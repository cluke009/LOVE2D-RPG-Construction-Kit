local BattleModel = require 'model.battle.battle_model'
local Formula     = require 'formula'

--
-- Class: BattleController
-- Communicate between the model and view
--
-- Require:
-- - model.battle.battle_model
-- - formula
--
local BattleController = {
    --
    -- Method: init
    -- Copy data from BattleModel
    --
    init = function(self, enemyGroup)
        self.data = BattleModel:init(enemyGroup)
    end,

    --
    -- Method: updateQueue
    -- Update BattleModel.data.queue
    --
    -- Arguments:
    --      kind - The type of player hero/enemy
    --      ID - ID to use
    --
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
    end,

    --
    -- Method: enemyTurn
    -- Run AI and take enemy turn.
    --
    -- Returns:
    --      dmg - dmg done
    --      heroID - ID of hero being attacked
    --
    enemyTurn = function(self)
        local heroID = Formula:enemyAI(self.data.hero)
        local enemyID = self.data.queue[1].key
        local dmg
        dmg, _ = Formula:attack(self.data.enemy[enemyID], self.data.hero[heroID])

        return dmg, heroID
    end,

    --
    -- Method: win
    -- Checks to see if either side has won yet.
    --
    -- Returns:
    --      boolean
    --
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
            return false, 'heroes dead'
        elseif #enemy == 0 then
            -- Update any important data that changed
            self:write()

            return true, { gold = self.data.gold, exp = self.data.exp}
        end
    end,

    --
    -- Method: heroTurn
    -- Complete "action" from hero turn.
    --
    -- Returns:
    --      ... - variable
    --
    heroTurn = function(self)
        if self.arg.action == 'attack' then
            dmg, _ = Formula:attack(self.arg[1], self.arg[2])
            return dmg, self.arg.args[2]
        end
    end,

    --
    -- Method: action
    -- Puts hero action into a queue to be completed with heroTurn.
    -- This works as a pass thru for actions in formula.lua
    --
    -- Arguments:
    --      action - The type of action to be taken
    --      ... - The arguments for said action
    --
    -- Returns:
    --      ... - variable
    --
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

    --
    -- Method: write
    -- Write any permanent changes made to the heroes back to the STATE object.
    -- Gives half EXP if dead. Writes - exp, gold, hp, mana
    -- TODO: Track status effects
    --
    write = function(self)
        for k,v in pairs(self.data.enemy) do
            self.data.gold = self.data.gold + v.gold
            self.data.exp = self.data.exp + v.exp
        end

        STATE.gold = STATE.gold + self.data.gold

        for k, v in pairs(self.data.hero) do
            STATE.heroes[k]['stats']['hp'] = v.stats.hp
            STATE.heroes[k]['stats']['mp'] = v.stats.mp
            if v.dead then
                STATE.heroes[k]['stats']['exp'] = v.stats.exp + ( self.data.exp / 2 )
            else
                STATE.heroes[k]['stats']['exp'] = v.stats.exp + self.data.exp
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

            STATE.heroes[k].stats.level = level
            STATE.heroes[k].stats.exp = exp
            STATE.heroes[k].stats.expmax = expmax
        end
    end,
}

return BattleController

