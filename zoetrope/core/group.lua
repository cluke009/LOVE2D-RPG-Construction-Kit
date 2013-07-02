-- Class: Group
-- A group is a set of sprites. Groups can be used to
-- implement layers or keep categories of sprites together.
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

Group = Class:extend
{
	-- Property: active
	-- If false, none of its member sprites will receive update-related events.
	active = true,

	-- Property: visible
	-- If false, none of its member sprites will be drawn.
	visible = true,

	-- Property: solid
	-- If false, nothing will collide against this group, nor will this group
	-- displace any other sprite. This does not prevent collision checking
	-- against individual sprites in this group, however.
	solid = true,

	-- Property: sprites
	-- A table of member sprites, in drawing order.
	sprites = {},

	-- Property: timeScale
	-- Multiplier for elapsed time; 1.0 is normal, 0 is completely frozen.
	timeScale = 1,

	-- Property: translate
	-- This table's x and y properties shift member sprites' positions when drawn.
	-- To draw sprites at their normal position, set both x and y to 0.
	translate = { x = 0, y = 0 },
	
	-- Property: translateScale
	-- This table's x and y properties multiply member sprites'
	-- positions, which you can use to simulate parallax scrolling. To draw
	-- sprites at their normal position, set both x and y to 1.
	translateScale = { x = 1, y = 1 },

	-- Method: add
	-- Adds a sprite to the group.
	--
	-- Arguments:
	--		sprite - <Sprite> to add
	--
	-- Returns:
	--		nothing

	add = function (self, sprite)
		assert(sprite, 'asked to add nil to a group')
		assert(sprite ~= self, "can't add a group to itself")
	
		if STRICT and self:contains(sprite) then
			local info = debug.getinfo(2, 'Sl')
			print('Warning: adding a sprite to a group it already belongs to (' ..
				  info.short_src .. ' line ' .. info.currentline .. ')')
		end

		table.insert(self.sprites, sprite)
	end,

	-- Method: remove
	-- Removes a sprite from the group. If the sprite is
	-- not in the group, this does nothing.
	-- 
	-- Arguments:
	-- 		sprite - <Sprite> to remove
	-- 
	-- Returns:
	-- 		nothing

	remove = function (self, sprite)
		for i, spr in ipairs(self.sprites) do
			if spr == sprite then
				table.remove(self.sprites, i)
				return
			end
		end
		
		if STRICT then
			local info = debug.getinfo(2, 'Sl')
			print('Warning: asked to remove a sprite from a group it was not a member of (' ..
				  info.short_src .. ' line ' .. info.currentline .. ')')
		end
	end,

	-- Method: moveToFront
	-- Moves a sprite in the group so that it is drawn on top
	-- of all other sprites in the group.
	--
	-- Arguments:
	--		sprite - <Sprite> to move, should already be a member of the group
	--
	-- Returns:
	--		nothing

	moveToFront = function (self, sprite)
		for i, spr in ipairs(self.sprites) do
			if spr == sprite then
				table.remove(self.sprites, i)
				table.insert(self.sprites, sprite)
				return
			end
		end

		if STRICT then
			print('Warning: asked to move sprite to front of group, but is not a member: ' .. sprite)
		end
	end,

	-- Method: moveToBack
	-- Moves a sprite in the group so that it is drawn below
	-- all other sprites in the group.
	--
	-- Arguments:
	--		sprite - <Sprite> to move, should already be a member of the group
	--
	-- Returns:
	--		nothing
	
	moveToBack = function (self, sprite)
		for i, spr in ipairs(self.sprites) do
			if spr == sprite then
				table.remove(self.sprites, i)
				table.insert(self.sprites, 1, sprite)
				return
			end
		end

		if STRICT then
			print('Asked to move sprite to back of group, but is not a member: ' .. sprite)
		end
	end,

	-- Method: sort
	-- Sorts members into a new draw sequence.
	--
	-- Arguments:
	--		func - function to perform the sort. This will receive two <Sprite>s as arguments;
	--			   the function must return whether the first should be drawn below the second.
	--
	-- Returns:
	--		nothing

	sort = function (self, func)
		table.sort(self.sprites, func)
	end,

	-- Method: collide
	-- Collides all solid sprites in the group with another sprite or group.
	-- This calls the <Sprite.onCollide> event handlers on all sprites that
	-- collide with the same arguments <Sprite.collide> does.
	--
	-- It's often useful to collide a group with itself, e.g. myGroup:collide().
	-- This checks for collisions between the sprites that make up the group.
	--
	-- Arguments:
	-- 		... - any number of <Sprite>s or <Group>s to collide with. If none
	--			  are specified, the group collides with itself.
	-- 
	-- Returns:
	--		nothing
	--
	-- See Also:
	--		<Sprite.collide>

	collide = function (self, ...)
		local list = {...}

		if #list > 0 then
			if STRICT then
				for _, other in pairs(list) do
					assert(other:instanceOf(Group) or other:instanceOf(Sprite), 'asked to collide non-group/sprite ' ..
						   type(other))
				end
			end

			Collision:check(self, ...)
		else
			Collision:check(self, self)
		end
	end,

	-- Method: setEffect
	-- Sets a pixel effect to use while drawing sprites in this group.
	-- See https://love2d.org/wiki/PixelEffect for details on how pixel
	-- effects work. After this call, the group's effect property will be
	-- set up so you can send variables to it. Only one pixel effect can
	-- be active on a group at a time.
	--
	-- Arguments:
	--		filename - filename of effect source code; if nil, this
	--				   clears any existing pixel effect.
	--		effectType - either 'screen' (applies the effect to the entire
	--					 group once, via an offscreen canvas), or 'sprite'
	--					 (applies to the effect to each individual draw operation).
	--					 Screen effects use more resources, but certain effects
	--					 need to work on the entire screen to be effective.
	--
	-- Returns:
	--		whether the effect was successfully created

	setEffect = function (self, filename, effectType)
		effectType = effectType or 'screen'

		if love.graphics.isSupported('pixeleffect') and
		   (effectType == 'sprite' or love.graphics.isSupported('canvas'))then
			if filename then
				self.effect = love.graphics.newPixelEffect(Cached:text(filename))
				self.effectType = effectType
			else
				self.effect = nil
			end

			return true
		else
			return false
		end
	end,

	-- Method: count
	-- Counts how many sprites are in this group.
	-- 
	-- Arguments:
	--		subgroups - include subgroups?
	-- 
	-- Returns:
	--		integer count

	count = function (self, subgroups)
		if subgroups then
			local count = 0

			for _, spr in pairs(self.sprites) do
				if spr:instanceOf(Group) then
					count = count + spr:count(true)
				else
					count = count + 1
				end
			end

			return count
		else
			return #self.sprites
		end
	end,

	-- Method: die
	-- Makes the group totally inert. It will not receive
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
	-- Makes this group completely active. It will receive
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

	-- Method: contains
	-- Returns whether this group contains a sprite.
	--
	-- Arguments:
	--		sprite - sprite to look for
	--		recurse - check subgroups? defaults to true
	--
	-- Returns:
	--		boolean

	contains = function (self, sprite, recurse)
		if recurse ~= false then recurse = true end

		for _, spr in pairs(self.sprites) do
			if spr == sprite then return true end

			if recurse and spr:instanceOf(Group) and spr:contains(sprite) then
				return true
			end
		end

		return false
	end,

	-- Method: loadLayers
	-- Loads layers from a Lua source file (as generated by Tiled -- http://mapeditor.org).
	-- Each layer is created as a <Group> belonging to this one and added to preserve its
	-- ordering. Tile layers are created as <Map> instances; object layers will try to create
	-- instances of a class named by the object's name property. If no class exists by
	-- this name, or the object has no name property, a gray fill will be created instead,
	-- as a placeholder. If the object has a property named _the, then this will set
	-- the.[whatever] to it.
	--
	-- Arguments:
	--		file - filename to load
	--		tileClass - class to create tiles in tile layers with; constructor
	--				    will be called with properties: image, width,
	--			 	    height, imageOffset (with x and y sub-properties)
	--
	-- Returns:
	--		nothing

	loadLayers = function (self, file, tileClass)
		local ok, data = pcall(loadstring(Cached:text(file)))
		local _, _, directory = string.find(file, '^(.*[/\\])')
		directory = directory or ''

		if ok then
			-- store tile properties by gid
			
			local tileProtos = {}

			for _, tileset in pairs(data.tilesets) do
				for _, tile in pairs(tileset.tiles) do
					local id = tileset.firstgid + tile.id
					
					for key, value in pairs(tile.properties) do
						tile.properties[key] = tovalue(value)
					end

					tileProtos[id] = tile
					tileProtos[id].width = tileset.tilewidth
					tileProtos[id].height = tileset.tileheight
				end
			end

			for _, layer in pairs(data.layers) do
				if self.prototype[layer.name] then
					error('The class you are loading layers into reserves the ' .. layer.name .. ' property for its own use; you cannot load a layer with that name')
				end

				if STRICT and self[layer.name] then
					local info = debug.getinfo(2, 'Sl')
					print('Warning: a property named ' .. layer.name .. ' already exists in this group (' ..
						  info.short_src .. ', line ' .. info.currentline .. ')')
				end

				if layer.type == 'tilelayer' then
					local map = Map:new{ spriteWidth = data.tilewidth, spriteHeight = data.tileheight }
					map:empty(layer.width, layer.height)

					-- load tiles

					for _, tiles in pairs(data.tilesets) do
						map:loadTiles(directory .. tiles.image, tileClass or Tile, tiles.firstgid)

						-- and mix in properties where applicable

						for id, tile in pairs(tileProtos) do
							if map.sprites[id] then
								map.sprites[id]:mixin(tile.properties)
							end
						end
					end

					-- load tile data

					local x = 1
					local y = 1

					for _, val in ipairs(layer.data) do
						map.map[x][y] = val
						x = x + 1

						if x > layer.width then
							x = 1
							y = y + 1
						end
					end

					self[layer.name] = map
					self:add(map)
				elseif layer.type == 'objectgroup' then
					local group = Group:new()

					for _, obj in pairs(layer.objects) do
						-- roll in tile properties if based on a tile

						if obj.gid and tileProtos[obj.gid] then
							local tile = tileProtos[obj.gid]

							obj.name = tile.properties.name
							obj.width = tile.width
							obj.height = tile.height

							for key, value in pairs(tile.properties) do
								obj.properties[key] = tovalue(value)
							end

							-- Tiled tile-based objects measure their y
							-- position at their lower-left corner, instead
							-- of their upper-left corner as usual

							obj.y = obj.y - obj.height
						end

						-- create a new object if the class does exist

						local spr

						if _G[obj.name] then
							obj.properties.x = obj.x
							obj.properties.y = obj.y
							obj.properties.width = obj.width
							obj.properties.height = obj.height

							spr = _G[obj.name]:new(obj.properties)
						else
							spr = Fill:new{ x = obj.x, y = obj.y, width = obj.width, height = obj.height, fill = { 128, 128, 128 } }
						end

						if obj.properties._the then
							the[obj.properties._the] = spr
						end

						group:add(spr)
					end

					self[layer.name] = group
					self:add(group)
				else
					error("don't know how to create a " .. layer.type .. " layer from file data")
				end
			end
		else
			error('could not load layers from file: ' .. data)
		end
	end,

	-- passes startFrame events to member sprites

	startFrame = function (self, elapsed)
		if not self.active then return end
		elapsed = elapsed * self.timeScale
		
		for _, spr in pairs(self.sprites) do
			if spr.active then spr:startFrame(elapsed) end
		end

		if self.onStartFrame then self:onStartFrame(elapsed) end
	end,

	-- passes update events to member sprites

	update = function (self, elapsed)
		if not self.active then return end
		elapsed = elapsed * self.timeScale

		for _, spr in pairs(self.sprites) do
			if spr.active then spr:update(elapsed) end
		end

		if self.onUpdate then self:onUpdate(elapsed) end
	end,

	-- passes endFrame events to member sprites

	endFrame = function (self, elapsed)
		if not self.active then return end
		elapsed = elapsed * self.timeScale

		for _, spr in pairs(self.sprites) do
			if spr.active then spr:endFrame(elapsed) end
		end

		if self.onEndFrame then self:onEndFrame(elapsed) end
	end,

	-- Method: draw
	-- Draws all visible member sprites onscreen.
	--
	-- Arguments:
	--		x - x offset in pixels
	--		y - y offset in pixels

	draw = function (self, x, y)
		if not self.visible then return end
		x = x or self.translate.x
		y = y or self.translate.y
		
		local scrollX = x * self.translateScale.x
		local scrollY = y * self.translateScale.y
		local appWidth = the.app.width
		local appHeight = the.app.height

		if self.effect then
			if self.effectType == 'screen' then
				if not self._canvas then self._canvas = love.graphics.newCanvas() end
				self._canvas:clear()
				love.graphics.setCanvas(self._canvas)
			elseif self.effectType == 'sprite' then
				love.graphics.setPixelEffect(self.effect)
			end
		end
		
		for _, spr in pairs(self.sprites) do	
			if spr.visible then
				if spr.translate then
					spr:draw(spr.translate.x + scrollX, spr.translate.y + scrollY)
				elseif spr.x and spr.y and spr.width and spr.height then
					local sprX = spr.x + scrollX
					local sprY = spr.y + scrollY

					if sprX < appWidth and sprX + spr.width > 0 and
					   sprY < appHeight and sprY + spr.height > 0 then
						spr:draw(sprX, sprY)
					end
				else
					spr:draw(scrollX, scrollY)
				end
			end
		end
			
		if self.effect then
			if self.effectType == 'screen' then
				love.graphics.setPixelEffect(self.effect)
				love.graphics.setCanvas()
				love.graphics.draw(self._canvas)
			end

			love.graphics.setPixelEffect()
		end
	end,

	__tostring = function (self)
		local result = 'Group ('

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
