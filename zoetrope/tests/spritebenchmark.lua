require 'zoetrope'

Block = Tile:extend
{
	width = 16,
	height = 16,

	blueGem = 'tests/assets/bluegem.png',
	greenGem = 'tests/assets/greengem.png',

	onNew = function (self)
		if (math.random() > 0.5) then
			self.image = self.blueGem
		else
			self.image = self.greenGem
		end
	
		self.velocity.x = math.random(-100, 100)
		self.velocity.rotation = math.random(math.pi / 2, 4 * math.pi)
		self.acceleration.y = math.random(500, 1000)
		self.rotation = math.random(0, math.pi * 4)
		self.scale = math.random(0.25, 2)
		self.alpha = math.random()
	end,
	
	onUpdate = function (self)
		if self.y > the.app.height and self.velocity.y > 0 then
			self.velocity.y = self.velocity.y * -1
		end
		
		if (self.x < 0 and self.velocity.x < 0) or
		   (self.x > the.app.width and self.velocity.x > 0) then
		   self.velocity.x = self.velocity.x * -1
		end
	end
}

SpriteBenchmark = TestApp:extend
{
	name = 'Sprite Benchmark',
	count = 0,
	fps = 999,
	minFPS = 55,
	currentFPS = 0,

	onNew = function (self)
		DEBUG = false
		STRICT = false

		self.blocks = Group:new()
		self:add(self.blocks)
		self.countText = Text:new{ x = 10, y = 440, font = 144, width = 200 }
		self:add(self.countText)
		self:add(Fill:new{ x = 0, y = 580, width = 800, height = 20, fill = {0, 0, 0, 200} })
		self:add(Text:new{ x = 10, y = 582, font = 14, width = 600,
				 text = 'sprites onscreen while maintaining roughly 60 frames per second.' })
	end,
	
	onUpdate = function (self, elapsed)
		self.currentFPS = math.floor(1 / elapsed)
	
		if self.currentFPS >= self.minFPS then
			self.blocks:add(Block:new{ x = math.random(0, 800), y = math.random(0, 600) })
			self.count = self.count + 1
			self.countText.text = self.count
		end

		if the.keys:justPressed('f') then
			self:toggleFullscreen()
		end
	end
}
