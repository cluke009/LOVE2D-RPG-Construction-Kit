--
-- Get our MapLoader into scope.
--
local MapLoader
local MapSetter = function(map)
    MapLoader = map
end

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
        if the.app.view._mapPrev and self.to == the.app.view._mapPrev then
            -- Disable collision check on spawn.
            self._collide = false

            -- Set player x, y.
            the.app.view.playerX = self.x
            the.app.view.playerY = self.y
        end
    end,
    onCollide = function(self, other, xOverlap, yOverlap)
        if self._collide and other:instanceOf(the.app.view.player) then
            -- We need to set mapPrev before we change maps
            -- so X and Y coordinates are accesssible on map creation
            the.app.view._mapPrev = the.app.view.mapName
            the.app.view = MapLoader:new
            {
                player = the.app.view.player,
                mapName = self.to,
                mapDir = the.app.view.mapDir,
            }
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

return MapSetter
