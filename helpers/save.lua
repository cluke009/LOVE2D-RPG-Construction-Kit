--
-- Class: Save
-- Game save class.
--
local Save = {
    --
    -- Method: save
    -- Save current game state to file.
    --
    -- Arguments:
    --      name - The name of the file to save.
    --
    save = function ( self, name )
        local save = Storage:new { filename = 'save' .. name .. '.dat' }
        STATE.conf.time.date = os.date('%x %H:%M')
        STATE.conf.time.seconds = STATE.conf.time.seconds + os.difftime(os.time(), STATE.conf.time.epoch )
        STATE.conf.time.human = self:secondsToClock(STATE.conf.time.seconds)
        STATE.prototype = nil
        save.data = STATE
        save:save()
    end,

    --
    -- Method: load
    -- Load current game state from file.
    --
    -- Arguments:
    --      name - The name of the file to load.
    --
    -- Returns:
    --      Loads map from save file.
    --
    load = function ( self, name )
        local save = Storage:new{ filename = 'save' .. name .. '.dat' }

        -- Load data into state
        save:load()
        STATE = save.data
        STATE.conf.time.epoch = os.time()

        -- Reload view
        the.app.view = MapView:new()
        the.app.view:flash({ 0, 0, 0 }, .75)
    end,

    --
    -- Method: new
    -- Sets epoch in STATE. Required to keep correct time.
    -- Only needs to be set once for new games.
    --
    new = function ( self )
        STATE.conf.time.epoch = os.time()
    end,

    --
    -- Method: secondsToClock
    -- Converts seconds to human readable form.
    --
    secondsToClock = function ( self, sSeconds )
        if sSeconds == 0 then
            return '00:00:00'
        else
            local nHours = string.format('%02.f', math.floor(sSeconds / 3600));
            local nMins  = string.format('%02.f', math.floor(sSeconds / 60 - (nHours * 60)));
            local nSecs  = string.format('%02.f', math.floor(sSeconds - nHours * 3600 - nMins * 60));
            return nHours .. ':' .. nMins .. ':' .. nSecs
        end
    end
}

return Save
