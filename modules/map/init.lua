--
-- Class: MapLoader
-- Local map loader class allows us to link multiple Tiled maps together.
-- Extends:
--      <View>
--
-- Properties:
--     public  - player, playerX, playerY, mapDir, mapName
--     private - _player, _mapPrev
--
local MapLoader = View:extend
{
    onNew = function(self)

        -- Load map
        self:loadLayers(self.mapDir .. self.mapName .. '/' .. self.mapName .. '.lua')

        -- Load map config
        local config = require('assets.maps.' .. self.mapName .. '.config')
        -- preload our events to avoid delays
        require('assets.maps.' .. self.mapName .. '.events')

        STATE.encounters[self.mapName] = config.encounters or {}
        STATE.mapName = self.mapName

        -- Create player
        -- We copy player object and create a new instance because we need
        -- to reference the original object for collision handling, presumably.
        self._player = self.player:new()

        -- Coordinates upon entering new room.
        -- Why must we reference the.app.view and self they should be the same?
        self._player.x = self.playerX or the.app.view.playerX or 0
        self._player.y = self.playerY or the.app.view.playerY or 0

        -- Add player
        self:add(self._player)
        the.hero = self._player
        -- Map stuff
        self.focus = self._player
        self:clampTo(self.map)

    end,

    onUpdate = function(self, elapsed)
        -- camera(elapsed)
        self.objects:collide(self._player)
        self.map:displace(self._player)
    end
}


--
-- Class: Door
-- Where you enter and exit a map.
--
-- Extends:
--      <Tile>
--
Door = Tile:extend
{
    _collide = true,
    onNew = function(self)
        if the.app.view._mapPrev and split(self.to, ',')[1] == the.app.view._mapPrev then
            -- Disable collision check on spawn.
            self._collide = false

            -- Set player x, y.
            the.app.view.playerX = self.x
            the.app.view.playerY = self.y
        end
    end,
    onCollide = function(self, other, xOverlap, yOverlap)
        if self._collide and other:instanceOf(the.app.view.player) then
            local _map = split(self.to, ',')

            the.app.view._mapPrev = the.app.view.mapName
            the.app.view = MapLoader:new
            {
                player = the.app.view.player,
                mapName = _map[1],
                mapDir = the.app.view.mapDir,
            }

            -- Set player x, y.
            the.app.view._player.x = _map[2] * 32
            the.app.view._player.y = _map[3] * 32

            -- Move foreground layer up
            if the.app.view.foreground then
                the.app.view:moveToFront(the.app.view.foreground)
            end
            the.app.view:flash({0, 0, 0}, .75)
        end
    end,
    onUpdate = function(self, elapsed)
        -- Enable collision check after we move off Door.
        local _p = the.app.view._player
        if not self:intersects(_p.x, _p.y, _p.width, _p.height) then
            self._collide = true
        end
    end,
}

return MapLoader
