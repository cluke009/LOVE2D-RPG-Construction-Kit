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
        self:loadLayers(self.mapDir .. self.mapName .. '.lua')

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

        -- Map stuff
        self.focus = self._player
        self:clampTo(self.map)
    end,

    onUpdate = function(self)
        self.map:displace(self._player)
        self.objects:collide(self._player)
    end
}

--
-- Pass our MapLoader to objects.lua to avoid circular require.
--
local MapSetter = require(... .. '.objects')
MapSetter(MapLoader)

return MapLoader
