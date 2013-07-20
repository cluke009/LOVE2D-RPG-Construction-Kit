local Assets  = require'assets'
local Equipment = Assets.Equipment
local Item      = Assets.Item
local Inventory = Assets.Inventory
local Shop = Assets.Shop
local Menu = require 'menu.menu'
local ShopModel, ShopController, ShopView

ShopModel = {
    --
    -- Method: init
    -- Create empty data table. Run functions to fill it.
    --
    init = function ( self, shopID )
        self.data = {}
        self:item(shopID)
        self:equipment(shopID)
        -- pretty.dump(self.data)
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

ShopController = {
    init = function ( self, shopID )
        ShopModel:init(shopID)
        self.data = ShopModel.data
    end,
    buy = function ( self, ikind, ID )
        if STATE.gold > Assets[ikind[1]]:get(ID, 'cost') then
            -- Update inventory
            Inventory:put(ikind[2], ID)
            -- Update gold
            STATE.gold = STATE.gold - Assets[ikind[1]]:get(ID, 'cost')
        else
            print('no gold')
        end
    end,

}

ShopView = Subview:new{
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
                -- name = Assets[v.ikind[1]]:get(v.key, 'name'),

                name = Assets[v.ikind[1]]:get(v.key, 'name') .. ' G ' .. Assets[v.ikind[1]]:get(v.key, 'cost'),
                hover = function()
                    self.text.text = Assets[v.ikind[1]]:get(v.key, 'desc')
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
        -- ShopController:init(self.shopID)
        -- pretty.dump(ShopController.data)
    end,
    onUpdate = function (self)
        self.gold.text = 'gold: ' .. STATE.gold
        if the.keys:justPressed('escape') then
            self:deactivate()
        end
    end,
}
return ShopView
