-- Class: Sprite
-- A sprite receives all update-related events and draws
-- itself onscreen with its draw() method. It is defined
-- by a rectangle; nothing it draws should be outside that
-- rectangle.
--
-- In most cases, you don't want to create a sprite directly.
-- Instead, you'd want to use a subclass tailored to your needs.
-- Create a new subclass if you need to heavily customize how a 
-- sprite is drawn onscreen.
--
-- If you don't need something to display onscreen, just
-- to listen to updates, set the sprite's visible property to false.
--
-- Extends:
--		<Class>
--
-- Event: onUpdate
-- Called once each frame, with the elapsed time since the last frame in seconds.
--
-- Event: onBeginFrame
-- Called once each frame like onUpdate, but guaranteed to fire before any others' onUpdate handlers.
--
-- Event: onEndFrame
-- Called once each frame like onUpdate, but guaranteed to fire after all others' onUpdate handlers.
--
-- Event: onCollide
-- Called when the sprite intersects another during a collide() call. When a collision is detected,
-- this event occurs for both sprites. The sprite is passed three arguments: the other sprite, the
-- horizontal overlap, and the vertical overlap between the other sprite, in pixels.

Sprite = Class:extend
{
	-- Property: active
	-- If false, the sprite will not receive an update-related events.
	active = true,

	-- Property: visible
	-- If false, the sprite will not draw itself onscreen.
	visible = true,

	-- Property: solid
	-- If false, the sprite will never be eligible to collide with another one.
	-- It will also never displace another one.
	solid = true,

	-- Property: x
	-- Horizontal position in pixels. 0 is the left edge of the window.
	x = 0,

	-- Property: y
	-- Vertical position in pixels. 0 is the top edge of the window.
	y = 0,

	-- Property: width
	-- Width in pixels.

	-- Property: height
	-- Height in pixels.

	-- Property: rotation
	-- Rotation of drawn sprite in radians. This does not affect the bounds
	-- used during collision checking.
	rotation = 0,

	-- Property: velocity
	-- Motion either along the x or y axes, or rotation about its center, in
	-- pixels per second.
	velocity = { x = 0, y = 0, rotation = 0 },

	-- Property: minVelocity
	-- No matter what else may affect this sprite's velocity, it
	-- will never go below these numbers.
	minVelocity = { x = - math.huge, y = - math.huge, rotation = - math.huge },

	-- Property: maxVelocity
	-- No matter what else may affect this sprite's velocity, it will
	-- never go above these numbers.
	maxVelocity = { x = math.huge, y = math.huge, rotation = math.huge },

	-- Property: acceleration
	-- Acceleration along the x or y axes, or rotation about its center, in
	-- pixels per second squared.
	acceleration = { x = 0, y = 0, rotation = 0 },

	-- Property: drag
	-- This property is only active when the related acceleration is 0. In those
	-- instances, it applies acceleration towards 0 for the given property. i.e.
	-- when the velocity is positive, it applies a negative acceleration.
	drag = { x = 0, y = 0, rotation = 0 },

	-- Property: scale
	-- This affects how the sprite is drawn onscreen. e.g. a sprite with scale 2 will
	-- display twice as big. Scaling is centered around the sprite's center. This has
	-- no effect on collision detection.
	scale = 1,

	-- Property: distort
	-- This allows you to scale a sprite in a distorted fashion by defining ratios
	-- between x and y scales.
	distort = { x = 1, y = 1 },

	-- Property: flipX
	-- If set to true, then the sprite will draw flipped horizontally.
	flipX = false,

	-- Property: flipY
	-- If set to true, then the sprite will draw flipped vertically.
	flipY = false,

	-- Property: alpha
	-- This affects the transparency at which the sprite is drawn onscreen. 1 is fully
	-- opaque; 0 is completely transparent.
	alpha = 1,

	-- Property: tint
	-- This tints the sprite a color onscreen. This goes in RGB order; each number affects
	-- how that particular channel is drawn. e.g. to draw the sprite in red only, set tint to
	-- { 1, 0, 0 }.
	tint = { 1, 1, 1 },

	-- Method: die
	-- Makes the sprite totally inert. It will not receive
	-- update events, draw anything, or be collided.
	--
	-- Arguments:
	--		none
	--
	-- Returns:
	-- 		nothing

	die = function (self)
		self.active = false
		self.visible = false
		self.solid = false
	end,

	-- Method: revive
	-- Makes this sprite completely active. It will receive
	-- update events, draw itself, and be collided.
	--
	-- Arguments:
	--		none
	--
	-- Returns:
	-- 		nothing

	revive = function (self)
		self.active = true
		self.visible = true
		self.solid = true
	end,

	-- Method: intersects
	-- Returns whether a point or rectangle intersects this sprite.
	--
	-- Arguments:
	--		x - top left horizontal coordinate
	--		y - top left vertical coordinate
	--		width - width of the rectangle, omit for points
	--		height - height of the rectangle, omit for points
	--
	-- Returns:
	--		boolean

	intersects = function (self, x, y, width, height)
		return self.x < x + (width or 0) and self.x + self.width > x and
			   self.y < y + (height or 0) and self.y + self.height > y
	end,

	-- Method: overlap
	-- Returns the horizontal and vertical overlap of this sprite
	-- and a rectangle. This ignores the sprite's <solid> property
	-- and does not trigger any <onCollide> events.
	--
	-- Arguments:
	--		x - top left horizontal coordinate
	--		y - top left vertical coordinate
	--		width - width of the rectangle
	--		height - height of the rectangles
	--
	-- Returns:
	--		Two numbers: horizontal overlap in pixels, and vertical overlap in pixels.

	overlap = function (self, x, y, width, height)
		local selfRight = self.x + self.width
		local selfBottom = self.y + self.height
		local right = x + width
		local bottom = y + height

		-- this is cribbed from
		-- http://frey.co.nz/old/2007/11/area-of-two-rectangles-algorithm/

		if self.x < right and selfRight > x and
		   self.y < bottom and selfBottom > y then
			return math.min(selfRight, right) - math.max(self.x, x),
				   math.min(selfBottom, bottom) - math.max(self.y, y)
		else
			return 0, 0
		end
	end,

	-- Method: collide
	-- Checks whether this sprite collides with other <Sprite>s ad <Group>s. If a collision is detected,
	-- onCollide() is called on both this sprite and the one it collides with, passing
	-- the amount of horizontal and vertical overlap between the sprites in pixels.
	--
	-- Arguments:
	-- 		... - any number of <Sprite>s or <Group>s to collide with.
	--
	-- Returns:
	--		nothing

	collide = function (self, ...)
		Collision:check(self, ...)
	end,

	-- Method: displace
	-- Displaces another sprite or group so that it no longer overlaps this one.
	-- This by default seeks to move the other sprite the least amount possible.
	-- You can give this function a hint about which way it ought to move the other
	-- sprite (e.g. by consulting its current motion) through the two optional
	-- arguments. A single displace() call will *either* move the other sprite
	-- horizontally or vertically, not along both axes.
	--
	-- This does *not* cause onCollide events to occur on the sprites.
	--
	-- Arguments:
	--		other - sprite or group to displace
	-- 		xHint - force horizontal displacement in one direction, uses direction constants, optional
	--		yHint - force vertical displacement in one direction, uses direction constants, optional
	--
	-- Returns:
	--		nothing

	displace = function (self, other, xHint, yHint)	
		if not self.solid or self == other or not other.solid then return end
		if STRICT then assert(other:instanceOf(Sprite), 'asked to displace a non-sprite') end

		local xChange = 0
		local yChange = 0

		if other.sprites then
			-- handle groups

			for _, spr in pairs(other.sprites) do
				self:displace(spr, xHint, yHint)
			end
		else
			-- handle sprites

			local xOverlap, yOverlap = self:overlap(other.x, other.y, other.width, other.height)
			
			-- resolve horizontal overlap

			if xOverlap ~= 0 then
				local leftMove = (other.x - self.x) + other.width
				local rightMove = (self.x + self.width) - other.x
				
				if xHint == LEFT then
					xChange = - leftMove
				elseif xHint == RIGHT then
					xChange = rightMove
				else
					if leftMove < rightMove then
						xChange = - leftMove
					else
						xChange = rightMove
					end
				end
			end
			
			-- resolve vertical overlap

			if yOverlap ~= 0 then
				local upMove = (other.y - self.y) + other.height
				local downMove = (self.y + self.height) - other.y
				
				if yHint == UP then
					yChange = - upMove
				elseif yHint == DOWN then
					yChange = downMove
				else
					if upMove < downMove then
						yChange = - upMove
					else
						yChange = downMove
					end
				end
			end
			
			-- choose the option that moves the other sprite the least
			
			if math.abs(xChange) > math.abs(yChange) then
				other.y = other.y + yChange
			else
				other.x = other.x + xChange
			end
		end
	end,

	-- Method: push
	-- Moves another sprite as if it had the same motion properties as this one.
	--
	-- Arguments:
	--		other - other sprite to push
	--		elapsed - elapsed time to simulate, in seconds
	--
	-- Returns:
	--		nothing

	push = function (self, other, elapsed)
		other.x = other.x + self.velocity.x * elapsed
		other.y = other.y + self.velocity.y * elapsed
	end,

	-- Method: distanceTo
	-- Returns the distance from this sprite to either another sprite or 
	-- an arbitrary point. This uses the center of sprites to calculate the distance.
	--
	-- Arguments:
	--		Can be either one argument, a sprite (or any other table with x
	--		and y properties), or two arguments, which correspond to a point.
	--
	-- Returns:
	--		distance in pixels

	distanceTo = function (self, ...)
		local arg = {...}
		local midX = self.x + self.width / 2
		local midY = self.y + self.width / 2

		if #arg == 1 then
			local spr = arg[1]

			if STRICT then
				assert(type(spr.x) == 'number' and type(spr.y) == 'number', 'asked to calculate distance to an object without numeric x and y properties')
			end

			local sprX = spr.x + spr.width / 2
			local sprY = spr.y + spr.height / 2

			return math.sqrt((midX - sprX)^2 + (midY - sprY)^2)
		else
			return math.sqrt((midX - arg[1])^2 + (midY - arg[2])^2)
		end
	end,

	startFrame = function (self, elapsed)
		if self.onStartFrame then self:onStartFrame(elapsed) end
	end,

	update = function (self, elapsed)
		local vel = self.velocity
		local acc = self.acceleration
		local drag = self.drag
		local minVel = self.minVelocity
		local maxVel = self.maxVelocity

		-- check existence of properties

		if STRICT then
			assert(vel, 'active sprite has no velocity property')
			assert(acc, 'active sprite has no acceleration property')
			assert(drag, 'active sprite has no drag property')
			assert(minVel, 'active sprite has no minVelocity property')
			assert(maxVel, 'active sprite has no maxVelocity property')
		end

		vel.x = vel.x or 0
		vel.y = vel.y or 0
		vel.rotation = vel.rotation or 0

		-- physics
			
		if vel.x ~= 0 then self.x = self.x + vel.x * elapsed end
		if vel.y ~= 0 then self.y = self.y + vel.y * elapsed end
		if vel.rotation ~= 0 then self.rotation = self.rotation + vel.rotation * elapsed end
		
		if acc.x and acc.x ~= 0 then
			vel.x = vel.x + acc.x * elapsed
		else
			if drag.x then
				if vel.x > 0 then
					vel.x = vel.x - drag.x * elapsed
					if vel.x < 0 then vel.x = 0 end
				elseif vel.x < 0 then
					vel.x = vel.x + drag.x * elapsed
					if vel.x > 0 then vel.x = 0 end
				end
			end
		end
		
		if acc.y and acc.y ~= 0 then
			vel.y = vel.y + acc.y * elapsed
		else
			if drag.y then
				if vel.y > 0 then
					vel.y = vel.y - drag.y * elapsed
					if vel.y < 0 then vel.y = 0 end
				elseif vel.y < 0 then
					vel.y = vel.y + drag.y * elapsed
					if vel.y > 0 then vel.y = 0 end
				end
			end
		end
		
		if acc.rotation and acc.rotation ~= 0 then
			vel.rotation = vel.rotation + acc.rotation * elapsed
		else
			if drag.rotation then
				if vel.rotation > 0 then
					vel.rotation = vel.rotation - drag.rotation * elapsed
					if vel.rotation < 0 then vel.rotation = 0 end
				elseif vel.rotation < 0 then
					vel.rotation = vel.rotation + drag.rotation * elapsed
					if vel.rotation > 0 then vel.rotation = 0 end
				end
			end
		end

		if minVel.x and vel.x < minVel.x then vel.x = minVel.x end
		if maxVel.x and vel.x > maxVel.x then vel.x = maxVel.x end
		if minVel.y and vel.y < minVel.y then vel.y = minVel.y end
		if maxVel.y and vel.y > maxVel.y then vel.y = maxVel.y end
		if minVel.rotation and vel.rotation < minVel.rotation then vel.rotation = minVel.rotation end
		if maxVel.rotation and vel.rotation > maxVel.rotation then vel.rotation = maxVel.rotation end
		
		if self.onUpdate then self:onUpdate(elapsed) end
	end,

	endFrame = function (self, elapsed)
		if self.onEndFrame then self:onEndFrame(elapsed) end
	end,

	draw = function (self, x, y)
		-- subclasses do interesting things here
	end,

	collidedWith = function (self, other, xOverlap, yOverlap)
		if self.onCollide then self:onCollide(other, xOverlap, yOverlap) end
	end
}
