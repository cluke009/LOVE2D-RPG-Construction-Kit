--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------
    LOVE2D RPG CONSTRUCTION KIT
--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
STRICT = true
DEBUG = true
io.stdout:setvbuf("no")

require 'zoetrope'
require 'modules'
require 'custom'
-- require 'helpers.state'
-- require 'helpers.log'
-- require 'assets.tables.config'
-- require 'map'
-- require 'objects'
-- require 'views.menu.main'
-- Navi = require 'modules.navi'

the.app = App:new
{
    count = 1,
    onRun = function(self)
        if STATE.conf.auto_start then
            self.view = MapView:new()
            self.view:flash({ 0, 0, 0 }, 10)
        else
            self.view = MenuMainView:new()
            self.view:flash({ 0, 0, 0 }, 10)
        end
        log:add('Game loaded')
    end,
    onUpdate = function (self, elapsed)
        -- log:update()
    end
}
