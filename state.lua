--
-- Initialize any empty game data that needs to be present before we load.
--
STATE = Class:new {
    map  = 'home',
    hud  = true,
    init = true,
    font = 16,
    gold = 300,
    heroStartX = 480,
    heroStartY = 480,
    inventory  = {
        item   = {},
        equipment = {},
        -- equipment = { [2] = 1, [3] = 1, [5] = 1 },
    },
    time = {
        date = 0,
        seconds = 0,
        human = '',
        epoch = 0,
    },
    heroes = require 'assets.tables.heroes',
    equip = {},
    event = {},
    removeObj = {},
}

-- Get all unique type of equipment
local unique = {}
local equipment = require 'assets.tables.equipment'
for i, v in ipairs(equipment) do
    unique[v.kind] = true
end

-- Add equippable types to STATE
for i, v in ipairs(STATE.heroes) do
    STATE.equip[i] = {}
    for k, v in pairs(unique) do
        STATE.equip[i][k] = false
    end
end

-- Calculate stats at level for heroes that join party at a level besides 1
-- local Formula = require 'formula'
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
