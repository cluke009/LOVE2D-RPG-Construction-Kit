-- shortcuts
local lg = love.graphics

-- bundled draw functions
local draw = {}

-- draw cursor
function draw.cursor(x,y)
    lg.draw(arc.img.cursor,x,y)
end

-- draw text
function draw.text(s,x,y,c)
    local c = c or arc.col.white
    if arc.cfg.msg_txt_shdw then
        lg.setColor(arc.col.shadow)
        lg.print(s,x+1,y+1)
    end
    lg.setColor(c)
    lg.print(s,x,y)
end

-- draw window
function draw.window(x,y,w,h)
    lg.setColor({0,0,0,64})
    lg.rectangle('fill',x,y+4,w,h-4)
    lg.setColor(arc.col.window)
    lg.rectangle('fill',x+1,y+4,w-2,h-5)
    lg.setLine(1,'rough')
    lg.setColor({40,40,40})
    lg.rectangle('fill',x,y,w,4)
    lg.setColor(arc.col.white)
    lg.line(x+1,y+1,x+w-1,y+1)
    lg.setColor(arc.col.gray)
    lg.line(x+1,y+2,x+w-1,y+2)
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
    draw.window(ax,ay,aw,ah)
end

return draw