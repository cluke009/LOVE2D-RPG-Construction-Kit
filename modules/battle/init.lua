-- local BattleModel = require(... .. '.battle_model')
local Formula     = require(... .. '.formula')

--
-- Class: BattleController
-- Communicate between the model and view
--
-- Require:
-- - model.battle.battle_model
-- - formula
--
local Battle = {
    -- 
    init = function(self, enemyGroup)

        self.data = {}
        self.data.enemy = self:enemyData(enemyGroup)
        for k,v in pairs(self.data.enemy) do
            self.data.gold = (self.data.gold or 0) + v.gold
            self.data.exp = (self.data.exp or 0) + v.exp
        end
        self.data.heroes = self:heroData()
        self.data.queue = self:queueData()
    end,
    -- 
    enemyData = function(self, enemyGroup)
        local array = {}
        for i,v in ipairs(enemyGroup) do
            table.insert(array, table.copy(enemies[v], true))
            array[i]['key'] = v
        end
        return array
    end,
    -- 
    heroData = function(self)
        local array = {}
        for i, v in ipairs(STATE.heroes) do
            if v.active then
                table.insert(array, v)
                array[#array]['key'] = i
            end
        end
        return array
    end,
    -- 
    queueData = function(self)
        -- Queue
        local array = {}
        for k, v in pairs(self.data.heroes) do
            if v.active then
                table.insert(array, {kind='heroes',key=k,spd = v.stats.spd})
            end
        end
        for k, v in pairs(self.data.enemy) do
            table.insert(array, {kind='enemy',key=k,spd = v.stats.spd})
        end

        table.sort(array, function(a,b) return a.spd>b.spd end)
        return array
    end,
    -- 
    queueUpdate = function(self)
        local size = #self.data.queue
        self.data.queue[size + 1] = self.data.queue[1]

        local kind, id
        if self.data.queue[1]['kind'] == 'enemy' then
            kind = 'heroes'
        else
            kind = 'enemy'
        end
        -- Take dead characters out of queue
        for i,v in ipairs(self.data[kind]) do
            if v.stats.hp <= 0 then
                v.dead = true
                for ii,vv in ipairs(self.data.queue) do
                    if vv.kind == kind and vv.key == i then
                        self.data.queue[ii] = nil
                    end
                end
            end
        end

        -- Empty first item
        self.data.queue[1] = nil

        -- Reindex: copy table then delete it
        local i = 1
        for k, v in pairs(self.data.queue) do
            self.data.queue[i] = self.data.queue[k]
            self.data.queue[k] = nil
            i = i + 1
        end

        return self:win()
    end,
    -- 
    win = function(self)
        local hero = {}
        local enemy = {}
        for i,v in ipairs(self.data.queue) do
            if v.kind == 'heroes' then
                table.insert(hero, i)
            else
                table.insert(enemy, i)
            end
        end

        if #hero == 0 then
            return true, 2
        elseif #enemy == 0 then
            return true, 1
        else
            return false
        end
    end,
    -- 
    write = function(self)

        STATE.inventory.gold = STATE.inventory.gold + self.data.gold

        for k, v in pairs(self.data.heroes) do
            -- STATE.heroes[k]['stats']['hp'] = v.stats.hp
            -- STATE.heroes[k]['stats']['mp'] = v.stats.mp
            if v.dead then
                STATE.heroes[k]['stats']['exp'] = math.floor(v.stats.exp + ( self.data.exp / 2 ))
            else
                STATE.heroes[k]['stats']['exp'] = math.floor(v.stats.exp + self.data.exp)
            end

            -- Update exp, expmax, level
            local sLvl = STATE.heroes[k]['stats']['level']
            local sExp = STATE.heroes[k]['stats']['exp']
            local test = require 'assets.tables.heroes'
            local exp, expmax, level, stats = Formula:exper(sLvl, sExp, test[k].stats)
            -- print(exp, expmax, level, stats )
            for k2,v2 in pairs(stats) do
                STATE.heroes[k].stats[k2] = v2
            end

            -- If player gained a level and is not dead max hp/mp
            if level > sLvl and STATE.heroes[k].stats.hp > 0 then
                STATE.heroes[k].stats.hp = STATE.heroes[k].stats.hpmax
                STATE.heroes[k].stats.mp = STATE.heroes[k].stats.mpmax
            end

            STATE.heroes[k].stats.level = level
            STATE.heroes[k].stats.exp = exp
            STATE.heroes[k].stats.expmax = expmax
        end
    end,
    -- 
    heroTurn = function(self, action, id)
        if action == 'attack' then
            local hero = self.data.heroes[self.data.queue[1].key]
            local enemy = self.data.enemy[id]
            local dmg, _ = Formula:attack(hero, enemy)
            local str = self.data.heroes[self.data.queue[1].key].name.. ' did ' .. dmg .. 'dmg to ' .. self.data.enemy[id].name
            return dmg, str
        elseif action == 'run' then
            local run = Formula:run()
            return run
        end

    end,
    enemyTurn = function(self)
        local heroID = Formula:enemyAI(self.data.heroes)
        local enemyID = self.data.queue[1].key

        dmg, _ = Formula:attack(self.data.enemy[enemyID], self.data.heroes[heroID])
        local str = self.data.enemy[enemyID].name .. ' did ' .. dmg .. 'dmg to ' .. self.data.heroes[heroID].name
        return dmg, str, heroID
    end,
}

return Battle

