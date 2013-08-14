local MenuGameItems = require 'view.menu_game_items.menu_game_items_view'
local MenuGameEquip = require 'view.menu_game_equip.menu_game_equip_view'
local MenuHelper    = require 'helpers.menu_helper'
local Party         = require 'view.menu_game.menu_game_party_helper'
Launch = Subview:new{
    party = Party:new(),
    menu = MenuHelper:new{
        x = 20,
        y = 200,
        width = 22,
        height = 23,
        step = 23,
        items = {
            {
                name = 'Items',
                action = function()
                    MenuGameItems:activate()
                end,
            }, {
                name = 'Equip',
                action = function()
                    MenuGameEquip:activate()
                end,
            },
        },
    },
    fill = Fill:new{
        x = 10,     width  = 780,
        y = 10,     height = 580,
        fill = { 0, 0, 255, 200 },
        border = { 255, 255, 255, 255 },
    },
    onNew = function(self)
        self:add(self.fill)
        self:add(self.menu)
        self:add(self.party)
    end,
    onUpdate = function(self)
        if the.keys:justPressed('escape') then
            self.party.ready = true
            self:deactivate()
        end
    end
}

return Launch
