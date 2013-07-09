local enemies   = require'assets.tables.enemies'
local equipment = require'assets.tables.equipment'
local items     = require'assets.tables.items'

--
-- Class: Assets
-- Interface for assets.
--
-- Require:
-- - assets.tables.enemies
-- - assets.tables.equipment
-- - assets.tables.items
--
local Assets = {}

--
-- Class: Enemy
-- Interface for Enemies.
--
Assets.Enemy = {
    --
    -- Method: get
    -- Retrieve any enemy object.
    --
    -- Arguments:
    --      enemyID - The ID of the object to get.
    --      ... - The property to get
    --
    -- Returns:
    --      string or table
    --
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
}

--
-- Class: Equipment
-- Interface for Equipment.
--
Assets.Equipment = {
    --
    -- Method: get
    -- Retrieve any equipment object.
    --
    -- Arguments:
    --      equipmentID - The ID of the object to get.
    --      ... - The property to get
    --
    -- Returns:
    --      string or table
    --
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
    --
    -- Method: set
    -- Equip item on hero.
    --
    -- Arguments:
    --      equipmentID - The ID of the equipment.
    --      heroID - The ID of the hero to equip it on.
    --
    set = function(self, equipmentID, heroID)
    end,
    --
    -- Method: equipped
    -- Retrieve currently equipped items.
    --
    -- Arguments:
    --      heroID - The ID of the object to get.
    --      ... - The property to get
    --
    -- Returns:
    --      string or table
    --
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

--
-- Class: Item
-- Interface for Item.
--
Assets.Item = {
    --
    -- Method: get
    -- Retrieve any item object.
    --
    -- Arguments:
    --      itemID - The ID of the object to get.
    --      ... - The property to get
    --
    -- Returns:
    --      string or table
    --
    get = function(self, itemID)
        local ret = nil
        local item = items[itemID][arg[1]]

        if arg[1] and type(item) == 'string' then
            ret = item
        elseif arg[1] and type(item) == 'table' then
            local data = {}; local i = 1
            for k, v in pairs(item) do
                data[k] = v
                i = i + 1
            end
            ret = data
        elseif arg[1] == nil then
            ret = items[itemID]
        end

        return ret
    end,
}

return Assets
