local Assets = require 'helpers.asset_helper'

--
-- Class: ShopHelper
-- Prepare local data table for modification
--
-- Require:
-- - helpers.asset_helper
--
-- Data Model:
--     [5] => table
--         (
--            [cost] => 50
--            [ikind] => equipment
--            [width] => 64
--            [key] => 2
--            [image] => assets/img/hoody.png
--            [name] => Rusty Shovel
--            [desc] => Trusty Rusty Attack + 10
--            [height] => 64
--            [kind] => Weapon
--            [effect] => table
--                (
--                   [str] => 25
--                   [con] => 25
--                )
--            [use] => table
--                (
--                   [1] => 2
--                )
--         )
--
local ShopHelper = {
    --
    -- Method: init
    -- Set up a temporary data table.
    --
    init = function ( self, shopID )
        self.data = {}
        self:item(shopID)
        self:equipment(shopID)
        -- table_print(self.data)
        return self.data
    end,

    --
    -- Method: item
    -- Insert items from shop into data table.
    --
    item = function ( self, shopID )
        if Assets:get('shop', shopID, 'items') then
            for i,v in ipairs(Assets:get('shop', shopID, 'items')) do
                local items = Assets:get('items', v)
                items['key'] = v
                items['ikind'] = 'items'
                table.insert(self.data, items)
            end
        end
    end,

    --
    -- Method: equipment
    -- Insert equipment from shop into data table.
    --
    equipment = function ( self, shopID )
        if Assets:get('shop', shopID, 'equipment') then
            for i,v in ipairs(Assets:get('shop', shopID, 'equipment')) do
                local equipment = Assets:get('equipment', v)
                equipment['key'] = v
                equipment['ikind'] = 'equipment'
                table.insert(self.data, equipment)
            end
        end
    end,

    --
    -- Method: buy
    -- Buy item from shop.
    --
    -- Arguments:
    --      ikind - The type of item/equipment
    --      ID - ID of item/equipment
    --
    buy = function ( self, ikind, ID )
        if STATE.gold >= Assets:get(ikind, ID, 'cost') then
            -- Update inventory
            Assets:putInventory(ikind, ID)
            -- Update gold
            STATE.gold = STATE.gold - Assets:get(ikind, ID, 'cost')
            log:add('purchased ' .. Assets:get(ikind, ID, 'name') .. ' from "' .. STATE.map .. '"')
        else
            print('no gold')
            log:add('no gold to purchase ' .. Assets:get(ikind, ID, 'name') .. ' from "' .. STATE.map .. '"')
            return false
        end
    end,
}

return ShopHelper
