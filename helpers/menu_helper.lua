local MenuHelper = Group:extend{
    items = {},
    selected = 1,
    active = true,
    highlight = function(self)
        self.h.y = self.y  + (self.selected - 1) * self.step
        if self.items[self.selected].hover then
            self.items[self.selected]:hover()
        end
    end,
    onNew = function(self)
        self.h = Tile:new{
            x = self.x - 14,        width = 22,
            y = self.y - 5,   height = 23,
            image = 'assets/img/arrow.png'
        }
        self:add(self.h)
        for i, value in ipairs(self.items) do
            self['textShadow' .. i] = Text:new{
                x = self.x + 12,
                y = self.y + 12 + (i - 1) * self.step,
                width = self.width - 20,
                tint = { 0, 0, 0 },
                font = STATE.font,
                text = self.items[i]['name']
            }
            self['text' .. i] = Text:new{
                x = self.x + 10,
                y = self.y + 10 + (i - 1) * self.step,
                width = self.width - 20,
                tint = { 1, 1, 1 },
                font = STATE.font,
                text = self.items[i]['name']
            }
            self:add(self['textShadow' .. i])
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
return MenuHelper
