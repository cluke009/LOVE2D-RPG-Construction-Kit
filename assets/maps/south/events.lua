local Guard = {name='Guard', face=love.graphics.newImage('assets/img/events/guardlax.png'),
              x=30, y=245, wbox=600, nrows=4,face_pos='r',}

local Narration = {x=320, y = 30, alx='m',alxb='m',box = false,wbox = 600,}

return {
    [1] = {
        [1] = {
            replay = true,
            auto = false,
            dialog = {
                {'NOPE. Not gonna happen.', Guard},
            }
        },
        [2] = {
            replay = false,
            auto = false,
            dialog = {
                {'Wow, dude. The fog has lifted. I\'ll let you through.', Guard}
            },
            after = function()
                Event:removeObj(21, 'Obj', 'south')
                Event:goto('south', 1, 3)
            end
        },
        [3] = {
            replay = false,
            auto = true,
            dialog = {
                {'The Gate is now gone!!!', Narration}
            },
            after = function()
                Event:goto('south', 1, 4)
            end
        },
        [4] = {
            replay = true,
            auto = false,
            dialog = {
                {'My job SUUUUUUUCKS.', Guard}
            }
        }
    },
    [2] = {
        [1] = {
            replay = true,
            auto = false,
            dialog = {
                {'"Southern Gate"', Narration}
            }
        }
    }
}
