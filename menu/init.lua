local pretty = require 'pl.pretty'

local Items  = require 'menu.items'
local Menu   = require 'menu.menu'
local Party  = require 'menu.party'
local Select = require 'menu.select'
local List   = require 'menu.list'


local Launch = Subview:new
{
    party = Party:new(),
    menu = Menu:new{
        x = 20, y = 200,
        width = 300, height = 24,
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
                    Subview:new
                    {
                        onActivate = function ( self )

                            local links = {}

                            for k, hero in pairs(STATE.heroes) do
                                if hero['active'] then
                                    table.insert(links, {
                                        name = '',
                                        action = function()
                                                List.data.hero = k
                                                List.data.kind = 'equipment'
                                                List:activate()
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
                    }:activate()
                end,
            },
        }
    },
    fill = Fill:new{
        width = 800,
        height = 600,
        fill = {255, 255, 255, 200}
    },
    onNew = function (self)
        self:add(self.fill)
        self:add(self.menu)
        self:add(self.party)
    end,
    onUpdate = function ( self )
        if the.keys:justPressed('escape') then
            self:deactivate()
        end
        if STATE.menu.update == true then
            STATE.menu.update = false
        end
    end
}

return Launch
