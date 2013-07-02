-- Class: View
-- A view is a group that packages several useful objects with it.
-- It's helpful to use, but not required. When a view is created, it
-- automatically sets the.view for itself. the.view should be considered
-- a read-only reference. If you want to switch views, you *must* set
-- the app's view property instead.
--
-- Extends:
--		<Group>

View = Group:extend
{
	-- Property: timer
	-- A built-in <Timer> object for use as needed.

	-- Property: tween
	-- A built-in <Tween> object for use as needed.

	-- Property: factory
	-- A built-in <Factory> object for use as needed.

	-- Property: focus
	-- A <Sprite> to keep centered onscreen.

	-- Property: focusOffset
	-- This shifts the view of the focus, if one is set. If both
	-- x and y properties are set to 0, then the view keeps the focus
	-- centered onscreen.
	focusOffset = { x = 0, y = 0 },

	-- Property: minVisible
	-- The view clamps its scrolling so that nothing above or to the left
	-- of these x and y coordinates is visible.
	minVisible = { x = -math.huge, y = -math.huge },

	-- Property: maxVisible
	-- This view clamps its scrolling so that nothing below or to the right
	-- of these x and y coordinates is visible.
	maxVisible = { x = math.huge, y = math.huge },

	-- private property: _tint
	-- used to implement tints.

	-- private property: _fx
	-- used to perform fades and flashes.

	new = function (self, obj)
		obj = self:extend(obj)

		obj.timer = Timer:new()
		obj:add(obj.timer)
		obj.tween = Tween:new()
		obj:add(obj.tween)
		obj.factory = Factory:new()

		-- set the.view briefly, so that during the onNew() handler
		-- we appear to be the current view
	
		local oldView = the.view

		the.view = obj
		if obj.onNew then obj:onNew() end

		-- then reset it so that nothing breaks for the remainder
		-- of the frame for the old, outgoing view members.
		-- our parent app will restore us into the.view at the top of the next frame
		-- exception: there was no old view.

		if oldView then the.view = oldView end
		return obj
	end,

	-- Method: clampTo
	-- Clamps the view so that it never scrolls past a sprite's boundaries.
	-- This only looks at the sprite's position at this instant in time,
	-- not afterwards.
	--
	-- Arguments:
	--		sprite - sprite to clamp to
	--
	-- Returns:
	--		nothing

	clampTo = function (self, sprite)
		self.minVisible.x = sprite.x
		
		if sprite.x + sprite.width > the.app.width then
			self.maxVisible.x = sprite.x + sprite.width
		else
			self.maxVisible.x = the.app.width
		end
		
		self.minVisible.y = sprite.y
		
		if sprite.y + sprite.height > the.app.height then
			self.maxVisible.y = sprite.y + sprite.height
		else
			self.maxVisible.y = the.app.height
		end
	end,

	-- Method: panTo
	-- Pans the view so that the target sprite or position is centered
	-- onscreen. This sets the view's focus to nil.
	--
	-- Arguments:
	--		target - sprite or coordinate pair to pan to
	--		duration - how long the pan will take, in seconds
	--		ease - what easing to apply, see <Tween> for details, defaults to 'quadInOut'
	--
	-- Returns:
	--		A <Promise> that is fulfilled when the pan completes.

	panTo = function (self, target, duration, ease)
		ease = ease or 'quadInOut'
		local targetX, targetY

		if STRICT then
			assert((target.x and target.y and target.width and target.height) or (#target == 2),
				   'pan target does not appear to be a sprite or coordinate pair')
			assert(type(duration) == 'number', 'pan duration is not a number')
			assert(self.tween.easers[ease], 'pan easing method ' .. ease .. ' is not defined')
		end

		if target.x and target.y and target.width and target.height then
			targetX = target.x + target.width / 2
			targetY = target.y + target.height / 2
		else
			targetX = target[1]
			targetY = target[2]
		end

		-- calculate translation to center these coordinates

		local tranX = math.floor(-targetX + the.app.width / 2)
		local tranY = math.floor(-targetY + the.app.height / 2)
		
		-- clamp translation to min and max visible
		
		if tranX > - self.minVisible.x then tranX = - self.minVisible.x end
		if tranY > - self.minVisible.y then tranY = - self.minVisible.y end
		
		if tranX < the.app.width - self.maxVisible.x then
			tranX = the.app.width - self.maxVisible.x
		end
		
		if tranY < the.app.height - self.maxVisible.y then
			tranY = the.app.height - self.maxVisible.y
		end

		-- tween the appropriate properties
		-- some care has to be taken to avoid fulfilling the promise twice

		self.focus = nil
		local promise = Promise:new()

		if tranX ~= self.translate.x then
			self.tween:start(self.translate, 'x', tranX, duration, ease)
				:andThen(function() promise:fulfill() end)

			if tranY ~= self.translate.y then
				self.tween:start(self.translate, 'y', tranY, duration, ease)
			end
		elseif tranY ~= self.translate.y then
			self.tween:start(self.translate, 'y', tranY, duration, ease)
				:andThen(function() promise:fulfill() end)
		else
			promise:fulfill()
		end

		return promise
	end,

	-- Method: fade
	-- Fades out to a specified color over a period of time.
	--
	-- Arguments:
	--		color - color table to fade to, e.g. { 0, 0, 0 }
	--		duration - how long to fade out in seconds, default 1
	--
	-- Returns:
	--		A <Promise> that is fulfilled when the effect completes.

	fade = function (self, color, duration)
		assert(type(color) == 'table', 'color to fade to is ' .. type(color) .. ', not a table')
		local alpha = color[4] or 255
		self._fx = color
		self._fx[4] = 0
		return self.tween:start(self._fx, 4, alpha, duration or 1, 'quadOut')
	end,

	-- Method: flash
	-- Immediately flashes the screen to a specific color, then fades out.
	--
	-- Arguments:
	--		color - color table to flash, e.g. { 0, 0, 0 }
	--		duration - how long to restore normal view in seconds, default 1
	--
	-- Returns:
	--		A <Promise> that is fulfilled when the effect completes.

	flash = function (self, color, duration)
		assert(type(color) == 'table', 'color to flash is ' .. type(color) .. ', not a table')
		color[4] = color[4] or 255
		self._fx = color
		return self.tween:start(self._fx, 4, 0, duration or 1, 'quadOut')
	end,

	-- Method: tint
	-- Immediately tints the screen a color. To restore normal viewing,
	-- call this method again with no arguments.
	--
	-- Arguments:
	--		red - red component, 0-255
	--		green - green component, 0-255
	--		blue - blue component, 0-255
	--		alpha - alpha, 0-255, default 255
	--
	-- Returns:
	--		nothing

	tint = function (self, red, green, blue, alpha)
		alpha = alpha or 255

		if red and green and blue and alpha > 0 then
			self._tint = { red, green, blue, alpha }
		else
			self._tint = nil
		end
	end,

	update = function (self, elapsed)
		Group.update(self, elapsed)

		-- follow the focused sprite

		local screenWidth = the.app.width
		local screenHeight = the.app.height
		
		if self.focus and self.focus.width < screenWidth
		   and self.focus.height < screenHeight then
			self.translate.x = math.floor(- (self.focus.x + self.focusOffset.x) +
							   (screenWidth - self.focus.width) / 2)
			self.translate.y = math.floor(- (self.focus.y + self.focusOffset.y) +
							   (screenHeight - self.focus.height) / 2)
		end
		
		-- clamp translation to min and max visible
		
		if self.translate.x > - self.minVisible.x then
			self.translate.x = - self.minVisible.x
		end

		if self.translate.y > - self.minVisible.y then
			self.translate.y = - self.minVisible.y
		end
		
		if self.translate.x < screenWidth - self.maxVisible.x then
			self.translate.x = screenWidth - self.maxVisible.x
		end
		
		if self.translate.y < screenHeight - self.maxVisible.y then
			self.translate.y = screenHeight - self.maxVisible.y
		end
	end,

	draw = function (self, x, y)
		Group.draw(self, x, y)

		-- draw our fx and tint on top of everything

		if self._tint then
			love.graphics.setColor(self._tint)
			love.graphics.rectangle('fill', 0, 0, the.app.width, the.app.height)
			love.graphics.setColor(255, 255, 255, 255)
		end

		if self._fx then
			love.graphics.setColor(self._fx)
			love.graphics.rectangle('fill', 0, 0, the.app.width, the.app.height)
			love.graphics.setColor(255, 255, 255, 255)
		end
	end,

	__tostring = function (self)
		local result = 'View ('

		if self.active then
			result = result .. 'active'
		else
			result = result .. 'inactive'
		end

		if self.visible then
			result = result .. ', visible'
		else
			result = result .. ', invisible'
		end

		if self.solid then
			result = result .. ', solid'
		else
			result = result .. ', not solid'
		end

		return result .. ', ' .. self:count(true) .. ' sprites)'
	end
}
