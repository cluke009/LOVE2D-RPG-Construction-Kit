local MenuGameItems = require 'views.menu.game.items'
local MenuGameEquip = require 'views.menu.game.equip'
local MenuHelper    = require 'helpers.menu_helper'
local Party         = require 'views.menu.game.party_helper'

Launch = Subview:new{
    party = Party:new(),
    menu = MenuHelper:new {
        coord = {20,200,150,23,true},
        items = {
            {'Items', function() MenuGameItems:activate() end },
            {'Equip', function() MenuGameEquip:activate() end },
        }
    },
    fill = Fill:new{
        x = 10,     width  = 780,
        y = 10,     height = 580,
        fill = { 0, 0, 255, 200 },
        border = { 255, 255, 255, 255 },
    },
    onActivate = function(self)
        self:add(self.fill)
        self:add(self.menu)
        self:add(self.party)
    end,
    onDeactivate = function(self)
        self:remove(self.fill)
        self:remove(self.menu)
        self:remove(self.party)
    end,
    onUpdate = function(self)
        if the.keys:justPressed('escape') then
            self.party.ready = true
            self:deactivate()
        end
    end
}

return Launch
