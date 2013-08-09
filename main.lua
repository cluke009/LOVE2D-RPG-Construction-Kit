--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------
    LOVE2D RPG CONSTRUCTION KIT
--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
STRICT = true
DEBUG = true
io.stdout:setvbuf("no")

require'zoetrope'
require'global'

require'view.menu_main.menu_main_view'

the.app = App:new{
    onRun = function(self)
        self.view = MenuMainView:new()
        self.view:flash({ 0, 0, 0 }, 10)
    end,
    onUpdate = function(self)
    end
}
