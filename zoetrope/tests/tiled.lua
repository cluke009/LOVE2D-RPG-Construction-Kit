require 'zoetrope'

Player = Fill:extend
{
	width = 16, height = 16, fill = { 0, 0, 255 },

	onUpdate = function (self)
		self.velocity.x = 0
		self.velocity.y = 0
		
		if the.keys:pressed(UP) then self.velocity.y = -200 end
		if the.keys:pressed(DOWN) then self.velocity.y = 200 end
		if the.keys:pressed(LEFT) then self.velocity.x = -200 end
		if the.keys:pressed(RIGHT) then self.velocity.x = 200 end
	end
}

Tiled = TestApp:extend
{
	onRun = function (self)
		self.view:loadLayers('tests/assets/map.lua')
		self.view:clampTo(self.view.map)
		self.view.focus = the.player
		
		local overlay = Group:new({ translateScale = { x = 0, y = 0 } })
		
		overlay:add(Fill:new{ x = 0, y = 550, width = 800, height = 50, fill = {0, 0, 0, 200} })
		overlay:add(Text:new
		{
			x = 10, y = 560, font = 14, width = 780,
			text = 'Move the square with the arrow keys to explore the map. Zoetrope can load tilemaps and objects created in Tiled, and respects layer ' ..
				   'order. Connecting an object to a class is as simple as giving it a name.'
		})

		self:add(overlay)
	end,

	onUpdate = function (self)
		self.view.map:displace(the.player)
	end
}
