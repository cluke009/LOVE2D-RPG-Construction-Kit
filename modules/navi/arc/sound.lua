-- shortcuts
local la = love.audio

local sound = {}

-- play sound
function sound.play(s)
    s:stop()
    s:rewind()
    la.play(s)
end

return sound