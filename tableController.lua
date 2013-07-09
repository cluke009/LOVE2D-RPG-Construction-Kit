local enemies = require'assets.tables.enemies'
local equipment = require'assets.tables.equipment'
local items = require'assets.tables.items'

local t = {}


t.Enemy = {
    get = function(self, enemyID, ...)
        local ret = nil
        local enemy = enemies[enemyID][arg[1]]

        if arg[1] and type(enemy) == 'string' then
            ret = enemy
        elseif arg[1] and type(enemy) == 'table' then
            local data = {}; local i = 1
            for k, v in pairs(enemy) do
                data[k] = v
                i = i + 1
            end
            ret = data
        elseif arg[1] == nil then
            ret = enemies[enemyID]
        end

        return ret
    end,
    set = function(self, equipmentID)
    end,
    equipped = function(self, heroID, ...)
    end,
}

-- Class: Equipment
-- Interface to equipment table
--
-- Method: get
--      Get equipment
--
-- Method: set
--      Set equipment
--
-- Method: equipped
--      Get equipped items
t.Equipment = {
    get = function(self, equipmentID, ...)
        local ret = nil
        local equip = equipment[equipmentID][arg[1]]

        if arg[1] and type(equip) == 'string' then
            ret = equip
        elseif arg[1] and type(equip) == 'table' then
            local data = {}; local i = 1
            for k, v in pairs(equip) do
                data[k] = v
                i = i + 1
            end
            ret = data
        elseif arg[1] == nil then
            ret = equipment[equipmentID]
        end

        return ret
    end,
    set = function(self, equipmentID)
    end,
    equipped = function(self, heroID, ...)
        local data = {}
        if STATE.equip[heroID] then
            local i = 1
            for k, v in pairs(STATE.equip[heroID]) do
                if arg[1] and equipment[v] then
                    data[i] = equipment[v][arg[1]]
                else
                    data[i] = equipment[v]
                end
                i = i + 1
            end
        end

        return data
    end,
}

t.Item = {
    get = function(self, equipmentID)
        return equipment[equipmentID]
    end,
    set = function(self, equipmentID)
    end,
    equipped = function(self, heroID, ...)
    end,
}

return t
