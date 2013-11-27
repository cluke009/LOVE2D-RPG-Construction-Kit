local Select        = require 'views.menu.game.items'
local MenuGameEquip = require 'views.menu.game.equip'
local MenuHelper    = require 'helpers.menu_helper'
local Party         = require 'views.menu.game.party_helper'
local Assets        = require 'helpers.asset_helper'

Launch = Subview:new{
    party = Party:new(),
    fill = Fill:new{
        x = 10,     width  = 780,
        y = 10,     height = 580,
        fill = { 0, 0, 255, 200 },
        border = { 255, 255, 255, 255 },
    },
    inventory_links = function (self)
        local links = {}
        if next(STATE.inventory.items) then
            for k, v in pairs(STATE.inventory.items) do
                table.insert(links, {
                    Assets:get('items', k, 'name') .. ' x' .. v,
                    function() print('Equipment1') end
                })
            end
        else
            links = {{}}
        end
        return links
    end,
    equipment_links = function (self)
        local links = {}
        if next(STATE.inventory.items) then
            for k, v in pairs(STATE.inventory.items) do
                table.insert(links, {
                    Assets:get('items', k, 'name') .. ' x' .. v,
                    function() print('Equipment1') end
                })
            end
        else
            links = {{}}
        end
        return links
    end,
    onNew = function(self)
        --
        -- Create static root menu
        --
        self.menu = MenuHelper:new {
            coord = {20,200,150,23,true},
            items = {
                {'Items', function() self.menu:submenu(self.items_menu) end },
                {'Equip', function() self.menu:submenu(self.equipment_menu) end },
            }
        }

        --
        -- Add static elements
        --
        self:add(self.fill)
        self:add(self.menu)
    end,
    onActivate = function(self)
        --
        -- Create dynamic child menus
        --
        self.items_menu = MenuHelper:new {
            parent = self.menu,
            coord = {20,80,300,23,false},
            items = self:inventory_links()
        }

        self.equipment_menu = MenuHelper:new {
            parent = self.menu,
            coord = {220,200,150,23,false},
            items = {
                {'Equipment1', function() print('Equipment1') end },
                {'Equipment2', function() print('Equipment2') end },
            }
        }

        --
        -- Add dynamic elements
        --
        self:add(self.party)
        self:add(self.items_menu)
        self:add(self.equipment_menu)
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
