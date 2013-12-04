--
-- Class: Event
-- Interface for Events.
--
local Event = {
    --
    -- Property: stack
    -- Table of methods and the order they should be run.
    --
    stack = {
        'play', 'before', 'dialog', 'after', 'goto',
    },
    --
    -- Method: register
    -- Reorders stacks as they occur.
    -- Required to make stacks fire as part of the game loop.
    --
    register = function (self, arg )
        -- if Play we must wait for user input
        if self.stack[1] ~= 'play' then
            table.insert(self.stack, self.stack[1])
            self[self.stack[1]](self, arg)
            self.stack[1] = nil
            self.stack = table.reindex(self.stack)
        elseif self:play(arg) then
            table.insert(self.stack, self.stack[1])
            self[self.stack[1]](self, arg)
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
        print('play')
        id = tonumber(id)
        STATE.event[STATE.conf.map]     = STATE.event[STATE.conf.map] or {}
        STATE.event[STATE.conf.map][id] = STATE.event[STATE.conf.map][id] or {
            id = 1, activated = false, cycle = false
        }

        self.events = require('maps.' .. STATE.conf.map .. '.events')
        local eventId = STATE.event[STATE.conf.map][id]
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
        print('before')
        id = tonumber(id)
        local eventId = STATE.event[STATE.conf.map][id]['id']
        if self.events[id][eventId]['before'] then
            self.events[id][eventId]['before']()
        end
    end,
    --
    -- Method: dialog
    -- Triggers dialog if part of the event.
    --
    dialog = function(self, id)
        print('dialog')
        id = tonumber(id)
        local eventId = STATE.event[STATE.conf.map][id]['id']

        if self.events[id][eventId]['dialog'] then
            local d = Dialog:new {
                dialog = self.events[id][eventId]['dialog']
            }
            d:activate()
        end
    end,
    --
    -- Method: after
    -- Functions to be run after all other events
    --
    after = function(self, id)
        print('after')
        id = tonumber(id)
        local eventId = STATE.event[STATE.conf.map][id]['id']

        if self.events[id][eventId]['after'] then
            self.events[id][eventId]['after']()
        end
    end,
    --
    -- Method: goto
    -- If one event triggers another we overwrite STATE with the new data.
    --
    goto = function(self, id)
        print('goto')
        id = tonumber(id)
        local eventId = STATE.event[STATE.conf.map][id]['id']
        eventId = self.events[id][eventId]['goto']

        if eventId then
            STATE.event[eventId[1]] = STATE.event[eventId[1]] or {}
            STATE.event[eventId[1]][eventId[2]] = {
                id = eventId[3],
                activated = false,
                cycle = false
            }
            -- Rerun if true and states match
            -- if eventId[4] and eventId[1] == STATE.conf.map then
            --     self:get(id)
            -- end
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
        elseif not STATE.event.removeObj[map][kind][id] then
            STATE.event.removeObj[map][kind][id] = {true}
        end
    end,
    --
    -- Method: checkObj
    -- Checks the STATE to see if an object should not be drawn.
    --
    checkObj = function(self, obj)
        if STATE.event.removeObj[STATE.conf.map] and STATE.event.removeObj[STATE.conf.map][obj.__class__] then
            if STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id] then
                -- Write image data to removeObj
                if not STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id][2] then
                    STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id] = {true, obj.solid, obj.image}
                elseif STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id][1] == false then
                    obj.solid = STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id][2]
                    obj.image = STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id][3]
                    STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id] = nil
                else
                    obj.solid = false
                    obj.image = 'assets/maps/img/trans.png'
                end
            end
        end
    end,
}



function test( ... )
    -- body
end

test()
return Event

