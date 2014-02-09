-- local Narration = {x=320, y = 30, alx='m',alxb='m',wbox = 600, nrows=3}
local lg = love.graphics

local ShopHelper = {
    getShop = function(self, id)
        self.shops = {}
        self.shopsId = {}
        if shops[id].equipment then
            table.insert(self.shops, 'Equipment')
            table.insert(self.shopsId, 5)
        end
        if shops[id].items then
            table.insert(self.shops, 'Items')
            table.insert(self.shopsId, 6)
        end
        table.insert(self.shops, 'back')
        table.insert(self.shopsId, 3)
    end,
    getItems = function(self, id)
        self.shopsItems = {}
        self.shopsItemsId = {}
        if shops[id].items then
            for i,v in ipairs(shops[id].items) do
                table.insert(self.shopsItems, items[v].name .. ' $' .. items[v].cost)
                table.insert(self.shopsItemsId, v)
            end
            table.insert(self.shopsItems, 'back')
        end
    end,
    getEquipment = function(self, id)
        self.shopsEquipment = {}
        self.shopsEquipmentId = {}
        if shops[id].equipment then
            for i,v in ipairs(shops[id].equipment) do
                table.insert(self.shopsEquipment, equipment[v].name .. ' $' .. equipment[v].cost)
                table.insert(self.shopsEquipmentId, v)
            end
            table.insert(self.shopsEquipment, 'back')
        end
    end,
    getDialog = function(self, id)
        self:getShop(id)
        self:getItems(id)
        self:getEquipment(id)
        return {
            [1] = {
                -- Main
                [1] = {
                    replay = true,
                    auto = true,
                    dialog = {
                        { '', {
                                nrows = 5, nvchs = 3,
                                choices = {'Buy', 'Sell', 'Leave'}
                            }
                        }
                    },
                    after = function(choice)
                        -- local id = self.shopsId[choice]
                        Event:goto('shop', 1, choice + 1)
                    end
                },
                -- Buy
                [2] = {
                    replay = true,
                    auto = true,
                    dialog = {
                        { '', {
                                nrows = 5, nvchs = #self.shops,
                                choices = self.shops
                            }
                        }
                    },
                    after = function(choice)
                        if choice == #self.shops then
                            Event:goto('shop', 1, 1)
                        else
                            local id = self.shopsId[choice]
                            Event:goto('shop', 1, id)
                        end
                    end
                },
                -- Sell
                [3] = {
                    replay = true,
                    auto = true,
                    dialog = {
                        { 'Sell stuff', {
                                nrows = 5, nvchs = #self.shopsItems,
                                choices = {'back'}
                            }
                        }
                    },
                    after = function(choice)
                        if choice == 1 then
                            Event:goto('shop', 1, 1)
                        end
                    end
                },
                -- Leave
                [4] = {
                    replay = true,
                    auto = true,
                    after = function()
                        Event:goto('shop', 1, 1)
                        ShopView:deactivate()
                    end
                },
                -- Equipment
                [5] = {
                    replay = true,
                    auto = true,
                    dialog = {
                        { '', {
                                nrows = 5, nvchs = #self.shopsEquipment,
                                choices = self.shopsEquipment
                            }
                        }
                    },
                    after = function(choice)
                        if choice == #self.shopsEquipment then
                            Event:goto('shop', 1, 2)
                        else
                            local equipment = self.shopsEquipmentId[choice]
                            Event:purchase('equipment', equipment)
                        end
                    end
                },
                -- Items
                [6] = {
                    replay = true,
                    auto = true,
                    dialog = {
                        { '', {
                                nrows = 5, nvchs = #self.shopsItems,
                                choices = self.shopsItems
                            }
                        }
                    },
                    after = function(choice)
                        if choice == #self.shopsItems then
                            Event:goto('shop', 1, 2)
                        else
                            local items = self.shopsItemsId[choice]
                            Event:purchase('items', items)
                        end
                    end
                },
            },
        }
    end
}


return ShopHelper
