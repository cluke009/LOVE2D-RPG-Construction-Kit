--
-- Method: scene
-- Triggers cutscene from Tiled. Replaces "the.app.view" with scene.
--
-- Arguments:
--      scene - Filename of scene to load.
--
-- Require:
-- - 'assets.cutscenes.' .. scene
--
local Cutscene = function(self, cutscene, anim)
    local scene = require('assets.cutscenes.' .. cutscene)
    local myView = View:extend {
        count = 1,
        dcount = 1,
        onNew = function(self)
            self.fill = Fill:new{
                x = 10,
                y = 440,
                width = 780,
                height = 150,
                fill = { 255, 255, 255, 200 }
            }
            self.img = Tile:new{
                image = scene[1]['image'],
            }
            self.text = Text:new{
                x = 20,
                y = 450,
                width = 760,
                tint = { 0, 0, 0 },
                font = STATE.font,
                text = scene[1]['dialog'][1]
            }
            self:add(self.img)
            if anim ~= 'true' then
                self:add(self.fill)
                self:add(self.text)
            end
        end,
        onUpdate = function(self)
            if anim == 'true' then
                self.dcount = self.dcount + 1

                if self.dcount > 40 then
                    self.count = self.count + 1
                    self.dcount = 1

                    if #scene >= self.count then
                        self.img:die()

                        self.img = Tile:new{
                            image = scene[self.count]['image']
                        }

                        self:add(self.img)
                    end
                end
                if #scene < self.count then
                    the.app.view = MapView:new()
                    if the.app.view.foreground then
                        the.app.view:moveToFront(the.app.view.foreground)
                    end
                end
            else
                if the.keys:justPressed('return') then

                    self.dcount = self.dcount + 1

                    if #scene[self.count]['dialog'] < self.dcount then
                        self.count = self.count + 1
                        self.dcount = 1

                        if #scene >= self.count then
                            self.img:die()
                            self.fill:die()

                            self.img = Tile:new{
                                image = scene[self.count]['image']
                            }
                            self.fill = Fill:new{
                                x = 10,
                                y = 440,
                                width = 780,
                                height = 150,
                                fill = { 255, 255, 255, 200 }
                            }

                            self:add(self.img)
                            self:add(self.fill)
                        end
                    end
                    self.text:die()
                    if #scene >= self.count then
                        self.text = Text:new{
                            x = 20,
                            y = 450,
                            width = 760,
                            tint = { 0, 0, 0 },
                            font = STATE.font,
                            text = scene[self.count]['dialog'][self.dcount]
                        }
                        self:add(self.text)
                    end

                elseif #scene < self.count then
                    the.app.view = MapView:new()
                    if the.app.view.foreground then
                        the.app.view:moveToFront(the.app.view.foreground)
                    end
                end
            end

        end
    }
    the.app.view = myView:new()
end

return Cutscene