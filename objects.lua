local Trigger = require'triggers'
local Battle  = require'view.battle.battle_view'
local Encounter = require'assets.tables.encounters'

local Assets  = require'assets'
local Enemies = Assets.Enemy
local Items   = Assets.Item
local Equipment = Assets.Equipment
local Inventory = Assets.Inventory

local dialog = require'assets.tables.dialog'

local obj = require'assets.tables.obj'
local npc = require'assets.tables.npcs'

--
-- Class: Door
-- Add the property "to" with the value "*mapname*" to load when passing over it.
--
Door = Tile:extend{
    onCollide = function(self, other)
        if other:instanceOf(Hero) then
            STATE.prevmap = STATE.map
            STATE.map = self.to
            the.app.view = MapView:new()
            the.app.view:flash({ 0, 0, 0 }, .75)
        end
    end
}

--
-- Class: Spawn
-- Add the property "from" with the value "*mapname*" to specify the spawn point when coming from that location.
--
Spawn = Tile:extend{
    onNew = function(self)
        if STATE.prevmap and self.from == STATE.prevmap then
            STATE.heroStartX = self.x
            STATE.heroStartY = self.y
        end
    end
}

--
-- Class: Hero
-- Player sprite. Grabs data from the first hero in heroes.lua
--
Hero = Animation:extend{
    width  = STATE.heroes[1].img.width,
    height = STATE.heroes[1].img.height,
    image  = STATE.heroes[1].img.down.image,
    sequences = {
        right = {
            frames = STATE.heroes[1].img.right.frames,
            fps = STATE.heroes[1].img.right.fps
        },
        left  = {
            frames = STATE.heroes[1].img.left.frames,
            fps = STATE.heroes[1].img.left.fps
        },
        up    = {
            frames = STATE.heroes[1].img.up.frames,
            fps = STATE.heroes[1].img.up.fps
        },
        down  = {
            frames = STATE.heroes[1].img.down.frames,
            fps = STATE.heroes[1].img.down.fps
        },
    },
    rand = function(self)
        local low = 100
        local high = 175
        if Encounter[STATE.map] then
            low = Encounter[STATE.map]['rate'][1]
            high = Encounter[STATE.map]['rate'][2]
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
            self.image = STATE.heroes[1].img.up.image
            self:play('up')
        elseif the.keys:pressed('down') then
            self.encounter = self.encounter - 1
            self.velocity.y = 300
            self.image = STATE.heroes[1].img.down.image
            self:play('down')
        elseif the.keys:pressed('left') then
            self.encounter = self.encounter - 1
            self.velocity.x = -300
            self.image = STATE.heroes[1].img.left.image
            self:play('left')
        elseif the.keys:pressed('right') then
            self.encounter = self.encounter - 1
            self.velocity.x = 300
            self.image = STATE.heroes[1].img.right.image
            self:play('right')
        end
        if self.velocity.x == 0 and self.velocity.y == 0 then
            self:freeze()
        end

        if self.encounter == 0 and Encounter[STATE.map] then
            local a = math.random(1, #Encounter[STATE.map])
            Battle:activate(Encounter[STATE.map][a])
            self:rand()
        end
    end
}


--
-- Class: Spawn
-- Add the property "id" with the "id value" from enemies.lua.
--
Enemy = Animation:extend{
    onNew = function(self)
        self.id        = tonumber(self.id)
        self.dialog    = tonumber(self.dialog)
        self.image     = Enemies:get(self.id, 'img').idle.image
        self.width     = Enemies:get(self.id, 'img').width
        self.height    = Enemies:get(self.id, 'img').height
        self.sequences = {
            down = {
                frames = Enemies:get(self.id, 'img').idle.frames,
                fps    = Enemies:get(self.id, 'img').idle.fps
            },
        }
        self:play('down')
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
                if the.keys:justPressed('return') then

                    -- Display dialog
                    local d = ''
                    if self.dialog then
                        d = dialog[self.dialog]
                    else
                        d = string.gsub(dialog.enemies, '$enemy', Enemies:get(self.id, 'name'))
                        d = { d }
                    end

                    Dialog:new{
                        dialog = d
                    }:activate()
                    -- Battle.enemyInit = self.id
                    TEMP['objects.Enemy.onUpdate.enemyID'] = self.id
                    Battle:activate(self.id)
                    -- TEMP['objects.Enemy.onUpdate.enemyID'] = nil
                end
            end
        end
    end
}

--
-- Class: Chest
-- Items and equipment can go in here.
-- Add the property "item" / "equipment" with the "id" from the appropriate config file.
--
Chest = Tile:extend{
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
        if STATE[STATE.map] == nil then
            STATE[STATE.map] = {}
            STATE[STATE.map]['chest'] = {}
        end
        -- TODO: add config for image
        if STATE[STATE.map]['chest'][self.uid] == nil then
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

                    STATE[STATE.map]['chest'][self.uid] = 1

                    -- Save to inventory
                    Inventory:put(self.kind, self.id)

                    -- Display dialog
                    local d = ''
                    if self.dialog then
                        d = dialog[tonumber(self.dialog)]
                    else
                        if self.item then
                            d = string.gsub(dialog.items, '$item', Items:get(self.id, 'name'))
                        elseif self.equipment then
                            d = string.gsub(dialog.items, '$item', Equipment:get(self.id, 'name'))
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
Obj = Tile:extend{
    onNew = function(self)
        self.id     = tonumber(self.id)
        self.dialog = tonumber(self.dialog)
        self.image  = obj[self.id]['image']
        self.width  = obj[self.id]['width']
        self.height = obj[self.id]['height']
    end,
    onCollide = function(self, other)
        self.other = other
        if other:instanceOf(Hero) and self.solid ~= 'false' then
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
                if the.keys:justPressed('return') then
                    if self.dialog then
                        Dialog:new{
                            dialog = dialog[self.dialog]
                        }:activate()
                    end
                    if self.trigger then
                        local options = split(self.trigger, ',')
                        local func = options[1]
                        options[1] = nil

                        local args = {}
                        for k,v in pairs(options) do
                            local a = split(v, '=')
                            args[string.trim(a[1])] = string.trim(a[2])
                        end
                        Trigger[func](self, args)
                    end
                    if self.scene then
                        Trigger:scene(self.scene)
                    end
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
    onNew = function(self)
        self.id     = tonumber(self.id)
        self.dialog = tonumber(self.dialog)
        self.image  = npc[self.id]['image']
        self.width  = npc[self.id]['width']
        self.height = npc[self.id]['height']
    end,
}
