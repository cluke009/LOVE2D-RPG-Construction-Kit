--
-- Initialize any empty game data that needs to be present before we load.
--
local heroes    = require 'assets.tables.heroes'
local equipment = require 'assets.tables.equipment'

-- Get all unique type of equipment
local unique = {}
for i, v in ipairs(equipment) do
    unique[v.kind] = false
end

-- Add needed data to heroes table
local hAtrr = {}
for i, v in ipairs(heroes) do
    hAtrr[i] = {
        stats  = heroes[i].stats,
        active = heroes[i].active,
        equip  = table.copy(unique),
    }
end

-- table_print(hAtrr)

STATE = Class:new {
    conf = {
        map  = 'home',
        hud  = true,
        font = 16,
        heroStartX = 480,
        heroStartY = 480,
        time = {
            date = 0,
            seconds = 0,
            human = '',
            epoch = 0,
        },
    },
    inventory  = {
        gold = 300,
        -- items = {},
        items   = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,8,19,20},
        -- equipment = {},
        equipment = { [1] = 3, [2] = 1, [3] = 4, [5] = 3},
    },
    heroes = hAtrr,
    event = {
        removeObj = {},
    },
}

-- Calculate stats at level for heroes that join party at a level besides 1
-- local Formula = require 'helpers.formula'
-- for i, iv in ipairs(STATE.heroes) do
--     -- Get experience needed for desired level
--     local experience, _ = Formula:level(STATE.heroes[i].stats.level)
--     -- Overwrite experience
--     STATE.heroes[i].stats.exp = experience
--     -- Get new stats/ Set level to 1 / Calculate by experience
--     local a,b,c,d = Formula:exper( 1, STATE.heroes[i].stats.exp, STATE.heroes[i].stats)
--     for k,kv in pairs(d) do
--         STATE.heroes[i].stats[k] = kv
--     end

--     STATE.heroes[i].stats.exp = a
--     STATE.heroes[i].stats.expmax = b
--     STATE.heroes[i].stats.hp = STATE.heroes[i].stats.hpmax
--     STATE.heroes[i].stats.mp = STATE.heroes[i].stats.mpmax
-- end
