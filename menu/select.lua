
local Menu  = require 'menu.menu'
local pretty = require 'pl.pretty'
local Select = Subview:new
{
    onActivate = function ( self )

        local links = {}

        for k, hero in pairs(STATE.heroes) do
            if hero['active'] then
                table.insert(links, {
                    name = '',
                    action = function()
                        local kind   = self.item.kind
                        local effect = self.item.effect
                        local key    = self.item.key
                        -- Apply effects
                        for i = 1, #effect do

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

                        -- TODO: Equip/remove item

                        -- Update inventory
                        if STATE.inventory[kind][key] == 1 then
                            STATE.inventory[kind][key] = nil
                        elseif STATE.inventory[kind][key] == nil then
                            self:deactivate()
                        else
                            STATE.inventory[kind][key] = STATE.inventory[kind][key] - 1
                        end


                        STATE.menu.update = true

                        self:remove(self.m)
                        self:deactivate()

                    end
                })
            end
        end


        self.m = Menu:new{
            x = 350,
            y = 20,
            width = 10,
            step = 100,
            items = links
        }
        self:add(self.m)

    end,
    onUpdate = function ( self )
        if the.keys:justPressed('escape') then
            self:remove(self.m)
            self:deactivate()
        end
    end
}
return Select
