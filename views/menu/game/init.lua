local MenuGameItems = require 'views.menu.game.items'
local MenuGameEquip = require 'views.menu.game.equip'
local MenuHelper    = require 'helpers.menu_helper'
local Party         = require 'views.menu.game.party_helper'

Launch = Subview:new{
    party = Party:new(),
    -- menu = MenuHelper:new {
    --     coord = {20,200,150,23,true},
    --     items = {
    --         {'Items', function() MenuGameItems:activate() end },
    --         {'Equip', function() MenuGameEquip:activate() end },
    --     }
    -- },
    fill = Fill:new{
        x = 10,     width  = 780,
        y = 10,     height = 580,
        fill = { 0, 0, 255, 200 },
        border = { 255, 255, 255, 255 },
    },
    onNew = function(self)
        self.menu = MenuHelper:new {
            coord = {20,200,150,23,true},
            items = {
                {'Items', function() self.menu:submenu(self.items_menu) end },
                {'Equip', function() self.menu:submenu(self.equipment_menu) end },
            }
        }
        self.items_menu = MenuHelper:new {
            parent = self.menu,
            coord = {120,200,150,23,false},
            items = {
                {'Items1', function() print('Items1') end },
                {'Items2', function() print('Items2') end },
            }
        }
        self.equipment_menu = MenuHelper:new {
            parent = self.menu,
            coord = {220,200,150,23,false},
            items = {
                {'Equipment1', function() print('Equipment1') end },
                {'Equipment2', function() print('Equipment2') end },
            }
        }
        self:add(self.fill)
        self:add(self.menu)
        self:add(self.items_menu)
        self:add(self.equipment_menu)
    end,
    onActivate = function(self)
        self:add(self.party)
    end,
    onDeactivate = function(self)
        self:remove(self.party)
    end,
    onUpdate = function(self)
        if the.keys:justPressed('backspace') then
            self:deactivate()
        end
    end
}

return Launch
