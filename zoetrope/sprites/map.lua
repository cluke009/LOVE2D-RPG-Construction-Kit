-- Class: Map
-- A map saves memory and CPU time by acting as if it were a grid of sprites.
-- Each different type of sprite in the grid is represented via a single
-- object. Each sprite must have the same size, however.
-- 
-- This works very similarly to a tilemap, but there is additional flexibility
-- in using a sprite, e.g. animation and other display effects. (If you want it
-- to act like a tilemap, use its loadTiles method.) However, changing a sprite's
-- x or y position has no effect. Changing the scale will have weird effects as
-- a map expects every sprite to be the same size.
--
-- Extends:
--		<Sprite>

Map = Sprite:extend
{
	-- Constant: NO_SPRITE
	-- Represents a map entry with no sprite.
	NO_SPRITE = -1,

	-- Property: sprites
	-- An ordered table of <Sprite> objects to be used in conjunction with the map property.
	sprites = {},

	-- Property: map
	-- A two-dimensional table of values, each corresponding to an entry in the sprites property.
	-- nb. The tile at (0, 0) visually is stored in [1, 1].
	map = {},

	-- Method: empty
	-- Creates an empty map.
	--
	-- Arguments:
	--		width - width of the map in sprites
	--		height - height of the map in sprites
	-- 
	-- Returns:
	--		self, for chaining

	empty = function (self, width, height)
		local x, y
		
		-- empty the map

		for x = 1, width do
			self.map[x] = {}
			
			for y = 1, height do
				self.map[x][y] = Map.NO_SPRITE
			end
		end
		
		-- set bounds
		
		self.width = width * self.spriteWidth
		self.height = height * self.spriteHeight
		
		return self
	end,

	-- Method: loadMap
	-- Loads map data from a file, typically comma-separated values.
	-- Each entry corresponds to an index in self.sprites, and all rows
	-- must have the same number of columns.
	--
	-- Arguments:
	--		file - filename of source text to use
	--		colSeparator - character to use as separator of columns, default ','
	--		rowSeparator - character to use as separator of rows, default newline
	--
	-- Returns:
	--		self, for chaining

	loadMap = function (self, file, colSeparator, rowSeparator)
		colSeparator = colSeparator or ','
		rowSeparator = rowSeparator or '\n'
		
		-- load data
		
		local x, y
		local source = Cached:text(file)
		local rows = split(source, rowSeparator)
		
		for y = 1, #rows do
			local cols = split(rows[y], colSeparator)
			
			for x = 1, #cols do
				if not self.map[x] then self.map[x] = {} end
				self.map[x][y] = tonumber(cols[x])
			end
		end
		
		-- set bounds
		
		self.width = #self.map * self.spriteWidth
		self.height = #self.map[1] * self.spriteHeight
		
		return self
	end,

	-- Method: loadTiles
	--- Loads the sprites group with slices of a source image.
	--  By default, this uses the Tile class for sprites, but you
	--  may pass as replacement class.
	--
	--  Arguments:
	--		image - source image to use for tiles
	--		class - class to create objects with; constructor
	--				  will be called with properties: image, width,
	--				  height, imageOffset (with x and y sub-properties)
	--		startIndex - starting index of tiles in self.sprites, default 0
	--
	--  Returns:
	--		self, for chaining

	loadTiles = function (self, image, class, startIndex)
		assert(self.spriteWidth and self.spriteHeight, 'sprite size must be set before loading tiles')
		if type(startIndex) ~= 'number' then startIndex = 0 end
		
		class = class or Tile
		self.sprites = self.sprites or {}
		
		local imageObj = Cached:image(image)
		local imageWidth = imageObj:getWidth()
		local imageHeight = imageObj:getHeight()
		 
		local i = startIndex
		
		for y = 0, imageHeight - self.spriteHeight, self.spriteHeight do
			for x = 0, imageWidth - self.spriteWidth, self.spriteWidth do
				self.sprites[i] = class:new{ image = image, width = self.spriteWidth,
											  height = self.spriteHeight,
											  imageOffset = { x = x, y = y }}
				i = i + 1
			end
		end
		
		return self
	end,

	-- Method: getMapSize
	-- Returns the size of the map in map coordinates.
	--
	-- Arguments:
	--		none
	--
	-- Returns:
	--		width and height in integers

	getMapSize = function (self)
		if #self.map == 0 then
			return 0, 0
		else
			return #self.map, #self.map[1]
		end
	end,

	-- Method: pixelToMap
	-- Converts pixels to map coordinates.
	--
	-- Arguments:
	--		x - x coordinate in pixels
	--		y - y coordinate in pixels
	--		clamp - clamp to map bounds? defaults to true
	--
	-- Returns:
	--		x, y map coordinates

	pixelToMap = function (self, x, y, clamp)
		if type(clamp) == 'nil' then clamp = true end

		-- remember, Lua tables start at index 1

		local mapX = math.floor(x / self.spriteWidth) + 1
		local mapY = math.floor(y / self.spriteHeight) + 1
		
		-- clamp to map bounds
		
		if clamp then
			if mapX < 1 then mapX = 1 end
			if mapY < 1 then mapY = 1 end
			if mapX > #self.map then mapX = #self.map end
			if mapY > #self.map[1] then mapY = #self.map[1] end
		end

		return mapX, mapY
	end,

	-- Method: spriteAtMap
	-- Returns the sprite at a given set of map coordinates, with
	-- the correct pixel position for that sprite. Remember that
	-- sprites in maps are shared, so any changes you make to one
	-- sprite will carry over to all instances of that sprite in the map.
	--
	-- Arguments:
	--		x - x coordinate in map units
	--		y - y coordinate in map units
	--
	-- Returns:
	--		<Sprite> instance. If no sprite is present at these
	--		coordinates, the method returns nil.

	spriteAtMap = function (self, x, y)
		if self.map[x] and self.map[x][y] then
			local spr = self.sprites[self.map[x][y]]

			if spr then 
				spr.x = (x - 1) * self.spriteWidth
				spr.y = (y - 1) * self.spriteHeight
				return spr
			end
		elseif STRICT then
			print('Warning: asked for map sprite at ' .. x .. ', ' .. y ' but map isn\'t that big')
		end
	end,

	-- Method: spriteAtPixel
	-- Returns the sprite at a given set of pixel coordinates, with
	-- the correct pixel position for that sprite. Remember that
	-- sprites in maps are shared, so any changes you make to one
	-- sprite will carry over to all instances of that sprite in the map.
	--
	-- Arguments:
	--		x - x coordinate in pixels
	--		y - y coordinate in pixels
	--
	-- Returns:
	--		<Sprite> instance. If no sprite is present at these
	--		coordinates, the method returns nil.

	spriteAtPixel = function (self, x, y)
		return self:spriteAtMap((x - 1) * self.spriteWidth, (y - 1) * self.spriteHeight)
	end,

	-- This overrides a method in <Sprite>, passing along
	-- collidedWith() calls to all sprites in the map touching a
	-- sprite.
	--
	-- Arguments:
	--		other - other <Sprite>
	--
	-- Returns:
	--		nothing

	collidedWith = function (self, other)
		local spriteWidth = self.spriteWidth
		local spriteHeight = self.spriteHeight
		local startX, startY = self:pixelToMap(other.x - self.x, other.y - self.y)
		local endX, endY = self:pixelToMap(other.x + other.width - self.x,
										   other.y + other.height - self.y)

		-- collect collisions against sprites

		local collisions = {}
		
		for x = startX, endX do 
			for y = startY, endY do
				local spr = self.sprites[self.map[x][y]]
				
				if spr and spr.solid then
					local sprX = self.x + (x - 1) * spriteWidth
					local sprY = self.y + (y - 1) * spriteHeight
					
					local xOverlap, yOverlap = other:overlap(sprX, sprY, spriteWidth, spriteHeight)

					if xOverlap ~= 0 or yOverlap ~= 0 then
						table.insert(collisions, { area = xOverlap * yOverlap, x = xOverlap, y = yOverlap,
												   a = spr, ax = sprX, ay = sprY })
					end
				end
			end
		end

		-- sort as usual and pass off collidedWith() calls

		table.sort(collisions, Collision.sortCollisions)

		for _, col in ipairs(collisions) do
			col.a.x, col.a.y = col.ax, col.ay
			col.a:collidedWith(other, col.x, col.y)
			other:collidedWith(col.a, col.x, col.y)
		end
	end,

	-- this is here mainly for completeness; it's better to specify displacement
	-- in individual map sprites

	displace = function (self, other, xHint, yHint)	
		if not self.solid or self == other or not other.solid then return end
		if STRICT then assert(other:instanceOf(Sprite), 'asked to displace a non-sprite') end

		local spriteWidth = self.spriteWidth
		local spriteHeight = self.spriteHeight
		local startX, startY = self:pixelToMap(other.x - self.x, other.y - self.y)
		local endX, endY = self:pixelToMap(other.x + other.width - self.x,
										   other.y + other.height - self.y)

		-- collect collisions against sprites

		local collisions = {}
		
		for x = startX, endX do 
			for y = startY, endY do
				local spr = self.sprites[self.map[x][y]]
				
				if spr and spr.solid then
					local sprX = self.x + (x - 1) * spriteWidth
					local sprY = self.y + (y - 1) * spriteHeight
					
					local xOverlap, yOverlap = other:overlap(sprX, sprY, spriteWidth, spriteHeight)

					if xOverlap ~= 0 or yOverlap ~= 0 then
						table.insert(collisions, { area = xOverlap * yOverlap, x = xOverlap, y = yOverlap,
												   a = spr, ax = sprX, ay = sprY })
					end
				end
			end
		end

		-- sort as usual and displace

		table.sort(collisions, Collision.sortCollisions)

		for _, col in ipairs(collisions) do
			col.a.x, col.a.y = col.ax, col.ay
			col.a:displace(other)
		end
	end,

	draw = function (self, x, y)
		-- lock our x/y coordinates to integers
		-- to avoid gaps in the tiles
	
		x = math.floor(x or self.x)
		y = math.floor(y or self.y)
		if not self.visible or self.alpha <= 0 then return end
		if not self.spriteWidth or not self.spriteHeight then return end
		
		-- determine drawing bounds
		-- we draw to fill the entire app windoow
		
		local startX, startY = self:pixelToMap(-x, -y)
		local endX, endY = self:pixelToMap(the.app.width - x, the.app.height - y)
		
		-- queue each sprite drawing operation
		
		local toDraw = {}
		
		for drawY = startY, endY do
			for drawX = startX, endX do
				local sprite = self.sprites[self.map[drawX][drawY]]
				
				if sprite and sprite.visible then
					if not toDraw[sprite] then
						toDraw[sprite] = {}
					end
					
					table.insert(toDraw[sprite], { x + (drawX - 1) * self.spriteWidth,
												   y + (drawY - 1) * self.spriteHeight })
				end
			end
		end
		
		-- draw each sprite in turn
		
		for sprite, list in pairs(toDraw) do
			for _, coords in pairs(list) do
				sprite:draw(coords[1], coords[2])
			end
		end
	end,

	-- makes sure all sprites receive startFrame messages

	startFrame = function (self, elapsed)
		for _, spr in pairs(self.sprites) do
			spr:startFrame(elapsed)
		end

		Sprite.startFrame(self, elapsed)
	end,

	-- makes sure all sprites receive update messages

	update = function (self, elapsed)
		for _, spr in pairs(self.sprites) do
			spr:update(elapsed)
		end

		Sprite.update(self, elapsed)
	end,

	-- makes sure all sprites receive endFrame messages

	endFrame = function (self, elapsed)
		for _, spr in pairs(self.sprites) do
			spr:endFrame(elapsed)
		end

		Sprite.endFrame(self, elapsed)
	end,

	__tostring = function (self)
		local result = 'Map (x: ' .. self.x .. ', y: ' .. self.y ..
					   ', w: ' .. self.width .. ', h: ' .. self.height .. ', '

		if self.active then
			result = result .. 'active, '
		else
			result = result .. 'inactive, '
		end

		if self.visible then
			result = result .. 'visible, '
		else
			result = result .. 'invisible, '
		end

		if self.solid then
			result = result .. 'solid'
		else
			result = result .. 'not solid'
		end

		return result .. ')'
	end
}
