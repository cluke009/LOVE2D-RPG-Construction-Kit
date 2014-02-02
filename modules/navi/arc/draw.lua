-- shortcuts
local lg = love.graphics

-- bundled draw functions
local draw = {}

-- A list of drawable objects
draw.list = {}

-- Sorting function
function draw.sort(a,b)
    return a.z < b.z
end
function draw.cursor(x,y)
    lg.setColor(_navi.arc.col.white)
    lg.draw(_navi.arc.img.cursor,x,y)
end

-- draw text
function draw.text(s,x,y,c)
    local c = c or _navi.arc.col.white
    if _navi.arc.cfg.msg_txt_shdw then
        lg.setColor(_navi.arc.col.shadow)
        lg.print(s,x+1,y+1)
    end
    lg.setColor(c)
    lg.print(s,x,y)
end
local arc_path = (...):match("(.-)[^%.]+$")
arc_path = string.gsub(arc_path, '%.', '/')
local dbox = lg.newImage(arc_path .. 'pics/dialogue-box-crop_03.png')
-- local dbox = lg.newImage('assets/img/dialoguebox_03.png')

-- draw window
function draw.window(x,y,w,h)
    -- lg.setColor(_navi.arc.col.white)
    lg.draw(dbox, -16,-16)
    -- lg.rectangle('line', x + 1, y + 1, w , h )
    -- lg.setColor(_navi.arc.col.window)
    -- lg.rectangle('fill', x + 1, y + 1, w - 2, h - 1)
    -- lg.setColor({0,0,0,64})
    -- lg.rectangle('fill',x,y+4,w,h-4)
    -- lg.setColor(_navi.arc.col.window)
    -- lg.rectangle('fill',x+1,y+4,w-2,h-5)
    -- lg.setLineWidth(1)
    -- lg.setLineStyle('rough')
    -- lg.setColor({40,40,40})
    -- lg.rectangle('fill',x,y,w,4)
    -- lg.setColor(_navi.arc.col.white)
    -- lg.line(x+1,y+1,x+w-1,y+1)
    -- lg.setColor(_navi.arc.col.gray)
    -- lg.line(x+1,y+2,x+w-1,y+2)
end

-- window animation
function draw.win_anim(x,y,w,h,f,d)
    if f > 1 then f = 1 end
    local ax,ay,aw,ah
    if d == 'close' then f = 1-f end
    if f >= 0 and f <= 0.5 then
        f = math.sin(math.pi*f)
        ax = x+w/2*(1-f)
        aw = f*w
        ay = y+h/2
        ah = 0
    elseif f > 0.5 and f <= 1 then
        f = math.sin(math.pi*(f-0.5))
        ax = x
        aw = w
        ay = y+h/2*(1-f)
        ah = f*h
    end
    _navi.draw.window(ax,ay,aw,ah)
end

return draw
