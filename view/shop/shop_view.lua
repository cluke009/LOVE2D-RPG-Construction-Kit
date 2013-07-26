local Menu           = require 'helpers.menu_helper'
local ShopController = require 'controller.shop.shop_controller'

local ShopView = Subview:new{
    text = Text:new{
        x = 420,
        y = 40,
        width = 480,
        tint = { 0, 0, 0 },
        font = 24,
    },
    inventory = function (self)
        local links = {}
        for k, v in pairs(ShopController.data) do
            -- pretty.dump(v)
            table.insert(links, {
                name = v.name .. ' G ' .. v.cost,
                hover = function()
                    self.text.text = v.desc
                end,
                action = function()
                    ShopController:buy(v.ikind, v.key)
                end
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
            font = {'assets/font/PressStart2P.ttf', 16},
        }

        self:add(self.fill)
        self:add(self.gold)
        self:add(self.text)
        local links = self:inventory()
        self.menu = Menu:new{
            x = 20,
            y = 80,
            step = 24,
            width = 1300,
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
