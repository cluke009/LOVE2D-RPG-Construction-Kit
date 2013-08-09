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
    selected = 1,
    active = true,
    highlight = function(self)
        self.h.y = self.y  + (self.selected - 1) * self.step
        if self.items[self.selected].hover then
            self.items[self.selected]:hover()
        end
    end,
    onNew = function(self)
        self.h = Tile:new{
            x = self.x - 14,        width = 22,
            y = self.y - 5,   height = 23,
            image = 'assets/img/arrow.png'
        }
        self:add(self.h)
        for i, value in ipairs(self.items) do
            self['textShadow' .. i] = Text:new{
                x = self.x + 12,
                y = self.y + 12 + (i - 1) * self.step,
                width = self.width - 20,
                tint = { 0, 0, 0 },
                font = STATE.font,
                text = self.items[i]['name']
            }
            self['text' .. i] = Text:new{
                x = self.x + 10,
                y = self.y + 10 + (i - 1) * self.step,
                width = self.width - 20,
                tint = { 1, 1, 1 },
                font = STATE.font,
                text = self.items[i]['name']
            }
            self:add(self['textShadow' .. i])
            self:add(self['text' .. i])
        end
        self:highlight()
    end,
    onUpdate = function(self)
        if self.active == true then
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
            elseif the.keys:justPressed('return') then
                playSound(FX[2].path)
                if self.items[self.selected].action then
                    self.items[self.selected]:action()
                end
            end
        end
    end
}
return MenuHelper
