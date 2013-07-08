local Trigger   = require 'triggers'
local Battle    = require 'battle'
local dialog    = require 'assets.tables.dialog'
local enemies   = require 'assets.tables.enemies'
local items     = require 'assets.tables.items'
local equipment = require 'assets.tables.equipment'
local obj       = require 'assets.tables.obj'
local npc       = require 'assets.tables.npcs'

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    DOOR - Where you leave a room.

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Door = Tile:extend
{
    onCollide = function (self, other)
        if other:instanceOf(Hero) then
            STATE.prevmap = STATE.map
            STATE.map = self.to

            the.app.view = MapView:new()
            the.app.view:flash({0, 0, 0}, .75)
        end
    end
}

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    SPAWN - Where you enter a room

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Spawn = Tile:extend
{
    onNew = function ( self )
        if STATE.prevmap and self.from == STATE.prevmap then
            STATE.heroStartX = self.x
            STATE.heroStartY = self.y
        end
    end
}

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    HERO - Player sprite

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Hero = Animation:extend
{
    -- TODO: add config
    width  = 32,
    height = 32,
    image  = 'assets/img/hero.png',

    onUpdate = function (self)
        self.velocity.x = 0
        self.velocity.y = 0

        if the.keys:pressed('up') then
            self.velocity.y = -300
        elseif the.keys:pressed('down') then
            self.velocity.y = 300
        end
        if the.keys:pressed('left') then
            self.velocity.x = -300
        elseif the.keys:pressed('right') then
            self.velocity.x = 300
        end
    end

}

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    ENEMY

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Enemy = Tile:extend
{
    onNew = function(self)
        -- TODO: add config
        self.id     = tonumber(self.id)
        self.dialog = tonumber(self.dialog)
        self.image  = enemies[self.id]['image']
        self.width  = enemies[self.id]['width']
        self.height = enemies[self.id]['height']
    end,
    onCollide = function (self, other)
        if other:instanceOf(Hero) then
            self.other = other
            self:displace(other)
        end
    end,
    onUpdate = function (self)
        if self.other then

            local otherX = self.other.x + (self.other.width/2)
            local otherY = self.other.y + (self.other.height/2)

            local selfX = self.x + (self.width/2)
            local selfY = self.y + (self.height/2)

            local offsetX = (self.width/2) + (self.other.width/2)
            local offsetY = (self.height/2) + (self.other.height/2)

            if math.abs(otherX - selfX) <= offsetX and math.abs(otherY - selfY) <= offsetY then
                if the.keys:justPressed('return') then

                    -- Display dialog
                    local d = ''
                    if self.dialog then
                        d = dialog[self.dialog]
                    else
                        d = string.gsub(dialog.enemies, '$enemy', enemies[self.id].name)
                        d = {d}
                    end

                    Dialog:new{
                        text = d
                    }:activate()
                    Battle.enemyInit = self.id
                    Battle:activate(self.id)
                end
            end
        end
    end
}

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    CHEST

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Chest = Tile:extend
{
    onNew = function ( self )

        -- Get item type
        if self.item then
            self.kind = 'item'
        elseif self.equipment then
            self.kind = 'equipment'
        elseif self.weapon then
            self.kind = 'weapon'
        end

        -- Add params
        self.uid       = tonumber(self.x .. self.y)
        self.item      = tonumber(self.item)
        self.equipment = tonumber(self.equipment)
        self.weapon    = tonumber(self.weapon)
        self.id        = self[self.kind]

        -- Set state of chest
        if STATE[STATE.map] == nil then
            STATE[STATE.map] = {}
            STATE[STATE.map]['chest'] = {}
        end
        if STATE[STATE.map]['chest'][self.uid] == nil then
            self.open = 0
            self.image = 'assets/img/chest.gif'
        else
            self.open = 1
            self.image = 'assets/img/chestopen.gif'
        end

    end,
    onCollide = function (self, other)
        if other:instanceOf(Hero) then
            self.other = other
            self:displace(other)
        end
    end,
    onUpdate = function (self)
        if self.other then

            local otherX = self.other.x + (self.other.width/2)
            local otherY = self.other.y + (self.other.height/2)

            local selfX = self.x + (self.width/2)
            local selfY = self.y + (self.height/2)

            local offsetX = (self.width/2) + (self.other.width/2)
            local offsetY = (self.height/2) + (self.other.height/2)

            if math.abs(otherX - selfX) <= offsetX and math.abs(otherY - selfY) <= offsetY then
                if the.keys:justPressed('return') and self.open == 0 then
                    self.image = 'assets/img/chestopen.gif'
                    self.open = 1

                    STATE[STATE.map]['chest'][self.uid] = 1

                    -- Save to inventory
                    if STATE['inventory'][self.kind][self.id] == nil then
                        STATE['inventory'][self.kind][self.id] = 1
                    else
                        STATE['inventory'][self.kind][self.id] = STATE['inventory'][self.kind][self.id] + 1
                    end

                    -- Display dialog
                    local d = ''
                    if self.dialog then
                        d = dialog[tonumber(self.dialog)]
                    else
                        if self.item then
                            d = string.gsub(dialog.items, '$item', items[self.id].name)
                        elseif self.equipment then
                            d = string.gsub(dialog.items, '$item', equipment[self.id].name)
                        end
                        d = {d}
                    end

                    Dialog:new{text = d}:activate()

                end
            end
        end
    end
}

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    Obj

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Obj = Tile:extend
{
    onNew = function(self)
        -- TODO: add config
        self.id     = tonumber(self.id)
        self.dialog = tonumber(self.dialog)
        self.image  = obj[self.id]['image']
        self.width  = obj[self.id]['width']
        self.height = obj[self.id]['height']
    end,
    onCollide = function (self, other)
        self.other = other
        if other:instanceOf(Hero) and self.solid ~= 'false' then
            self:displace(other)
        end
    end,
    onUpdate = function (self)
        if self.other then

            local otherX = self.other.x + (self.other.width/2)
            local otherY = self.other.y + (self.other.height/2)

            local selfX = self.x + (self.width/2)
            local selfY = self.y + (self.height/2)

            local offsetX = (self.width/2) + (self.other.width/2)
            local offsetY = (self.height/2) + (self.other.height/2)

            if math.abs(otherX - selfX) <= offsetX and math.abs(otherY - selfY) <= offsetY then
                if the.keys:justPressed('return') then
                    if self.dialog then
                        Dialog:new{
                            text = dialog[self.dialog]
                        }:activate()
                    end
                    if self.trigger then
                        Trigger[self.trigger]( )
                    end
                    if self.scene then
                        Trigger:scene(self.scene)
                    end
                end
            end
        end
    end
}


--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    NPC

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
NPC = Obj:extend
{
    onNew = function(self)
        self.id     = tonumber(self.id)
        self.dialog = tonumber(self.dialog)
        self.image  = npc[self.id]['image']
        self.width  = npc[self.id]['width']
        self.height = npc[self.id]['height']
    end,

}
