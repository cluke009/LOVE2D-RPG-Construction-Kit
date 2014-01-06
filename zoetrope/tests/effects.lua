Effects = TestApp:extend
{
	onRun = function (self)
		self:add(Fill:new{ width = self.width, height = self.height, fill = {200, 200, 200} })
		the.group = Group:new()
		self:add(the.group)

		for i = 1, 100 do
			the.group:add(Tile:new
			{
				x = math.random(self.width),
				y = math.random(self.height),
				image = 'tests/assets/bluegem.png',
				scale = 2,
				rotation = math.random(math.pi),
				velocity = { rotation = math.pi }
			})
		end

		self:add(Fill:new{ x = 0, y = 550, width = 800, height = 50, fill = {0, 0, 0, 200} })
		local text = Text:new{ x = 10, y = 560, font = 14, width = 780 }
		self:add(text)

		if (love.graphics.isSupported('pixeleffect')) then
			text.text = 'Press the F key to toggle a fuzzy screen effect, the D key to toggle ' ..
						'a desaturation effect. Pixel effects can be set by individual group.'
		else
			text.text = 'Sorry, this system does not support pixel effects.'
		end
	end,

	onUpdate = function (self)
		if the.keys:justPressed('f') then self:toggleScreenEffect() end
		if the.keys:justPressed('d') then self:toggleSpriteEffect() end
	end,

	toggleScreenEffect = function (self)
		if self.screenEffectOn then
			self.view:setEffect()
			self.screenEffectOn = false
		else
			self.view:setEffect('tests/assets/fuzzyscreen.effect')
			self.view.effect:send('pixelSize', { 1 / self.width, 1 / self.height })
			self.view.effect:send('brightness', 0.15)
			self.view.effect:send('sharpness', 0)
			self.screenEffectOn = true
		end
	end,
	
	toggleSpriteEffect = function (self)
		if self.spriteEffectOn then
			the.group:setEffect()
			self.spriteEffectOn = false
		else
			the.group:setEffect('tests/assets/desaturate.effect', 'sprite')
			the.group.effect:send('desaturation', 1)
			self.spriteEffectOn = true
		end
	end
}
