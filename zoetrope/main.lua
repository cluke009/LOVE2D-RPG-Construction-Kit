DEBUG = true
STRICT = true

require 'tests'

MenuButton = Button:extend
{
	onNew = function (self)
		self.background = Fill:new{ width = 200, height = 24, fill = {175, 208, 229 } }
		self.label = Text:new{ x = 4, y = 6, align = 'center',
							   width = 192, height = 16, text = self.label, tint = {0.07, 0.27, 0.39} }
	end,

	onMouseEnter = function (self)
		self.background.fill = {20, 69, 101}
		self.label.tint = {0.68, 0.82, 0.89}
	end,

	onMouseExit = function (self)
		self.background.fill = {175, 208, 229}
		self.label.tint = {0.07, 0.27, 0.39}
	end,

	onMouseUp = function (self)
		the.app = self.app:new()
		the.app:run()
	end
}

MenuBlock = Fill:extend
{
	width = 28, height = 16,
	fill = {248, 248, 248},
	drag = { x = 25, y = 25 },
	mass = 1,
	hits = {},
	alpha = 0,
	colors = { {239, 187, 45},
			   {184, 146, 39},
			   {133, 93, 0},
			   {133, 93, 0},
			   {175, 208, 229},
			   {127, 186, 233},
			   {127, 186, 233},
			   {81, 154, 208},
			   {36, 121, 180},
			 },

	onNew = function (self)
		self.fill = self.colors[math.random(#self.colors)]
	end,

	onStartFrame = function (self)
		while #self.hits > 0 do table.remove(self.hits) end
	end,

	onCollide = function (self, other)
		for _, spr in pairs(self.hits) do
			if spr == other then return end
		end

		table.insert(self.hits, other)
		table.insert(other.hits, self)
		self:displace(other)

		-- stop any acceleration applied by the view

		self.acceleration.x, self.acceleration.y = 0, 0
		other.acceleration.x, other.acceleration.y = 0, 0

		-- the following algorithm is shamelessly stolen from
		-- http://www.gamasutra.com/view/feature/131424/pool_hall_lessons_fast_accurate_.php?page=3

		-- find vector between the two centers and normalize it

		local centX = self.x - other.x
		local centY = self.y - other.y
		local centLength = math.sqrt(centX * centX + centY * centY)
		centX = centX / centLength
		centY = centY / centLength

		-- find length of each's movement vector along the center vector

		local dotSelf = self.velocity.x * centX + self.velocity.y * centY
		local dotOther = other.velocity.x * centX + other.velocity.y * centY
		
		-- combined momentum of both blocks

		local optMomentum = 2 * (dotSelf - dotOther) / (self.mass + other.mass)

		-- then set our own new velocity

		self.velocity.x = self.velocity.x - optMomentum * other.mass * centX
		self.velocity.y = self.velocity.y - optMomentum * other.mass * centY
		other.velocity.x = other.velocity.x + optMomentum * self.mass * centX
		other.velocity.y = other.velocity.y + optMomentum * self.mass * centY

		the.view.tween:start(self, 'alpha', 1, 0.25) 
		the.view.tween:start(other, 'alpha', 1, 0.25)
	end,

	onUpdate = function (self)
		if math.abs(self.velocity.x + self.velocity.y) < 5 and
		   self.alpha ~= 0 and not the.view.tween:status(self, 'alpha', 0) then
			the.view.tween:start(self, 'alpha', 0)
		end

		if (self.x < 480 and self.velocity.x < 0) or
		   (self.x + self.width > the.app.width and self.velocity.x > 0) then
			self.velocity.x = self.velocity.x * -1
			self.acceleration.x, self.acceleration.y = 0, 0
		end

		if (self.y < 0 and self.velocity.y < 0) or
		   (self.y + self.height > the.app.height and self.velocity.y > 0) then
			self.velocity.y = self.velocity.y * -1
			self.acceleration.x, self.acceleration.y = 0, 0
		end
	end
}

the.app = App:new
{
	fps = 40,

	apps =
	{
		'Sprite Benchmark', SpriteBenchmark,
		'Collision Benchmark', CollisionBenchmark,
		'Sprites', SpriteTypes,
		'Collision Checking', Collisions,
		'Keyboard and Mouse Input', Input,
		'Gamepad Input', GamepadSupport,
		'Object Reuse', Reuse,
		'Maps', Maps,
		'Tiled Map Support', Tiled,
		'Emitters', Emitters,
		'Sounds', Sounds,
		'Files', Files,
		'UI', UI,
		'Parallax Scrolling', Scrolling,
		'Pixel Effects', Effects,
		'Subviews', SubviewTest,
		'Timers', Timers,
		'Tweens', Tweens,
		'Input Recording', Recording,
		'Debugging', Debugging
	},

	onRun = function (self)
		DEBUG = true
		STRICT = true

		self:add(Fill:new{ x = 0, y = 0, width = self.width, height = self.height, fill = {255, 255, 255} })

		-- blocks

		self.blocks = Group:new()
		self:add(self.blocks)
	
		for x = 480, 750, 50 do
			for y = 10, 600, 50 do
				self.blocks:add(MenuBlock:new{ x = x, y = y })
			end
		end

		self.view.timer:every(1, function() self:pushBlock() end)

		-- menu buttons

		local x = 10
		local y = 25

		for i = 1, #self.apps, 2 do
			self:add(MenuButton:new{ x = x, y = y, label = self.apps[i], app = self.apps[i + 1] })

			x = x + 250

			if x > 400 then
				x = 10
				y = y + 40
			end
		end

		print('Welcome to the Zoetrope test suite.')

		self:add(Text:new{ x = 10, y = 470, font = 100, width = 780, tint = {0, 0, 0}, text = 'Zoetrope' })
		self:add(Text:new{ x = 10, y = 580, font = 11, tint = {0.15, 0.15, 0.15}, text = 'http://libzoetrope.org/' })
		self:add(Text:new{ x = 10, y = 440, font = 14, width = 400, text =
						   'Click a heading above to see a demo.\nPress the Escape key at any time to return to this menu.', tint = {0.15, 0.15, 0.15} })
		self:useSysCursor(true)
	end,

	onUpdate = function(self)
		self.blocks:collide()
	end,

	pushBlock = function (self)
		local block = self.blocks.sprites[math.random(#self.blocks.sprites)]
		block.acceleration.x = math.random(-400, 400)
		block.acceleration.y = math.random(-400, 400)
	
		if math.abs(1 - block.alpha) > NEARLY_ZERO and not self.view.tween:status(block, 'alpha', 1) then
			self.view.tween:start(block, 'alpha', 1, 0.25)
		end
	end
}
