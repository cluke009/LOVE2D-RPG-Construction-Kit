local Assets    = require'helpers.asset_helper'
local Equipment = Assets.Equipment
local Item      = Assets.Item
local Shop      = Assets.Shop

local ShopModel = {
    --
    -- Method: init
    --
    init = function ( self, shopID )
        self.data = {}
        self:item(shopID)
        self:equipment(shopID)
        return self.data
    end,
    item = function ( self, shopID )
        for i,v in ipairs(Shop:get(shopID).items) do
            local items = Item:get(v)
            items['key'] = v
            items['ikind'] = {'Item', 'item'}
            table.insert(self.data, items)
        end
    end,
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
