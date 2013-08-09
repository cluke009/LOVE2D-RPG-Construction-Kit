require'helpers.string_helper'
require'helpers.table_helper'
require'state'

STATE.map = 'west'
STATE.font = {'assets/font/press_start_2p/PressStart2P.ttf', 16}
STATE.heroStartX = 480
STATE.heroStartY = 480
STATE.inventory = {
        item = {},
        equipment = {},
    }
STATE.gold = 300

require'map'
require'objects'
require'helpers.dialog_helper'

--
-- Class: Save
-- Game save class.
--
Save = {
    --
    -- Method: save
    -- Save current game state to file.
    --
    -- Arguments:
    --      name - The name of the file to save.
    --
    save = function(self, name)
        local save = Storage:new{ filename = 'save' .. name .. '.dat' }
        STATE.time.date = os.date('%x %H:%M')
        STATE.time.seconds = STATE.time.seconds + os.difftime(os.time(), STATE.time.epoch )
        STATE.time.human = self:SecondsToClock(STATE.time.seconds)
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
    load = function(self, name)
        local save = Storage:new{ filename = 'save' .. name .. '.dat' }

        -- Load data into state
        save:load()
        STATE = save.data
        STATE.time.epoch = os.time()

        -- Reload view
        the.app.view = MapView:new()
        the.app.view:flash({ 0, 0, 0 }, .75)
    end,

    --
    -- Method: new
    -- Sets epoch in STATE. Required to keep correct time. 
    -- Only needs to be set once for new games.
    --
    new = function(self)
        STATE.time.epoch = os.time()
    end,

    --
    -- Method: SecondsToClock
    -- Converts seconds to human readable form.
    --
    SecondsToClock = function(self, sSeconds)
        if sSeconds == 0 then
            return '00:00:00'
        else
            nHours = string.format('%02.f', math.floor(sSeconds / 3600));
            nMins  = string.format('%02.f', math.floor(sSeconds / 60 - (nHours * 60)));
            nSecs  = string.format('%02.f', math.floor(sSeconds - nHours * 3600 - nMins * 60));
            return nHours .. ':' .. nMins .. ':' .. nSecs
        end
    end
}