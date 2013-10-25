--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------
    LOVE2D RPG CONSTRUCTION KIT
--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
STRICT = true
DEBUG = true
io.stdout:setvbuf("no")

require 'zoetrope'
require 'helpers.state'
require 'assets.tables.config'

require 'map'
require 'objects'

require 'helpers.string_helper'
require 'helpers.table_helper'
require 'helpers.dialog_helper'
require 'view.menu_main.menu_main_view'

the.app = App:new{
    onRun = function(self)
    	if STATE.auto_start then
    		self.view = MapView:new()
	        self.view:flash({ 0, 0, 0 }, 10)
    	else
	        self.view = MenuMainView:new()
	        self.view:flash({ 0, 0, 0 }, 10)
	    end
    end,
}
