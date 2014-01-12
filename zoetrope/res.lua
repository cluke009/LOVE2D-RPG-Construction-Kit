-- backward compatibility
local getDimensions = love.graphics.getMode or love.window.getMode

-- manage resolution scaling

local lg          = love.graphics
local getMousePos = love.mouse.getPosition
local min,max     = math.min,math.max
-- ==========
-- SETTINGS
-- ==========
local dx    = 0
local dy    = 0
local xscale= 1
local yscale= 1
local rw,rh

local r = {}
r.set = function(mode,game_width,game_height,screen_width,screen_height)
	if mode == 'fit' or mode == 'nearest' then
		local aspect_ratio  = game_width/game_height
		local gw,gh         = aspect_ratio*screen_height,screen_height
		local gw2,gh2       = screen_width,screen_width/aspect_ratio
		rw,rh               = gw,gh
		if gw*gh >= gw2*gh2 then
			rw,rh = gw2,gh2
		end
		xscale = min(screen_width/game_width,screen_height/game_height)
		yscale = xscale
		local integer_scale = math.floor(xscale)
		if mode == 'nearest' and xscale > 1 and xscale ~= integer_scale then 
			xscale = integer_scale
			yscale = xscale
			rw,rh  = xscale*game_width,yscale*game_height
		end
		dx,dy  = (screen_width-rw)/2,(screen_height-rh)/2
	elseif mode == 'stretch' then
		dx,dy  = 0,0
		xscale = screen_width/game_width
		yscale = screen_height/game_height
		rw     = game_width*xscale
		rh     = game_height*yscale
	elseif mode == 'center' then
		dx,dy  = (screen_width-game_width)/2,(screen_height-game_height)/2
		xscale = 1
		yscale = 1
		rw     = game_width
		rh     = game_height
	end
	return r
end

r.render = function(draw,...)
	lg.push()
	lg.setScissor(dx,dy,rw,rh)
	lg.translate(dx,dy)
	lg.scale(xscale,yscale)
	draw(...)
	lg.setScissor()
	lg.pop()
	return r
end

r.gamePosition = function(sx,sy)
	local clampedX,clampedY = min(max(sx,dx),dx+rw),min(max(sy,dy),dy+rh)
	return (clampedX-dx)/xscale,(clampedY-dy)/yscale
end

r.screenPosition = function(gx,gy)
	local w,h = getDimensions()
	local x,y = (gx*xscale) + dx , gy*yscale + dy

	return math.max( math.min(x,w), 0 ), math.max( math.min(y,h) , 0 )
end

return r