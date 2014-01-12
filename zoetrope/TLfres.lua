-- TLfres v1.04, the world's easiest way to give a game resolution-independence
-- by Taehl (SelfMadeSpirit@gmail.com)

TLfres = {}	-- namespace
local lg, trans, scale, color, rect = love.graphics, love.graphics.translate, love.graphics.scale, love.graphics.setColor, love.graphics.rectangle
local w, h, extent, ws, hs, wt, ht

-- Sets up TLfres and sets the screen mode. Default parameters should work fine in most cases.
function TLfres.setScreen(m, extent, centered, stretch)
	m,extent = m or {}, extent or 800
	m.w,m.h,m.aa = m.w or 800, m.h or 600, m.aa or 0
	local v = love.mouse.isVisible()	-- Fixes Love forgetting if mouse is visible upon changing res
	love.window.setMode(m.w, m.h)
	love.mouse.setVisible(v)

	w, h = m.w > 0 and m.w or lg.getWidth(), m.h > 0 and m.h or lg.getHeight()
	TLfres.centered, extent = centered, extent--/2
	ws,hs = w/extent, h/extent
	if centered then wt,ht = w/2, w/2-(w-h)/2
	else wt,ht = 0,0
	end
	TLfres.w, TLfres.h, TLfres.e, TLfres.ws, TLfres.hs, TLfres.wt, TLfres.ht, TLfres.stretch = w,h,extent,ws,hs,wt,ht
end

-- Transforms screen geometry. Call this at the beginning of love.draw().
function TLfres.transform()
	trans(wt, ht)
	scale(ws, TLfres.stretch and hs or ws)
end

-- Draws rectangles at the top and bottom of the screen to ensure proper aspect ratio. Call this at the end of love.draw() if you're not using stretch mode.
function TLfres.letterbox(w,h, c)
	local w,h,c,e = w or 4, h or 3, c or {0,0,0, 255}, TLfres.e
	color(c)

	local tall,de = e/w*h, e*2
	if TLfres.centered then
		rect("fill", -e,-e, de,e-tall)
		rect("fill", -e,e,  de,tall-e)
	else
		local o = (ws-hs) / ws * (e-1)
		rect("fill", 0,-o,   de,e-tall)
		rect("fill", 0,de-o, de,tall-e)
	end
end
