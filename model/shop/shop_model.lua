local Assets    = require'helpers.asset_helper'
local Equipment = Assets.Equipment
local Item      = Assets.Item
local Shop      = Assets.Shop

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
        for i,v in ipairs(Shop:get(shopID).items) do
            local items = Item:get(v)
            items['key'] = v
            items['ikind'] = {'Item', 'item'}
            table.insert(self.data, items)
        end
    end,

    --
    -- Method: equipment
    -- Insert equipment from shop into data table.
    --
    equipment = function ( self, shopID )
        for i,v in ipairs(Shop:get(shopID).equipment) do
            local equipment = Equipment:get(v)
            equipment['key'] = v
            equipment['ikind'] = {'Equipment', 'equipment'}
            table.insert(self.data, equipment)
        end
    end
}

return ShopModel
