require 'zoetrope'

CollisionBlock = Fill:extend
{
	width = 16,
	height = 16,
	fill = {0, 0, 255, 64},
	hitFill = {255, 0, 0, 64},

	onNew = function (self)
		self.x = math.random(0, the.app.width)
		self.y = math.random(0, the.app.height) 
		self.velocity.x = math.random(-100, 100)
		self.velocity.y = math.random(-100, 100)
	end,

	onStartFrame = function (self)
		self.fill = CollisionBlock.fill
	end,

	onUpdate = function (self)
		if (self.x < 0 and self.velocity.x < 0) or
		   (self.x > the.app.width and self.velocity.x > 0) then
			self.velocity.x = self.velocity.x * -1
		end

		if (self.y < 0 and self.velocity.y < 0) or
		   (self.y > the.app.height and self.velocity.y > 0) then
			self.velocity.y = self.velocity.y * -1
		end
	end,

	onCollide = function (self, other)
		self.fill = CollisionBlock.hitFill
		if the.app.mode == 'displace' then self:displace(other) end
	end
}

CollisionBenchmark = TestApp:extend
{
	name = 'Collision Benchmark',
	minFPS = 55,
	count = 0,
	mode = 'collide',

	onNew = function (self)
		DEBUG = false
		STRICT = false

		self.blocks = Group:new()
		self:add(self.blocks)
		self.countText = Text:new{ x = 10, y = 420, font = 144, width = 200 }
		self:add(self.countText)
		self:add(Fill:new{ x = 0, y = 560, width = 800, height = 40, fill = {0, 0, 0, 200} })
		self:add(Text:new{ x = 10, y = 562, font = 14, width = 600,
				 text = 'sprites onscreen while maintaining roughly 60 frames per second.\n' ..
				 		'Press the T key to toggle between simple collision and displacement.' })
	end,

	onUpdate = function (self, elapsed)
		if the.keys:justPressed('t') then
			if self.mode == 'collide' then
				self.mode = 'displace'
			else
				self.mode = 'collide'
			end
		end

		self.blocks:collide()
		self.currentFPS = math.floor(1 / elapsed)
	
		if self.currentFPS >= self.minFPS then
			self.blocks:add(CollisionBlock:new{ })
			self.count = self.count + 1
			self.countText.text = self.count
		end
	end
}
