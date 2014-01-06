require 'zoetrope'

Sensor = Fill:extend
{
	alpha = 0,

	onUpdate = function (self, elapsed)
		if self.alpha > 0 then
			self.alpha = math.max(self.alpha - elapsed * 4, 0) 
		end
	end
}

Input = TestApp:extend
{
	onNew = function (self)
		self.released = Sensor:new{ width = 200, height = 400, fill = { 255, 0, 0 } }
		self:add(self.released)
		
		self.justPressed = Sensor:new{ x = 200, width = 200, height = 400, fill = { 0, 255, 0 } }
		self:add(self.justPressed)
		
		self.pressed = Sensor:new{ x = 400, width = 200, height = 400, fill = { 0, 0, 255 } }
		self:add(self.pressed)
		
		self.justReleased = Sensor:new{ x = 600, width = 200, height = 400, fill = { 255, 255, 0 } }
		self:add(self.justReleased)
		
		self.leftMouse = Sensor:new{ y = 400, width = 400, height = 200, fill = { 0, 255, 255 } }
		self:add(self.leftMouse)
		
		self.rightMouse = Sensor:new{ x = 400, y = 400, width = 400, height = 200, fill = { 255, 0, 255 } }
		self:add(self.rightMouse)

		self.extraLabel = Text:new
		{
			x = 10, y = 10, width = 200
		}
		self:add(self.extraLabel)

		self:add(Text:new
		{
			x = 10, y = 540, width = 650, font = 14,
			text = 'The bars above indicate the state of the space bar. Red means it\'s released, ' ..
				   'green means it was just pressed, blue means it is currently pressed, and yellow ' ..
				   'means that it has just been released. Click the left and right mouse buttons to ' ..
				   'see the other two indicators light up.'
		})
	end,

	onUpdate = function (self)
		if the.keys:released(' ') then self.released.alpha = 1 end
		if the.keys:justPressed(' ') then self.justPressed.alpha = 1 end
		if the.keys:pressed(' ') then self.pressed.alpha = 1 end
		if the.keys:justReleased(' ') then self.justReleased.alpha = 1 end
		if the.mouse:pressed('l') then self.leftMouse.alpha = 1 end
		if the.mouse:pressed('r') then self.rightMouse.alpha = 1 end 

		local keys = { the.keys:allPressed() }
		self.extraLabel.text = 'Mouse position: ' .. the.mouse.x .. ', ' .. the.mouse.y .. '\n' ..
							   #keys .. ' keys pressed simultaneously'
	end
}
