require 'zoetrope'

TestApp = App:extend
{
	update = function (self, elapsed)
		if the.keys:pressed('escape') then
			the.app = Menu:new()
			the.app:run()
		end
		App.update(self, elapsed)

	end
}

require 'tests.collisionbenchmark'
require 'tests.collisions'
require 'tests.debugging'
require 'tests.emitters'
require 'tests.effects'
require 'tests.reuse'
require 'tests.files'
require 'tests.gamepad'
require 'tests.input'
require 'tests.maps'
require 'tests.recording'
require 'tests.scrolling'
require 'tests.sounds'
require 'tests.spritebenchmark'
require 'tests.spritetypes'
require 'tests.subview'
require 'tests.tiled'
require 'tests.timers'
require 'tests.tweens'
require 'tests.ui'
