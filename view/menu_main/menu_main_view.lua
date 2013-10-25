local MenuHelper = require 'helpers.menu_helper'
local Sound      = require 'assets.tables.sound'
local Music      = Sound.music
local Save       = require 'helpers.save'
local msrc       = love.audio.newSource(Music[1].path)

local Quit, Continue, emitter

local sWidth = love.graphics.getWidth()
local sheight = love.graphics.getHeight()

emitter = Emitter:new {
    -- The x, y, width, and height properties
    -- determine where particles will appear when they're emitted.
    -- The burst will appear in a square centered in the window
    -- that's 8 pixels large.
    x = love.graphics.getWidth() / 2 - 4,
    width = 8,
    y = love.graphics.getHeight() / 2 - 4,
    height = 8,

    -- These set the minimum and maximum values for
    -- particles when they are emitted.
    min = { velocity = { x = -200, y = -200 } },
    max = { velocity = { x = 200, y = 200 } },
    period = 1,
}

-- Our emitter now needs some sprites to launch.
-- This is a shortcut method that creates 200 copies
-- of a blue fill sprite. Notice that the sprite doesn't
-- need x or y properties -- the emitter will set them.

emitter:loadParticles(Fill:extend {
    width = 1,
    height = 1,
    fill = {255, 255, 255, 200}
}, 200)

--
-- Class: MenuMainView
-- The main game menu
--
-- TODO: this should probably be local
--
MenuMainView = View:extend {
    menu = MenuHelper:new {
        coord = {sWidth/2-93,250,150,23,true},
        items = {
            {'New Game', function()
                love.audio.stop(msrc)
                Save:new()
                the.app.view = MapView:new()
                if the.app.view.foreground then
                    the.app.view:moveToFront(the.app.view.foreground)
                end
            end },
            {'Continue', function() Continue:activate() end },
            {'Quit', function() Quit:activate() end },
        }

    },
    onNew = function ( self )
        msrc:setLooping(true)
        msrc:play()
        self:add(Tile:new{
            image = 'assets/img/SpaaaaaaaceFinFlat_0.jpg'
        })
        self:add(emitter)

        self:add(Text:new{
            font = {'assets/font/bud_null/Budnm___.ttf', 43},
            text = 'RPG CONSTRUCTION KIT v0.01',
            tint = {0,0,0},
            width = sWidth,
            align = 'center',
            x = 2,
            y = 132,
        })
        self:add(Text:new{
            font = {'assets/font/bud_null/Budnm___.ttf', 43},
            text = 'RPG CONSTRUCTION KIT v0.01',
            width = sWidth,
            align = 'center',
            x = 0,
            y = 130
        })
        self:add(Fill:new{
            fill = {0,0,0},
            width = 400,
            height = 2,
            x = sWidth/2 - 198,
            y = 172
        })
        self:add(Fill:new{
            fill = {255,255,255},
            width = 400,
            height = 2,
            x = sWidth/2 - 200,
            y = 170
        })
        self:add(Text:new{
            font = {'assets/font/press_start_2p/PressStart2P.ttf', 15},
            text = 'FOR LOVE2D/ZOETROPE',
            tint = {0,0,0},
            width = sWidth,
            align = 'center',
            x = 2,
            y = 181
        })
        self:add(Text:new{
            font = {'assets/font/press_start_2p/PressStart2P.ttf', 15},
            text = 'FOR LOVE2D/ZOETROPE',
            width = sWidth,
            align = 'center',
            x = 0,
            y = 180
        })
        self:add(self.menu)
    end
}

--
-- Class: Quit
-- The Quit game menu
--
-- TODO: this should probably be local
--
Quit = Subview:new {
    onNew = function ( self )
        self.menu = MenuHelper:new {
            coord = {330,295,220,23,true},
            items = {
                {'No', function() self:deactivate() end },
                {'Yes', function() love.event.quit() end },
            }
        }

        local sWidth = love.graphics.getWidth()
        local sheight = love.graphics.getHeight()

        self:add(Fill:new {
            width = 226,
            height = 100,
            x = (sWidth / 2) - 113,
            y = (sheight / 2) - 50,
            border = {0,0,0}
        })
        self:add(Fill:new {
            width = 226,
            height = 70,
            x = (sWidth / 2) - 113,
            y = (sheight / 2) - 10,
            border = {0,0,0},
            tint = {0,0,1}
        })
        self:add(Text:new {
            text = 'Quit to desktop',
            x = (sWidth / 2) - 113,
            y = (sheight / 2) - 45,
            width = 226,
            font = {'assets/font/bud_null/Budnm___.ttf', 30},
            align = 'center',
            tint = {0,0,0}
        })
        self:add(self.menu)
    end,
    onUpdate = function(self)
        if the.keys:justPressed('escape') then
            self:deactivate()
        end
    end
}

--
-- Class: Continue
-- The Continue game menu
--
-- TODO: this should probably be local
--
Continue = Subview:new {
    onNew = function ( self )

        local items = {}
        for i=1,3 do
            local s = Storage:new{ filename = 'save' .. i .. '.dat' }; s:load(); s = s.data
            if next(s) then
                table.insert(items, {
                    'DATE: ' .. s.time.date  .. '\nTIME: ' .. s.time.human .. '\nMAP: ' .. s.map,
                    function()
                        love.audio.stop(msrc)
                        Save:load(tostring(i))
                    end,
                })
            else
                table.insert(items, {})
            end
        end
        self.menu = MenuHelper:new {
            coord = {160,160,500,110,true},
            items = items
        }
        self:add(Fill:new {
            width = sWidth,
            height = sheight,
            tint = {0,0,0},
            alpha = 0.5
        })

        self:add(Fill:new {
            width = 500,
            height = 400,
            x = (sWidth / 2) - 250,
            y = (sheight / 2) - 200,
            border = {0,0,0}
        })
        self:add(Fill:new {
            width = 480,
            height = 100,
            x = (sWidth / 2) - 240,
            y = 160,
            border = {0,0,0},
            tint = {0,0,1}
        })
        self:add(Fill:new {
            width = 480,
            height = 100,
            x = (sWidth / 2) - 240,
            y = 270,
            border = {0,0,0},
            tint = {0,0,1}
        })
        self:add(Fill:new {
            width = 480,
            height = 100,
            x = (sWidth / 2) - 240,
            y = 380,
            border = {0,0,0},
            tint = {0,0,1}
        })
        self:add(Text:new {
            text = 'Saves',
            x = (sWidth / 2) - 113,
            y = 120,
            width = 226,
            font = {'assets/font/bud_null/Budnm___.ttf', 30},
            align = 'center',
            tint = {0,0,0}
        })
        self:add(self.menu)
    end,
    onUpdate = function(self)
        if the.keys:justPressed('escape') then
            self:deactivate()
        end
    end
}
