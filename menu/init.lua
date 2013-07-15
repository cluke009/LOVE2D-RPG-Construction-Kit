local Items = require'menu.items'
local Equip = require'menu.equip'

local Menu = require'menu.menu'
local Party = require'menu.party'


Launch = Subview:new{
    party = Party:new(),
    menu = Menu:new{
        x = 20,
        y = 200,
        width = 22,
        height = 23,
        step = 23,
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
