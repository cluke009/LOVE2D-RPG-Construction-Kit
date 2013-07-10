--[[
    Class: Dialog
    Display dialog boxes.

    Properties:
        dialog - A table of text to display.
        text - change text properties
        fill - change bg properties

    Extends:
         <Subview>

    Example code:
        (begin code)
        local text = {'some text', 'some more text'}
        local dialog = Dialog:new{dialog = text}
        dialog:activate()
        (end code)
--]]
Dialog = Subview:new{
    dialog = {},
    count = 1,
    text = Text:new{
        x = 20,
        y = 190,
        width = 440,
        tint = { 0, 0, 0 },
        font = {'assets/font/PressStart2P.ttf', 16},
        text = ''
    },
    fill = Fill:new{
        x = 10,
        y = 180,
        width = 460,
        height = 80,
        fill = { 255, 255, 255, 200 }
    },
    onActivate = function(self)
        -- Add sprites
        self:add(self.fill)
        self:add(self.text)
    end,
    onDeactivate = function(self)
    end,
    onNew = function(self)
    end,
    onUpdate = function(self)
        if self.count == 1 then
            self.text.text = self.dialog[1]
        end
        if the.keys:justPressed('return') then
            if #self.dialog > self.count then
                self.text.text = self.dialog[self.count + 1]
                self.count = self.count + 1
            else
                self:deactivate()
            end
        end
    end
}
