local Assets    = require 'helpers.asset_helper'

--
-- Class: ShopModel
-- Prepare local data table for modification
--
-- Require:
-- - helpers.asset_helper
--
local ShopModel = {
    --
    -- Method: init
    -- Set up data table.
    --
    init = function ( self, shopID )
        self.data = {}
        self:item(shopID)
        self:equipment(shopID)
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
    end
}

return ShopModel
