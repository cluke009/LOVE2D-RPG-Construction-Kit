--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------


STRICT = true
DEBUG = true

pretty = require'pl.pretty'

require'globals'
require'state'

require'zoetrope'

require'map'
require'objects'
require'dialog'


menu = require'menu'


-- pretty.dump(STATE)

the.app = App:new{
    onRun = function(self)
        -- Reload clean game state every time
        initializeSTATE()

        -- Setup save state
        self.save = Storage:new{ filename = 'save.dat' }

        -- Set view to our map loader.
        self.view = MapView:new()

    -- l = love.graphics.newPixelEffect([[]])
    -- love.graphics.setPixelEffect(l)

    end,
    onUpdate = function(self)

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------
    GLOBAL CONTROLS
--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------

        if the.keys:justPressed(' ') and menu.activated ~= true then
            menu:activate()
        end

        if the.keys:justPressed('s') then
            -- Save state data
            self.save.data = STATE
            self.save:save()
        end


        if the.keys:justPressed('l') then
            -- Load data into state if exists
            self.save:load()
            STATE = self.save.data

            -- Reload view
            self.view = MapView:new()
            the.app.view:flash({ 0, 0, 0 }, .75)
        end

        if the.keys:justPressed('d') then
            -- Save empty state data
            self.save.data = {}
            self.save:save()

            -- Load data into state
            self.save:load()
            STATE = self.save.data

            -- Reload view
            self.view = MapView:new()
            the.app.view:flash({ 0, 0, 0 }, .75)
        end
    end
}
