SpriteTypes = TestApp:extend
{
	title = 'Sprite Types',

	-- test .. in paths
	blueGem = 'tests/assets/../assets/bluegem.png',
	chestAnim = 'tests/assets/../../tests/assets/animation.png',
	
	onNew = function (self)
		print 'This demonstrates the different types of sprites available in Zoetrope.'
	end,
	
	onRun = function (self)
		self:add(Fill:new
		{
			x = 100, y = 40,
			width = 32, height = 32,
			fill = { 0, 0, 255 }, border = { 0, 255, 0 }
		})	
	
		self:add(Fill:new
		{
			x = 150, y = 36, width = 32, height = 32,
			fill = { 0, 0, 255 }, border = { 0, 255, 0 },
			tint = { 0, 0, 1 }, velocity = { rotation = math.pi },
			alpha = 0.5, scale = 2 
		})

		self:add(Text:new
		{
			x = 50, y = 100, width = 200, align = 'center',
			text = 'A Fill fills a rectangular area with a solid color, and has an optional border.'
		})
		
		self:add(Tile:new
		{
			x = 360, y = 40,
			width = 32, height = 32,
			image = self.blueGem
		})
		
		self:add(Tile:new
		{
			x = 420, y = 45,
			image = self.blueGem,
			tint = { 0.5, 1, 0.5 }, velocity = { rotation = math.pi },
			scale = 3, alpha = 0.5
		})

		self:add(Text:new
		{
			x = 300, y = 100, width = 200, align = 'center',
			text = 'A Tile stamps an image or repeats it across a rectangular area.'
		})
		
		local anim = Animation:new
		{
			x = 600, y = 45,
			width = 16, height = 24,
			image = self.chestAnim,
			sequences = { open = { frames = { 1, 2, 3, 4, 5, 4, 3, 2 }, fps = 10 } }
		}

		anim:play('open')
		self:add(anim)

		local anim2 = Animation:new
		{
			x = 640, y = 45,
			width = 16, height = 24,
			image = self.chestAnim,
			sequences = { open = { frames = { 1, 2, 3, 4, 5, 4, 3, 2 }, fps = 10 } },
		  	tint = { 0.5, 1, 0.5 }, alpha = 0.5,
			velocity = { rotation = math.pi }, scale = 3
		}
		anim2:play('open')
		self:add(anim2)

		self:add(Text:new
		{
			x = 550, y = 100, width = 200,
			text = 'An Animation plays a sequence of frames from an image.'
		})

		self:add(Text:new
		{
			x = 50, y = 250, width = 200,
			text = 'Text sprites display text using outline (or TrueType) fonts.',
			tint = { 1, 0, 0 }
		})

		self:add(Text:new
		{
			x = 300, y = 250, width = 200,
			text = 'Font color can be set...',
			align = 'center',
			tint = { 0, 1, 0 }
		})

		self:add(Text:new
		{
			x = 550, y = 250, width = 200,
			text = '... as well as alignment of text when it wraps to multiple lines.',
			align = 'right',
			tint = { 0, 0, 1 }
		})

		self:add(Text:new
		{
			x = 0, y = 350, width = 800,
			align = 'center',
			text = 'Text sprites can also use bitmap fonts.',
			font = 'tests/assets/press_start.png'
		})

		self:add(Text:new
		{
			x = 0, y = 375, width = 800,
			align = 'center',
			text = 'Text sprites can also use bitmap fonts.',
			font = 'tests/assets/press_start.png',
			scale = 1.5,
			alpha = 0.25,
			tint = { 0, 0, 1 },
			velocity = { rotation = math.pi / 2 }
		})

		self:add(Text:new
		{
			x = 10, y = 560, width = 560, font = 14,
			text = 'All sprites can be scaled, rotated, tinted, and alpha faded. They also have ' ..
				   'velocity, acceleration, and drag (for both their x and y motion as well as rotation).'
		})
	end
}
