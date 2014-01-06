require 'zoetrope'

CollisionWall = Fill:extend
{
	fill = {255, 0, 255},
	width = 16,
	height = 16,

	onCollide = function (self, other)
		if other == the.app.player then
			self:displace(other)
		end
	end
}

Collisions = TestApp:extend
{
	onRun = function (self)
		self.player = Fill:new
		{
			x = 16, y = 16, width = 16, height = 16,
			onStartFrame = function (self)
				self.fill = { 255, 255, 255 }
			end,
			onCollide = function (self, other, xOverlap, yOverlap)
				if xOverlap > 8 and yOverlap > 8 then
					self.fill = { 255, 255, 0 }
				end
			end
		}
		
		self.obstacle = Fill:new
		{
			x = 200, y = 200, width = 96, height = 96, fill = {255, 0, 0},
			onCollide = function (self, other)
				self:displace(other)
			end
		}
								   
		self.pushable = Fill:new
		{
			x = 100, y = 100, width = 48, height = 48, fill = {0, 0, 255},
			onCollide = function (self, other)
				other:displace(self)
			end
		}
							
		self.collidable = Fill:new{ x = 20, y = 20, width = 32, height = 32,
									fill = {0, 255, 0} }

		self.wall = Group:new()
		self:add(self.wall)
		self.wall:add(CollisionWall:new{ x = 20, y = 100 })
		self.wall:add(CollisionWall:new{ x = 36, y = 100 })
		self.wall:add(CollisionWall:new{ x = 52, y = 100 })
		self.wall:add(CollisionWall:new{ x = 68, y = 100 })
		self.wall:add(CollisionWall:new{ x = 84, y = 100 })
		self.wall:add(CollisionWall:new{ x = 84, y = 84 })

		self:add(self.collidable)		
		self:add(self.obstacle)
		self:add(self.pushable)
		self:add(self.player)

		self:add(Text:new{ x = 10, y = 560, width = 600, font = 14,
						   text = 'Use the arrow keys to move. Zoetrope can do basic collision ' ..
						   'detection based on bounding rectangles, and also have sprites displace each other.' })
	end,
	
	onUpdate = function (self, elapsed)
		self.player.velocity.x = 0
		self.player.velocity.y = 0
		
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
		
		self.player:collide(self.collidable, self.obstacle, self.pushable, self.wall)
		self.pushable:collide(self.collidable, self.obstacle, self.player, self.wall)
	end
}
