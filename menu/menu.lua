local Menu = Group:extend{
    items = {},
    selected = 1,
    active = true,
    highlight = function(self)
        self.h.y = self.y + 10 + (self.selected - 1) * self.step
        if self.items[self.selected].hover then
            self.items[self.selected]:hover()
        end
    end,
    onNew = function(self)
        self.h = Fill:new{
            x = self.x,
            y = self.y + 10,
            width = self.width,
            height = self.step,
            fill = { 0, 255, 255, 100 }
        }
        self:add(self.h)
        for i, value in ipairs(self.items) do
            self['text' .. i] = Text:new{
                x = self.x + 10,
                y = self.y + 10 + (i - 1) * self.step,
                width = self.width - 20,
                tint = { 0, 0, 0 },
                font = 24,
                text = self.items[i]['name']
            }
            self:add(self['text' .. i])
        end
        self:highlight()
    end,
    onUpdate = function(self)
        if self.active == true then
            if the.keys:justPressed('up') then
                if self.selected > 1 then
                    self.selected = self.selected - 1
                else
                    self.selected = #self.items
                end
                self:highlight()
            elseif the.keys:justPressed('down') then
                if self.selected < #self.items then
                    self.selected = self.selected + 1
                else
                    self.selected = 1
                end
                self:highlight()
            elseif the.keys:justPressed('return') then
                if self.items[self.selected].action then
                    self.items[self.selected]:action()
                end
            end
        end
    end
}
return Menu
