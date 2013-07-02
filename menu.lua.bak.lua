local pretty    = require 'pl.pretty'
local items     = require 'assets.tables.items'
local equipment = require 'assets.tables.equipment'
local weapons   = require 'assets.tables.weapons'

local menu = {}
local Menu, Items, Equip, Party, Equipment, Weapons, Heroes

Menu = Group:extend
{
    items = {},
    selected = 1,
    highlight = function (self)
        self.h.y = self.y + 10 + (self.selected - 1) * self.fheight
        if self.items[self.selected].hover then
            self.items[self.selected]:hover()
        end
    end,
    onNew = function (self)
        self.h = Fill:new{
            x = self.x,
            y = self.y + 10,
            width = self.width,
            height = self.fheight,
            fill = {0, 255, 255, 100}
        }
        self:add(self.h)
        for i,value in ipairs(self.items) do
            self:add(Text:new{
                x = self.x + 10,
                y = self.y + 10 + (i - 1) * self.fheight,
                width = self.width - 20,
                tint = {0,0,0},
                font = 24,
                text = self.items[i]['name']
            })
        end
        self:highlight()
    end,
    onUpdate = function (self)
        if the.keys:justPressed('up') then
            if self.selected > 1 then
                self.selected = self.selected - 1
            else
                self.selected = #self.items
            end
            self:highlight()
        elseif the.keys:justPressed('down') then
            if self.selected < #self.items then
                self.selected = self.selected + 1
            else
                self.selected = 1
            end
            self:highlight()
        elseif the.keys:justPressed('return') then
            if self.items[self.selected].action then
                self.items[self.selected]:action()
            end
        end
    end
}


Party = Group:extend
{
    ready = true,
    onUpdate = function (self)
        if self.ready == true then
            for k, hero in pairs(STATE.heroes) do
                if hero['active'] then
                    self:add(Tile:new{
                        x = 0,
                        y = 0 + (k - 1) * 100,
                        width = 32,
                        height = 32,
                        image = hero.image
                    })
                    self:add(Text:new{
                        x = 32,
                        y = 0 + (k - 1) * 100,
                        width = 100,
                        tint = {0,0,0},
                        font = 24,
                        text = hero.name
                    })
                    self:add(Text:new{
                        x = 150,
                        y = 0 + (k - 1) * 100,
                        width = 100,
                        tint = {0,0,0},
                        font = 24,
                        text = 'Level ' .. hero.stats.level
                    })


                    self:add(Text:new{
                        x = 32,
                        y = 32 + (k - 1) * 100,
                        width = 100,
                        tint = {0,0,0},
                        font = 24,
                        text = 'HP ' .. hero.stats.hp .. '/' .. hero.stats.hpmax
                    })

                    self:add(Text:new{
                        x = 150,
                        y = 32 + (k - 1) * 100,
                        width = 100,
                        tint = {0,0,0},
                        font = 24,
                        text = 'MP ' .. hero.stats.mp .. '/' .. hero.stats.mpmax
                    })

                    print(hero.image)
                end
            end
        end
                    -- self:add(Text:new{
                    --     x = 0,
                    --     y = 0,
                    --     width = 100,
                    --     tint = {0,0,0},
                    --     font = 24,
                    --     text = 'hero.name'
                    -- })
        self.ready = false



        -- self.h = Fill:new{
        --     x = self.x,
        --     y = self.y + 10,
        --     width = self.width,
        --     height = 24,
        --     fill = {0, 255, 255, 100}
        -- }
        -- self:add(self.h)
        -- for i,value in ipairs(self.items) do
        --     self:add(Text:new{
        --         x = self.x + 10,
        --         y = self.y + 10 + (i - 1) * 24,
        --         width = self.width - 20,
        --         tint = {0,0,0},
        --         font = 24,
        --         text = self.items[i]['name']
        --     })
        -- end

    end,
}



Heroes = Subview:new
{
    onActivate = function ( self )

        local links = {}

        for k, hero in pairs(STATE.heroes) do
            if hero['active'] then
                table.insert(links, {
                    name = hero.name,
                    action = function()
                        local kind   = self.item.kind
                        local effect = self.item.effect
                        local key    = self.item.key

                        -- Apply effects
                        for i = 1, #effect do
-- pretty.dump(STATE.heroes[k].stats)

                            local stat  = effect[i][1]
                            local value = effect[i][2]
                            local sHero = STATE.heroes[k].stats[stat]

                            if string.find(stat, 'max', -3) then
                                STATE.heroes[k].stats[stat] = sHero + value
                            elseif STATE.heroes[k].stats[stat .. 'max'] and sHero + value > STATE.heroes[k].stats[stat .. 'max'] then
                                STATE.heroes[k].stats[stat] = STATE.heroes[k].stats[stat .. 'max']
                            else
                                STATE.heroes[k].stats[stat] = sHero + value
                            end

                        end
-- pretty.dump(STATE.heroes[k].stats)
                        -- TODO: Equip/remove item

                        -- Update inventory
                        if STATE.inventory[kind][key] == 1 then
                            STATE.inventory[kind][key] = nil
                        elseif STATE.inventory[kind][key] == nil then
                            self:remove(self.group)
                            self:deactivate()
                            Items.ready = true
                            Equip.ready = true
                        else
                            STATE.inventory[kind][key] = STATE.inventory[kind][key] - 1
                        end
                    end
                })
            end
        end

        self.group = Group:new{
            onNew = function ( self )
                self:add(Fill:new{
                    x = 150,
                    y = 100,
                    width = 500,
                    height = 450,
                    fill = {255, 255, 255, 125}
                })
                self:add(Text:new{
                    x = 160,
                    y = 525,
                    width = 480,
                    tint = {0,0,0},
                    font = 16,
                    text = '"enter" to use "esc" to cancel'
                })
                self:add(Menu:new{
                    x = 150,
                    y = 150,
                    width = 500,
                    height = 500,
                    items = links
                })
            end
        }

        self:add(self.group)

    end,
    onUpdate = function ( self )
        if the.keys:justPressed('escape') then
            self:remove(self.group)
            self:deactivate()
            Items.ready = true
            Equip.ready = true
        end
    end
}
Items = Subview:new
{
    ready = true,
    onUpdate = function ( self )
        if self.ready == true then
            self:add(Fill:new{
                x = 150,
                y = 50,
                width = 500,
                height = 500,
                fill = {255, 255, 255, 120}
            })
            local t = Text:new{
                x = 160,
                y = 60,
                width = 480,
                tint = {0,0,0},
                font = 24,
            }
            if next(STATE.inventory.item) then
                local links = {}
                for k,v in pairs(STATE.inventory.item) do
                    table.insert(links, {
                        name = items[k].name .. ' x' .. v,
                        hover = function()
                            t.text = items[k].desc
                        end,
                        action = function()
                            Heroes.item = items[k]
                            Heroes.item['key'] = k
                            Heroes.item['kind'] = 'item'
                            Heroes:activate()

                            self:remove(self.m)
                        end
                    })
                end

                self.m = Menu:new{
                    x = 150,
                    y = 150,
                    width = 500,
                    height = 500,
                    items = links
                }
                self:add(self.m)
            else
                t.text = 'No items.'
            end
            self:add(t)
            self.ready = false
        end

        if the.keys:justPressed('escape') then
            self.ready = true
            self:remove(self.m)
            self:deactivate()
        end
    end
}

Equip = Subview:new
{
    ready = true,
    onUpdate = function ( self )
        if self.ready == true then
            self:add(Fill:new{
                x = 150,
                y = 50,
                width = 500,
                height = 500,
                fill = {255, 255, 255, 120}
            })
            local t = Text:new{
                x = 160,
                y = 60,
                width = 480,
                tint = {0,0,0},
                font = 24,
            }
            if next(STATE.inventory.equipment) then
                local links = {}
                for k,v in pairs(STATE.inventory.equipment) do
                    table.insert(links, {
                        name = equipment[k].name .. ' x' .. v,
                        hover = function()
                            t.text = equipment[k].desc
                        end,
                        action = function()
                            Heroes.item = equipment[k]

                            Heroes.item['key'] = k
                            Heroes.item['kind'] = 'equipment'
                            Heroes:activate()

                            self:remove(self.m)
                        end
                    })
                end

                self.m = Menu:new{
                    x = 150,
                    y = 150,
                    width = 500,
                    height = 500,
                    items = links
                }
                self:add(self.m)
            else
                t.text = 'No equipment.'
            end
            self:add(t)
            self.ready = false
        end

        if the.keys:justPressed('escape') then
            self.ready = true
            self:remove(self.m)
            self:deactivate()
        end
    end
}

menu.Launch = Subview:new
{
    onNew = function (self)
        self:add(Fill:new{
            x = 250,
            y = 200,
            width = 300,
            height = 200,
            fill = {255, 255, 255, 255}
        })

        self:add(Menu:new{
            x = 250,
            y = 200,
            width = 300,
            height = 200,
            fheight = 24,
            items = {
                {
                    name = 'Items',
                    action = function()
                        Items:activate()
                    end,
                },
                {
                    name = 'Equip',
                    action = function()
                        Equip:activate()
                    end,
                },
            }
        })
        self:add(Party:new())
    end,
    onUpdate = function ( self )
        if the.keys:justPressed('escape') then
            self:deactivate()
        end
    end
}

return menu
