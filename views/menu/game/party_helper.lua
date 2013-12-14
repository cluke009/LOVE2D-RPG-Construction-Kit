local Asset = require 'helpers.asset_helper'
local Party = Group:extend{
    text = 'test',
    ready = true,
    stats = Group:new{
        str = {'', {1,1,1}},
        int = {'', {1,1,1}},
        wis = {'', {1,1,1}},
        con = {'', {1,1,1}},
        spd = {'', {1,1,1}},
        onNew = function (self)
            self['attack'] = Text:new{
                x = 220,
                y = 170,
                width = 200,
                tint = { 1, 1, 1 },
                font = {STATE.conf.font[1], 19},
                text = ''
            }
            self['magic'] = Text:new{
                x = 220,
                y = 190,
                width = 200,
                tint = { 1, 1, 1 },
                font = {STATE.conf.font[1], 19},
                text = ''
            }
            self['speed'] = Text:new{
                x = 220,
                y = 210,
                width = 200,
                tint = { 1, 1, 1 },
                font = STATE.conf.font,
                text = ''
            }
            self['defense'] = Text:new{
                x = 400,
                y = 170,
                width = 200,
                tint = { 1, 1, 1 },
                font = STATE.conf.font,
                text = ''
            }
            self['magic_defense'] = Text:new{
                x = 400,
                y = 190,
                width = 200,
                tint = { 1, 1, 1 },
                font = STATE.conf.font,
                text = ''
            }

            self['new_attack'] = Text:new{
                x = 330,
                y = 170,
                width = 200,
                tint = { 1, 1, 1 },
                font = {STATE.conf.font[1], 19},
                text = ''
            }
            self['new_magic'] = Text:new{
                x = 330,
                y = 190,
                width = 200,
                tint = { 1, 1, 1 },
                font = {STATE.conf.font[1], 19},
                text = ''
            }
            self['new_speed'] = Text:new{
                x = 330,
                y = 210,
                width = 200,
                tint = { 1, 1, 1 },
                font = STATE.conf.font,
                text = ''
            }
            self['new_defense'] = Text:new{
                x = 560,
                y = 170,
                width = 200,
                tint = { 1, 1, 1 },
                font = STATE.conf.font,
                text = ''
            }
            self['new_magic_defense'] = Text:new{
                x = 560,
                y = 190,
                width = 200,
                tint = { 1, 1, 1 },
                font = STATE.conf.font,
                text = ''
            }
            self:add(self['attack'])
            self:add(self['magic'])
            self:add(self['speed'])
            self:add(self['defense'])
            self:add(self['magic_defense'])

            self:add(self['new_attack'])
            self:add(self['new_magic'])
            self:add(self['new_speed'])
            self:add(self['new_defense'])
            self:add(self['new_magic_defense'])
        end,
        onUpdate = function (self )
           self['attack'].text        = 'ATTACK... ' .. STATE.heroes[self.id].stats.str
           self['magic'].text         = 'MAGIC.... ' .. STATE.heroes[self.id].stats.int
           self['speed'].text         = 'SPEED.... ' .. STATE.heroes[self.id].stats.spd
           self['defense'].text       = 'DEFENSE........ ' .. STATE.heroes[self.id].stats.con
           self['magic_defense'].text = 'MAGIC DEFENSE.. ' .. STATE.heroes[self.id].stats.wis

           self['new_attack'].text        = self.str[1]
           self['new_magic'].text         = self.int[1]
           self['new_speed'].text         = self.spd[1]
           self['new_defense'].text       = self.con[1]
           self['new_magic_defense'].text = self.wis[1]

           self['new_attack'].tint        = self.str[2]
           self['new_magic'].tint         = self.int[2]
           self['new_speed'].tint         = self.spd[2]
           self['new_defense'].tint       = self.con[2]
           self['new_magic_defense'].tint = self.wis[2]
        end,
    },
    onNew = function (self)
        local i = 1
        for k, hero in pairs(STATE.heroes) do
            self['group' .. i] = Group:new{
                onNew = function (self)
                    self['image'] = Tile:new{
                        x = 182,
                        y = 10 + (i - 1) * 120,
                        width = 100,
                        height = 100,
                    }
                    self['name'] = Text:new{
                        x = 320,
                        y = 15 + (i - 1) * 120,
                        width = 200,
                        tint = { 1, 1, 1 },
                        font = {STATE.conf.font[1], 19},
                        text = ''
                    }
                    self['level'] = Text:new{
                        x = 520,
                        y = 15 + (i - 1) * 120,
                        width = 200,
                        tint = { 1, 1, 1 },
                        font = {STATE.conf.font[1], 19},
                        text = ''
                    }
                    self['hp'] = Text:new{
                        x = 320,
                        y = 45 + (i - 1) * 120,
                        width = 100,
                        tint = { 1, 1, 1 },
                        font = STATE.conf.font,
                        text = ''
                    }
                    self['mp'] = Text:new{
                        x = 320,
                        y = 65 + (i - 1) * 120,
                        width = 100,
                        tint = { 1, 1, 1 },
                        font = STATE.conf.font,
                        text = ''
                    }
                    self['exp'] = Text:new{
                        x = 320,
                        y = 85 + (i - 1) * 120,
                        width = 100,
                        tint = { 1, 1, 1 },
                        font = STATE.conf.font,
                        text = ''
                    }
                    self['Weapon'] = Text:new{
                        x = 435,
                        y = 45 + (i - 1) * 120,
                        width = 300,
                        tint = { 1, 1, 1 },
                        font = STATE.conf.font,
                        text = ''
                    }
                    self['Armor'] = Text:new{
                        x = 435,
                        y = 65 + (i - 1) * 120,
                        width = 300,
                        tint = { 1, 1, 1 },
                        font = STATE.conf.font,
                        text = ''
                    }
                    self['Accessory'] = Text:new{
                        x = 435,
                        y = 85 + (i - 1) * 120,
                        width = 300,
                        tint = { 1, 1, 1 },
                        font = STATE.conf.font,
                        text = ''
                    }

                    self:add(self['image'])
                    self:add(self['name'])
                    self:add(self['level'])
                    self:add(self['hp'])
                    self:add(self['mp'])
                    self:add(self['exp'])
                    self:add(self['Weapon'])
                    self:add(self['Armor'])
                    self:add(self['Accessory'])
                end
            }

            -- self['nameShadow' .. i] = Text:new{
            --     x = 32 + 372,
            --     y = 0 + 42 + (i - 1) * 100,
            --     width = 100,
            --     tint = { 0, 0, 0 },
            --     font = STATE.conf.font,
            --     text = ''
            -- }
            -- self['levelShadow' .. i] = Text:new{
            --     x = 170 + 372,
            --     y = 0 + 42 + (i - 1) * 100,
            --     width = 300,
            --     tint = { 0, 0, 0 },
            --     font = STATE.conf.font,
            --     text = ''
            -- }
            -- self['hpShadow' .. i] = Text:new{
            --     x = 32 + 372,
            --     y = 32 + 42 + (i - 1) * 100,
            --     width = 100,
            --     tint = { 0, 0, 0 },
            --     font = STATE.conf.font,
            --     text = ''
            -- }
            -- self['mpShadow' .. i] = Text:new{
            --     x = 150 + 372,
            --     y = 32 + 42 + (i - 1) * 100,
            --     width = 100,
            --     tint = { 0, 0, 0 },
            --     font = STATE.conf.font,
            --     text = ''
            -- }
            -- self['expShadow' .. i] = Text:new{
            --     x = 268 + 372,
            --     y = 32 + 42 + (i - 1) * 100,
            --     width = 100,
            --     tint = { 0, 0, 0 },
            --     font = STATE.conf.font,
            --     text = ''
            -- }
            -- self:add(self['nameShadow' .. i])
            -- self:add(self['levelShadow' .. i])
            -- self:add(self['hpShadow' .. i])
            -- self:add(self['mpShadow' .. i])
            -- self:add(self['expShadow' .. i])

            self:add(self['group' .. i])
            i = i + 1
        end
    end,
    onUpdate = function(self)
        -- if self.ready then
            local p = 1
            for k, hero in pairs(STATE.heroes) do
                if hero['active'] then
 
                    local Armor, Weapon, Accessory = '', '', ''
                    if hero.equip.Armor then Armor = Asset:get('equipment', hero.equip.Armor, 'name') end
                    if hero.equip.Weapon then Weapon = Asset:get('equipment', hero.equip.Weapon, 'name') end
                    if hero.equip.Accessory then Accessory = Asset:get('equipment', hero.equip.Accessory, 'name') end
                    self['group' .. k]['image'].image       = Asset:get('heroes', k, 'portraits')[1]
                    self['group' .. k]['name'].text         = Asset:get('heroes', k, 'name')
                    self['group' .. k]['level'].text        = 'Level ' .. hero.stats.level
                    self['group' .. k]['hp'].text           = 'HP: ' .. hero.stats.hp .. '/' .. hero.stats.hpmax
                    self['group' .. k]['mp'].text           = 'MP: ' .. hero.stats.mp .. '/' .. hero.stats.mpmax
                    self['group' .. k]['exp'].text          = 'XP: ' .. hero.stats.exp .. '/' .. hero.stats.expmax
                    self['group' .. k]['Armor'].text        = 'Armor:     ' .. Armor
                    self['group' .. k]['Weapon'].text       = 'Weapon:    ' .. Weapon
                    self['group' .. k]['Accessory'].text    = 'Accessory: ' .. Accessory
                    -- self['image' .. p].image = Asset:get('heroes', k, 'portraits')[1]
                    -- self['name' .. p].text = Asset:get('heroes', k, 'name')
                    -- self['nameShadow' .. p].text = Asset:get('heroes', k, 'name')
                    -- self['levelShadow' .. p].text = 'Level ' .. hero.stats.level
                    -- self['hpShadow' .. p].text = 'HP ' .. hero.stats.hp .. '/' .. hero.stats.hpmax
                    -- self['mpShadow' .. p].text = 'MP ' .. hero.stats.mp .. '/' .. hero.stats.mpmax
                    -- self['expShadow' .. p].text = 'EXP ' .. hero.stats.exp .. '/' .. hero.stats.expmax

                    -- self['level' .. p].text = 'Level ' .. hero.stats.level
                    -- self['hp' .. p].text = 'HP ' .. hero.stats.hp .. '/' .. hero.stats.hpmax
                    -- self['mp' .. p].text = 'MP ' .. hero.stats.mp .. '/' .. hero.stats.mpmax
                    -- self['exp' .. p].text = 'EXP ' .. hero.stats.exp .. '/' .. hero.stats.expmax
                else
                    -- self['image' .. p].text = ''
                    -- self['name' .. p].text = ''
                    -- self['nameShadow' .. p].text = ''
                end
                p = p + 1
            end
            -- self.ready = false
        -- end
    end,
}
return Party
