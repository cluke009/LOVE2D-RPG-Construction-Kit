local draw = require(arc_path .. 'draw')
local bool,calc,str,tab,misc = unpack(require(arc_path .. 'code'))
local _,_,_choice = unpack(require(arc_path .. 'input'))


-- shortcuts
local lg = love.graphics
local lt = love.timer

-- a bloc is text of one color and with no line breaks.
-- messages are played out in blocs to improve performance.
local _bloc = {}
_bloc.__index = _bloc
function _bloc:new(s,x,y,c)
    local o = {}
    setmetatable(o,_bloc)
    o.s = str.unformat(s)
    o.nc = o.s:len()
    o.x,o.y = x,y
    o.c = c or arc.col.white
    local _,r,g,b,a,co
    local n,e = 0,1
    -- parse out and set color
    if s:sub(1,2) == '|c' then
	_,_,r,g,b,a = s:find('(%x%x)(%x%x)(%x%x)(%x%x)',3)
	co = {tonumber(r,16),tonumber(g,16),tonumber(b,16),tonumber(a,16)}
	n = n+10
	o.c = co
    end
    return o
end

-- draw first 'nc' characters of bloc
function _bloc:draw(x,y,nc)
    local nc = nc or -1 -- if nc>s:len(), displays all of s, so don't worry about it
    draw.text(self.s:sub(1,nc),x+self.x,y+self.y,self.c)
end

-- message class
local _navi = {}
_navi.__index = _navi
function _navi:new(s,opt)
    local o = {}
    setmetatable(o,_navi)
    
    -- a ton of options!
	local opt = opt or {}
    local w = opt.w									    -- text wrap width
    o.wbox = opt.wbox								    -- fixed box width
    o.x = opt.x	or 10								    -- x disp pos
    o.y = opt.y	or 10								    -- y disp pos
    o.alx = opt.alx or 'l'							    -- text x alignment
    o.alxb = opt.alxb or 'l'						    -- box x alignment
    o.alyb = opt.alyb or 't'						    -- box y alignment
    o.wait = opt.wait								    -- if nil, keypress ends msg, else wait opt.wait sec
    o.skip = misc.get_def(opt.skip,true)				-- true = can skip msg with keypress
	o.msg_spd = opt.msg_spd or arc.cfg.msg_spd		    -- message speed
	o.instant = opt.instant							    -- true = show all text instantly
    o.box = misc.get_def(opt.box,true)				    -- true = message box
    o.box_open = misc.get_def(opt.box_open,false)       -- true = box open animation
    o.box_close = misc.get_def(opt.box_close,false)     -- true = box close animation
    o.box_anim = misc.get_def(opt.box_anim,             -- true = box open/close animation
        not (o.box_open or o.box_close))	    
    o.name = opt.name								    -- name
    o.face = opt.face								    -- face picture
	o.face_pos = opt.face_pos or 'l'					-- face picture pos
	o.face_border = misc.get_def(opt.face_border,true)	-- face border
    o.blinker = misc.get_def(opt.blinker,true)		    -- true = show blinker
    o.scroll = misc.get_def(opt.scroll,true)			-- true = scroll message
    o.nrows = opt.nrows								    -- # rows in box
    if o.nrows and o.name then						    -- name takes up 1 row
		o.nrows = o.nrows-1
    end
    o.chs = opt.choices								    -- list of choices
    if o.chs then
		if opt.nvchs then							    -- # views for choices
			o.nvchs = opt.nvchs
		else
			o.nvchs = #o.chs
			if o.nrows and (o.nvchs>o.nrows) then
				o.nvchs = o.nrows
			end
		end
	end
		
    o.dytext = (s=='' and -arc.fn.h) or 0 -- if message is '', move choices up one line
    o.dyname = (o.name and arc.fn.h) or 0
	-- set face info
    if o.face then
        o.wface = o.face:getWidth()
        o.hface = o.face:getHeight()
        o.dxface = o.wface+10
		if w then
            w = w-o.dxface
        end
    else o.dxface = 0 end
    -- if box width is set, set 'w'
    if o.wbox then
        w = o.wbox-o.dxface-20
        o.wbox_fixed = true
    end
	-- choice cannot be longer than 'w'
	o.nchs = (o.chs and #o.chs) or 0
	local lwchs
	if o.chs then
		lwchs,wcur = {},arc.img.cursor:getWidth()+3
		for i = 1,o.nchs do lwchs[i] = arc.fn.w(o.chs[i])+wcur end
		local lwmaxchs = math.max(unpack(lwchs))
		if w and lwmaxchs > w then w = lwmaxchs end
	end
	-- handle new message box formatting option
    s = _navi.repl_col(s)
	if o.nrows then
		local t = str.inbw(s,'|m')
		local m = {}
		if w then
			for i = 1,#t do
				m[i] = _navi.add_nls(t[i],w)
				if i~=#t then m[i] = _navi.add_nms(m[i],o.nrows) end
			end
			s = table.concat(m)
		end
	elseif w then
		s = _navi.add_nls(s,w)
	end
	if s:len() == 0 then s = s..' ' end -- prevent code crash
	
    -- adds pauses in a hackish way. it adds spaces before the pause command
    -- and adjusts the block display pos. n spaces = pause of n/msg_spd sec
    local ps = string.rep(' ',arc.cfg.msg_nc_short_pause)
    local pl = string.rep(' ',arc.cfg.msg_nc_long_pause)
    s = s:gsub('|,',ps..'|,')
    s = s:gsub('|:',pl..'|:')
    
	o.b = {}
    o.lw = {} 	-- line: widths
    o.lb = {} 	-- line: last bloc
    o.bl = {} 	-- block: liine #
    o.rnc = {} 	-- block: rolling total # chars
    o.lb[0] = 0
	o.rnc[0] = 0
	
    local i = 1					-- pos in 's'
    local j = 1 				-- pos where last bloc ended
    local e = 1 				-- current bloc #
    local cl = 1				-- current line #
    local xc,yc = 0,0			-- keeps track of block pos
    local dx,dy					-- dx,dy shift for current bloc
    local cc = arc.col.white	-- current text color
    local b						-- current bloc string
    local z						-- format command
    while true do -- parse all the information out!
        b = ''
        z = s:sub(i,i+1)
        
        -- start a new bloc when you see a formatting command
        if z == '|!' then
            b = s:sub(j,i-1)
            dx,dy = arc.fn.w(str.unformat(b)),0
        elseif z == '|c' then
            b = s:sub(j,i-1)
            dx,dy = arc.fn.w(str.unformat(b)),0
        elseif z == '|n' then
            b = s:sub(j,i-1)
            dx,dy = -xc,arc.fn.h
        elseif z == '|,' then
            b = s:sub(j,i-1)
            dx,dy = -arc.fn.w(ps)+arc.fn.w(str.unformat(b)),0
        elseif z == '|:' then
            b = s:sub(j,i-1)
            dx,dy = -arc.fn.w(pl)+arc.fn.w(str.unformat(b)),0
        end
        
        -- reached the end
        if i >= s:len() then
            b = s:sub(j,i)
            dx,dy = arc.fn.w(str.unformat(b)),0
            o.lw[cl] = xc+dx
            o.lb[cl] = e
			-- if choices don't fit in same box, they will appear in next box
			-- so put in keypress to let player read current box 
            if o.nrows and not o.wait and (o.chs and cl%o.nrows+o.nvchs>o.nrows) then z = '|!' end
        end
        
        -- create bloc
        if b ~= '' then
            o.b[e] = _bloc:new(b,xc,yc,cc)
            cc = o.b[e].c
            o.bl[e] = cl
            o.rnc[e] = o.rnc[e-1]+o.b[e].nc
            -- update line #
            if (z == '|n') then
                o.lw[cl] = xc+arc.fn.w(str.unformat(b))
                o.lb[cl] = e
				-- if last line in box, add keypress to let player read current box
                if o.nrows and not o.wait and (cl%o.nrows==0) then z = '|!' end
                cl = cl+1
            end
            -- keypress stuff
            o.b[e].inp = (z == '|!')
            xc,yc = xc+dx,yc+dy
            e,j = e+1,i
        end
        
        if i >= s:len() then break end
        i = i+1    
    end
        
    -- alignment
    o.nl = cl
    if o.chs then
        o.cchs = _choice:new(o.chs,o.nvchs)
        o.wll = math.max(math.max(unpack(o.lw)),math.max(unpack(lwchs)))
    else
        o.nchs = 0
        o.wll = math.max(unpack(o.lw))
    end
    
    -- total height of all lines (including choices)
    if o.nrows then
        o.hls = arc.fn.h*o.nrows
    else
        o.nrows = o.nl+o.nchs
        o.hls = arc.fn.h*o.nrows
    end    
    -- dxm and dym are multipliers to align (i.e. center) text
    o.dxm = tab.index({l=0,m=.5,r=1},o.alx)
    o.dxmb = tab.index({l=0,m=.5,r=1},o.alxb)
    o.dymb = tab.index({t=0,m=.5,b=1},o.alyb)
	-- calculate x-shift of each bloc
	o.bdx = {}
	for i = 1,#o.b do o.bdx[i] = math.floor(-o.dxm*o.lw[o.bl[i]]) end
    	
    o:set_pos()
    o:init()
	return o
end

-- set various positions and lengths
function _navi:set_pos()
    if not self.wbox_fixed then self.wbox = self.wll+self.dxface+20 end -- margin = 20 px
    self.hbox = self.hls+arc.fn.h+self.dyname+6
    self.xbox = -10-math.floor(self.dxmb*self.wbox)
    self.ybox = -10-math.floor(self.dymb*self.hbox)
    local x,y = self.xbox,self.ybox -- everything is wrt this
    self.xname = x+10+self.dxface
    self.yname = y+10
    if self.face then
        self.xface = x+10
        self.yface = y+math.floor(0.5*(self.hbox-self.hface))
    end
    self.xtext = x+10+self.dxface+self.dxm*(self.wbox-20-self.dxface)
    self.ytext = y+10+self.dyname
    self.xchc = x+10+self.dxface
    self.ychc = y+10+self.dyname+arc.fn.h*self.nl+self.dytext+2
    self.xblink = x+math.floor(0.5*(self.wbox-arc.img.blinker:getWidth()))
    self.yblink = y+self.hbox-math.floor(0.5*arc.img.blinker:getHeight())
    self.clip = {self.xname,self.ytext,self.wll,self.hls}
	-- if face_pos is 'r', make some changes...
	if self.face_pos == 'r' then
		self.xname = self.xname-self.dxface
		self.xtext = self.xtext-self.dxface
		self.clip[1] = self.clip[1]-self.dxface
		self.xchc = self.xchc-self.dxface
		self.xface = self.xbox+self.wbox-self.dxface
	end
	-- choice bar
	if self.chs then
		-- when the choice is run, the pos is wrt self.xchc, do
		-- don't add that in here - or it will be wrong!
		self.cchs.xbar = self.wbox-self.dxface-24
	end
end

-- init message
function _navi:init()
	self.pos = 'made'
    self.ci = 1
    self.view = 1
	self.pick = nil
  if self.chs then
    self.cchs:reset()
  end
	-- handle keypresses and waits
	for i = 1,#self.b do
		self.b[i].done = nil
		self.b[i].tset = nil
	end
end

-- is the message done?
function _navi:is_over()
	return self.pos == 'over'
end

-- what choice did the player pick?
function _navi:get_pick()
	return self.pick
end

-- play message at (x,y)
function _navi:play(x,y)
	if self.pos == 'over' then return end
	local i		-- moving bloc #
	local dys	-- adjusts text position
	local bf,bl	-- first and last blocs in view
	local t1,t2	-- temp variables
	lg.push()
	x,y = x+self.x,y+self.y
	lg.translate(x,y)
	-- used for message auto-init
    if self.pos == 'made' then
		self.t0 = lt.getTime()
		self.pos = 'open'
	end

    -- play open or close animation
    local animo = self.pos=='open' and (self.box_anim or self.box_open)
    local animc = self.pos=='close' and (self.box_anim or self.box_close)
    if self.box and (animo or animc) then
        af = (lt.getTime()-self.t0)/arc.cfg.msg_tanim
        draw.win_anim(self.xbox, self.ybox, self.wbox, self.hbox, af, self.pos)
        if af > 1 then
			self.pos = (self.pos=='open' and 'show') or (self.pos=='close' and 'over')
			self.t0 = lt.getTime()
		end
		lg.pop()
		return
    end
    if not self.anim and self.pos == 'open' then self.pos = 'show' end

    local nc = (self.instant and math.huge) or math.floor(self.msg_spd*(lt.getTime()-self.t0))
    -- draw stuff
    if self.box then draw.window(self.xbox, self.ybox, self.wbox, self.hbox) end    
    if self.name then draw.text(self.name, self.xname, self.yname, arc.col.name) end
    if self.face then
        lg.setColor(arc.col.white)
        lg.draw(self.face, self.xface, self.yface)
        if self.face_border then lg.rectangle('line', self.xface, self.yface, self.wface, self.hface) end
    end
    
    -- scroll text
    if self.pos == 'scroll' and self.scroll then
		lg.setScissor(x+self.clip[1], y+self.clip[2], self.clip[3], self.clip[4])
        dys = -(self.view-1)*arc.fn.h
		af = (lt.getTime()-self.sct0)/arc.cfg.msg_tscroll
        if af >= 1 then
            self.pos = self.scpos
			if self.pos == 'show' then
                self.view = self.view+self.nrows
                self.t0 = self.t0 + (lt.getTime()-self.b[self.sci].t0)
			elseif self.pos == 'choice' then
				self.t0 = lt.getTime()
			end
        else
            af = math.sin(math.pi/2*af) -- cooler than linear!
            for i = self.scbf,self.scbl do
                self.b[i]:draw(self.xtext+self.bdx[i], self.ytext+dys-af*arc.fn.h*self.nrows)
            end
        end
        lg.setScissor()
		lg.pop()
		return
    end
    
	dys = -(self.view-1)*arc.fn.h
    -- init some stuff for the choice...
    if self.pos == 'choice' then
        if self.chs then
            if self:chc_fits() then --  then -- start new screen
                self.dychs = (-self.nl+self.nl%self.nrows)*arc.fn.h
            else
				self.view = self.view+self.nrows
                self.dychs = -self.nl*arc.fn.h
			end
        end
        self.pos = 'choose'
    end

    -- display blocs
    if self.view <= self.nl then
        bf = self.lb[self.view-1]+1
        bl = self.lb[math.min(self.view+self.nrows-1,self.nl)]
        for i = bf,bl do
		
            -- display everything and process any keypresses       
            if self.pos == 'show' and nc <= self.rnc[i] then -- display the current bloc
                self.b[i]:draw(self.xtext+self.bdx[i], self.ytext+dys, nc-self.rnc[i-1])
                self.ci = i
                break
            else
                self.b[i]:draw(self.xtext+self.bdx[i], self.ytext+dys)				
				
				-- handle waits at end of view
				if self.wait and i == bl and not self.b[i].done then
					t1 = i==#self.b and self.chs and self:chc_fits()	-- at end, choices fit, don't wait
					t2 = i==#self.b and not self.chs					-- at end, no choices, don't wait (is handled later)
					if not (t1 or t2) then
						if self.b[i].tset then
							if lt.getTime()-self.b[i].waitt0 >= self.wait then
								self.b[i].done = true
								if self.scroll then
									self:set_scroll(i,bf,bl)
								else
									self:advance(i,bl)
								end
							end
							lg.pop()
							return
						else
							self.b[i].tset = true
							self.b[i].t0 = lt.getTime()
							self.b[i].waitt0 = lt.getTime()
							break
						end
					end
				end
				
				-- handle keypresses
                if self.b[i].inp and not self.b[i].done then
                    self.ci = i
                    if self.b[i].tset then
						self:show_blinker()
                        if arc.btn.kp == arc.btn.ent then -- if player pressed input key
                            self.b[i].done = true
                            if i == bl and self.scroll then -- do scroll animation
                                self:set_scroll(i,bf,bl)
                            else
								self:advance(i,bl)
							end
						end
						lg.pop()
						return -- waiting for keypress, don't go further
                    else
                        -- store time when message paused for keypress. this is
                        -- later used to adjust the initial time of the message.
                        self.b[i].t0 = lt.getTime()
                        self.b[i].tset = true
                        break
                    end
                end
				
				-- break out of loop if you reached the end
                if self.pos == 'show' and i == #self.b then
                    self.pos = 'choice'
                    self.t0 = lt.getTime()
                    break
                end
				
            end        
        
        end
    end

    -- press enter key to skip the message
    if self.pos == 'show' and arc.btn.kp == arc.btn.ent and self.skip and (not self.b[self.ci].inp or (self.b[self.ci].inp and (not self.b[self.ci].tset or self.b[self.ci].done))) then
        for i = bf,bl-1 do
            if self.b[i].inp then
                self.b[i].done = true
            end
        end
        self.t0 = lt.getTime()-self.rnc[self.lb[math.min(self.view+self.nrows-1,self.nl)]]/arc.cfg.msg_spd
    end

    -- if message is over, don't display
    if self.pos == 'choose' then
		if self.chs then
            if not self.cchs.done then
				self.cchs:run(self.xchc, self.ychc+self.dychs)
            else
                self.pos = 'close'
                self.t0 = lt.getTime()
                self.pick = self.cchs.pick
            end
        else
            if self.wait == nil then
				self:show_blinker()
                if arc.btn.kp == arc.btn.ent then
                    self.pos = 'close'
                    self.t0 = lt.getTime()
                end
            elseif (lt.getTime()-self.t0 > self.wait) then
                self.pos = 'close'
                self.t0 = lt.getTime()
            end
        end
    end
    
    if self.pos == 'close' and not (self.box and (self.box_anim or self.box_close)) then
        self.pos = 'over'
    end
	lg.pop()
end

-- show blinker
function _navi:show_blinker()
	if ((lt.getTime()-self.t0)%arc.cfg.msg_tblink < 0.5*arc.cfg.msg_tblink) and self.blinker then
		lg.setColor(arc.col.white)
		lg.draw(arc.img.blinker, self.xblink, self.yblink)
	end
end

-- will choices fit in same screen as last line?
function _navi:chc_fits()
	return (self.nl%self.nrows)+self.nvchs <= self.nrows
end

-- advance to next box
function _navi:advance(i,bl)
	if i == #self.b then
		self.pos = 'choice'
		self.t0 = lt.getTime()
	elseif i == bl then
		self.view = self.view+self.nrows
	end
	self.t0 = self.t0 + (lt.getTime()-self.b[i].t0)
end

-- set up scrolling
function _navi:set_scroll(i,bf,bl)
	self.pos = 'scroll'
	self.scpos = (i==#self.b and 'choice') or 'show'
	self.scbf = bf
	self.scbl = bl
	self.sci = i
	self.sct0 = lt.getTime()
end

-- plays a list of messages sequentially
function _navi.play_list(m,x,y)
    for i = 1,#m do
        if m[i].pos ~= 'over' then
            if m[i].pos == 'made' then m[i]:init() end
            m[i]:play(x,y)
            break
        end
    end
end

-- if width 'w' is specified, this adds newlines '|n' at the
-- right places so that no line is greater than the specified width.
function _navi.add_nls(s,w,opt)
	s = s .. ' '
    local ss = ''
    local si,sj,t
    local bi,bj,i,j = 1,1,1,1
    local t = {['|c']=10, ['|,']=2, ['|:']=2, ['|!']=2}
    b = str.unformat(s)
    -- i is current position in string
    -- j is current position minus formatting options
    for i = 1,s:len() do
        if s:sub(i,i) == ' ' or s:sub(i,i+1) == '|n' then
            if si and sj and arc.fn.w(b:sub(bj,j-1)) > w then -- there must be at least one ' ' before this
                ss = ss .. s:sub(bi,si-1) .. '|n'
                bi = si+1
                bj = sj+1
            end
            si = i -- pos of the last blank space in s
            sj = j -- pos of the last blank space in s minus formatting options
        end
        -- handle when there's already a newline
        if s:sub(i,i+1) == '|n' then
            ss = ss .. s:sub(bi,i+1)
            j = j-2
            si = i+1
            sj = j
            bi = si+1
            bj = sj+1
        end
        z = s:sub(i,i+1)
        -- subtract # chars in formatting options
        if not (t[z] == nil) then
            j = j-t[z]
        end
        j = j+1
    end
    ss = ss .. s:sub(bi,s:len())
    s = ss:sub(1,ss:len()-1) -- we added a ' ' at the beginning so remove it
    return s
end

-- replace the '|m' with '|n's to start new message box
function _navi.add_nms(s,nrows)
	local n,nl,ns,ni
	nl = '|n'
	n = str.get_nmatch(s,nl)
	ni = nrows-n%nrows
	ns = #s
	if not (ni==nrows and ns>2 and s:sub(ns-1,ns) == '|n') then
		s = s .. nl:rep(ni)
	end
	return s
end

-- remove the '|!' if it's the last thing in the message
function _navi.rem_kp(s)
    local sl = s:len()
    if s:sub(sl-1,sl) == '|!' then s = s:sub(1,sl-2) end
    return s
end

-- replace shortcuts for color changes
function _navi.repl_col(s)
    local a,b,c,d,e
    while true do
        a,b,c,d = s:find('(|c{(%a+)})')
        if a == nil then break
        else
            d = arc.col[d]
            d = (#d==4 and d) or {d[1],d[2],d[3],255}
            s = s:gsub(c, string.format('|c%2x%2x%2x%2x',unpack(d)))
        end
    end
    return s
end

return _navi
