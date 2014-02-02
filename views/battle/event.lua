local Narration = {x=320, y = 30, alx='m',alxb='m',wbox = 600, nrows=3}

local BattleEvent = {
    battletext = '',
    getext = function (self )
       return self.battletext
    end,
    getGroup = function(self)
        local enemyGroup = Battle.data.enemy
        self.enemyName = {}
        self.enemyChoice = {}
        for i,v in ipairs(enemyGroup) do
            if not v.dead then
                table.insert(self.enemyName, i .. ' ' .. v.name)
                table.insert(self.enemyChoice, i)
            end
        end
        table.insert(self.enemyName, 'back')
    end,
    getItems = function(self)
        local litems = STATE.inventory.items
        self.items = {}
        self.itemChoice = {}
        for k,v in pairs(litems) do
            table.insert(self.items, items[k].name ..'x'..v)  
            table.insert(self.itemChoice, k) 
        end
        -- table_print(self.items)
        table.insert(self.items, 'back')
    end,
    getHeroes = function(self)
        local litems = STATE.heroes
        self.heroes = {}
        self.heroesChoice = {}
        for k,v in pairs(litems) do
            if v.active then
                table.insert(self.heroes, v.name)  
                table.insert(self.heroesChoice, k) 
            end
        end
        -- table_print(self.items)
        table.insert(self.heroes, 'back')
    end,
    choices = {
        'Attack',
        'Skill',
        'Defend',
        'Item',
        'Run',
        'Skip',
    },
    getDialog = function(self)
        self.gold = Battle.data.gold
        self.exp = Battle.data.exp
        self.queue = Battle.data.queue
        self.turnKind = self.queue[1].kind
        self.turnKey = self.queue[1].key
        self:getGroup()
        self:getItems()
        self:getHeroes()
        return {
            [1] = {
                [1] = {
                    replay = true,
                    auto = true,
                    before = function()
                        -- body
                        local herokey = self.heroesChoice[self.turnKey]
                        if self['defend' .. herokey] then
                            STATE.heroes[herokey].stats.con = self['defend' .. herokey][1][1]
                            self['defend' .. herokey] = nil
                        end
                    end,
                    dialog = {
                        { '', {nvchs = 5, choices = self.choices, face_pos={x=0,y=0,z=true}, x=30, y=245, wbox=140, alxb='l', alyb='t', nrows=6 } }
                    },
                    after = function (choice)
                        if choice == 1 then
                            -- print('Attack')
                            Event:goto('battle', 1, 2)
                        elseif choice == 2 then
                            -- print('Skill')
                            -- Event:goto('inn', 1, 3)
                        elseif choice == 3 then
                            -- print('Defend')
                            local herokey = self.heroesChoice[self.turnKey]
                            self['defend' .. herokey] = {
                                {STATE.heroes[herokey].stats.con},
                                {math.ceil(STATE.heroes[herokey].stats.con * 1.1)}
                            }
                            STATE.heroes[herokey].stats.con = math.ceil(STATE.heroes[herokey].stats.con * 1.1)
                            Battle:queueUpdate()
                        elseif choice == 4 then
                            -- print('Item')
                            Event:goto('battle', 1, 5)
                        elseif choice == 5 then
                            local run = Battle:heroTurn('run')
                            if run then
                                BattleView:deactivate()
                            else
                                Battle:queueUpdate()
                            end
                        elseif choice == 6 then
                            Battle:queueUpdate()
                        end
                    end
                },
                [2] = {
                    replay = true,
                    auto = true,
                    before = function ()
                    end,
                    dialog = {
                        { '', {nvchs = #self.enemyName, choices = self.enemyName, face_pos={x=0,y=0,z=true}, x=30, y=245, wbox=140, alxb='l', alyb='t', nrows=6,} }
                    },
                    after = function (choice)
                        if choice == #self.enemyName then
                            Event:goto('battle',1,1)
                        else
                            local key = self.enemyChoice[choice]
                            local dmg,  str = Battle:heroTurn('attack', key)
                            Battle.text.text = Battle.text.text .. str..'\n'
                            local w,h = Battle.text:getSize()
                            if h > 110 then
                                Battle.text.text = Battle.text.text:gsub('.-\n', '',1)
                            end
                            Battle:queueUpdate()
                            Event:goto('battle',1,1)
                        end
                    end
                },
                [3] = {
                    replay = true,
                    auto = true,
                    before = function ()
                    end,
                    after = function (choice)
                    end
                },
                [4] = {
                    replay = true,
                    auto = true,
                    before = function ()
                    end,
                    after = function (choice)
                    end
                },
                [5] = {
                    replay = true,
                    auto = true,
                    dialog = {
                        { '', {nvchs = #self.items, choices = self.items, face_pos={x=0,y=0,z=true}, x=30, y=245, wbox=140, alxb='l', alyb='t', nrows=6,} }
                    },
                    before = function ()
                    end,
                    after = function (choice)
                        if choice == #self.items then
                            Event:goto('battle',1,1)
                        else
                            self.itemKey = self.itemChoice[choice]
                            Event:goto('battle',1,6)    
                        end
                    end
                },
                [6] = {
                    replay = true,
                    auto = true,
                    dialog = {
                        { '', {nvchs = #self.heroes, choices = self.heroes, face_pos={x=0,y=0,z=true}, x=30, y=245, wbox=140, alxb='l', alyb='t', nrows=6,} }
                    },
                    before = function ()
                    end,
                    after = function (choice)
                        if choice == #self.heroes then
                            Event:goto('battle',1,5)
                        else
                            local herokey = self.heroesChoice[choice]
                            Event:useItem(self.itemKey, herokey)
                            Battle:queueUpdate()
                            Event:goto('battle',1,1)    
                        end
                    end
                },
            },
            [2] = {
                [1] = {
                    replay = true,
                    auto = true,
                    before = function()
                        _, win = Battle:win()
                    end,
                    dialog = {
                        {'YOU WIN', Narration},
                        {'GOLD: ' .. self.gold, Narration},
                        {'EXPERIENCE: ' .. self.exp, Narration}
                    },
                    after = function()
                        Event:goto('battle',1,1)
                        Battle:write()
                        BattleView:deactivate()
                    end,
                },
            },
            [3] = {
                [1] = {
                    replay = true,
                    auto = true,
                    dialog = {
                        { 'LOSE',}
                    },
                    after = function()
                        Event:goto('battle',1,1)
                        -- reset health for now
                        for k, v in pairs(STATE.heroes) do
                            STATE.heroes[k].stats.hp = STATE.heroes[k].stats.hpmax
                            STATE.heroes[k].stats.mp = STATE.heroes[k].stats.mpmax
                            STATE.heroes[k].dead = nil
                        end
                        BattleView:deactivate()
                    end,
                },
            }
        }
    end
}


return BattleEvent
