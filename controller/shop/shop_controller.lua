local ShopModel = require 'model.shop.shop_model'
local Assets    = require 'helpers.asset_helper'

--
-- Class: ShopController
-- Communicate between the model and view
--
-- Require:
-- - model.shop.shop_model
-- - helpers.asset_helper
-- 
local ShopController = {
    --
    -- Method: init
    -- Copy data from ShopModel
    --
    init = function ( self, shopID )
        ShopModel:init(shopID)
        self.data = ShopModel.data
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
