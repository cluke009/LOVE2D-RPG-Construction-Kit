-- Debug
STRICT = true
DEBUG  = true
io.stdout:setvbuf("no")

-- Init
require 'zoetrope'
require 'objects'
require 'modules.helpers'

-- Tables
npcs      = require 'assets.tables.npcs'
objs      = require 'assets.tables.objs'
items     = require 'assets.tables.items'
equipment = require 'assets.tables.equipment'
heroes    = require 'assets.tables.heroes'
enemies   = require 'assets.tables.enemies'

-- Modules
STATE   = require 'modules.state'
Navi    = require 'modules.navi'
Event   = require 'modules.event'
Animate = require 'modules.animate'
Battle  = require 'modules.battle'

-- Views
apView    = require 'modules.map'
ShopView   = require 'views.shop'
BattleView = require 'views.battle'

-- Create new app
the.app = App:new
{
    name = 'RPG Construction Kit V0.1',
    onRun = function (self)
        -- Load our map
        self.view = MapView:new
        {
            player  = Hero,
            mapDir  = 'assets/maps/',
            mapName = 'inn',
            playerX = 5 * 32,
            playerY = 5 * 32
        }
        -- Move foreground layer up
        if the.app.view.foreground then
            the.app.view:moveToFront(the.app.view.foreground)
        end
        the.app.view:flash({0, 0, 0}, .75)
    end,
    onUpdate = function (self)
        if DEBUG and the.keys:justPressed('f5') then
            table_print(STATE)
        end
    end,
}
