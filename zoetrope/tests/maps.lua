require 'zoetrope'

Maps = TestApp:extend
{
	onRun = function (self)	
		-- programmatically created map
	
		local map = Map:new{ x = 124, y = 10, spriteWidth = 16, spriteHeight = 16 }
		map:empty(16, 16)
		
		local x, y
		
		for x = 1, 16 do
			for y = 1, 16 do
				map.map[x][y] = math.random(1, 4)
			end
		end
		
		local mario = 'tests/assets/bluegem.png'
		
		map.sprites[1] = Fill:new{ width = 16, height = 16, fill = {255, 0, 0} }
		map.sprites[2] = Fill:new{ width = 16, height = 16, fill = {0, 255, 0} }
		map.sprites[3] = Fill:new{ width = 16, height = 16, fill = {0, 0, 255} }
		map.sprites[4] = Tile:new{ width = 16, height = 16, image = mario }
		self:add(map)
		
		-- map loaded from CSV
		
		self.map2 = Map:new{ x = 256, y = 300, spriteWidth = 24, spriteHeight = 24 }
		self.map2:loadMap('tests/assets/map.csv')
		self.map2.sprites[1] = Fill:new{ width = 24, height = 24, fill = {0, 0, 255},
			onCollide = function (self, other)
				self:displace(other)
			end }
		self:add(self.map2)
		
		-- map with loadTiles() used
		
		local map3 = Map:new{ x = 400, y = 10, spriteWidth = 16, spriteHeight = 16 }
		map3:loadTiles('tests/assets/tiles.png')
		map3:empty(16, 16)
		
		for x = 1, 16 do
			for y = 1, 16 do
				map3.map[x][y] = math.random(1, 2)
			end
		end
		
		self:add(map3)
		
		-- player for testing collisions
		
		self.player = Fill:new{ x = 380, y = 380, width = 16, height = 16 }
		self:add(self.player)

		self:add(Text:new
		{
			x = 10, y = 510, width = 550, font = 14,
			text = 'Move the square with the arrow keys to escape the maze. Zoetrope\'s Map ' ..
				   'class allows you to create traditional tilemaps as well ' ..
				   'as animated ones. Any sprite type can be used as a map element. The Map ' ..
				   'class performs collision detection, but each sprite can contain a collision ' ..
				   'handler. You can create maps manually or by loading from CSV.'
		})
	end,
	
	onUpdate = function (self, elapsed)
		self.map2:collide(self.player)
	
		self.player.velocity.x = 0
		self.player.velocity.y = 0
		self.player.fill = { 255, 255, 255 }
		
		if self.keys:pressed('left') then
			self.player.velocity.x = -150
		end
		
		if self.keys:pressed('right') then
			self.player.velocity.x = 150
		end
		
		if self.keys:pressed('up') then
			self.player.velocity.y = -150
		end
		
		if self.keys:pressed('down') then
			self.player.velocity.y = 150
		end
	end
}
