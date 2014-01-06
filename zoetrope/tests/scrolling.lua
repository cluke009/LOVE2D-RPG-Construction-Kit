require 'zoetrope'

Scrolling = TestApp:extend
{
	onRun = function (self)
		local x
		
		local layer1 = Group:new()
		layer1.translateScale.x = 0.25
		layer1.translateScale.y = 0.25
		self:add(layer1)
		
		for x = 16, self.width * 5, 64 do
			layer1:add(Tile:new{ x = x, y = 100, image = 'tests/assets/bluegem.png', scale = 0.5 })
		end
		
		local layer2 = Group:new()
		layer2.translateScale.x = 0.5
		layer2.translateScale.y = 0.5
		self:add(layer2)
		
		for x = 16, self.width * 5, 64 do
			layer2:add(Tile:new{ x = x, y = 150, image = 'tests/assets/bluegem.png' })
		end
		
		local layer3 = Group:new()
		self:add(layer3)
		
		for x = 16, self.width * 5, 64 do
			layer3:add(Tile:new{ x = x, y = 200, image = 'tests/assets/bluegem.png', scale = 2 })
		end
		
		local layer4 = Group:new()
		layer4.translateScale.x = 0
		layer4.translateScale.y = 0
		self:add(layer4)
		
		for x = 16, self.width * 5, 100 do
			layer4:add(Tile:new{ x = x, y = 400, image = 'tests/assets/bluegem.png', scale = 4 })
		end
		
		self.view.tween:start(self.view.translate, 'x', self.width * -4, 10, 'quadInOut')
		:andThen(Tween.reverseForever)

		layer4:add(Text:new
		{
			x = 10, y = 550, width = 600, font = 14,
			text = 'Each group of sprites can be assigned a separate scroll factor, to simulate ' ..
				   'parallax scrolling. Set the factor to 0 to keep sprites onscreen, i.e. for a HUD.'
		})
	end
}
