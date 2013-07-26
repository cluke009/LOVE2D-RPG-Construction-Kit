local assets    = require 'helpers.asset_helper'
local Item      = assets.Item

local Menu = require'helpers.menu_helper'
local Party = require'view.menu_game.menu_game_party_helper'

local Select, Items

Items = Subview:new{
    ready = true,
    party = Party:new(),
    fill = Fill:new{
        width = 800,
        height = 600,
        fill = { 255, 255, 255, 255 }
    },
    text = Text:new{
        x = 20,
        y = 40,
        width = 480,
        tint = { 0, 0, 0 },
        font = 24,
        text = 'No items.'
    },
    inventory = function (self)
        local links = {}
        if next(STATE.inventory.item) then
            for k, v in pairs(STATE.inventory.item) do
                table.insert(links, {
                    name = Item:get(k, 'name') .. ' x' .. v,
                    hover = function()
                        self.text.text = Item:get(k, 'desc')
                    end,
                    action = function()
                        Select.item = Item:get(k)
                        Select.item.key = k
                        Select:activate()
                    end
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
                x = 20,
                y = 80,
                step = 24,
                width = 300,
                items = links
            }
            self:add(self.menu)
        end
        self:add(self.text)
    end,
    onNew = function(self)
        self:add(self.fill)
        self:add(self.party)
    end,
    onUpdate = function(self)
        if self.ready == true then
            if self.menu then
                self:remove(self.menu)
                self.menu = Menu:new{
                    x = 20,
                    y = 80,
                    step = 24,
                    width = 300,
                    items = self:inventory()
                }
                self:add(self.menu)
            end
            self.ready = false
        end

        if the.keys:justPressed('escape') then
            self.ready = true
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
                    name = '',
                    action = function()
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
                        Item:use(key)
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
    onUpdate = function(self)
        if the.keys:justPressed('escape') then
            self:remove(self.m)
            self:deactivate()
        end
    end
}
return Items
