--
-- File: Objects
--

local Battle    = require 'views.battle'
local Encounter = require 'assets.tables.encounters'

local Assets    = require 'helpers/asset_helper'
local Event     = require 'helpers/event_helper'

--
-- Class: Door
-- Add the property "to" with the value "*mapname*" to load when passing over it.
--
Door = Tile:extend{
    __class__ = 'Door',
    onCollide = function(self, other)
        if other:instanceOf(Hero) then
            STATE.conf.prevmap = STATE.conf.map
            STATE.conf.map = self.to
            the.app.view = MapView:new()
            if the.app.view.foreground then
                the.app.view:moveToFront(the.app.view.foreground)
            end
            the.app.view:flash({ 0, 0, 0 }, .75)
        end
    end
}

--
-- Class: Spawn
-- Add the property "from" with the value "*mapname*" to specify the spawn point when coming from that location.
--
Spawn = Tile:extend{
    __class__ = 'Spawn',
    onNew = function(self)
        if STATE.conf.prevmap and self.from == STATE.conf.prevmap then
            STATE.conf.heroStartX = self.x
            STATE.conf.heroStartY = self.y
        end
    end
}

--
-- Class: Hero
-- Player sprite. Grabs data from the first hero in heroes.lua
--
Hero = Animation:extend{
    __class__ = 'Hero',
    width  = Assets:get('heroes', 1, 'img').width,
    height = Assets:get('heroes', 1, 'img').height,
    image  = Assets:get('heroes', 1, 'img').down.image,
    sequences = {
        right = {
            frames = Assets:get('heroes', 1, 'img').right.frames,
            fps = Assets:get('heroes', 1, 'img').right.fps
        },
        left  = {
            frames = Assets:get('heroes', 1, 'img').left.frames,
            fps = Assets:get('heroes', 1, 'img').left.fps
        },
        up    = {
            frames = Assets:get('heroes', 1, 'img').up.frames,
            fps = Assets:get('heroes', 1, 'img').up.fps
        },
        down  = {
            frames = Assets:get('heroes', 1, 'img').down.frames,
            fps = Assets:get('heroes', 1, 'img').down.fps
        },
    },
    rand = function(self)
        local low = 100
        local high = 175
        if Encounter[STATE.conf.map] then
            low = Encounter[STATE.conf.map]['rate'][1]
            high = Encounter[STATE.conf.map]['rate'][2]
        end
        self.encounter = math.random(low, high)
    end,
    onNew = function(self)
        self:rand()
    end,
    onCollide = function(self, other)

    end,
    onUpdate = function(self)
        -- 
        -- Check if Navi is active and disable movement.
        -- 
        if not Event.navi then
            --
            -- KeyPressed
            --
            if the.keys:pressed('up') and self.velocity.x == 0 then
                self.encounter, self.velocity.y = self.encounter - 1, -120
                self.image = Assets:get('heroes', 1, 'img').up.image
                self:play('up')
            elseif the.keys:pressed('down') and self.velocity.x == 0 then
                self.encounter, self.velocity.y = self.encounter - 1, 120
                self.image = Assets:get('heroes', 1, 'img').down.image
                self:play('down')
            elseif the.keys:pressed('left') and self.velocity.y == 0 then
                self.encounter, self.velocity.x = self.encounter - 1, -120
                self.image = Assets:get('heroes', 1, 'img').left.image
                self:play('left')
            elseif the.keys:pressed('right') and self.velocity.y == 0 then
                self.encounter, self.velocity.x = self.encounter - 1, 120
                self.image = Assets:get('heroes', 1, 'img').right.image
                self:play('right')
            end

            --
            -- KeyReleased
            --
            if the.keys:justReleased('up') then
                local x,y = the.app.view.map:pixelToMap(self.x,self.y)
                local spriteAtMap = the.app.view.map:spriteAtMap(x,y)
                self['uy'] = (spriteAtMap and y * 32 or (y - 1) * 32)
                self.up = true
            elseif the.keys:justReleased('down') then
                local x,y = the.app.view.map:pixelToMap(self.x,self.y)
                local spriteAtMap =  the.app.view.map:spriteAtMap(x,y + 1)
                self['dy'] = (spriteAtMap and (y - 1) * 32 or y * 32)
                self.down = true
            elseif the.keys:justReleased('left') then
                local x,y = the.app.view.map:pixelToMap(self.x,self.y)
                local spriteAtMap =  the.app.view.map:spriteAtMap(x,y)
                self['lx'] = (spriteAtMap and x * 32 or (x - 1) * 32)
                self.left = true
            elseif the.keys:justReleased('right') then
                local x,y = the.app.view.map:pixelToMap(self.x,self.y)
                local spriteAtMap = the.app.view.map:spriteAtMap(x + 1,y)
                self['rx'] = (spriteAtMap and (x - 1) * 32 or x * 32)
                self.right = true
            end
        end

        --
        -- Interpolate coordinates
        --
        if self.up and self.y <= self.uy then
            self.y, self.velocity.y, self.up = self.uy, 0, false
        elseif self.down and self.y >= self.dy then
            self.y, self.velocity.y, self.down = self.dy, 0, false
        elseif self.left and self.x <= self.lx then
            self.x, self.velocity.x, self.left = self.lx, 0, false
        elseif self.right and self.x >= self.rx then
            self.x, self.velocity.x, self.right = self.rx, 0, false
        end

        --
        -- Other Crap
        --
        if self.encounter == 0 and Encounter[STATE.conf.map] then
            local a = math.random(1, #Encounter[STATE.conf.map])
            Battle:activate(Encounter[STATE.conf.map][a])
            self:rand()
        end
        if self.velocity.x == 0 and self.velocity.y == 0 then
            self:freeze()
        end
    end
}

--
-- Class: Chest
-- Items and equipment can go in here.
-- Add the property "item" / "equipment" with the "id" from the appropriate config file.
--
Chest = Tile:extend{
    __class__ = 'Chest',
    onNew = function(self)
        -- Get item type
        if self.item then
            self.kind = 'item'
        elseif self.equipment then
            self.kind = 'equipment'
        end

        -- Add params
        self.uid        = tonumber(self.x .. self.y)
        self.item       = tonumber(self.item)
        self.equipment  = tonumber(self.equipment)
        self.weapon     = tonumber(self.weapon)
        self.id         = self[self.kind]

        -- Set state of chest
        if STATE[STATE.conf.map] == nil then
            STATE[STATE.conf.map] = {}
            STATE[STATE.conf.map]['chest'] = {}
        end
        -- TODO: add config for image
        if STATE[STATE.conf.map]['chest'][self.uid] == nil then
            self.open = 0
            self.image = 'assets/img/chest.gif'
        else
            self.open = 1
            self.image = 'assets/img/chestopen.gif'
        end
    end,
    onCollide = function(self, other)
        if other:instanceOf(Hero) then
            self.other = other
            self:displace(other)
        end
    end,
    onUpdate = function(self)
        if self.other then
            local otherX = self.other.x + (self.other.width / 2)
            local otherY = self.other.y + (self.other.height / 2)

            local selfX = self.x + (self.width / 2)
            local selfY = self.y + (self.height / 2)

            local offsetX = (self.width / 2) + (self.other.width / 2)
            local offsetY = (self.height / 2) + (self.other.height / 2)

            if math.abs(otherX - selfX) <= offsetX and math.abs(otherY - selfY) <= offsetY then
                if the.keys:justPressed('return') and self.open == 0 then
                    self.image = 'assets/img/chestopen.gif'
                    self.open = 1

                    STATE[STATE.conf.map]['chest'][self.uid] = 1

                    -- Save to inventory
                    Inventory:put(self.kind, self.id)

                    -- Display dialog
                    local d = ''
                    if self.dialog then
                        d = dialog[tonumber(self.dialog)]
                    else
                        if self.item then
                            d = string.gsub('Recieved $item. Its a good one', '$item', Items:get(self.id, 'name'))
                        elseif self.equipment then
                            d = string.gsub('Recieved $item. Its a good one', '$item', Equipment:get(self.id, 'name'))
                        end
                        d = { d }
                    end

                    Dialog:new{ dialog = d }:activate()
                end
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
        self.image  = Assets:get('obj', self.id, 'image')
        self.width  = Assets:get('obj', self.id, 'width')
        self.height = Assets:get('obj', self.id, 'height')
    end,
    onCollide = function(self, other)
        self.other = other

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
        self.image  = Assets:get('npcs', self.id, 'image')
        self.width  = Assets:get('npcs', self.id, 'width')
        self.height = Assets:get('npcs', self.id, 'height')
    end,
}

--
-- Class: Enemy
-- Add the property "id" with the "id value" from enemies.lua.
--
-- Extends:
--      <Obj>
--
Enemy = Obj:extend{
    __class__ = 'Enemy',
    onNew = function(self)
        self.id        = tonumber(self.id)
        self.image     = Assets:get('enemies', self.id, 'img').idle.image
        self.width     = Assets:get('enemies', self.id, 'img').width
        self.height    = Assets:get('enemies', self.id, 'img').height
        self.sequences = {
            down = {
                frames = Assets:get('enemies', self.id, 'img').idle.frames,
                fps    = Assets:get('enemies', self.id, 'img').idle.fps
            },
        }
        self:play('down')
    end,
}

--
-- Class: Test
-- Testing walk cycles
--
-- Extends:
--      <Obj>
--
Test = Animation:extend{
    onNew = function(self)
        self.count = 1
        self.id        = tonumber(self.id)
        self.image     = Assets:get('enemies', self.id, 'img').idle.image
        self.width     = Assets:get('enemies', self.id, 'img').width
        self.height    = Assets:get('enemies', self.id, 'img').height
        self.sequences = {
            right = {
                frames = Assets:get('enemies', self.id, 'img').right.frames,
                fps = Assets:get('enemies', self.id, 'img').right.fps
            },
            left  = {
                frames = Assets:get('enemies', self.id, 'img').left.frames,
                fps = Assets:get('enemies', self.id, 'img').left.fps
            },
            up    = {
                frames = Assets:get('enemies', self.id, 'img').up.frames,
                fps = Assets:get('enemies', self.id, 'img').up.fps
            },
            down  = {
                frames = Assets:get('enemies', self.id, 'img').down.frames,
                fps = Assets:get('enemies', self.id, 'img').down.fps
            },
        }
        self:play('down')
        self.cycleID = 1
    end,
    onUpdate = function(self)
        self.velocity.x = 0
        self.velocity.y = 0

        if self.count < Assets:get('enemies', self.id, 'cycle')[self.cycleID][2] * 16 then
            self:play(Assets:get('enemies', self.id, 'cycle')[self.cycleID][1])
            if Assets:get('enemies', self.id, 'cycle')[self.cycleID][1] == 'up' then
                self.velocity.y = -64
            elseif Assets:get('enemies', self.id, 'cycle')[self.cycleID][1] == 'down' then
                self.velocity.y = 64
            elseif Assets:get('enemies', self.id, 'cycle')[self.cycleID][1] == 'left' then
                self.velocity.x = -64
            elseif Assets:get('enemies', self.id, 'cycle')[self.cycleID][1] == 'right' then
                self.velocity.x = 64
            end
        elseif self.cycleID >= #Assets:get('enemies', self.id, 'cycle') then
            self.cycleID = 1
            self.count = 1
        else
            self.cycleID = self.cycleID + 1
            self.count = 1

        end

        self.count = self.count + 1
    end
}
