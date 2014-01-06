FactoryParticle = Fill:extend{
	width = 16,
	height = 16,

	onNew = function (self)
		the.app.particles:add(self)
	end,

	onReset = function (self)
		self.x = (the.app.width - self.width) / 2
		self.y = (the.app.height - self.height) / 2
	end,

	onUpdate = function (self)
		if self.x < - self.width or self.y < - self.height or self.x > the.app.width then
			the.view.factory:recycle(self)
		end
	end
}

Reuse = TestApp:extend
{
	onNew = function (self)
		self.particles = Group:new()
		self:add(self.particles)
		self.label = Text:new{ x = 10, y = 500, font = 48, width = 800, text = '0 sprites created' }
		self:add(self.label)

		self:add(Text:new{ x = 10, y = 560, width = 640, font = 14,
						   text = 'Press the R, G, and B keys to create sprites of different hues. ' ..
						   'When a sprite goes offscreen, it is automatically reused. Zoetrope\'s Factory ' ..
						   'class does the bookkeeping for you.' })
	end,

	onUpdate = function (self, elapsed)
		if the.keys:justPressed('r') then
			self.view.factory:create(FactoryParticle,
									{ fill = { 255, 0, 0 },
									  velocity = { x = -200, y = 0, rotation = 0 } })
		elseif the.keys:justPressed('g') then
			self.view.factory:create(FactoryParticle,
									{ fill = { 0, 255, 0 },
									  velocity = { x = 0, y = -200, rotation = 0 } })
		elseif the.keys:justPressed('b') then
			self.view.factory:create(FactoryParticle,
									{ fill = { 0, 0, 255 },
									  velocity = { x = 200, y = 0, rotation = 0 } })
		end

		self.label.text = self.particles:count() .. ' sprites created'
	end
}
