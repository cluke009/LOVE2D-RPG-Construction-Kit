local Menu           = require 'helpers.menu_helper'
local ShopController = require 'controller.shop.shop_controller'

--
-- Class: ShopView
-- Display code for shops.
--
-- Extends:
--   <Subview>
--
-- Require:
-- - helpers.menu_helper
-- - controller.shop.shop_controller
--
local ShopView = Subview:new {
    text = Text:new{
        x = 420,
        y = 40,
        width = 480,
        tint = { 0, 0, 0 },
        font = STATE.font,
    },
    inventory = function (self)
        local links = {}
        for k, v in pairs(ShopController.data) do
            -- pretty.dump(v)
            table.insert(links, {
                v.name .. ' G ' .. v.cost,
                function() ShopController:buy(v.ikind, v.key) end,
                function() self.text.text = v.desc end,
            })
        end
        return links
    end,
    onActivate = function(self)
        ShopController:init(self.shopID)
        self.fill = Fill:new{
            width  = 800,
            height = 600,
            fill = { 255, 255, 255, 200 },
        }
        self.gold = Text:new{
            x = 20,      width = 1000,
            y = 20,      height = 120,
            tint = { 0, 0, 0 },
            font = STATE.font,
        }

        self:add(self.fill)
        self:add(self.gold)
        self:add(self.text)
        local links = self:inventory()
        self.menu = Menu:new{
            coord = {20,80,1300,24, true},
            items = links
        }
        self:add(self.menu)
    end,
    onDeactivate = function(self)
        self:remove(self.fill)
        self:remove(self.gold)
        self:remove(self.text)
        self:remove(self.menu)
    end,
    onUpdate = function (self)
        self.gold.text = 'gold: ' .. STATE.gold
        if the.keys:justPressed('escape') then
            self:deactivate()
        end
    end,
}
return ShopView
