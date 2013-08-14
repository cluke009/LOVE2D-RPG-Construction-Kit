-- Require needed stuff locally
local Menu = require 'helpers.menu_helper'
local equipment = require 'assets.tables.equipment'

-- Make our classes available to each other
local Equip, Equipped, EquipList, EquipHero

-- Add some vars for local data
local localHero, localItem, localItemType

-- Extend subview with our ready trigger
Subview = Subview:extend{ ready = true }
Group = Group:extend{ ready = true }

-- Some helper functions to delegate object update/removal
local subviewRemove = function(this)
    if the.keys:justPressed('escape') then
        this:deactivate()
    end
end

--[[----------------------------------------------------------------------------
-- Our starting point when selecting the equip option
-- Updates
--  - localHero
-- Activates
--  - Equipped
--]] ----------------------------------------------------------------------------
Equip = Subview:new{
    onActivate = function(self)
        local links = {}

        for k, v in pairs(STATE.heroes) do
            if v['active'] then
                table.insert(links, {
                    name = '',
                    action = function()
                        localHero = v
                        localHero.key = k
                        Equipped:activate()
                    end
                })
            end
        end

        self.menu = Menu:new{
            x = 350,
            y = 20,
            width = 22,
            step = 100,
            items = links
        }
        self:add(self.menu)
    end,
    onDeactivate = function ( self )
        self:remove(self.menu)
    end,
    onUpdate = function(self)
        subviewRemove(self)
    end
}


--[[----------------------------------------------------------------------------
-- View currently equipped items of selected hero
-- Updates
--  - localItemType
-- Activates
--  - EquipList
--]] ----------------------------------------------------------------------------
Equipped = Subview:new{
    equipped = function (self)
        -- Get kinds of equipment
        local unique = {}
        for i, v in ipairs(equipment) do
            unique[v.kind] = true
        end

        -- Create menu
        local links = {}
        for k, v in pairs(unique) do
            local heroID = localHero.key
            local itemID = STATE.equip[heroID][k]
            local ename = ''

            if itemID and itemID ~= 0 then
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

        return links
    end,
    onActivate = function(self)
        self.fill = Fill:new{
            x = 320,     width  = 430,
            y = 20,    height = 560,
            fill = { 0, 0, 255, 255 },
            border = { 255, 255, 255, 255 },
        }
        -- Add menu to stage
        self.menu = Menu:new{
            x = 20,
            y = 80,
            step = 24,
            width = 300,
            items = self:equipped()
        }
        self:add(self.fill)
        self:add(self.menu)
        self:add(EquipHero)
    end,
    onDeactivate = function(self)
        EquipHero.ready = true
        self:remove(self.fill)
        self:remove(self.menu)
        self:remove(EquipHero)
    end,
    onUpdate = function(self)
        -- TODO: Re-examine menu class
        -- Maybe we should do updates there
        if self.ready then
            self:remove(self.menu)
            self.menu = Menu:new{
                x = 20,
                y = 80,
                step = 24,
                width = 300,
                items = self:equipped()
            }
            self:add(self.menu)
            self.ready = false
        end

        subviewRemove(self)
    end
}

--[[----------------------------------------------------------------------------
-- View avilable equipment of specified type
-- Updates
--  -
-- Activates
--  -
--]] ----------------------------------------------------------------------------
EquipList = Subview:new{
    onActivate = function(self)
        -- Add background
        self.fill = Fill:new{
            x = 20,     width  = 300,
            y = 20,    height = 300,
            fill = { 0, 0, 255, 255 },
            border = { 255, 255, 255, 255 },
        }
        self:add(self.fill)

        local ofType = {}

        -- Check if we have any equipment in inventory
        if next(STATE.inventory.equipment) then

            -- Get equipment of specified type from master equipment list
            for k, v in pairs(STATE.inventory.equipment) do
                if equipment[k].kind == localItemType then
                    ofType[k] = equipment[k]
                    ofType[k].amount = v
                    ofType[k].key = k
                end
            end

            -- Add remove to list
            ofType[0] = {
                effect = {},
                key = 0,
                name = "Remove",
                amount = 0
            }

            -- Remove already equipped items from available items
            for k, v in pairs(STATE.equip) do
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
            for k, v in pairs(ofType) do
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
                x = 20,
                y = 80,
                step = 24,
                width = 300,
                items = links
            }
            self:add(self.menu)
        end
    end,
    onDeactivate = function(self)
        Equipped.ready = true
        EquipHero.ready = true
        if self.menu then
            self:remove(self.menu)
        end
        self:remove(self.fill)
    end,
    onNew = function(self)
    end,
    onUpdate = function(self)
        subviewRemove(self)
    end
}

EquipHero = Group:new{
    text = {},
    onNew = function(self)
        self.image = Tile:new{
            x = 0 + 370,
            y = 0 + 40,
            width = 32,
            height = 32,
        }
        self.name = Text:new{
            x = 32 + 370,
            y = 0 + 40,
            width = 100,
            tint = { 0, 0, 0 },
            font = STATE.font,
            text = ''
        }
        self.atk = Text:new{
            x = 32 + 370,
            y = 32 + 80,
            width = 100,
            tint = { 0, 0, 0 },
            font = STATE.font,
            text = ''
        }

        self.def = Text:new{
            x = 32 + 370,
            y = 32 + 120,
            width = 100,
            tint = { 0, 0, 0 },
            font = STATE.font,
            text = ''
        }
        self.mag = Text:new{
            x = 32 + 370,
            y = 32 + 160,
            width = 100,
            tint = { 0, 0, 0 },
            font = STATE.font,
            text = ''
        }
        self.mdef = Text:new{
            x = 32 + 370,
            y = 32 + 200,
            width = 100,
            tint = { 0, 0, 0 },
            font = STATE.font,
            text = ''
        }
        self.spd = Text:new{
            x = 32 + 370,
            y = 32 + 240,
            width = 100,
            tint = { 0, 0, 0 },
            font = STATE.font,
            text = ''
        }
        self:add(self.image)
        self:add(self.name)
        self:add(self.atk)
        self:add(self.def)
        self:add(self.mag)
        self:add(self.mdef)
        self:add(self.spd)
    end,
    onUpdate = function(self)
        if self.ready then
            local equipmentEffect = table.copy(STATE.heroes[localHero.key].stats)
            local hero = STATE.heroes[localHero.key]

            -- Get kinds of equipment
            local unique = {}
            for i, v in ipairs(equipment) do
                unique[v.kind] = true
            end

            -- Get stat totals with equiped items
            for k, v in pairs(unique) do
                local heroID = localHero.key
                local itemID = STATE.equip[heroID][k]

                if itemID and itemID ~= 0 then
                    local effect = equipment[itemID].effect
                    for k, v in pairs(effect) do
                        equipmentEffect[k] = equipmentEffect[k] + v
                    end
                end
            end

            self.image.image = hero.image
            self.name.text   = hero.name
            self.atk.text    = 'ATK '  .. equipmentEffect.str
            self.def.text    = 'DEF '  .. equipmentEffect.con
            self.mag.text    = 'MAG '  .. equipmentEffect.int
            self.mdef.text   = 'MDEF ' .. equipmentEffect.wis
            self.spd.text    = 'SPD '  .. equipmentEffect.spd

            self.ready = false
        end
    end
}

return Equip
