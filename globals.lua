--
-- File: Globals
--

--
-- Function: table.copy
--
-- Arguments:
--      t - Table to copy
--
-- Returns:
--      table
--
function table.copy(t)
    local t2 = {}
    for k, v in pairs(t) do
        t2[k] = v
    end
    return t2
end

--
-- Function: table.deepcopy
--
-- Arguments:
--      t - Table to copy
--
-- Returns:
--      table
--
function table.deepcopy(t)
    if type(t) ~= 'table' then
        return t
    end
    local mt = getmetatable(t)
    local res = {}
    for k, v in pairs(t) do
        if type(v) == 'table' then
            v = table.deepcopy(v)
        end
        res[k] = v
    end
    setmetatable(res, mt)
    return res
end

--
-- I suck at math
--


--
-- Function: math.round
--
-- https://love2d.org/forums/viewtopic.php?f=4&t=146#p1508
-- Round 'v' to 'p' decimal places
--
-- Arguments:
--      v - value
--      p - precision
--
-- Returns:
--      rounded value
--
function math.round(v, p)
    -- figure out scaling factor for number of decimal points, or 0 if 'p' not supplied
    local scale = math.pow(10, p or 0)
    -- calculate result ignoring sign
    local res = math.floor(math.abs(v) * scale + 0.5) / scale
    -- if 'v' was negative return value should be too
    if v < 0 then
        res = -res
    end

    return res
end


--
-- Function: random
-- https://love2d.org/forums/viewtopic.php?f=4&t=10301#p62273
--
-- Arguments:
--      min - Lowest number.
--      max - Highest number.
--      precision - Precision in decimal places.
--
-- Returns:
--      number
--
function random(min, max, precision)
    local precision = precision or 0
    local num = math.random()
    local range = math.abs(max - min)
    local offset = range * num
    local randomnum = min + offset
    return math.floor(randomnum * math.pow(10, precision) + 0.5) / math.pow(10, precision)
end
