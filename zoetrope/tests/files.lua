require 'zoetrope'

Files = TestApp:extend
{
	onNew = function (self)
		self.storage = Storage:new()
		self.storage.data = { red = 'yes', green = true, blue = 1 }
		self.storage:save()

		self.label = Text:new{ x = 4, y =4, width = the.app.width, height = the.app.height }
		self.label.text = 'Saved to storage.dat:\n' .. dump(self.storage.data)
		self:add(self.label)

		self.countStorage = Storage:new{ filename = 'count.dat' }
		self.countStorage:load()

		if not self.countStorage.data.count then
			self.countStorage.data.count = 0
		end

		self.countStorage.data.count = self.countStorage.data.count + 1
		self.countStorage:save()

		self:add(Text:new
		{
			x = 10, y = 520, width = 550, font = 14,
			text = 'Zoetrope can serialize structured data into text files, to save high scores ' ..
				   ' and player preferences.\n\n... By the way, you\'ve  run this test ' ..
				   self.countStorage.data.count .. ' times.'
		})
	end
}
