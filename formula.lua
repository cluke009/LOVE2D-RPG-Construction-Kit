
--
-- Class: formula
--
local formula = {

    --
    -- Method: attack
    -- calculate attack dmg
    -- (atk * 4) - (def * 2) +/- 10%
    --
    -- Arguments:
    --      offense - character making attack
    --      defense - character being attacked
    -- Returns:
    --      string - dmg done
    --      object - updated object after dmg \ passed by reference
    --
    attack = function ( offense, defense )
        -- pretty.dump(offense)

        local oRand = (offense.stats.str * 4) * (random(-10, 10)/100)
        local dRand = (defense.stats.def * 2) * (random(-10, 10)/100)

        local def = math.round(defense.stats.def * 2 + dRand)
        local str = math.round(offense.stats.str * 4 + oRand)
        local dmg = str - def

        defense.stats.hp = defense.stats.hp - dmg
        -- print(atk, def, atk - def)

        return dmg, defense
    end,
    --
    -- Method: dodge
    -- calculate dodge %
    --
    dodge = function (  )
        -- body
    end,
    --
    -- Method: defend
    -- if defending improve defense constant to 3
    --
    defend = function (  )
        -- body
    end,
    --
    -- Method: special
    -- calculate any non-basic attack
    --
    special = function (  )
        -- body
    end,
    --
    -- Method: level
    -- calculate stats by level
    --
    level = function (  )
        -- body
    end,
    --
    -- Method: enemyAI
    -- Simple AI to pick a random id of party member.
    --
    -- Arguments:
    --      party - object of available targets
     -- Returns:
    --      integer - id of party member to attack
    --
    enemyAI = function ( party )
        local p = {}
        for k,v in pairs(party) do
            -- if not v.dead then
                table.insert(p, k)
            -- end
        end

        return p[math.random(1, #p)]
    end,
}


return formula
