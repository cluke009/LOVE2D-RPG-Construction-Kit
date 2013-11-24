local enemies   = require 'assets.tables.enemies'
local equipment = require 'assets.tables.equipment'
local event     = require 'assets.tables.events'
local items     = require 'assets.tables.items'
local shop      = require 'assets.tables.shop'

local Trigger = require 'triggers'

--
-- Class: Assets
-- Interface for assets.
--
-- TODO: Route all asset calls through this class
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

        if arg[1] and type(enemy) ~= 'table' then
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

        if arg[1] and type(equip) ~= 'table' then
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
    get = function(self, itemID, ...)
        local ret = nil
        local item = items[itemID][arg[1]]

        if arg[1] and type(item) ~= 'table' then
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
    --
    -- Method: inventory
    -- STATE.inventory
    --
    -- Returns:
    --      inventory object
    --
    inventory = function(self, itemID, ...)

    end,
    --
    -- Method: use
    -- Use item and update STATE.inventory
    --
    -- Arguments:
    --      itemID - The ID of the object to use.
    --      ... - The property to use
    --
    -- Returns:
    --      nothing
    --
    use = function(self, itemID, ...)
        if STATE.inventory['item'][itemID] == 1 then
            STATE.inventory['item'][itemID] = nil
        elseif STATE.inventory['item'][itemID] == nil then
            self:deactivate()
        else
            STATE.inventory['item'][itemID] = STATE.inventory['item'][itemID] - 1
        end
    end,
}

--
-- Class: Inventory
-- Interface for Inventory.
--
Assets.Inventory = {
    --
    -- Method: get
    --
    get = function(self, kind, itemID, ...)
    end,
    --
    -- Method: put
    --
    put = function(self, kind, ID, ...)
        if STATE['inventory'][kind][ID] == nil then
            STATE['inventory'][kind][ID] = 1
        else
            STATE['inventory'][kind][ID] = STATE['inventory'][kind][ID] + 1
        end
    end,
}

--
-- Class: Shop
-- Interface for Shop.
--
Assets.Shop = {
    --
    -- Method: get
    --
    get = function(self, shopID, ...)
        shopID = tonumber(shopID)
        return shop[shopID]
    end,

}

--
-- Class: Event
-- Interface for Events.
--
Assets.Event = {
    --
    -- Method: init
    --
    init = function(self, eventID)
        local ID = tonumber(eventID)
        local e = event[ID]

        local currentEvent, continue
        currentEvent, continue = self:register(ID)

        if e[currentEvent].dialog then
            local d = Dialog:new{
                dialog = e[currentEvent].dialog
            }
            -- Cycle dialog
            if e[currentEvent].cycle and not STATE.event[ID].cycle then
                -- table_print(e[currentEvent])
                d = Dialog:new{
                    dialog = {e[currentEvent].dialog[1]}
                }
                STATE.event[ID].cycle = 2
            elseif STATE.event[ID].cycle then
                local cycleID = STATE.event[ID].cycle
                d = Dialog:new{
                    dialog = {e[currentEvent].dialog[cycleID]}
                }
                if #e[currentEvent].dialog > STATE.event[ID].cycle then
                    STATE.event[ID].cycle = STATE.event[ID].cycle + 1
                else
                    STATE.event[ID].cycle = 1
                end
            end

            d.onDeactivate = function()
                if e[currentEvent].func then
                    self:trigger(e, currentEvent)
                end
            end
            d:activate()
        elseif e[currentEvent].func then
            self:trigger(e, currentEvent)
        end
        return continue
    end,
    --
    -- Method: trigger
    --
    trigger = function(self, e, currentEvent )
        local options = split(e[currentEvent].func, ',')
        local func = options[1]
        options[1] = nil

        local args = {}
        for k,v in pairs(options) do
            local a = split(v, '=')
            args[string.trim(a[1])] = string.trim(a[2])
        end
        Trigger[func](self, args)
    end,
    --
    -- Method: register
    --
    register = function(self, ID)
        local a, e, ret1, ret2
        if not STATE.event[ID] then
            STATE.event[ID] = {
                id = 1,
                activated = true,
                cycle = false
            }
            ret1, ret2 = 1, _
        elseif STATE.event[ID] then
            ret1, ret2 = STATE.event[ID]['id'], _
        end
        if event[ID][STATE.event[ID]['id']].trigger then
            a = event[ID][STATE.event[ID]['id']].trigger
            e = string.split(a)

            --  Write trigger to DB
            if ID == tonumber(e[1]) then
                -- If trigger shares same parent we return current id before overwriting STATE
                local cur = STATE.event[ID]['id']
                STATE.event[tonumber(e[1])] = {
                    id = tonumber(e[2]),
                    activated = false,
                    cycle = false
                }

                ret1, ret2 =  cur, e[3]
            else
                STATE.event[tonumber(e[1])] = {
                    id = tonumber(e[2]),
                    activated = false,
                    cycle = false
                }
            end
        end
        return ret1, ret2
    end,
}

return Assets
