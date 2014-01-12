local Narration = {x=320, y = 30, alx='m',alxb='m',box = false,wbox = 600,}

return {
    [1] = {
        [1] = {
            replay = true,
            auto = false,
            before = function ()
                if Event:getInventory('equipment', 2) then
                    Event:goto('earth2', 1, 2)
                end
            end,
            dialog = {
                {'It\'s a crack. I do not recommend smoking it.', Narration}
            }
        },
        [2] = {
            replay = false,
            auto = false,
            dialog = {
                {'You dig out a GOLDEN KEY.|nNow you can open the GOLDEN GATE!', Narration}
            },
            after = function()
                Event:removeObj(23, 'Obj', 'earth2')
            end
        }
    }
}
