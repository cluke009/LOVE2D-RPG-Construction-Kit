local Narration = {x=320, y = 30, alx='m',alxb='m',box = false,wbox = 600,}

return {
    [1] = {
        [1] = {
            replay = true,
            auto = false,
            dialog = {
                {'You probably need a key for this.', Narration}
            }
        },
        [2] = {
            replay = false,
            auto = false,
            dialog = {
                {'The GOLDEN KEY opens the shit out of this door!', Narration}
            },
            after = function()
                Event:removeObj(24, 'Obj', 'earth1')
            end
        }
    }
}
