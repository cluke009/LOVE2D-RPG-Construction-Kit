--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------
    LOVE2D RPG CONSTRUCTION KIT
--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
STRICT = true
DEBUG = true
io.stdout:setvbuf("no")

require 'zoetrope'
require 'state'
require 'assets.tables.config'

require 'map'
require 'objects'

require 'helpers.string_helper'
require 'helpers.table_helper'
require 'helpers.dialog_helper'
require 'view.menu_main.menu_main_view'

the.app = App:new{
    onRun = function(self)
        self.view = MenuMainView:new()
        self.view:flash({ 0, 0, 0 }, 10)
    end,
}
