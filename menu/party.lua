local Party = Group:extend{
    text = 'test',
    ready = true,
    onNew = function (self)
        local i = 1
        for k, hero in pairs(STATE.heroes) do
            if hero['active'] then
                self['image' .. i] = Tile:new{
                    x = 0 + 370,
                    y = 0 + 40 + (i - 1) * 100,
                    width = 32,
                    height = 32,
                    image = hero.image
                }
                self['name' .. i] = Text:new{
                    x = 32 + 370,
                    y = 0 + 40 + (i - 1) * 100,
                    width = 100,
                    tint = { 0, 0, 0 },
                    font = 24,
                    text = hero.name
                }
                self['level' .. i] = Text:new{
                    x = 150 + 370,
                    y = 0 + 40 + (i - 1) * 100,
                    width = 100,
                    tint = { 0, 0, 0 },
                    font = 24,
                    text = ''
                }
                self['hp' .. i] = Text:new{
                    x = 32 + 370,
                    y = 32 + 40 + (i - 1) * 100,
                    width = 100,
                    tint = { 0, 0, 0 },
                    font = 24,
                    text = ''
                }
                self['mp' .. i] = Text:new{
                    x = 150 + 370,
                    y = 32 + 40 + (i - 1) * 100,
                    width = 100,
                    tint = { 0, 0, 0 },
                    font = 24,
                    text = ''
                }
                self['exp' .. i] = Text:new{
                    x = 268 + 370,
                    y = 32 + 40 + (i - 1) * 100,
                    width = 100,
                    tint = { 0, 0, 0 },
                    font = 24,
                    text = ''
                }
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
                    self['level' .. i].text = 'Level ' .. hero.stats.level
                    self['hp' .. i].text = 'HP ' .. hero.stats.hp .. '/' .. hero.stats.hpmax
                    self['mp' .. i].text = 'MP ' .. hero.stats.mp .. '/' .. hero.stats.mpmax
                    self['exp' .. i].text = 'EXP ' .. hero.stats.exp .. '/' .. hero.stats.expmax
                end
            end
            self.ready = false
        end
    end,
}
return Party
