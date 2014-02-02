local Narration = {x=320, y = 30, alx='m',alxb='m',box = false,wbox = 600,}

return {
    [1] = {
        [1] = {
            before = function()

            end,
            replay = false,
            -- dialog = {{'test', Narration}},
            auto = true,
            after = function()
                Event:removeObj(6, 'NPC', 'earth4')
                Event:goto('earth4', 1, 2)
            end
        },
        [2] = {
            replay = false,
            auto = true,
        }
    },
    [2] = {
        [1] = {
            replay = false,
            auto = false,
            dialog = {
                {'THIS IS THE PART WHERE WE FIGHT EACH OTHER.', Narration}
            },
            after = function()
                Event:goto('earth4', 2, 2)
            end
        },
        [2] = {
            replay = false,
            auto = true,
            dialog = {
                {'But now we cool. Go check out that floating, psychadelic Prince head over there.', Narration}
            },
            after = function()
                Event:goto('south', 1, 2)
                Event:restoreObj(6, 'NPC', 'earth4')
            end
        }
    },
    [3] = {
        [1] = {
            replay = true,
            auto = false,
            dialog = {
                {'You want some pancakes, or you maybe wanna teleport or something?', Narration}
            },
            after = function ()
                Event:map('town', 11, 11)
            end
        }
    }
}
