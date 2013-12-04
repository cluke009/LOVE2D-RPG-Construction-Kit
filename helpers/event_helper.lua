--
-- Class: Event
-- Interface for Events.
--
local Event = {

    get = function(self, id)
        -- print('get')
        self.events = require('maps.' .. STATE.conf.map .. '.events')
        self:state(tonumber(id))
    end,
    -- Run code for events
    state = function(self, id)
        -- print('state')
        STATE.event[STATE.conf.map]     = STATE.event[STATE.conf.map] or {}
        STATE.event[STATE.conf.map][id] = STATE.event[STATE.conf.map][id] or {
            id = 1, activated = false, cycle = false
        }
        local eventId = STATE.event[STATE.conf.map][id]
        local e = self.events[id][eventId['id']]
        self:play(e, id, eventId)
    end,
    -- Check replay/autoplay logic
    play = function(self, e, id, eventId)
        -- print('play')
        if e.replay and e.auto then
            -- print('replay=true','auto=true')
            self:before(id, eventId['id'])
        elseif e.replay and not e.auto and the.keys:justPressed('return') then
            -- print('replay=true','auto=false')
            self:before(id, eventId['id'])
        elseif not e.replay and e.auto then
            -- print('replay=false','auto=true')
            if eventId.activated == false then
                eventId.activated = true
                self:before(id, eventId['id'])
            end
        elseif not e.replay and not e.auto and the.keys:justPressed('return') then
            -- print('replay=false','auto=false')
            if eventId.activated == false then
                eventId.activated = true
                self:before(id, eventId['id'])
            end
        end
    end,
    before = function(self, id, eventId)
        if self.events[id][eventId]['before'] then
            self.events[id][eventId]['before']()
        end

        self:dialog(id, eventId)
    end,
    dialog = function(self, id, eventId)
        -- print('dialog')
        if self.events[id][eventId]['dialog'] then
            local d = Dialog:new {
                dialog = self.events[id][eventId]['dialog']
            }
            d:activate()
            d.onDeactivate = function ()
                self:after(id, eventId)
            end
        else
            self:after(id, eventId)
        end
    end,
    after = function(self, id, eventId)
        if self.events[id][eventId]['after'] then
            self.events[id][eventId]['after']()
        end

        self:goto(id, eventId)
    end,
    goto = function(self, id, eventId)
        -- print('goto')
        local eventId = self.events[id][eventId]['goto']

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
    -- Remove Objects
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
    -- _removeObj = function(obj)
    --     if STATE.event.removeObj[STATE.conf.map] and STATE.event.removeObj[STATE.conf.map][obj.__class__] then
    --         if STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id] then
    --             -- Write image data to removeObj
    --             if not STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id][2] then
    --                 STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id] = {true, obj.solid, obj.image}
    --             elseif STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id][1] == false then
    --                 obj.solid = STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id][2]
    --                 obj.image = STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id][3]
    --                 STATE.event.removeObj[STATE.conf.map][obj.__class__][obj.id] = nil
    --                 -- table_print(STATE.event.removeObj)
    --             else
    --                 obj.solid = false
    --                 obj.image = 'assets/maps/img/trans.png'
    --             end
    --         end
    --     end
    -- end,
}

return Event
