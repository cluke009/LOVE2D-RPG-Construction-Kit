local event   = require 'assets.tables.events'
local Trigger = require 'triggers'

--
-- Class: Event
-- Interface for Events.
--
local Event = {
    --
    -- Method: init
    -- Initialize event code.
    --
    init = function(self, eventID)
        local ID = tonumber(eventID)
        local e = event[ID]

        local currentEvent, continue
        currentEvent, continue = self:register(ID)

        if e[currentEvent].dialog then
            local d = Dialog:new{
                dialog = e[currentEvent].dialog
            }
            -- Cycle dialog
            if e[currentEvent].cycle and not STATE.event[ID].cycle then
                -- table_print(e[currentEvent])
                d = Dialog:new{
                    dialog = {e[currentEvent].dialog[1]}
                }
                STATE.event[ID].cycle = 2
            elseif STATE.event[ID].cycle then
                local cycleID = STATE.event[ID].cycle
                d = Dialog:new{
                    dialog = {e[currentEvent].dialog[cycleID]}
                }
                if #e[currentEvent].dialog > STATE.event[ID].cycle then
                    STATE.event[ID].cycle = STATE.event[ID].cycle + 1
                else
                    STATE.event[ID].cycle = 1
                end
            end

            d.onDeactivate = function()
                if e[currentEvent].func then
                    self:trigger(e, currentEvent)
                end
            end
            d:activate()
        elseif e[currentEvent].func then
            self:trigger(e, currentEvent)
        end
        return continue
    end,
    --
    -- Method: trigger
    -- Run triggers.lua for event
    --
    trigger = function(self, e, currentEvent )
        local options = split(e[currentEvent].func, ',')
        local func = options[1]
        options[1] = nil

        local args = {}
        for k,v in pairs(options) do
            local a = split(v, '=')
            args[string.trim(a[1])] = string.trim(a[2])
        end
        Trigger[func](self, args)
    end,
    --
    -- Method: register
    --
    register = function(self, ID)
        local a, e, ret1, ret2
        if not STATE.event[ID] then
            STATE.event[ID] = {
                id = 1,
                activated = true,
                cycle = false
            }
            ret1, ret2 = 1, _
        elseif STATE.event[ID] then
            ret1, ret2 = STATE.event[ID]['id'], _
        end
        if event[ID][STATE.event[ID]['id']].trigger then
            a = event[ID][STATE.event[ID]['id']].trigger
            e = string.split(a)

            --  Write trigger to DB
            if ID == tonumber(e[1]) then
                -- If trigger shares same parent we return current id before overwriting STATE
                local cur = STATE.event[ID]['id']
                STATE.event[tonumber(e[1])] = {
                    id = tonumber(e[2]),
                    activated = false,
                    cycle = false
                }

                ret1, ret2 =  cur, e[3]
            else
                STATE.event[tonumber(e[1])] = {
                    id = tonumber(e[2]),
                    activated = false,
                    cycle = false
                }
            end
        end
        return ret1, ret2
    end,
    --
    -- Method: get
    -- Retrieve an event object.
    --
    get = function(self, ID)
        return event[tonumber(ID)]
    end,
}

return Event
