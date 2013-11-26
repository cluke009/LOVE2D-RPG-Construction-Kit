local Sound = require 'assets.tables.sound'
local FX    = Sound.fx

--
-- Class: MenuHelper
-- Simple vertical menus.
--
-- Properties:
--     x - X coordinates.
--     y - Y coordinates.
--     width - Text width.
--     height - Text height.
--     step - Height between cursor movement.
--
-- Extends:
--     <Group>
--
-- Require:
-- - assets.tables.sound
--
-- Example code:
--     (begin code)
-- local MenuHelper = require 'helpers.menu_helper'
--
-- menu = MenuHelper:new {
--     x = 200,
--     y = 250,
--     width = 150,
--     height = 23,
--     step = 23,
--     items = {
--         {
--             name = 'New Game',
--             action = function()
--                 love.audio.stop(msrc)
--                 Save:new()
--                 the.app.view = MapView:new()
--             end,
--         }, {
--             name = 'Continue',
--             action = function()
--                 Continue:activate()
--             end,
--         }, {
--             name = 'Quit',
--             action = function()
--                 Quit:activate()
--             end,
--         },
--     },
-- }
-- self:add(menu)
--     (end code)
--

local MenuHelper = Group:extend{
    items = {},
    delay = 1,
    selected = 1,
    highlight = function(self)
        self.h.y = self.y  + (self.selected - 1) * self.height
        if self.items[self.selected].hover then
            self.items[self.selected][3]()
        end
    end,
    onNew = function(self)
        self.x = self.coord[1]
        self.y = self.coord[2]
        self.width = self.coord[3]
        self.height = self.coord[4]
        self.active = self.coord[5]

        self.bg = Fill:new{
            x = self.x - 10,     width  = self.width +  10,
            y = self.y - 10,     height = (self.height * #self.items) +  20,
            fill = { 0, 0, 255, 200 },
            border = { 255, 255, 255, 255 },
        }
        self:add(self.bg)

        self.h = Tile:new{
            x = self.x - 14,  width = 22,
            y = self.y - 5,   height = 23,
            image = 'assets/img/arrow.png'
        }
        self:add(self.h)
        for i, value in ipairs(self.items) do
            self['textShadow' .. i] = Text:new{
                x = self.x + 12,
                y = self.y + 12 + (i - 1) * self.height,
                width = self.width - 20,
                tint = { 0, 0, 0 },
                font = STATE.conf.font,
                text = self.items[i][1]
            }
            self['text' .. i] = Text:new{
                x = self.x + 10,
                y = self.y + 10 + (i - 1) * self.height,
                width = self.width - 20,
                tint = { 1, 1, 1 },
                font = STATE.conf.font,
                text = self.items[i][1]
            }
            self:add(self['textShadow' .. i])
            self:add(self['text' .. i])
        end
        self:highlight()
        if self.active == false then
            self:die()
        end
    end,
    onUpdate = function(self)
        if the.keys:justPressed('up') then
            playSound(FX[1].path)
            if self.selected > 1 then
                self.selected = self.selected - 1
            else
                self.selected = #self.items
            end
            self:highlight()
        elseif the.keys:justPressed('down') then
            playSound(FX[1].path)
            if self.selected < #self.items then
                self.selected = self.selected + 1
            else
                self.selected = 1
            end
            self:highlight()
        elseif the.keys:justPressed('return') and self.delay >= 10 then
            playSound(FX[2].path)
            if self.items[self.selected][2] then
                self.items[self.selected][2]()
                self.delay = 1
            end
        elseif the.keys:justPressed('escape') then
            if self.parent then
                self:deactivate(self.parent)
                self.delay = 1
            end
        end
        self.delay = self.delay + 1
    end,
    submenu = function(self, child)
        self.active = false
        self.h:die()
        -- parent:die()
        child:revive()
    end,
    deactivate = function(self, parent)
        self.active = false
        self:die()
        parent.active = true
        parent:revive()
        parent.h:revive()
    end
}
return MenuHelper
