--
-- Class: Assets
-- Interface for assets.
--
-- TODO: Route all asset calls through this class
--
local Assets = {
    --
    -- Method: req
    -- require called asset
    --
    req = function(self, KIND)
        return require('assets.tables.' .. KIND)
    end,

    --
    -- Method: get
    -- Retrieve any asset object.
    --
    -- Arguments:
    --      itemID - The ID of the object to get.
    --      ... - The property to get
    --
    -- Returns:
    --      string or table
    --
    -- TODO:
    --      Integrate sound and encounters
    --
    get = function(self, KIND, ID, ...)
        ID = tonumber(ID)
        local ret = nil
        KIND = self:req(KIND)

        local kind = KIND[ID][arg[1]]

        if arg[1] and type(kind) ~= 'table' then
            ret = kind
        elseif arg[1] and type(kind) == 'table' then
            local data = {}; local i = 1
            for k, v in pairs(kind) do
                data[k] = v
                i = i + 1
            end
            ret = data
        elseif arg[1] == nil then
            ret = KIND[ID]
        end

        return ret
    end,

    --
    -- Method: useItem
    -- Use item and update STATE.inventory
    --
    -- Arguments:
    --      itemID - The ID of the object to use.
    --      ... - The property to use
    --
    -- Returns:
    --      nothing
    --  TODO: remove calls to this function
    --
    useItem = function(self, itemID, ...)
        itemID = tonumber(itemID)
        if STATE.inventory['items'][itemID] == 1 then
            STATE.inventory['items'][itemID] = nil
        elseif STATE.inventory['items'][itemID] == nil then
            -- self:deactivate()
        else
            STATE.inventory['items'][itemID] = STATE.inventory['items'][itemID] - 1
        end
        -- TODO: apply effects of item to hero?
    end,

    --
    -- Method: deleteInventory
    -- Remove item or equipment to inventory
    --
    deleteInventory = function(self, kind, ID, amount)
        ID = tonumber(ID)
        amount = amount or 1
        if not STATE.inventory[kind][ID] or STATE.inventory[kind][ID] - amount <= 0 then
            STATE.inventory[kind][ID] = nil
        else
            STATE.inventory[kind][ID] = STATE.inventory[kind][ID] - amount
        end
        return STATE.inventory[kind][ID]
    end,
    --
    -- Method: putInventory
    -- Add item or equipment to inventory
    --
    putInventory = function(self, kind, ID, amount)
        ID = tonumber(ID)
        amount = amount or 1
        if STATE['inventory'][kind][ID] == nil then
            STATE['inventory'][kind][ID] = amount
        else
            STATE['inventory'][kind][ID] = STATE['inventory'][kind][ID] + amount
        end
    end,

    --
    -- Method: getInventory
    -- Check for item or equipment in inventory
    --
    getInventory = function(self, kind, ID)
        ID = tonumber(ID)
        if STATE['inventory'][kind][ID] == nil then
            return false
        else
            return STATE['inventory'][kind][ID]
        end
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
        local equipment = self:req('equipment')
        if STATE.heroes[heroID].equip then
            local i = 1
            for k, v in pairs(STATE.heroes[heroID].equip) do
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

    --
    -- Method: equip
    -- Equip equipment to hero
    --
    equip = function(self, ID, heroID, ...)
        -- TODO: check that equipment is in inventory and available to use
        local itemType = self:get('equipment', ID, 'kind')
        STATE.heroes[heroID].equip[itemType] = ID
    end,
}

return Assets
