require 'zoetrope'

UI = TestApp:extend
{
	name = 'UI Test',

	onRun = function (self)
		local cursor = Cursor:new()
		cursor:add(Tile:new{ image = 'tests/assets/bluegem.png', scale = 1.5,
							 velocity = { x = 0, y = 0, rotation = math.pi } })
		cursor.hotspot.x = 12
		cursor.hotspot.y = 12

		local button = Button:new{ x = 250, y = 200, width = 300, height = 100 }
		button.background = Fill:new{ width = 300, height = 100,
									  fill = {25, 25, 25}, border = {255, 255, 255} }
		button.label = Text:new{ text = 'Hello', font = 72, width = 100, align = 'center' }
		button.label:centerAround(button.background.width / 2, button.background.height / 2)

		button.onMouseEnter = function (self)
			self.background.fill = { 255, 0, 0 }
		end

		button.onMouseExit = function (self)
			self.background.fill = {50, 50, 50}
		end

		button.onMouseUp = function (self)
			self.x = math.random(0, the.app.width - self.width - 300)
			self.y = math.random(0, the.app.height - self.height - 300)
		end

		local input = TextInput:new{ x = 250, y = 350, width = 300, height = 24, font = 72 }

		self.meta:add(DebugConsole:new())
		the.console:watch('mouse clicked', 'the.mouse._thisFrame.l == true')

		self:add(input)
		self:add(button)
		self:add(cursor)

		self:add(Text:new
		{
			x = 10, y = 550, width = 600, font = 14,
			text = 'Zoetrope has basic classes for buttons, text inputs, and mouse cursors. ' ..
				   'They\'re as bare-bones as possible so that you can theme them for an app.'
		})

		self:useSysCursor(false)
	end
}
