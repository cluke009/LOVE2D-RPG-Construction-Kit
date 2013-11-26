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
    onUpdate = function(self)
        self.velocity.x = 0
        self.velocity.y = 0
        if the.keys:pressed('up') then
            self.encounter = self.encounter - 1
            self.velocity.y = -300
            self.image = Assets:get('heroes', 1, 'img').up.image
            self:play('up')
        elseif the.keys:pressed('down') then
            self.encounter = self.encounter - 1
            self.velocity.y = 300
            self.image = Assets:get('heroes', 1, 'img').down.image
            self:play('down')
        elseif the.keys:pressed('left') then
            self.encounter = self.encounter - 1
            self.velocity.x = -300
            self.image = Assets:get('heroes', 1, 'img').left.image
            self:play('left')
        elseif the.keys:pressed('right') then
            self.encounter = self.encounter - 1
            self.velocity.x = 300
            self.image = Assets:get('heroes', 1, 'img').right.image
            self:play('right')
        end
        if self.velocity.x == 0 and self.velocity.y == 0 then
            self:freeze()
        end

        if self.encounter == 0 and Encounter[STATE.conf.map] then
            local a = math.random(1, #Encounter[STATE.conf.map])
            Battle:activate(Encounter[STATE.conf.map][a])
            self:rand()
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
    onUpdate = function(self)
        if STATE.event.removeObj[STATE.conf.map] and STATE.event.removeObj[STATE.conf.map][self.__class__] then
            if STATE.event.removeObj[STATE.conf.map][self.__class__][self.id] then
                -- Write image data to removeObj
                if not STATE.event.removeObj[STATE.conf.map][self.__class__][self.id][2] then
                    STATE.event.removeObj[STATE.conf.map][self.__class__][self.id] = {true, self.solid, self.image}
                elseif STATE.event.removeObj[STATE.conf.map][self.__class__][self.id][1] == false then
                    self.solid = STATE.event.removeObj[STATE.conf.map][self.__class__][self.id][2]
                    self.image = STATE.event.removeObj[STATE.conf.map][self.__class__][self.id][3]
                    STATE.event.removeObj[STATE.conf.map][self.__class__][self.id] = nil
                    -- table_print(STATE.event.removeObj)
                else
                    self.solid = false
                    self.image = 'assets/maps/img/trans.png'
                end
            end
        end

        if self.other then

            local otherX = self.other.x + (self.other.width / 2)
            local otherY = self.other.y + (self.other.height / 2)

            local selfX = self.x + (self.width / 2)
            local selfY = self.y + (self.height / 2)

            local offsetX = (self.width / 2) + (self.other.width / 2)
            local offsetY = (self.height / 2) + (self.other.height / 2)

            if math.abs(otherX - selfX) <= offsetX and math.abs(otherY - selfY) <= offsetY then
                if self.event then
                    self:onEvent()
                end
            end
        end
    end,
    onEvent = function(self)
        -- Get the currently needed event
        local e, continue
        e = Event:get(self.event)[1]
        if STATE.event[tonumber(self.event)] then
            -- table_print(STATE.event)
            local eid = STATE.event[tonumber(self.event)]['id']
            e = Event:get(self.event)[eid]
        end
        -- Check replay/autoplay logic
        if self.continue == 'true' then
            -- print('continue = true')
            if STATE.event[tonumber(self.event)].activated == false then
                STATE.event[tonumber(self.event)].activated = true
                self.continue = Event:init(self.event)
            end
        elseif e.replay and e.auto then
            -- print('replay=true','auto=true')
            self.continue = Event:init(self.event)
        elseif e.replay and not e.auto and the.keys:justPressed('return') then
            -- print('replay=true','auto=false')
            self.continue = Event:init(self.event)
        elseif not e.replay and e.auto then
            -- print('replay=false','auto=true')
            if not STATE.event[tonumber(self.event)] then
                self.continue = Event:init(self.event)
            elseif STATE.event[tonumber(self.event)].activated == false then
                STATE.event[tonumber(self.event)].activated = true
                self.continue = Event:init(self.event)
            end
        elseif not e.replay and not e.auto and the.keys:justPressed('return') then
            -- print('replay=false','auto=false')
            if not STATE.event[tonumber(self.event)] then
                self.continue = Event:init(self.event)
            elseif STATE.event[tonumber(self.event)].activated == false then
                STATE.event[tonumber(self.event)].activated = true
                self.continue = Event:init(self.event)
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
