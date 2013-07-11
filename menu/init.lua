local Items = require'menu.items'
local Equip = require'menu.equip'

local Menu = require'menu.menu'
local Party = require'menu.party'


Launch = Subview:new{
    party = Party:new(),
    menu = Menu:new{
        x = 20,
        y = 200,
        width = 300,
        height = 24,
        step = 24,
        items = {
            {
                name = 'Items',
                action = function()
                    Items:activate()
                end,
            }, {
                name = 'Equip',
                action = function()
                    Equip:activate()
                end,
            },
        }
    },
    fill = Fill:new{
        width = 800,
        height = 600,
        fill = { 255, 255, 255, 200 }
    },
    onNew = function(self)
        self:add(self.fill)
        self:add(self.menu)
        self:add(self.party)
    end,
    onUpdate = function(self)
        if the.keys:justPressed('escape') then
            self:deactivate()
        end
    end
}

return Launch
