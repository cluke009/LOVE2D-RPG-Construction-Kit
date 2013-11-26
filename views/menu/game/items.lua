local Assets    = require 'helpers.asset_helper'
local Menu      = require 'helpers.menu_helper'
local Party     = require 'views.menu.game.party_helper'

local Select, Items

Items = Subview:new{
    text = Text:new{
        x = 20,
        y = 40,
        width = 480,
        tint = { 0, 0, 0 },
        font = STATE.font,
        text = 'No items.'
    },
    inventory = function (self)
        local links = {}
        if next(STATE.inventory.items) then
            for k, v in pairs(STATE.inventory.items) do
                table.insert(links, {
                    Assets:get('items', k, 'name') .. ' x' .. v,
                    function()
                        Select.item = Assets:get('items', k)
                        Select.item.key = k
                        Select:activate()
                    end,
                    function()
                        self.text.text = Assets:get('items', k, 'desc')
                    end,

                })
            end
        else
            self.text.text = 'No items.'
        end
        return links
    end,
    onActivate = function(self)
        local links = self:inventory()
        if next(links) then
            self.menu = Menu:new{
                coord = {20,80,300,23,true},
                items = links
            }
            self:add(self.menu)
        end
        self:add(self.text)
    end,
    onNew = function(self)
        -- self:add(self.fill)
    end,
    onUpdate = function(self)
        if the.keys:justPressed('escape') then
            self:remove(self.text)
            if self.menu then
                self:remove(self.menu)
            end
            self:deactivate()
        end
    end
}

Select = Subview:new{
    onActivate = function(self)
        local links = {}

        for k, hero in pairs(STATE.heroes) do
            if hero['active'] then
                table.insert(links, {
                    '',
                    function()
                        local effect = self.item.effect
                        local key = self.item.key
                        -- Apply effects
                        for i = 1, #effect do
                            local stat = effect[i][1]
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

                        -- Update inventory
                        Assets:useItem(key)
                        self:remove(self.m)

                        self:deactivate()
                    end
                })
            end
        end

        self.m = Menu:new{
            coord = {350,20,10,100,true},
            items = links
        }
        self:add(self.m)
    end,
    onUpdate = function(self)
        if the.keys:justPressed('escape') then
            self:remove(self.m)
            self:deactivate()
        end
    end
}
return Items
