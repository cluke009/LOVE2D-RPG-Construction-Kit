local items = require 'assets.tables.items'
local Menu  = require 'menu.menu'
local Party = require 'menu.party'

local Select, Items

Items = Subview:new
{
    ready = true,
    party = Party:new(),
    fill = Fill:new{
        width = 800,
        height = 600,
        fill = {255, 255, 255, 255}
    },
    text = Text:new{
        x = 20, y = 40,
        width = 480,
        tint = {0,0,0},
        font = 24,
        text = 'No items.'
    },
    onNew = function ( self )
        self:add(self.fill)
        self:add(self.party)
    end,
    onUpdate = function ( self )
        if self.ready == true then

            if next(STATE.inventory.item) then
                local links = {}
                for k,v in pairs(STATE.inventory.item) do
                    table.insert(links, {
                        name = items[k].name .. ' x' .. v,
                        hover = function()
                            self.text.text = items[k].desc
                        end,
                        action = function()
                            Select.item = items[k]
                            Select.item.kind = 'item'
                            Select.item.key = k
                            Select:activate()
                        end
                    })
                end

                self.menu = Menu:new{
                    x = 20, y = 80,
                    step = 24,
                    width = 300,
                    items = links
                }
                self:add(self.menu)
            else
                self.text.text = 'No items.'
            end
            self:add(self.text)
            self.ready = false
        end

        if STATE.menu.update == true then
            self.ready = true
            self:remove(self.text)
            self:remove(self.menu)
            STATE.menu.update = false
        end

        if the.keys:justPressed('escape') then
            self.ready = true
            STATE.menu.update = true
            self:remove(self.text)
            self:remove(self.menu)
            self:deactivate()
        end
    end
}

Select = Subview:new
{
    onActivate = function ( self )

        local links = {}

        for k, hero in pairs(STATE.heroes) do
            if hero['active'] then
                table.insert(links, {
                    name = '',
                    action = function()
                        local kind   = self.item.kind
                        local effect = self.item.effect
                        local key    = self.item.key
                        -- Apply effects
                        for i = 1, #effect do

                            local stat  = effect[i][1]
                            local value = effect[i][2]
                            local sHero = STATE.heroes[k].stats[stat]

                            if string.find(stat, 'max', -3) then
                                STATE.heroes[k].stats[stat] = sHero + value
                            elseif STATE.heroes[k].stats[stat .. 'max'] and sHero + value > STATE.heroes[k].stats[stat .. 'max'] then
                                STATE.heroes[k].stats[stat] = STATE.heroes[k].stats[stat .. 'max']
                            else
                                STATE.heroes[k].stats[stat] = sHero + value
                            end

                        end

                        -- TODO: Equip/remove item

                        -- Update inventory
                        if STATE.inventory[kind][key] == 1 then
                            STATE.inventory[kind][key] = nil
                        elseif STATE.inventory[kind][key] == nil then
                            self:deactivate()
                        else
                            STATE.inventory[kind][key] = STATE.inventory[kind][key] - 1
                        end

                        STATE.menu.update = true
                        self:remove(self.m)
                        self:deactivate()
                    end
                })
            end
        end


        self.m = Menu:new{
            x = 350,
            y = 20,
            width = 10,
            step = 100,
            items = links
        }
        self:add(self.m)

    end,
    onUpdate = function ( self )
        if the.keys:justPressed('escape') then
            self:remove(self.m)
            self:deactivate()
        end
    end
}
return Items
