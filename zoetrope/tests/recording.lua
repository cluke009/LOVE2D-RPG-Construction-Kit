require 'zoetrope'
io.stdout:setvbuf("no")
function table_print(tt, indent, done)
    done = done or {}
    indent = indent or 0
    if type(tt) == "table" then
        for key, value in pairs (tt) do
            io.write(string.rep (" ", indent)) -- indent it
            if type (value) == "table" and not done [value] then
                done [value] = true
                io.write(string.format("[%s] => table\n", tostring (key)));
                io.write(string.rep (" ", indent+4)) -- indent it
                io.write("(\n");
                table_print(value, indent + 7, done)
                io.write(string.rep (" ", indent+4)) -- indent it
                io.write(")\n");
            else
                io.write(string.format("[%s] => %s\n",
                tostring (key), tostring(value)))
            end
        end
    else
        io.write(tt .. "\n")
    end
end

Recording = TestApp:extend
{
	onNew = function (self)
		self.recorder = Recorder:new()
		self.meta:add(self.recorder)

		local cursor = Cursor:new()
		cursor:add(Fill:new{ width = 8, height = 8, fill = { 255, 0, 0 } })
		self:useSysCursor(false)

		self.player = Fill:new{ x = 100, y = 100, width = 16, height = 16, fill = { 255, 255, 255 } }

		self.recLabel = Text:new { x = 750, y = 10, tint = { 1, 0, 0 }, text = 'REC', visible = false } 
		self.view.tween:start(self.recLabel, 'alpha', 0, 0.25):andThen(Tween.reverseForever)

		self:add(self.player)
		self:add(cursor)
		self:add(self.recLabel)

		self:add(Text:new
		{
			x = 10, y = 510, width = 600, font = 14,
			text = 'Zoetrope can record and play back user input, for testing purposes or ' ..
				   'so that users can share replays. The R key begins recording and stops it. ' ..
				   'Try turning on recording, then moving the square with the arrow keys or ' ..
				   'adding more sprites by clicking the mouse. Hit R again when you\'re done, ' ..
				   'then P to play it back.'
		})
	end,

	onUpdate = function (self, elapsed)
		-- recorder

		if the.keys:justPressed('r') then
			if self.recorder.state == Recorder.IDLE then
				print('Recording started')
				self.recorder:startRecording()
				self.recLabel.visible = true
			elseif self.recorder.state == Recorder.RECORDING then
				self.recorder:stopRecording()
				print('Recording stopped, ' .. #self.recorder.record .. ' events recorded')
				self.recLabel.visible = false
			end
		end

		if the.keys:justPressed('p') then
			table_print(self.recorder.record)
			self.player.x = 100
			self.player.y = 100
			self.recorder:startPlaying()
			print('Playing back recording')
		end

		-- keyboard events

		self.player.velocity.x = 0
		self.player.velocity.y = 0

		if the.keys:pressed('up') then
			self.player.velocity.y = -100
		elseif the.keys:pressed('down') then
			self.player.velocity.y = 100
		elseif the.keys:pressed('left') then
			self.player.velocity.x = -100
		elseif the.keys:pressed('right') then
			self.player.velocity.x = 100
		end

		-- mouse events

		if the.mouse:justPressed() then
			self:add(Fill:new{ x = the.mouse.x - 8, y = the.mouse.y - 8, width = 16, height = 16,
								velocity = { x = 0, y = 200, rotation = math.pi } })
		end
	end
}
