local _,_,_,tab,_ = unpack(require(arc_path .. 'code'))
local draw = require(arc_path .. 'draw')
local sound = require(arc_path .. 'sound')

-- shortcuts
local lg = love.graphics
local lk = love.keyboard

-- key class
local _key = {}
_key.__index = _key
function _key:new(btn,sfx)
    local o = {}
    setmetatable(o,_key)
    o.btn = btn
    o.sfx = sfx
    o.t = 0
    o.pos = 0
    o.hit = false
    return o
end

--[[
checks whether key registers (hit)
'pos' is the cursor state.
    0: on the first button press, the cursor moves.
    1: if button is held down, after time=cfg.wait0, the cursor moves again.
    2: if still held down, the cursor continually moves every time=cfg.wait.
]]
function _key:check(dt)
    local z = self.pos    
    self.t = self.t+dt
    if (z==0 and arc.btn.kp==self.btn) or (z==1 and lk.isDown(self.btn) and self.t>arc.cfg.key_wait0) then
        self.pos = self.pos+1
        self.t = 0
        self.hit = true
        return
    end
    if z == 2 and lk.isDown(self.btn) and self.t>arc.cfg.key_wait then
        self.t = self.t-arc.cfg.key_wait
        self.hit = true
        return
    end
    if not lk.isDown(self.btn) then self.pos = 0 end
    self.hit = false
end

-- input area class
local _inp_area = {}
_inp_area.__index = _inp_area
--[[
what is a view?
ex: if list has 4 items but there's only space to show 3,
view=1 -> show 1-3, view=2 -> show 2-4
]]
function _inp_area:new(x,y,nvx,nvy)
    local o = {}
    setmetatable(o,_inp_area)
    -- if x is a number, you can only scroll in y dimension
    o.onx,o.ony = type(x)=='table',type(y)=='table'
    if not o.onx then x = tab.rep(x,#y) end
    if not o.ony then y = tab.rep(y,#x) end
    o.x,o.y = x,y -- coordinates
    o.ix,o.iy = 1,1 -- index pos
    o.ivx,o.ivy = 1,1 -- index view pos
    o.nx,o.ny = #x,#y -- # pos
    o.nvx = nvx or o.nx -- # view
    o.nvy = nvy or o.ny
    return o
end

-- updates position and view from input
function _inp_area:run()
    local ix,iy = self.ix,self.iy
    if self.ony then
        if arc.key.u.hit then self.iy = self.iy-1 end
        if arc.key.d.hit then self.iy = self.iy+1 end
    end
    if self.onx then
        if arc.key.r.hit then self.ix = self.ix+1 end
        if arc.key.l.hit then self.ix = self.ix-1 end
    end
    if (ix~=self.ix or iy~=self.iy) then
        sound.play(arc.sfx.cursor)
    end
    if arc.btn.kp == arc.btn.ent then
        self.btn = 'ent'
    end
    self.ix,self.ivx = _inp_area.get_pos(self.ix,self.ivx,self.nx,self.nvx)
    self.iy,self.ivy = _inp_area.get_pos(self.iy,self.ivy,self.ny,self.nvy)
end

-- resets input area
function _inp_area:reset()
  self.btn = nil
  self.ix,self.iy = 1,1
  self.ivs,self.ivy = 1,1
end

-- draws cursor
function _inp_area:draw_cursor(x,y)
    x,y = x or 0, y or 0
    draw.cursor(self.x[self.ix-self.ivx+1]+x,self.y[self.iy-self.ivy+1]+y)
end

-- if pos is outside view, move view until you can see pos
function _inp_area.get_pos(i,iv,n,v)
    i = (i-1)%n+1 -- loops cursor
    if i > iv+v-1 then iv = i+1-v
    elseif i < iv then iv = i end
    return i,iv
end

-- choice class
local _choice = {}
_choice.__index = _choice
function _choice:new(l,nvy,xbar)
    local o = {}
    setmetatable(o,_choice)
    local ys = tab.range(0,arc.fn.h*(#l-1),arc.fn.h)
    o.ia = _inp_area:new(0,ys,1,nvy)
    o.l = l
    o.xbar = xbar
    o.done = false
    return o
end

-- reset choice
function _choice:reset()
  self.done = false
  self.pick = nil
  self.ia:reset()
end

-- display list and cursor
function _choice:run(x,y)
    local i,hbar,hbox,ydel
    self.ia:run()
    self.ia:draw_cursor(x,y)
    for i = self.ia.ivy, self.ia.ivy+self.ia.nvy-1 do
        draw.text(self.l[i],x+arc.img.cursor:getWidth()+arc.cfg.cur_dx,y+arc.fn.h*(i-self.ia.ivy)+arc.cfg.cur_dy)
    end
    if self.xbar and (self.ia.ny > self.ia.nvy) then
        hbar = arc.fn.h*(self.ia.nvy)-2
        hbox = self.ia.nvy/self.ia.ny*hbar
        ydel = (hbar-hbox)/(self.ia.ny-self.ia.nvy)
        lg.setColor(arc.col.shadow)
        lg.rectangle('fill',x+self.xbar, y-2, 2, hbar)
        lg.setColor(arc.col.white)
        lg.rectangle('fill',x+self.xbar, y-2+ydel*(self.ia.ivy-1), 2, math.max(1,hbox))
    end
    if self.ia.btn == 'ent' then
        sound.play(arc.sfx.confirm)
        self.done = true
        self.pick = self.ia.iy -- the choice you picked (a number)
    end
end

return {_key,_inp_area,_choice}
