_navi.template = {face_pos={x=0,y=0,z=true}, box_anim=false, x=30, y=245, wbox=600, wbox=600, alxb='l', alyb='t', nrows=4,}

local AnimeGuy   = {name = 'Anime Guy',  face = love.graphics.newImage('assets/img/animeguyfull.png')}
local AnimeGuyR  = {name = 'Anime Guy',  face = love.graphics.newImage('assets/img/animeguyfullr.png')}
local Bill       = {name = 'Bill',       face = love.graphics.newImage('assets/img/billfull.png')}
local BillR      = {name = 'Bill',       face = love.graphics.newImage('assets/img/billfullr.png')}
local Querina    = {name = 'Querina',    face = love.graphics.newImage('assets/img/querinafull.png')}
local QuerinaR   = {name = 'Querina',    face = love.graphics.newImage('assets/img/querinafullr.png')}
local Copernicus = {name = 'Copernicus', face = love.graphics.newImage('assets/img/copernicusfull.png')}
local Sherman    = {name = 'Sherman',    face = love.graphics.newImage('assets/img/shermanfullr.png')}
local Bartender  = {name = 'Bill Montana',  face = love.graphics.newImage('assets/img/murrayfull.png')}
local Bartender1 = {name = 'Bartender',  face = love.graphics.newImage('assets/img/murrayfull.png')}

local Narration =   {x=320, y = 30, alx='m',alxb='m',wbox = 600,box=false,face_pos = {x=0,y=0,z=true}, face=love.graphics.newImage('assets/img/events/narratebg.png')}

return {
    [1] = {
        [1] = {
            replay = false,
            auto   = false,
            dialog = {
                {'You hear a loud rumbling ahead of you?!', Narration},
            },
            after  = function()
                Event:removeObj(25, 'Obj', 'earth2')
            end,
        },
        [2] = {
            replay = false,
            auto = false
        }
    },
    [2] = {
        [1] = {
            replay = true,
            auto   = false,
            after  = function()
                Event:battle(1)
            end
        }
    },
    [3] = {
        [1] = {
            replay = true,
            auto   = true,
            dialog = {
                {'A huge, golden door.', Narration},
            },
            after= function()
                Event:goto('earth1', 3, 2)
            end
        },
        [2] = {
            replay = true,
            auto   = false,
            dialog = {
                {'A huge, golden door.', Narration},
            },
        }
    },
    [4] = {
        [1] ={
            replay = false,
            auto = true,
            dialog = {
                {'Light shines through a crack in the ceiling above.', Narration}
            },
            after= function()
                Event:goto('earth1', 4, 2)
            end
        },
        [2] ={
            replay = true,
            auto = false,
            dialog = {
                {'The light illuminates a floor plate that appears to be stuck.', Narration}
            }
        }
    },
    -- [5] = {
    --     [1] = {
    --         replay = true,
    --         auto = false,
    --         dialog = {
    --             {'A large switch.', Narration}
    --         }
    --     }
    -- }
}
