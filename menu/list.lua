local items = require 'assets.tables.items'
local Menu  = require 'menu.menu'
local Select  = require 'menu.select'
local Party = require 'menu.party'

local Items = Subview:new
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
                            Select.kind = 'Item'
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

return Items
