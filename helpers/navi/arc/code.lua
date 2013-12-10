local bool = {}
-- boolean map
function bool.map(c)
    if c then return 2 else return 1 end
end

local calc = {}
-- round number
function calc.round(num, idp)
    local mult = 10^(idp or 0)
    return math.floor(num * mult + 0.5) / mult
end

local str = {}
-- finds nth instance of pattern
function str.find_nth(s,p,n)
    local a,b,i = 1
    for i = 1,n do
        a,b = s:find(p,a)
        if a == nil then return a end
        a = b+1
    end
    a = a-p:len()
    return a
end
-- gets # of matches of a pattern in string
function str.get_nmatch(s,p)
    local i,w = 0
    for w in s:gmatch(p) do i = i+1 end
    return i
end
-- gets strings in between pattern
function str.inbw(s,p)
    local a,b,c = 1
    local t,i = {},1
    while true do
        c,b = s:find(p,a)
        if c == nil then
            t[i] = s:sub(a,-1)
            break
        end
        t[i] = s:sub(a,c-1)
        a = b+1
        i = i+1
    end
    return t
end
-- removes formatting commands from string
function str.unformat(s)
    s = s:gsub('|n','')
    s = s:gsub('|,','')
    s = s:gsub('|:','')
    s = s:gsub('|!','')
    s = s:gsub('|c%x%x%x%x%x%x%x%x','')
    return s
end


local tab = {}
-- create table from value repeated
function tab.rep(s,n)
    local t,i = {}
    for i = 1,n do t[i] = s end
    return t
end
-- get subset of table
function tab.sub(t,a,b)
    local o,i = {}
    for i = a,b do o[i-a+1] = t[i] end
    return o
end
-- range function
function tab.range(a,b,d)
    d = d or 1
    local t,i = {}
    local n = math.abs((b-a)/d)+1
    for i = 1,n do t[i] = a+d*(i-1) end
    return t
end
-- oneline table index
function tab.index(t,i)
    return t[i]
end
-- range for input areas
function tab.range_ia(n)
    return tab.range(0,fn.h*(n-1),fn.h)
end
-- adds alpha to color table if no alpha is there
function tab.addcola(t)
    if #t == 3 then t[4] = 255 end
    return t
end

local misc = {}
-- set default argument
function misc.get_def(v,d)
    if v == nil then
        return d
    else
        return v
    end
end

return {bool,calc,str,tab,misc}