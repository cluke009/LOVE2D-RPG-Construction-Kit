    -- Get all unique type of equipment
local unique = {}
for i, v in ipairs(equipment) do
    unique[v.kind] = false
end

local STATE = Class:new {
    conf = {
        font = {'assets/fonts/chary___.ttf', 18},
        time = {
            date = 0,
            seconds = 0,
            human = '',
            epoch = 0,
        },
    },
    inventory  = {
        gold = 300,
        items = {[1]=3,[2]=4,[6]=2},
        equipment = {},
    },
    heroes = table.copy(heroes),
    event = {
        removeObj = {},
    },
    encounters = {}
}
-- Add needed data to heroes table
local hAtrr = {}
for i, v in ipairs(STATE.heroes) do
    STATE.heroes[i].equip = table.copy(unique)
end

return STATE
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
