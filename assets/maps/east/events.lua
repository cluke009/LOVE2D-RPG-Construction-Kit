_navi.template = {face_pos={x=0,y=0,z=true}, box_anim=false, x=30, y=245, wbox=600, wbox=600, alxb='l', alyb='t', nrows=4,}
local lg = love.graphics
local Narration =   {x=320, y = 30, alx='m',alxb='m',wbox = 600,box=false,face_pos = {x=0,y=0,z=true}, face=love.graphics.newImage('assets/img/events/narratebg.png')}
local AnimeGuy   = {name = 'Anime Guy',  face = love.graphics.newImage('assets/img/animeguyfull.png')}
local AnimeGuyR  = {name = 'Anime Guy',  face = love.graphics.newImage('assets/img/animeguyfullr.png')}
local Bill       = {name = 'Bill',       face = love.graphics.newImage('assets/img/billfull.png')}
local BillR      = {name = 'Bill',       face = love.graphics.newImage('assets/img/billfullr.png')}
local Querina    = {name = 'Querina',    face = love.graphics.newImage('assets/img/querinafull.png')}
local QuerinaR   = {name = 'Querina',    face = love.graphics.newImage('assets/img/querinafullr.png')}
local Guard     = {name = 'Eastern Guard',face = love.graphics.newImage('assets/img/guardlaxfull.png')}

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
                Event:removeObj(11, 'Obj', 'east')
                Event:goto('east', 1, 3)
            end
        },
        [3] = {
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
                {'"Eastern Gate"', Narration}
            }
        }
    }
}
