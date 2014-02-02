_navi.template  = {face_pos={x=0,y=0,z=true}, x=24, y=256, wbox=608, nrows=4, alxb='l', alyb='t', nrows=4,}

local lg = love.graphics

local Narration  = {x=320, y=30,         face = lg.newImage('assets/img/events/narratebg.png'), wbox=600, alx='m', alxb='m', nrows=2, box=false,}
local AnimeGuy   = {name = 'Anime Guy',  face = lg.newImage('assets/img/events/animeguyfull.png')}
local AnimeGuyR  = {name = 'Anime Guy',  face = lg.newImage('assets/img/events/animeguyfullr.png')}
local Bill       = {name = 'Bill',       face = lg.newImage('assets/img/events/billfull.png')}
local BillR      = {name = 'Bill',       face = lg.newImage('assets/img/events/billfullr.png')}
local Querina    = {name = 'Querina',    face = lg.newImage('assets/img/events/querinafull.png')}
local QuerinaR   = {name = 'Querina',    face = lg.newImage('assets/img/events/querinafullr.png')}

return {
    [1] = {
        [1] = {
            replay = false,
            auto = true,
            dialog = {
                {'Is this that temple you were talkin\' about?', Bill},
                {'Yep.', QuerinaR},
                {'So, what\'s in there?', AnimeGuy},
                {'Well, they say the guardians of the land live in these temples.', QuerinaR},
                {'You think they could lift the fog?', Bill},
                {'I dunno, I\'ve never seen or talked to one.', QuerinaR},
                {'Well, there\'s only one way to find out.', AnimeGuy},
            }
        }
    }
}
