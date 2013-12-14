local MenuHelper = require 'helpers.menu_helper'
local Party      = require 'views.menu.game.party_helper'
local Assets     = require 'helpers.asset_helper'

-- menu_game_highlight
Launch = Subview:new{
    party = Party:new(),
    fill = Tile:new{
        width  = 640,
        height = 360,
        image = 'assets/img/menu_game.png'
    },
    party_items_links = function (self)
        local links = {}
        if next(STATE.heroes) then
            for k, v in pairs(STATE.heroes) do
                if STATE.heroes[k].active then
                    table.insert(links, {
                        -- Assets:get('heroes', k, 'name'),
                        '',
                        function()
                            Assets:useItem(self.item, k)
                            self.items_menu:submenu(self.party_items_menu)
                            self:remove(self.items_menu)
                            self.items_menu = MenuHelper:new {
                                coord = {12,20,150,23,false},
                                items = self:items_links()
                            }
                            self:add(self.items_menu)
                            self.party_items_menu:deactivate(self.items_menu)
                            self.menu:submenu(self.items_menu)
                        end
                    })
                end
            end
        else
            links = false
        end
        return links
    end,
    party_equipment_links = function (self)
        local links = {}
        if next(STATE.heroes) then
            for k, v in pairs(STATE.heroes) do
                if STATE.heroes[k].active then
                    table.insert(links, {
                        -- Assets:get('heroes', k, 'name'),
                        '',
                        function()
                            self.menu.visible = false
                            self.party_equipment_menu:submenu(self.equipment_menu)
                            local hero = k
                            for k,v in pairs(STATE.heroes) do
                                if hero == k then
                                    self.hero = k
                                    local y = self.party['group' .. k]['image'].y
                                    self.party['group' .. k].translate.y = - y + 20
                                    self.party['stats'].id = k
                                    self.party:add(self.party['stats'])
                                    self.party.stats.visible = true
                                else
                                    self.party['group' .. k].visible = false
                                end
                            end
                        end
                    })
                end
            end
        else
            links = false
        end
        return links
    end,
    items_links = function (self)
        local links = {}
        if next(STATE.inventory.items) then
            for k, v in pairs(STATE.inventory.items) do
                table.insert(links, {
                    Assets:get('items', k, 'name') .. ' x' .. v,
                    function()
                        self.item = k
                        self.items_menu:submenu(self.party_items_menu)
                    end
                })
            end
        else
            links = {{}}
        end
        return links
    end,
    equipment_links = function (self)
        local links = {}
        if next(STATE.inventory.equipment) then
            for k, v in pairs(STATE.inventory.equipment) do
                table.insert(links, {
                    Assets:get('equipment', k, 'name') .. ' x' .. v,
                    function()
                        self.equipment = k
                        local itemType = Assets:get('equipment', k, 'kind')
                        local base = {}
                        if STATE.heroes[self.hero].equip[itemType] then
                            local effect = Assets:get('equipment', STATE.heroes[self.hero].equip[itemType], 'effect')
                            for k,v in pairs(effect) do
                                base[k] = STATE.heroes[self.hero].stats[k] - v
                                self.party.stats[k][1] = base[k]
                                self.party.stats[k][2] = {1,1,1}
                            end
                        end
                        local new = {}
                        local effect = Assets:get('equipment', k, 'effect')

                        for k,v in pairs(effect) do
                            if base[k] then
                                new[k] = base[k] + v
                            else
                                new[k] = STATE.heroes[self.hero].stats[k] + v
                            end
                            self.party.stats[k][1] = new[k]
                        end

                        -- Change font color to reflect new value
                        local tt = table.merge(base, new)
                        for k,v in pairs(tt) do
                            if new[k] and STATE.heroes[self.hero].stats[k] < new[k] then
                                self.party.stats[k][2] = {0,1,0}
                            elseif new[k] and STATE.heroes[self.hero].stats[k] > new[k] then
                                self.party.stats[k][2] = {1,0,0}
                            elseif base[k] and base[k] < STATE.heroes[self.hero].stats[k] then
                                self.party.stats[k][2] = {1,0,0}
                            elseif base[k] and base[k] > STATE.heroes[self.hero].stats[k] then
                                self.party.stats[k][2] = {0,1,0}
                            end
                        end

                        -- Adjust arrow height
                        if Assets:get('equipment', self.equipment, 'kind') == 'Weapon' then
                            self.equipment_sub_menu.h.y = 52
                        elseif Assets:get('equipment', self.equipment, 'kind') == 'Armor' then
                            self.equipment_sub_menu.h.y = 72
                        else
                            self.equipment_sub_menu.h.y = 92
                        end
                        self.equipment_menu:submenu(self.equipment_sub_menu)
                    end
                })
            end
        else
            links = {{}}
        end
        return links
    end,
    onNew = function(self)
        --
        -- Create static root menu
        --
        self.menu = MenuHelper:new {
            coord = {12,20,150,23,true},
            items = {
                {'Items', function() 
                    self.menu:submenu(self.items_menu) 
                    self.menu.visible = false
                    -- if self:party_items_links() then self.menu:submenu(self.party_items_menu) end
                end },
                {'Magic', function() print('Magic') end },
                {'Equipment', function() 
                    self.menu:submenu(self.party_equipment_menu)
                    -- if self:equipment_links() then self.menu:submenu(self.equipment_menu) end
                end },
                {'Status\n', function() print('Status') end },
                {'Config', function() print('Config') end },
                {'Save', function() print('Save') end },
            }
        }

        --
        -- Add static elements
        --
        self:add(self.fill)
        self:add(self.menu)
    end,
    onActivate = function(self)
        --
        -- Create dynamic child menus
        --
        self.items_menu = MenuHelper:new {
            coord = {12,20,150,23,false},
            items = self:items_links(),
        }
        self.equipment_menu = MenuHelper:new {
            coord = {12,20,150,23,false},
            items = self:equipment_links(),
            onDeactivate = function()
                for k,v in pairs(STATE.heroes) do
                    self.party['group' .. k].translate.y = 0
                    self.party['group' .. k].visible = true
                    self.party.stats.visible = false
                end
            end
        }
        self.party_items_menu = MenuHelper:new {
            coord = {182,10,450,120,false},
            items = self:party_items_links(),
        }
        self.party_equipment_menu = MenuHelper:new {
            coord = {182,10,450,120,false},
            items = self:party_equipment_links(),
        }
        
        self.equipment_sub_menu = MenuHelper:new {
            coord = {430,52,450,120,false},
            items = {{'',function (  )
                -- Update equipment menu
                Assets:equip(self.equipment, self.hero)
                self:remove(self.equipment_menu)
                self.equipment_menu = MenuHelper:new {
                    coord = {12,20,150,23,false},
                    items = self:equipment_links(),
                    onDeactivate = function()
                        for k,v in pairs(STATE.heroes) do
                            self.party['group' .. k].translate.y = 0
                            self.party['group' .. k].visible = true
                            self.party.stats.visible = false
                        end
                        self.menu.visible = true
                        self.party:remove(self.party['stats'])
                    end
                }

                self:add(self.equipment_menu)

                --  Relink parents
                self.menu:submenu(self.party_equipment_menu)
                self.party_equipment_menu:submenu(self.equipment_menu)
                self.equipment_menu:submenu(self.equipment_sub_menu)

                self.equipment_sub_menu:deactivate(self.equipment_menu)
            end}},
            onDeactivate = function()
                for k,v in pairs(STATE.heroes[self.hero].stats) do
                    self.party.stats[k] = {'', {1,1,1}}
                end
            end
        }
        
        --
        -- Add dynamic elements
        --
        self:add(self.party)
        self:add(self.items_menu)
        self:add(self.equipment_menu)
        self:add(self.party_items_menu)
        self:add(self.party_equipment_menu)
        self:add(self.equipment_sub_menu)
    end,
    onDeactivate = function(self)
        self:remove(self.party)
    end,
    onUpdate = function(self)
        if the.keys:justPressed('backspace') then
            self:deactivate()
        end
    end
}

return Launch
