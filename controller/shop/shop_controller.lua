local ShopModel = require 'model.shop.shop_model'
local Assets    = require 'assets'

local ShopController = {
    init = function ( self, shopID )
        ShopModel:init(shopID)
        self.data = ShopModel.data
    end,
    buy = function ( self, ikind, ID )
        if STATE.gold > Assets[ikind[1]]:get(ID, 'cost') then
            -- Update inventory
            Assets.Inventory:put(ikind[2], ID)
            -- Update gold
            STATE.gold = STATE.gold - Assets[ikind[1]]:get(ID, 'cost')
        else
            print('no gold')
            return false
        end
    end,
}

return ShopController
