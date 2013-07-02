STRICT = true
DEBUG = true
io.stdout:setvbuf("no")

STATE = {

    map = 'home',
    hud = true,
    init = true,
    heroStartX = 480,
    heroStartY = 480,
    heroes = require 'assets.tables.heroes',
    inventory = {
        item = {},
        equipment = {[2]=1,[3]=1,[5]=1},
    },
    equip = {},
    menu = {
        update = false
    },
}






-- Get all unique type of equipment
local unique = {}
local equipment = require 'assets.tables.equipment'
for i,v in ipairs(equipment) do
    unique[v.kind] = true
end

-- Add equippable types to STATE
for i,v in ipairs(STATE.heroes) do
    STATE.equip[i] = {}
    for k,v in pairs(unique) do
        STATE.equip[i][k] = false
    end
end

