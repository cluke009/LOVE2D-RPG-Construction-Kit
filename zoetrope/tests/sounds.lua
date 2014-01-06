require 'zoetrope'

Sounds = TestApp:extend
{
	onNew = function (self)
		self.timer = Timer:new()
		self:add(self.timer)
		self.testSound = sound('tests/assets/tone.mp3')
		self.testSound:play(1)
		self.testSound:setVolume(0.25)
		
		self.signal = Fill:new{ x = 100, y = 100, width = 100, height = 100, fill = { 0, 0, 255 } }
		self:add(self.signal)

		self.timer:after(1, bind(self.testSound, 'play'))

		self:add(Text:new
		{
			x = 10, y = 550, width = 550, font = 14,
			text = 'Zoetrope has simple functions to play sound that re-use sound assets to avoid ' ..
				   'wasting memory. Press the space bar to play a beep.'
		})
	end,

	onUpdate = function (self, elapsed)
		if the.keys:justPressed(' ') then
			playSound('tests/assets/beep.mp3')
		end

		self.signal.visible = not self.testSound:isStopped()
	end
}
