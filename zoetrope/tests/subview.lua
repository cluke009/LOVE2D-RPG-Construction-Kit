SubviewTest = TestApp:extend
{
	onRun = function (self)
		for x = 10, self.width - 10, 50 do
			for y = 10, self.height - 10, 50 do
				self:add(Fill:new { x = x, y = y, fill = {0, 0, 255}, width = 40, height = 40,
									velocity = { rotation = math.pi * 2 }})
			end
		end

		self:add(Fill:new{ x = 0, y = 550, width = 800, height = 50, fill = {0, 0, 0, 200} })
		self:add(Text:new{ x = 10, y = 560, font = 14, width = 780, text = 'Press the S key to show the subview overlay.' })

		self.subview = Subview:new
		{
			onNew = function (self)
				self.bg = Fill:new{ x = (the.app.width - 300) / 2, y = 100,
								    height = 50, width = 300, fill = {255, 255, 255} }
				self:add(self.bg)
				self:add(Text:new{ x = (the.app.width - 300) / 2 + 10, y = 110,
								   width = 280, align = 'center', tint = {0, 0, 0},
								   text = 'Press the S key again to hide this overlay.', font = 14 })
			end,

			onActivate = function (self)
				self.tween:start(self.bg, 'alpha', 0.5, 0.5):andThen(Tween.reverseForever)
			end
		}

	end,

	onUpdate = function (self)
		if the.keys:justPressed('s') then
			if the.app.subview.activated then
				the.app.subview:deactivate()
			else
				the.app.subview:activate()
			end
		end
	end
}
