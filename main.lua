-- Debug
STRICT = true
DEBUG  = true
io.stdout:setvbuf("no")

-- Init
require 'zoetrope'
require 'modules.helpers'

-- Tables
npcs      = require 'assets.tables.npcs'
objs      = require 'assets.tables.obj'
items     = require 'assets.tables.items'
equipment = require 'assets.tables.equipment'
heroes    = require 'assets.tables.heroes'

-- Modules
STATE   = require 'modules.state'
Navi    = require 'modules.navi'
Event   = require 'modules.event'
Animate = require 'modules.animate'
Menu    = require 'modules.menu'

-- Views
MapView  = require 'modules.map'
ShopView = require 'views.shop'


-- Create Hero object
Hero = Animation:extend
{
    width = 32,
    height = 32,
    image = 'assets/img/spritetest.png',
    sequences = {
        down = {
            frames ={1,2},
            fps = 5,
        },
        left = {
            frames ={3,4},
            fps = 5,
        },
        right = {
            frames ={7,8},
            fps = 5,
        },
        up = {
            frames ={5,6},
            fps = 5,
        },
    },
    onUpdate = function (self)
        self.velocity.x = 0
        self.velocity.y = 0

        -- Its time to run
        local velo = 120
        if the.keys:pressed('shift') then
            velo = 300
        end

        -- Its time to move
        if not Event.navi then
            if the.keys:pressed('up') then
                self.velocity.y = -velo
                self:play('up')
            elseif the.keys:pressed('down') then
                self.velocity.y = velo
                self:play('down')
            elseif the.keys:pressed('left') then
                self.velocity.x = -velo
                self:play('left')
            elseif the.keys:pressed('right') then
                self.velocity.x = velo
                self:play('right')
            elseif self.velocity.x == 0 and self.velocity.y == 0 then
                self:freeze()
            end
        end
    end
}
--
-- Class: Obj
-- Anything else that might go on your map.
-- - These can be collideable or not by setting the property "solid" with a value of "false".
-- - Add the property "id" with the "id value" from obj.lua.
--
Obj = Animation:extend {
    __class__ = 'Obj',
    onNew = function(self)
        self.id     = tonumber(self.id)
        self.image  = objs[self.id].image
        self.width  = objs[self.id].width
        self.height = objs[self.id].height
    end,
    onCollide = function(self, other)
        if other:instanceOf(Hero) then self.other = other end
        if other:instanceOf(Hero) and self.solid ~= 'false' then
            self:displace(other)
        end
    end,
    animate = function(self, elapsed)
    end,
    onUpdate = function(self, elapsed)
        Event:checkObj(self)
        self:animate(elapsed)

        if self.other then
            local otherX = self.other.x + (self.other.width / 2)
            local otherY = self.other.y + (self.other.height / 2)
            local selfX = self.x + (self.width / 2)
            local selfY = self.y + (self.height / 2)
            local offsetX = (self.width / 2) + (self.other.width / 2)
            local offsetY = (self.height / 2) + (self.other.height / 2)

            if math.abs(otherX - selfX) <= offsetX and math.abs(otherY - selfY) <= offsetY then
                if self.event then
                    Event:register(self.event)
                end
            end
        end
    end
}

--
-- Class: NPC
-- Add the property "id" with the "id value" from npcs.lua.
--
-- Extends:
--      <Obj>
--
NPC = Obj:extend {
    __class__ = 'NPC',
    onNew = function(self)
        self.id     = tonumber(self.id)
        self.image  = npcs[self.id].image
        self.width  = npcs[self.id].width
        self.height = npcs[self.id].height
    end,
}

-- Create new app
the.app = App:new
{
    onRun = function (self)
        -- Load our map
        self.view = MapView:new
        {
            player  = Hero,
            mapDir  = 'assets/maps/',
            mapName = 'itemshop',
            playerX = 360,
            playerY = 260
        }
        -- Move foreground layer up
        if the.app.view.foreground then
            the.app.view:moveToFront(the.app.view.foreground)
        end
        the.app.view:flash({0, 0, 0}, .75)
    end
}
