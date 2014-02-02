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
local ShopView = Subview:new {
    text = Text:new{
        x = 420,
        y = 40,
        width = 480,
        tint = { 0, 0, 0 },
    },
    inventory = function (self)
        local links = {}
        for k, v in pairs(ShopHelper.data) do
            table.insert(links,
                v.name .. ' G ' .. v.cost
            )
        end
        return links
    end,
    onNew = function ( self )

    end,
    onActivate = function(self)
        -- Initialize shop data
        ShopHelper:init()

        self.fill = Fill:new{
            width  = 800,
            height = 600,
            fill = { 255, 255, 255, 200 },
        }
        self.gold = Text:new{
            x = 20,      width = 1000,
            y = 20,      height = 120,
            tint = { 0, 0, 0 },
        }

        self:add(self.fill)
        self:add(self.gold)
        self:add(self.text)
        local links = self:inventory()
        -- self.menu = Menu:new{
        --     coord = {20,80,1300,24, true},
        --     items = links
        -- }
        -- self:add(self.menu)
        table_print(links)
        self:add(Navi:new{
            dialog = {
                {
                    '',
                    {
                        x=30, y=245, wbox=300, nrows=#links+1,
                        nvchs=#links, choices =links
                    }
                }
            }
        })
        -- self:add(log.init)
    end,
    onDeactivate = function(self)
        self:remove(self.fill)
        self:remove(self.gold)
        self:remove(self.text)
        self:remove(self.menu)
    end,
    onUpdate = function (self)
        -- log:update()
        self.gold.text = 'gold: ' .. STATE.inventory.gold
        if the.keys:justPressed('escape') then
            self:deactivate()
        end
    end,
}
return ShopView
