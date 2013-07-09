--[[
    Class: Dialog
    Display dialog boxes.

    Properties:
         text - A table of text to display.

    Extends:
         <Subview>

    Example code:
        (begin code)
        local text = {'some text', 'some more text'}
        local dialog = Dialog:new{text = text}
        dialog:activate()
        (end code)
--]]

Dialog = Subview:new{
    text = {},
    count = 1,
    onNew = function(self)
    -- Create sprites
        self.f = Fill:new{
            x = 10,
            y = 440,
            width = 780,
            height = 150,
            fill = { 255, 255, 255, 200 }
        }
        self.t = Text:new{
            x = 20,
            y = 450,
            width = 760,
            tint = { 0, 0, 0 },
            font = 24,
            text = self.text[1]
        }
        self:add(self.f)
        self:add(self.t)
    end,
    onActivate = function(self)
    end,
    onDeactivate = function(self)
    end,
    onUpdate = function(self)
        if the.keys:justPressed('return') then
            if #self.text > self.count then
                -- Destroy sprites
                self.f:die()
                self.t:die()

                -- Recreate sprites
                self.t = Text:new{
                    x = 20,
                    y = 450,
                    width = 760,
                    tint = { 0, 0, 0 },
                    font = 24,
                    text = self.text[self.count + 1]
                }
                self:add(self.f)
                self:add(self.t)

                -- Update counter
                self.count = self.count + 1
            else
                self:deactivate()
            end
        end
    end
}
