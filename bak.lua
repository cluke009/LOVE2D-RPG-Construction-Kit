-- Reload clean game state every time
-- initializeSTATE()

-- Setup save state
self.save = Storage:new{ filename = 'save.dat' }

if the.keys:justPressed('s') then
    -- Save state data
    self.save.data = STATE
    self.save:save()
end

if the.keys:justPressed('l') then
    -- Load data into state if exists
    self.save:load()
    STATE = self.save.data

    -- Reload view
    self.view = MapView:new()
    the.app.view:flash({ 0, 0, 0 }, .75)
end

if the.keys:justPressed('d') then
    -- Save empty state data
    self.save.data = {}
    self.save:save()

    -- Load data into state
    self.save:load()
    STATE = self.save.data

    -- Reload view
    self.view = MapView:new()
    the.app.view:flash({ 0, 0, 0 }, .75)
end


STATE = Class:extend {
    map = 'west',
    hud = true,
    init = true,
    font = {'assets/font/press_start_2p/PressStart2P.ttf', 16},
    heroStartX = 480,
    heroStartY = 480,
    inventory = {
        item = {},
        equipment = { [2] = 1, [3] = 1, [5] = 1 },
    },
    -----------------------------------------
    -- not configurable beyond this point
    -----------------------------------------
    heroes = table.copy(require 'assets.tables.heroes', true),
    equip = {},
    gold = 300,
}

TEMP = {}

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

-- Copy clean state table
local stateCopy = {}
if STATE.init then
    stateCopy = table.copy(STATE, true)
    Formula = require 'formula'
    stateCopy.init = false
    STATE.init = false
end

-- Load clean game state
function initializeSTATE()
    STATE = table.copy(stateCopy, true)
    -- Calculate stats
    for i, iv in ipairs(STATE.heroes) do
        -- Get experience needed for desired level
        local experience, _ = Formula:level(STATE.heroes[i].stats.level)
        -- Overwrite experience
        STATE.heroes[i].stats.exp = experience
        -- Get new stats/ Set level to 1 / Calculate by experience
        local a,b,c,d = Formula:exper( 1, STATE.heroes[i].stats.exp, STATE.heroes[i].stats)
        for k,kv in pairs(d) do
            STATE.heroes[i].stats[k] = kv
        end
        -- print(d)
        STATE.heroes[i].stats.exp = a
        STATE.heroes[i].stats.expmax = b
        STATE.heroes[i].stats.hp = STATE.heroes[i].stats.hpmax
        STATE.heroes[i].stats.mp = STATE.heroes[i].stats.mpmax
    end
end
