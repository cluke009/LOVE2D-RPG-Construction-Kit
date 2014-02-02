

--
-- Class: BattleModel
-- Prepare local data table for modification
--
-- Require:
-- - helpers.asset_helper
--
local BattleModel = {
    --
    -- Method: init
    -- Create empty data table. Run functions to fill it.
    --
    init = function ( self, enemyGroup, rand )
        self.data = {
            hero = {},
            enemy = {},
            queue = {},
            gold = 0,
            exp = 0,
            rand = rand,
            enemyGroup = enemyGroup
        }
        self:hero()
        self:enemy()
        self:queue()
        -- table_print(self.data)

        return self.data
    end,

    --
    -- Method: hero
    -- Fill hero data table.
    -- Copies active heroes and applies equipment boosts.
    --
    hero = function ( self )
        -- Merge hero data
        for k, v in pairs(STATE.heroes) do
            if v.active then
                -- Copy active heroes
                self.data.hero[k] = v
                self.data.hero[k]['name'] = heroes[k]['name']
                -- local stats = self.data.hero[k]['stats']

                -- -- Add bonuses from equipment to stats
                -- for i, effects in ipairs(Event:equipped(k, 'effect')) do
                --     for k, v in pairs(effects) do
                --         stats[k] = stats[k] + v
                --     end
                -- end
            end
        end
    end,

    --
    -- Method: enemy
    -- Fill enemy data table with 1-5 enemies from the group.
    -- Stats are randomized by +/- 10% for each enemy.
    --
    enemy = function ( self )
        local array = {}
        local enemyGroup = self.data.enemyGroup

        -- Lua likes to pick 2 every time with only one random. Who knows why?
        -- local superRand = math.random(math.random(1, 3), 5)
        -- superRand = 2 -- or not at all random

        -- for i=1, superRand do
        --     local randID = math.random(1, #enemyGroup)
        --     randID = enemyGroup[randID]

        --     table.insert(array, table.copy(Assets:get('enemies', randID), true))
        --     array[i]['key'] = randID

        --     -- Randomize stats +/- 10%
        --     for k,v in pairs(array[i]['stats']) do
        --         local randStats = v + math.floor(v * (math.random(-10, 10)/100))
        --         array[i]['stats'][k] = randStats
        --     end
        --     array[i]['stats']['hpmax'] = array[i]['stats']['hp']
        -- end
        for i,v in ipairs(enemyGroup) do
            table.insert(array, table.copy(enemies[v], true))
            array[i]['key'] = v

            -- Randomize stats +/- 10%
            for k,v in pairs(array[i]['stats']) do
                local randStats = v + math.floor(v * (math.random(-10, 10)/100))
                array[i]['stats'][k] = randStats
            end
            array[i]['stats']['hpmax'] = array[i]['stats']['hp']
        end

        self.data.enemy = array
    end,

    --
    -- Method: queue
    -- Creates a queue for turn order. Sorted by spd, highest first.
    --
    queue = function ( self )
        -- Queue
        for k, v in pairs(self.data.hero) do
            table.insert(self.data.queue, {kind='hero',key=k,spd = v.stats.spd})
        end
        for k, v in pairs(self.data.enemy) do
            table.insert(self.data.queue, {kind='enemy',key=k,spd = v.stats.spd})
        end

        table.sort(self.data.queue, function(a,b) return a.spd>b.spd end)
        -- table_print(self.data.queue)
    end
}

return BattleModel
