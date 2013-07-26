local Party = Group:extend{
    text = 'test',
    ready = true,
    onNew = function (self)
        local i = 1
        for k, hero in pairs(STATE.heroes) do
            if hero['active'] then
                self['image' .. i] = Tile:new{
                    x = 0 + 340,
                    y = 0 + 40 + (i - 1) * 100,
                    width = hero.img.width,
                    height = hero.img.height,
                    image = hero.img.down.image,
                    imageOffset = {x=0,y=196}
                }
                self['name' .. i] = Text:new{
                    x = 32 + 370,
                    y = 0 + 40 + (i - 1) * 100,
                    width = 100,
                    tint = { 1, 1, 1 },
                    font = STATE.font,
                    text = hero.name
                }
                self['level' .. i] = Text:new{
                    x = 170 + 370,
                    y = 0 + 40 + (i - 1) * 100,
                    width = 300,
                    tint = { 1, 1, 1 },
                    font = STATE.font,
                    text = ''
                }
                self['hp' .. i] = Text:new{
                    x = 32 + 370,
                    y = 32 + 40 + (i - 1) * 100,
                    width = 100,
                    tint = { 1, 1, 1 },
                    font = STATE.font,
                    text = ''
                }
                self['mp' .. i] = Text:new{
                    x = 150 + 370,
                    y = 32 + 40 + (i - 1) * 100,
                    width = 100,
                    tint = { 1, 1, 1 },
                    font = STATE.font,
                    text = ''
                }
                self['exp' .. i] = Text:new{
                    x = 268 + 370,
                    y = 32 + 40 + (i - 1) * 100,
                    width = 100,
                    tint = { 1, 1, 1 },
                    font = STATE.font,
                    text = ''
                }
                self['nameShadow' .. i] = Text:new{
                    x = 32 + 372,
                    y = 0 + 42 + (i - 1) * 100,
                    width = 100,
                    tint = { 0, 0, 0 },
                    font = STATE.font,
                    text = hero.name
                }
                self['levelShadow' .. i] = Text:new{
                    x = 170 + 372,
                    y = 0 + 42 + (i - 1) * 100,
                    width = 300,
                    tint = { 0, 0, 0 },
                    font = STATE.font,
                    text = ''
                }
                self['hpShadow' .. i] = Text:new{
                    x = 32 + 372,
                    y = 32 + 42 + (i - 1) * 100,
                    width = 100,
                    tint = { 0, 0, 0 },
                    font = STATE.font,
                    text = ''
                }
                self['mpShadow' .. i] = Text:new{
                    x = 150 + 372,
                    y = 32 + 42 + (i - 1) * 100,
                    width = 100,
                    tint = { 0, 0, 0 },
                    font = STATE.font,
                    text = ''
                }
                self['expShadow' .. i] = Text:new{
                    x = 268 + 372,
                    y = 32 + 42 + (i - 1) * 100,
                    width = 100,
                    tint = { 0, 0, 0 },
                    font = STATE.font,
                    text = ''
                }
                self:add(self['nameShadow' .. i])
                self:add(self['levelShadow' .. i])
                self:add(self['hpShadow' .. i])
                self:add(self['mpShadow' .. i])
                self:add(self['expShadow' .. i])

                self:add(self['image' .. i])
                self:add(self['name' .. i])
                self:add(self['level' .. i])
                self:add(self['hp' .. i])
                self:add(self['mp' .. i])
                self:add(self['exp' .. i])
                i = i + 1
            end
        end
    end,
    onUpdate = function(self)
        if self.ready then
            local i = 1
            for k, hero in pairs(STATE.heroes) do
                if hero['active'] then
                    self['levelShadow' .. i].text = 'Level ' .. hero.stats.level
                    self['hpShadow' .. i].text = 'HP ' .. hero.stats.hp .. '/' .. hero.stats.hpmax
                    self['mpShadow' .. i].text = 'MP ' .. hero.stats.mp .. '/' .. hero.stats.mpmax
                    self['expShadow' .. i].text = 'EXP ' .. hero.stats.exp .. '/' .. hero.stats.expmax

                    self['level' .. i].text = 'Level ' .. hero.stats.level
                    self['hp' .. i].text = 'HP ' .. hero.stats.hp .. '/' .. hero.stats.hpmax
                    self['mp' .. i].text = 'MP ' .. hero.stats.mp .. '/' .. hero.stats.mpmax
                    self['exp' .. i].text = 'EXP ' .. hero.stats.exp .. '/' .. hero.stats.expmax
                end
                i = i + 1
            end
            self.ready = false
        end
    end,
}
return Party
