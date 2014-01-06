require 'zoetrope'

Tweens = TestApp:extend
{
	onRun = function (self)
		local y = 250
		
		for easer, _ in pairs(Tween.easers) do
			local block = Fill:new{ x = 200, y = y, width = 25, height = 25 }
			self:add(block)
			self.view.tween:start(block, 'x', 275, 1, easer):andThen(Tween.reverseForever)
			y = y + 25
		end
		
		local alphaBlock = Fill:new{ x = 350, y = 250, width = 100, height = 100 }
		self:add(alphaBlock)
		
		local colorBlock = Fill:new{ x = 500, y = 250, width = 100, height = 100,
									  fill = { 255, 0, 0 } }
		self:add(colorBlock)
		self.view.tween:start(colorBlock, 'fill', { 0, 0, 255 }):andThen(Tween.reverseForever)

		self:add(Text:new
		{
			x = 10, y = 550, width = 700, font = 14,
			text = 'Any numeric property -- horizontal position and alpha in the first two ' ..
				   'examples -- can be smoothly tweened between two values. Zoetrope can also ' ..
				   'tween tables of numbers, i.e. colors.'
		})
	end
}
