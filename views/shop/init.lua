local ShopHelper     = require 'views.shop.shop_helper'

--
-- Class: ShopView
-- Display code for shops.
--
-- Extends:
--   <Subview>
--
-- Require:
-- - helpers.menu_helper
-- - modes.shop.shop_helper
--
_navi.template  = {face_pos={x=0,y=0,z=true}, x=0, y=56, wbox=608, nrows=4, alxb='l', alyb='t', nrows=4,box=false}
local ShopHelper = require 'views.shop.shop_helper'
local ShopView = Subview:new {

    onNew = function ( self )
    end,
    onActivate = function(self)
        -- Initialize shop data
        self.fill = Tile:new{
            image = 'assets/img/events/shop.png',
        }
        self.gold = Text:new{
            x = 20,      width = 1000,
            y = 20,      height = 120,
            tint = { 0, 0, 0 },
        }
        self:add(self.fill)
        self:add(self.gold)

    end,
    onDeactivate = function(self)
        self:remove(self.fill)
        self:remove(self.gold)
    end,
    onUpdate = function (self)
        Event:register(1, 'shop', ShopHelper:getDialog(self.id))
        self.gold.text = 'gold: ' .. STATE.inventory.gold
        if the.keys:justPressed('escape') then
            self:deactivate()
        end
    end,
}
return ShopView
