--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
]] -----------------------------------------------------------------------------

--
-- Class: State
-- Initialize any empty game data that needs to be present before we load.
-- Set init to false so it isn't loaded more than once
--
-- Properties:
--
--     map - Map to load when game starts.
--     hud - Boolean to display hud.
--     heroStartX - Starting X position.
--     heroStartY - Starting Y position.
--     inventory -
--         - item - Array of items in inventory
--         - equipment - Array of equipment in inventory
--
STATE = {
    map = 'east',
    hud = true,
    init = true,
    heroStartX = 480,
    heroStartY = 480,
    inventory = {
        item = {},
        equipment = { [2] = 1, [3] = 1, [5] = 1 },
    },
    -----------------------------------------
    -- not configurable beyond this point
    -----------------------------------------
    heroes = require'assets.tables.heroes',
    equip = {},
    menu = {
        update = false
    },
}
--
-- Class: TEMP
-- For table data that can be immediately destroyed
-- Current convention TEMP[<filename>.<class>.<method>.<property>]
--
TEMP = {}

-- Get all unique type of equipment
local unique = {}
local equipment = require'assets.tables.equipment'
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

-- Copy clean state table
local stateCopy = {}
if STATE.init then
    stateCopy = table.copy(STATE)
    stateCopy.init = false
    STATE.init = false
end

-- Load clean game state
function initializeSTATE()
    print('INIT')
    STATE = table.copy(stateCopy)
end
