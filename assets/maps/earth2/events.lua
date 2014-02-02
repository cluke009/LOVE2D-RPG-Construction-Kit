_navi.template = {face_pos={x=0,y=0,z=true}, box_anim=false, x=30, y=245, wbox=600, wbox=600, alxb='l', alyb='t', nrows=4,}

local AnimeGuy   = {name = 'Anime Guy',  face = love.graphics.newImage('assets/img/events/animeguyfull.png')}
local AnimeGuyR  = {name = 'Anime Guy',  face = love.graphics.newImage('assets/img/events/animeguyfullr.png')}
local Bill       = {name = 'Bill',       face = love.graphics.newImage('assets/img/events/billfull.png')}
local BillR      = {name = 'Bill',       face = love.graphics.newImage('assets/img/events/billfullr.png')}
local Querina    = {name = 'Querina',    face = love.graphics.newImage('assets/img/events/querinafull.png')}
local QuerinaR   = {name = 'Querina',    face = love.graphics.newImage('assets/img/events/querinafullr.png')}
local Copernicus = {name = 'Copernicus', face = love.graphics.newImage('assets/img/events/copernicusfull.png')}
local Sherman    = {name = 'Sherman',    face = love.graphics.newImage('assets/img/events/shermanfullr.png')}
local Bartender  = {name = 'Bill Montana',  face = love.graphics.newImage('assets/img/events/murrayfull.png')}
local Bartender1 = {name = 'Bartender',  face = love.graphics.newImage('assets/img/events/murrayfull.png')}

local Narration =   {x=320, y = 30, alx='m',alxb='m',wbox = 600,box=false,face_pos = {x=0,y=0,z=true}, face=love.graphics.newImage('assets/img/events/events/narratebg.png')}

return {
    [1] = {
        [1] = {
            before = function()
                Event:removeObj(30, 'Obj', 'earth2')
            end,
            replay = false,
            auto = true,
            dialog = {
                {'You hear a loud rumbling from behind you as you step on the switch!', Narration},
            },
            after = function()
                Event:restoreObj(25, 'Obj', 'earth2')
            end
        }
    },
    [2] = {
        [1] = {
            replay= true,
            auto = false,
            dialog = {
                {'A sneaky door!', Narration}
            }
        }
    }
}

