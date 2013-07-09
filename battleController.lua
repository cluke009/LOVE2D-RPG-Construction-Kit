local BattleModel = require'battleModel'
local formula = require'formula'

local BattleController = {
    init = function(self)
        self.data = BattleModel:init()
    -- pretty.dump(self.data)
    end,
    updateQueue = function(self, kind, ID)
    -- Move first item to last item
        local size = #self.data.queue
        self.data.queue[size + 1] = self.data.queue[1]

        -- Take dead characters out of queue
        if self.data[kind] and self.data[kind][ID].stats.hp <= 0 then
            for k, v in pairs(self.data.queue) do
                if v.key == ID and v.kind == kind then
                    self.data.queue[k] = nil
                    self.data[kind][ID].dead = true
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

    -- pretty.dump(self.data.queue)
    end,
    enemyTurn = function(self)
    -- TODO: handle total party death
        local heroID = formula.enemyAI(self.data.hero)
        local enemyID = self.data.queue[1].key
        local dmg
        dmg, _ = formula.attack(self.data.enemy[enemyID], self.data.hero[heroID])

        return dmg, heroID
    end,
    win = function(self, ID)
        local hero = {}
        local enemy = {}
        for i,v in ipairs(self.data.queue) do
            if v.kind == 'hero' then
                table.insert(hero, i)
            else
                table.insert(enemy, i)
            end
        end

        if #hero == 0 then
            return true, 'heroes dead'
        elseif #enemy == 0 then
            return false, 'enemy dead'
        end
    end,
    heroTurn = function(self)
        if self.arg.action == 'attack' then
            dmg, _ = formula.attack(self.arg[1], self.arg[2])
            return dmg, self.arg.args[2]
        end
    end,
    action = function(self, action, ...)
        self.arg = {
            self.data.hero[arg[1]],
            self.data.enemy[arg[2]]
        }
        self.arg.args = arg
        self.arg.action = action
        local dmg = 0
        return dmg, arg[2]
    end,
    write = function(self)
    -- onDeactive write changes to STATE
    end,
}

return BattleController

