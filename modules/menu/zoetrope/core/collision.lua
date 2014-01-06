-- Class: Collision
-- This is a utility class that helps with collision detection. It's aware
-- of <Sprite>s and <Group>s and makes sure collisions are resolved in the
-- correct order (most overlap to least). You shouldn't have to use this class
-- directly.
--
-- See Also:
--		<Sprite.collide>, <Group.collide>

Collision = Class:extend
{
	-- Property: gridSize
	-- Default grid size used when checking collisions. Roughly speaking, this
	-- should be two times as big as your most common sprite size, but tweaking
	-- this number can yield better performance.
	gridSize = 25,

	-- Method: check
	-- Checks for collisions between <Sprite>s and <Group>s. If you call
	-- Collision:check(a, b, c), it will check for collisions between a and b,
	-- a and c, but not b and c.
	--
	-- It spatially hashes all objects into a grid, then checks for collisions via
	-- <Sprite.overlap()>. If an overlap is detected, then the collision is recorded.
	-- As a final step, this calls collidedWith() on sprites that collided, but in 
	-- descending order of overlap. (This normally only triggers the onCollide() handler
	-- for the sprite, but <Map>s take advantage of this indirection.)
	-- The sequence of collision resolutions is important, so that displacement occurs
	-- in an order that prevents sprites from getting stuck on walls made of multiple sprites.
	--
	-- Arguments:
	--		a - primary <Sprite> or <Group>
	--		... - any number of <Sprite>s or <Group>s to check for collisions against
	--			  the A sprite or group
	--
	-- Returns:
	--		nothing

	check = function (self, a, ...)
		-- coerce all arguments into a flat list of sprites,
		-- recording where the first argument (or A group) sits in the list

		local args = {...}
		local list = self:solidSprites(a)
		local aLength = #list

		for _, item in pairs(args) do
			self:solidSprites(item, list)
		end

		-- build a spatial hash from the list, recording the grid
		-- cells that each of the sprites fits inside.
		-- we also record which cells each of the sprites in the A group
		-- sits in.

		local grid = {}
		local gridSize = a.gridSize or self.gridSize
		local gridded = {}
		local deferred = {}
		local aHuge = {}
		local aCells = {}

		for i, spr in ipairs(list) do
			if not gridded[spr] then
				local startX = math.floor(spr.x / gridSize)
				local endX = math.floor((spr.x + spr.width) / gridSize)
				local startY = math.floor(spr.y / gridSize)
				local endY = math.floor((spr.y + spr.height) / gridSize)

				-- Special casing of very large sprites (as defined as >= 25 cells in
				-- area). If they are in the A list, we just reserve them
				-- for later and check them against all sprites in the other lists.
				-- If they are not in the A list, we defer them to the very end of the gridding
				-- process, only to cells that have already been gridded by virtue of another
				-- sprite being in them.
				--
				-- The assumption here is that huge sprites are probably big tilemaps, and
				-- thus likely to collide with every sprite anyway.

				if (endX - startX) * (endY - startY) > 25 then
					if i <= aLength then
						table.insert(aHuge, spr)
					else
						table.insert(deferred, { spr = spr, startX = startX, endX = endX, startY = startY, endY = endY })
					end
				else
					if i <= aLength then
						aCells[spr] = {}
					end
				
					for x = startX, endX do
						grid[x] = grid[x] or {}

						for y = startY, endY do
							grid[x][y] = grid[x][y] or {}
							table.insert(grid[x][y], spr)

							if i <= aLength then
								table.insert(aCells[spr], grid[x][y])
							end
						end
					end
				end

				gridded[spr] = true
			end
		end

		-- Grid all huge sprites we just deferred. Unlike above,
		-- we only add them to grid cells that already have sprites in them.

		for _, d in pairs(deferred) do
			for x = d.startX, d.endX do
				if grid[x] then
					for y = d.startY, d.endY do
						if grid[x][y] then
							table.insert(grid[x][y], d.spr)
						end
					end
				end
			end
		end

		-- aCells now is a table whose keys are sprites in this group,
		-- and whose values are a table of grid cells that the sprite is in.
		-- We now build a list of collisions based on that.

		local collisions = {}
		local alreadyCollided = {}

		for aSpr, cells in pairs(aCells) do
			alreadyCollided[aSpr] = alreadyCollided[aSpr] or {}
			
			for _, cell in pairs(cells) do
				for _, bSpr in pairs(cell) do
					if aSpr ~= bSpr and not alreadyCollided[aSpr][bSpr] then
						local xOverlap, yOverlap = bSpr:overlap(aSpr.x, aSpr.y, aSpr.width, aSpr.height)

						if xOverlap ~= 0 or yOverlap ~= 0 then
							table.insert(collisions, { area = xOverlap * yOverlap, x = xOverlap, y = yOverlap, a = aSpr, b = bSpr })
						end

						-- record that we've already checked this collision

						alreadyCollided[bSpr] = alreadyCollided[bSpr] or {}
						alreadyCollided[aSpr][bSpr] = true
						alreadyCollided[bSpr][aSpr] = true
					end
				end
			end
		end

		-- Run through the huge sprites in the A list, if any, adding
		-- collisions to the existing list.

		for _, aSpr in pairs(aHuge) do
			alreadyCollided[aSpr] = alreadyCollided[aSpr] or {}

			for i = aLength + 1, #list do
				local bSpr = list[i]

				if aSpr ~= bSpr and not alreadyCollided[aSpr][bSpr] then
					local xOverlap, yOverlap = bSpr:overlap(aSpr.x, aSpr.y, aSpr.width, aSpr.height)

					if xOverlap ~= 0 or yOverlap ~= 0 then
						table.insert(collisions, { area = xOverlap * yOverlap, x = xOverlap, y = yOverlap, a = aSpr, b = bSpr })
					end

					alreadyCollided[bSpr] = alreadyCollided[bSpr] or {}
					alreadyCollided[aSpr][bSpr] = true
					alreadyCollided[bSpr][aSpr] = true
				end
			end
		end

		-- collisions now is a list, each item containing these properties:
		--		a - sprite colliding
		--		b - second sprite colliding
		--		x - x overlap
		--		y - y overlap
		--	 	area - square area of overlap
		--
		-- we now sort the table and resolve collisions in descending order of overlap area.
		
		table.sort(collisions, self.sortCollisions)

		for _, col in ipairs(collisions) do
			col.a:collidedWith(col.b, col.x, col.y)
			col.b:collidedWith(col.a, col.x, col.y)
		end
	end,

	-- Method: solidSprites
	-- Returns a table of <Sprite>s belonging to an object that
	-- should be collided with others, descending into groups.
	--
	-- Arguments:
	--		source - <Sprite> or <Group>
	--		existing - existing table to add to
	--
	-- Returns:
	--		table of <Sprite>s

	solidSprites = function (self, source, existing)
		local result = existing or {}
		
		if source.solid then
			if source.x and source.y and source.width and source.height then
				table.insert(result, source)
			elseif source.sprites then
				for _, spr in pairs(source.sprites) do
					if spr.sprites then
						result = self:solidSprites(spr, result)
					elseif spr.solid then
						table.insert(result, spr)
					end
				end
			end
		end

		return result
	end,

	-- Method: sortCollisions
	-- This sorts a table of collisions in descending order of overlap,
	-- suitable for use in conjunction with table.sort().
	--
	-- Arguments:
	--		a - one collision table
	--		b - one collision table
	--
	-- Returns:
	--		whether a should be sorted before b

	sortCollisions = function (a, b)
		return a.area > b.area
	end
}
