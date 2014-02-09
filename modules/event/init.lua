--
-- Class: Event
-- Interface for Events.
--
local Event = {
    ----------------------------------------------------------------------------
    --
    -- Functions used to process events.
    --
    ----------------------------------------------------------------------------

    --
    -- Property: stack
    -- Table of method names and the order they should be run.
    --
    stack = {
        'play', 'before', 'dialog', 'after',
    },
    --
    -- Method: register
    -- Reorders stacks as they occur.
    -- Required to make stacks fire as part of the game loop.
    --
    register = function(self, arg, name, event)
        if name then
            self.map = name
            self.events = event
            -- print(self.events)
        else
            self.map = the.app.view.mapName
            self.events = require('assets.maps.' .. the.app.view.mapName .. '.events')
        end
        if self.stack[1] and self[self.stack[1]](self, arg) then
            -- print(self.stack[1])
            -- print('--------------------------------------------')
            table.insert(self.stack, self.stack[1])
            self.stack[1] = nil
            self.stack = table.reindex(self.stack)
        end
    end,
    --
    -- Method: play
    -- Write event data to the STATE table. Check replay/autoplay logic.
    -- Returns true if we can move to next item in stack.
    --
    play = function(self, id)
        -- print('play')
        id = tonumber(id)
        STATE.event[self.map]     = STATE.event[self.map] or {}
        STATE.event[self.map][id] = STATE.event[self.map][id] or {
            id = 1, activated = false, cycle = false
        }

        local eventId = STATE.event[self.map][id]
        local e = self.events[id][eventId['id']]

        if e.replay and e.auto then
            -- print('replay=true','auto=true')
            return true
        elseif e.replay and not e.auto and the.keys:justPressed('return') then
            -- print('replay=true','auto=false')
            return true
        elseif not e.replay and e.auto then
            -- print('replay=false','auto=true')
            if eventId.activated == false then
                eventId.activated = true
                return true
            end
        elseif not e.replay and not e.auto and the.keys:justPressed('return') then
            -- print('replay=false','auto=false')
            if eventId.activated == false then
                eventId.activated = true
                return true
            end
        end
    end,
    --
    -- Method: before
    -- Functions to be run before all other events
    --
    before = function(self, id)
        -- print('before')
        id = tonumber(id)
        local eventId = STATE.event[self.map][id]['id']
        if self.events[id][eventId]['before'] then
            self.events[id][eventId]['before']()
            return true
        else
            return true
        end
    end,
    --
    -- Method: dialog
    -- Triggers dialog if part of the event.
    --
    dialog = function(self, id)
        -- print('dialog')
        id = tonumber(id)
        local eventId = STATE.event[self.map][id]['id']
        if self.events[id][eventId]['dialog'] and not self.navi then
            self.navi = Navi:new{
                dialog = self.events[id][eventId]['dialog']
            }
            the.app.view:add(self.navi)
        elseif self.events[id][eventId]['dialog'] and self.navi.is_over then
            return true
        elseif not self.events[id][eventId]['dialog'] then
            return true
        end
    end,
    --
    -- Method: after
    -- Functions to be run after all other events.
    -- Passes navi choice number as an argument to the event "after" function.
    -- Destroys self.navi after completion.
    --
    after = function(self, id)
        -- print('after')
        id = tonumber(id)
        local eventId = STATE.event[self.map][id]['id']

        if self.events[id][eventId]['after'] and self.events[id][eventId]['dialog'] then
            self.events[id][eventId]['after'](self.navi.choice)
            self.navi = nil
            return true
        elseif self.events[id][eventId]['after'] then
            self.events[id][eventId]['after']()
            self.navi = nil
            return true
        else
            self.navi = nil
            return true
        end
    end,

    ----------------------------------------------------------------------------
    --
    -- Functions to be used inside events.
    --
    ----------------------------------------------------------------------------

    --
    -- Method: goto
    -- If one event triggers another we overwrite STATE with the new data.
    --
    goto = function(self, map, parent, child)
        -- print('goto')
        STATE.event[map] = STATE.event[map] or {}
        STATE.event[map][parent] = {
            id = child,
            activated = false,
            cycle = false
        }
    end,
    map = function(self, map, x, y)
        -- Load our map
        the.app.view = MapView:new
        {
            player  = Hero,
            mapDir  = 'assets/maps/',
            mapName = map,
            playerX = x * 32,
            playerY = y * 32,
        }
        -- table_print(STATE)
        -- Move foreground layer up
        if the.app.view.foreground then
            the.app.view:moveToFront(the.app.view.foreground)
        end
        the.app.view:flash({0, 0, 0}, .75)
    end,
    --
    -- Method: cutscene
    -- Loads a cutscene.
    -- Pass through function. Exposed here for simplicity (hopefully).
    --
    cutscene = function ( self, cutscene, anim )
        local Cutscene  = require 'helpers.cutscene_helper'
        Cutscene(cutscene, anim)
    end,
    --
    -- Method: shop
    -- Opens up a shop with the supplied ID.
    --
    -- Require:
    -- - 'view.shop.shop_view'
    --
    shop = function ( self, id )
        -- ShopView.mapName = the.app.view.mapName
        ShopView.id = id
        ShopView:activate()
    end,
    --
    -- Method: battle
    -- Manually trigger a battle.
    --
    battle = function(self, id)
        BattleView.config = require('assets.maps.' .. the.app.view.mapName .. '.config')
        BattleView.enemyGroup = BattleView.config['encounters']['scripted'][id]
        BattleView:activate()
    end,
    --
    -- Method: party
    -- Add character to party
    --
    party = function(self, id)
        STATE.heroes[id].active = true
    end,
    --
    -- Method: restore
    -- Restores MP/HP
    --
    restore = function ( self, options )
        if options.hp == 'true' then
            local hero = STATE.heroes
            for i,v in ipairs(hero) do
                if v.active == true then
                    hero[i].stats.hp = hero[i].stats.hpmax
                end
            end
            the.app.view:flash({ 255, 0, 0 }, .75)
        end
        if options.mp == 'true' then
            local hero = STATE.heroes
            for i,v in ipairs(hero) do
                if v.active == true then
                    hero[i].stats.mp = hero[i].stats.mpmax
                end
            end
            the.app.view:flash({ 0, 0, 255 }, .75)
        end
    end,
    --
    -- Method: useItem
    -- Use item and update STATE.inventory
    --
    -- Arguments:
    --      itemID - The ID of the object to use.
    --      ... - The property to use
    --
    -- Returns:
    --      nothing
    --  TODO: remove calls to this function
    --
    useItem = function(self, itemID, heroID)
        itemID = tonumber(itemID)
        if STATE.inventory['items'][itemID] == 1 then
            STATE.inventory['items'][itemID] = nil
        elseif STATE.inventory['items'][itemID] == nil then
            -- self:deactivate()
        else
            STATE.inventory['items'][itemID] = STATE.inventory['items'][itemID] - 1
        end
        -- TODO: apply effects of item to hero?
        local effect = items[itemID]['effect']
        for i = 1, #effect do
            local stat = effect[i][1]
            local value = effect[i][2]
            local sHero = STATE.heroes[heroID].stats[stat]

            if string.find(stat, 'max', -3) then
                STATE.heroes[heroID].stats[stat] = sHero + value
            elseif STATE.heroes[heroID].stats[stat .. 'max'] and sHero + value > STATE.heroes[heroID].stats[stat .. 'max'] then
                STATE.heroes[heroID].stats[stat] = STATE.heroes[heroID].stats[stat .. 'max']
            else
                STATE.heroes[heroID].stats[stat] = sHero + value
            end
        end
    end,
    --
    -- Method: getInventory
    -- Check for item or equipment in inventory
    --
    getInventory = function(self, kind, ID)
        ID = tonumber(ID)
        if STATE['inventory'][kind][ID] == nil then
            return false
        else
            return STATE['inventory'][kind][ID]
        end
    end,
    --
    -- Method: putInventory
    -- Add item or equipment to inventory
    --
    putInventory = function(self, kind, ID, amount)
        ID = tonumber(ID)
        amount = amount or 1
        if STATE['inventory'][kind][ID] == nil then
            STATE['inventory'][kind][ID] = amount
        else
            STATE['inventory'][kind][ID] = STATE['inventory'][kind][ID] + amount
        end
    end,
    --
    -- Method: deleteInventory
    -- Remove item or equipment to inventory
    --
    deleteInventory = function(self, kind, ID, amount)
        ID = tonumber(ID)
        amount = amount or 1
        if not STATE.inventory[kind][ID] or STATE.inventory[kind][ID] - amount <= 0 then
            STATE.inventory[kind][ID] = nil
        else
            STATE.inventory[kind][ID] = STATE.inventory[kind][ID] - amount
        end
        return STATE.inventory[kind][ID]
    end,
    --
    -- Method: purchase
    -- Remove item or equipment to inventory
    --
    purchase = function(self, kind, ID, amount)
        ID = tonumber(ID)
        amount = amount or 1
        if STATE.inventory.gold - (_G[kind][ID]['cost'] * amount) >= 0 then
            self:putInventory(kind, ID, amount)
            STATE.inventory.gold = STATE.inventory.gold - (_G[kind][ID]['cost'] * amount)
            return true
        else
            return false
        end
    end,
    --
    -- Method: equipped
    -- Retrieve currently equipped items.
    --
    -- Arguments:
    --      heroID - The ID of the object to get.
    --      ... - The property to get
    --
    -- Returns:
    --      string or table
    --
    equipped = function(self, heroID, ...)
        local data = {}
        if STATE.heroes[heroID].equip then
            local i = 1
            for k, v in pairs(STATE.heroes[heroID].equip) do
                if arg[1] and equipment[v] then
                    data[i] = equipment[v][arg[1]]
                else
                    data[i] = equipment[v]
                end
                i = i + 1
            end
        end

        return data
    end,
    --
    -- Method: equip
    -- Equip equipment to hero
    --
    equip = function(self, ID, heroID, ...)
        -- Remove equipment, subtract stats and put back in inventory.
        local itemType = self:get('equipment', ID, 'kind')
        if STATE.heroes[heroID].equip[itemType] then
            local effect = self:get('equipment', STATE.heroes[heroID].equip[itemType])['effect']
            for k,v in pairs(effect) do
                STATE.heroes[heroID].stats[k] = STATE.heroes[heroID].stats[k] - v
            end
            self:putInventory('equipment', STATE.heroes[heroID].equip[itemType])
        end

        -- Equip item, add stats and remove from inventory.
        STATE.heroes[heroID].equip[itemType] = ID
        self:deleteInventory('equipment', ID)

        local effect = self:get('equipment', ID)['effect']
        for k,v in pairs(effect) do
            STATE.heroes[heroID].stats[k] = STATE.heroes[heroID].stats[k] + v
        end
    end,
    --
    -- Method: removeObj
    -- Registers an object in the STATE to be removed from the game map.
    --
    removeObj = function(self, id, kind, map)
        if not STATE.event.removeObj[map] then
            STATE.event.removeObj[map] = {}
            if not STATE.event.removeObj[map][kind] then
                STATE.event.removeObj[map][kind] = {}
                if not STATE.event.removeObj[map][kind][id] then
                    STATE.event.removeObj[map][kind][id] = {true}
                end
            end
        elseif not STATE.event.removeObj[map][kind] then
            STATE.event.removeObj[map][kind] = {}
            if not STATE.event.removeObj[map][kind][id] then
                STATE.event.removeObj[map][kind][id] = {true}
            end
        else
            STATE.event.removeObj[map][kind][id] = {true}
        end
    end,
    --
    -- Method: restoreObj
    -- Restores an object to the map
    --
    restoreObj = function(self, id, kind, map)
        if STATE.event.removeObj[map] and STATE.event.removeObj[map][kind][id] then
            STATE.event.removeObj[map][kind][id][1] = false
        end
    end,
    --
    -- Method: checkObj
    -- Checks the STATE to see if an object should not be drawn.
    --
    checkObj = function(self, obj)
        if STATE.event.removeObj[the.app.view.mapName] and STATE.event.removeObj[the.app.view.mapName][obj.__class__] then
            if STATE.event.removeObj[the.app.view.mapName][obj.__class__][obj.id] then
                -- Write image data to removeObj
                if not STATE.event.removeObj[the.app.view.mapName][obj.__class__][obj.id][2] then
                    STATE.event.removeObj[the.app.view.mapName][obj.__class__][obj.id] = {true, obj.solid, obj.image}
                elseif STATE.event.removeObj[the.app.view.mapName][obj.__class__][obj.id][1] == false then
                    obj.solid = STATE.event.removeObj[the.app.view.mapName][obj.__class__][obj.id][2]
                    obj.image = STATE.event.removeObj[the.app.view.mapName][obj.__class__][obj.id][3]
                    STATE.event.removeObj[the.app.view.mapName][obj.__class__][obj.id] = nil
                else
                    obj.solid = false
                    obj.image = 'assets/img/objs/clear.png'
                end
            end
        end
    end,
}

return Event

