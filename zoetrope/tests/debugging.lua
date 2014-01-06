require 'zoetrope'

Debugging = TestApp:extend
{
	onRun = function (self)
		the.block = Fill:new { x = 300, y = 200, width = 200, height = 200, fill = {255, 255, 255 } }
		the.console:watch('the.block.x', 'the.block.x')
		the.console:watch('the.block.y', 'the.block.y')
		self:add(the.block)

		self:add(Text:new
		{
			x = 10, y = 500, width = 650, font = 14,
			text = 'Press the tab key to bring up the debug console, which displays recently printed ' ..
				   'text. You can enter any Lua statement -- the.block.width = 50, for example -- and ' ..
				   'also watch values. Try entering the.console:watch("mouse x", "the.mouse.x"). ' ..
				   'The console supports command history with the up and down arrow keys, and will ' ..
				   'activate if your app crashes (hit Ctrl-D to try this out). You can also force ' ..
				   'LOVE to reload your code from on disk and restart your app by pressing ' ..
				   'Ctrl-Alt-R (Ctrl-Option-R on a Mac). You can also add your own debugging hotkeys.'
		})
	end,

	onUpdate = function (self)
		if the.keys:justPressed('d') and the.keys:pressed('ctrl') then
			error('testing error handler')
		end
	end
}
