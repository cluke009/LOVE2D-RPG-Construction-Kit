--
-- Game State
--
STATE = {
    map = 'home',
    hud = true,
    init = true,
    heroStartX = 480,
    heroStartY = 480,
    inventory = {
        item = {},
        equipment = {[2]=1,[3]=1,[5]=1},
    },
    -----------------------------------------
    -- not configurable beyond this point
    -----------------------------------------
    heroes = require 'assets.tables.heroes',
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

-- Copy clean state table
local stateCopy = {}
if STATE.init then
    stateCopy = table.copy(STATE)
    stateCopy.init = false
    STATE.init = false
end

-- Load clean game state
function initializeSTATE( )
    print('INIT')
    STATE = table.copy(stateCopy)
end
