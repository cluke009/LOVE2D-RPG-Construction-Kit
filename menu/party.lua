local Party = Group:extend{
    text = 'test',
    ready = true,
    onUpdate = function(self)

        if self.ready == true then
            print('ready')
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
                        text = 'Level ' .. hero.stats.level
                    }
                    self['hp' .. i] = Text:new{
                        x = 32 + 370,
                        y = 32 + 40 + (i - 1) * 100,
                        width = 100,
                        tint = { 0, 0, 0 },
                        font = 24,
                        text = 'HP ' .. hero.stats.hp .. '/' .. hero.stats.hpmax
                    }
                    self['mp' .. i] = Text:new{
                        x = 150 + 370,
                        y = 32 + 40 + (i - 1) * 100,
                        width = 100,
                        tint = { 0, 0, 0 },
                        font = 24,
                        text = 'MP ' .. hero.stats.mp .. '/' .. hero.stats.mpmax
                    }
                    self['exp' .. i] = Text:new{
                        x = 268 + 370,
                        y = 32 + 40 + (i - 1) * 100,
                        width = 100,
                        tint = { 0, 0, 0 },
                        font = 24,
                        text = 'EXP ' .. hero.stats.exp .. '/' .. hero.stats.expmax
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

            self.ready = false
        end


        if STATE.menu.update == true then
            print('update')
            local i = 1
            for k, hero in pairs(STATE.heroes) do
                if hero['active'] then
                    self:remove(self['image' .. i])
                    self:remove(self['name' .. i])
                    self:remove(self['level' .. i])
                    self:remove(self['hp' .. i])
                    self:remove(self['mp' .. i])
                    self:remove(self['exp' .. i])
                    i = i + 1
                end
            end

            self.ready = true
        end
    end,
}
return Party
