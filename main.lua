--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------

require 'globals'
require 'zoetrope'
require 'map'
require 'objects'
require 'dialog'

menu =  require 'menu'
pretty =  require 'pl.pretty'

-- pretty.dump(STATE)

the.app = App:new
{
    onRun = function (self)
        -- Setup save state
        self.save = Storage:new{ filename = 'save.dat' }

        -- Set view to our map loader.
        self.view = MapView:new()
    end,

    onUpdate = function (self)

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
            if next(self.save.data) then
                STATE = self.save.data
            end

            -- Reload view
            self.view = MapView:new()
            the.app.view:flash({0, 0, 0}, .75)
        end

        if the.keys:justPressed('d') then
            -- Save empty state data
            self.save.data = {}
            self.save:save()

            -- Load data into state
            self.save:load()

            -- Reload view
            self.view = MapView:new()
            the.app.view:flash({0, 0, 0}, .75)
        end
    end
}
