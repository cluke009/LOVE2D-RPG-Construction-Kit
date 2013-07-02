-- Require needed stuff locally
local pretty = require 'pl.pretty'
local Menu      = require 'menu.menu'
local equipment = require 'assets.tables.equipment'

-- Make our classes available to each other
local Equip, Equipped, EquipList, EquipHero

-- Add some vars for local data
local localHero, localItem, localItemType

-- Extend subview with our ready trigger
Subview = Subview:extend { ready = true }
Group   = Group:extend { ready = true }


function table.copy(t)
  local t2 = {}
  for k,v in pairs(t) do
    t2[k] = v
  end
  return t2
end



-- Some helper functions to delegate object update/removal
local subviewRemove = function ( this )
    if the.keys:justPressed('escape') then
        this:deactivate()
    end
end

local subviewRedraw = function ( this, ...)
    if arg[2] then
        this.ready = true
    end
    if this.ready == true then
        this:onReady()
        this.ready = false
        the.app.view:flash({255, 255, 255}, 1.5)
    end
end

-- local spriteRemove = function ( this )
--     for i, v in ipairs(this.sprites) do
--         table.remove(this.sprites, i)
--     end
-- end


--[[----------------------------------------------------------------------------
-- Our starting point when selecting the equip option
-- Updates
--  - localHero
-- Activates
--  - Equipped
--]]----------------------------------------------------------------------------
Equip = Subview:new
{
    onNew = function ( self )

        local links = {}

        for k, v in pairs(STATE.heroes) do
            if v['active'] then
                table.insert(links, {
                    name = '',
                    action = function()
                        localHero = v
                        localHero.key = k
                        EquipHero.ready = true
                        Equipped:activate()
                    end
                })
            end
        end

        self:add(Menu:new{
            x = 350,
            y = 20,
            width = 10,
            step = 100,
            items = links
        })

    end,
    onDeactivate = function ( self )
        -- spriteRemove(self)
    end,

    onUpdate = function ( self )
        subviewRemove(self)
    end
}


--[[----------------------------------------------------------------------------
-- View currently equipped items of selected hero
-- Updates
--  - localItemType
-- Activates
--  - EquipList
--]]----------------------------------------------------------------------------
Equipped = Subview:new
{
    onReady = function ( self )
        self:remove(self.fill)
        self:remove(self.menu)
        self:remove(EquipHero)

        self.fill = Fill:new{
            width = 600,
            x = 360,
            height = 600,
            fill = {255, 255, 255, 255}
        }
        self:add(self.fill)







        -- Get kinds of equipment
        local unique = {}
        for i,v in ipairs(equipment) do
            unique[v.kind] = true
        end

        -- Create menu
        local links = {}
        for k,v in pairs(unique) do
            local heroID = localHero.key
            local itemID = STATE.equip[heroID][k]
            local ename = ''

            if itemID then
                ename = equipment[itemID].name
            end

            table.insert(links, {
                name = k .. ': ' .. ename,
                hover = function()
                end,
                action = function()
                    localItemType = k
                    EquipList:activate()
                end
            })
        end

        -- Add menu to stage
        self.menu = Menu:new{
            x = 20, y = 80,
            step = 24,
            width = 300,
            items = links
        }
        self:add(self.menu)
        self:add(EquipHero)

    end,
    onActivate = function ( self )
        self.ready = true
    end,
    onDeactivate = function ( self )
        self:remove(self.fill)
        self:remove(self.menu)
        self:remove(EquipHero)
    end,
    onNew = function ( self )
    end,
    onUpdate = function ( self )
        subviewRedraw(self)
        subviewRemove(self)
    end
}

--[[----------------------------------------------------------------------------
-- View avilable equipment of specified type
-- Updates
--  -
-- Activates
--  -
--]]----------------------------------------------------------------------------
EquipList = Subview:new
{
    onReady = function ( self )

        -- Add background
        self.fill = Fill:new{
            width = 300,
            height = 600,
            fill = {255, 255, 255, 255}
        }
        self:add(self.fill)


        local ofType = {}

        -- Check if we have any equipment in inventory
        if next(STATE.inventory.equipment) then

            -- Get equipment of specified type from master equipment list
            for k,v in pairs(STATE.inventory.equipment) do
                if equipment[k].kind == localItemType then
                    ofType[k] = equipment[k]
                    ofType[k].amount = v
                    ofType[k].key = k
                end
            end

            -- Remove already equipped items from available items
            for k,v in pairs(STATE.equip) do
                local typeID = v[localItemType]

                if typeID and typeID == ofType[typeID].key then
                    ofType[typeID].amount = ofType[typeID].amount - 1
                    if ofType[typeID].amount == 0 then
                        ofType[typeID] = nil
                    end
                end
            end

            -- TODO: Check if hero can use item

        end


        -- If we have any items availible to equip display them
        if next(ofType) then

            local links = {}
            for k,v in pairs(ofType) do
                table.insert(links, {
                    name = ofType[k].name .. ' x' .. ofType[k].amount,
                    hover = function()
                        -- self.text.text = ofType[k].desc
                    end,
                    action = function()
                        STATE.equip[localHero.key][localItemType] = k
                        self:deactivate()
                    end
                })
            end

            -- Add menu
            self.menu = Menu:new{
                x = 20, y = 80,
                step = 24,
                width = 300,
                items = links
            }
            self:add(self.menu)
        end
    end,
    onActivate = function ( self )
        self.ready = true
    end,
    onDeactivate = function ( self )
        Equipped.ready = true
        EquipHero.ready = true
        self:remove(self.menu)
        self:remove(self.fill)
    end,
    onNew = function ( self )
    end,
    onUpdate = function ( self )
        subviewRedraw(self)
        subviewRemove(self)
    end
}

EquipHero = Group:new
{
    text = {},
    onReady = function ( self )
        self:remove(self.image)
        self:remove(self.name)
        self:remove(self.atk)
        self:remove(self.def)
        self:remove(self.mag)
        self:remove(self.mdef)
        self:remove(self.spd)

        -- Get kinds of equipment
        local unique = {}
        for i,v in ipairs(equipment) do
            unique[v.kind] = true
        end



        -- Get stat totals with equiped items
        local equipmentEffect = table.copy(STATE.heroes[localHero.key].stats)
        for k,v in pairs(unique) do

                    local heroID = localHero.key
                    local itemID = STATE.equip[heroID][k]

            if itemID then
                local effect = equipment[itemID].effect
                for k,v in pairs(effect) do
                    print(k,v)
                    equipmentEffect[k] = equipmentEffect[k] + v
                    print(equipmentEffect[k])
                end
            end
        end

        local hero = STATE.heroes[localHero.key]
        self.image = Tile:new{
            x = 0 + 370,
            y = 0 + 40,
            width = 32,
            height = 32,
            image = hero.image
        }
        self.name = Text:new{
            x = 32 + 370,
            y = 0 + 40,
            width = 100,
            tint = {0,0,0},
            font = 24,
            text = hero.name
        }
        self.atk = Text:new{
            x = 32 + 370,
            y = 32 + 80,
            width = 100,
            tint = {0,0,0},
            font = 20,
            text = self.text.atk
        }

        self.def = Text:new{
            x = 32 + 370,
            y = 32 + 120,
            width = 100,
            tint = {0,0,0},
            font = 20,
            text = 'DEF ' .. equipmentEffect.def
        }
        self.mag = Text:new{
            x = 32 + 370,
            y = 32 + 160,
            width = 100,
            tint = {0,0,0},
            font = 20,
            text = 'MAG ' .. equipmentEffect.mag
        }
        self.mdef = Text:new{
            x = 32 + 370,
            y = 32 + 200,
            width = 100,
            tint = {0,0,0},
            font = 20,
            text = 'MDEF ' .. equipmentEffect.mdef
        }
        self.spd = Text:new{
            x = 32 + 370,
            y = 32 + 240,
            width = 100,
            tint = {0,0,0},
            font = 20,
            text = 'SPD ' .. equipmentEffect.spd
        }
        self:add(self.image)
        self:add(self.name)
        self:add(self.atk)
        self:add(self.def)
        self:add(self.mag)
        self:add(self.mdef)
        self:add(self.spd)
    end,
    onUpdate = function ( self )
        subviewRedraw(self)
    end
}



return Equip
