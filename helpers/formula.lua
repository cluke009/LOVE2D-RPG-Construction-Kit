--
-- Class: Formula
--
local Formula = {
    --
    -- Method: attack
    -- calculate attack dmg
    -- (str * 4) - (con * 2) +/- 10%
    --
    -- Arguments:
    --      offense - character making attack
    --      defense - character being attacked
    --
    -- Returns:
    --      string - dmg done
    --      object - updated object after dmg \ passed by reference
    --
    attack = function(self, offense, defense)
    -- pretty.dump(offense)

        local oRand = (offense.stats.str * 4) * (math.random(-10, 10) / 100)
        local dRand = (defense.stats.con * 2) * (math.random(-10, 10) / 100)

        local con = math.floor(defense.stats.con * 2 + dRand)
        local str = math.floor(offense.stats.str * 4 + oRand)
        local dmg = str - con

        if self:crit() == 'hit' then
            if offense.kind == 'enemy' then
                dmg = dmg * 1.5
            else
                dmg = dmg * 2
            end
            print('crit hit', dmg)
        elseif self:crit() == 'miss' then
            dmg = 0
            -- dodge = true
            print('crit miss')
        end

        if dmg < 0 then
            dmg = 0
        end

        local hp = defense.stats.hp - dmg

        if hp < 0 then
            defense.stats.hp = 0
        else
            defense.stats.hp = hp
        end

        return dmg, defense
    end,
    --
    -- Method: crit
    -- math.random(1,20) if 20 its a crit hit if not check if miss is 20 then its a dodge
    --
    crit = function(self)
        local hit = math.random(1,20)
        local miss = math.random(1,20)

        if hit == 20 then
            return 'hit'
        elseif miss == 20 then
            return 'miss'
        end
    end,
    --
    -- Method: defend
    -- if defending improve defense constant to 3
    --
    defend = function(self)
    -- body
    end,
    --
    -- Method: run
    -- calculate if party can run from battle
    --
    run = function(self)
    -- body
    end,
    --
    -- Method: special
    -- calculate any non-basic attack
    --
    special = function(self)
    -- body
    end,
    --
    -- Method: stats
    -- Calculate stats for level
    --
    stats = function(self, level, stat)
        -- local randStats = stat + math.floor(stat * (math.random(2, 10)/100))
        local s = stat * level
        return s
    end,


    exper = function(self, lvl, exp, stat)
        lvl = lvl + 1
        local _, nextLevel = self:level(lvl)
        local exb = exp - nextLevel

        -- print("----------------------------------------")
        -- print("level: " .. lvl - 1)
        -- print("----------------------------------------")
        -- print(newStats)

        -- print(newStats)
        -- print('---------------------')
        -- print(exp,exb,nextLevel,lvl)
        if nextLevel <= exp then
            exp = exb
            return self:exper(lvl, exp, stat)
        else
            print(exp,exb,nextLevel,lvl)
            -- return exb,nextLevel,lvl
            local newStats = {}
            for k,v in pairs(stat) do
                if k ~= 'exp' and k ~= 'expmax' and k ~= 'level' and k ~= 'hp' and k ~= 'mp' then
                    newStats[k] = self:stats(lvl - 1, v)
                end
            end
            return exp, nextLevel, lvl - 1, newStats
        end

    end,

    --
    -- Method: level
    -- Get experience to next level
    -- http://disgaea.wikia.com/wiki/Experience
    -- X = Level
    -- .04 * X^3 + .8 * X^2 + 2 * X,
    --
    level = function(self, lvl)
        local prevLevel = lvl - 1

        local totalExp = 0.04 * math.pow(lvl, 3) + 0.8 * math.pow(lvl, 2) * lvl
        totalExp = math.floor(totalExp)

        local prevExp = 0.04 * math.pow(prevLevel, 3) + 0.8 * math.pow(prevLevel, 2) * prevLevel
        prevExp = math.floor(prevExp)

        local nextLevel = totalExp - prevExp

        return totalExp, nextLevel
    end,
    --
    -- Method: enemyAI
    -- Simple AI to pick a random id of party member.
    --
    -- Arguments:
    --      party - object of available targets
    --
    -- Returns:
    --      integer - id of party member to attack
    --
    enemyAI = function ( self, party)
        local p = {}
        for k, v in pairs(party) do
            if not v.dead then
                table.insert(p, k)
            end
        end

        return p[math.random(1, #p)]
    end,
}


return Formula
