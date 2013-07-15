local DefaultMap = require 'assets.maps.test'


local MapGen = {

    base = require 'assets.maps.test',

    init = function ( self, ... )
        local B       = self.base
        local aHeight = 600
        local aWidth  = 800
        local iWidth  = B.tilesets[1].imagewidth
        local iHeight = B.tilesets[1].imageheight
        local tWidth  = B.tilewidth
        local tHeight = B.tileheight

        B.height = math.round(math.random(aHeight, aHeight * 4) / tHeight)
        B.width  = math.round(math.random(aWidth, aWidth * 4) / tWidth)

        B.layers[1].height = B.height
        B.layers[1].width = B.width

        local bSize = B.height * B.width

        local I = iWidth * iHeight
        local T = tWidth * tHeight
        local numTiles = I/T

        local c = {}

        for i = 1, 3 do --height
            local r = {}
            for i = 1, 5 do --width
                table.insert(r, 0)
            end
            table.insert(c, r)
        end
        pretty.dump(c)
        local t ={}
        for i = 1, 30 do
            -- local m = math.random(1, numTiles)
            table.insert(t, 0)
        end
        local rows = 3
        local cols = 10
        local dir

        for i=1,30 do
            dir = math.random(1,4)
            if dir == 1 then -- Move up

            elseif dir == 2 then -- Move down

            elseif dir == 3 then -- Move left

            else -- Move right

            end
        end



        B.layers[1].data = c


        return B
    end

}

function join_tables(t1, t2)
    for k,v in ipairs(t2) do
        table.insert(t1, v)
    end
    return t1
end
return MapGen
