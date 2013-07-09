local t         = require 'tableController'
local Enemy     = t.Enemy
local Equipment = t.Equipment
local Item      = t.Item

local BattleModel = {
init = function ( self )
self.data = {
hero = {},
enemy = {},
queue = {}
}
self:hero()
self:enemy()
self:queue()
        -- pretty.dump(self.data)
        return self.data
        end,
        hero = function ( self )
        -- Merge hero data
        for k, v in pairs(STATE.heroes) do
            if v.active then
                -- Copy active heroes
                self.data.hero[k] = table.deepcopy(v)

                local stats = self.data.hero[k]['stats']

                -- Add bonuses from equipment to stats
                for i, effects in ipairs(Equipment:equipped(k, 'effect')) do
                    for k, v in pairs(effects) do
                        stats[k] = stats[k] + v
                    end
                end
            end
        end
        -- pretty.dump(self.data.hero[1])
        end,
        enemy = function ( self )
        local array = {}
        local e = TEMP['objects.Enemy.onUpdate.enemyID']
        local enemyGroup = Enemy:get(e, 'group')

        -- Lua likes to pick 2 every time with only one random. Who knows why?
        local superRand = math.random(math.random(1, 3), 5)
        -- superRand = 2 -- or not at all random

        for i=1, superRand do
            local randID = math.random(1, #enemyGroup)
            randID = enemyGroup[randID]

            table.insert(array, table.deepcopy(Enemy:get(randID)))
            array[i]['key'] = randID

            -- Randomize stats +/- 10%
            for k,v in pairs(array[i]['stats']) do
                local randStats = v + math.round(v * (random(-10, 10)/100))
                array[i]['stats'][k] = randStats
            end
        end

        self.data.enemy = array
        end,
        queue = function ( self )
        -- Queue
        for k, v in pairs(self.data.hero) do
            table.insert(self.data.queue, {kind='hero',key=k,spd = v.stats.spd})
        end

        for k, v in pairs(self.data.enemy) do
            table.insert(self.data.queue, {kind='enemy',key=k,spd = v.stats.spd})
        end

        table.sort(self.data.queue, function(a,b) return a.spd>b.spd end)
    end
}

return BattleModel
