
local e = {}


e.init = function ( self, img )


    local shader = love.graphics.newPixelEffect([[
        vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords)
        {

            vec4 pixel = Texel(texture, texture_coords);

            pixel.r = 1.0-pixel.r;
            pixel.g = 1.0-pixel.g;
            pixel.b = 1.0-pixel.b;
            return  pixel;

        }

    ]])
    love.graphics.setPixelEffect(shader)
end

return e
