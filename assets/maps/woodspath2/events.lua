_navi.template = {face_pos={x=0,y=0,z=true}, box_anim=false, x=30, y=245, wbox=600, wbox=600, alxb='l', alyb='t', nrows=4,}


local AnimeGuy   = {name = 'Anime Guy',  face = love.graphics.newImage('assets/img/animeguyfull.png')}
local AnimeGuyR  = {name = 'Anime Guy',  face = love.graphics.newImage('assets/img/animeguyfullr.png')}
local Bill       = {name = 'Bill',       face = love.graphics.newImage('assets/img/billfull.png')}
local BillR      = {name = 'Bill',       face = love.graphics.newImage('assets/img/billfullr.png')}
local Querina    = {name = 'Querina',    face = love.graphics.newImage('assets/img/querinafull.png')}
local QuerinaR   = {name = 'Querina',    face = love.graphics.newImage('assets/img/querinafullr.png')}
local Copernicus = {name = 'Copernicus', face = love.graphics.newImage('assets/img/Copernicus1.png')}
local Sherman    = {name = 'Sherman',    face = love.graphics.newImage('assets/img/Sherman1.png')}
local Hogan      = {name = 'Cloaked Man',face = love.graphics.newImage('assets/img/hoganfull.png')}
local HoganR     = {name = 'Cloaked Man',face = love.graphics.newImage('assets/img/hoganfullr.png')}

local HoganTwo     = {name = 'Cloaked Man',face = {love.graphics.newImage('assets/img/hoganfull.png'), love.graphics.newImage('assets/img/hoganfullr.png')}}


-- Anime Guy Left Talk, Bill Right
local AnimeBill    = {name = 'Anime Guy',   face = {love.graphics.newImage('assets/img/animefull.png'), love.graphics.newImage('assets/img/billdullr.png')}}
-- Anime Guy Left, Bill Right Talk
local AnimeBill2    = {name = 'Bill',   face = {love.graphics.newImage('assets/img/animedull.png'), love.graphics.newImage('assets/img/billfullr.png')}}


-- Bill Left Talking, Anime Guy Right
local BillAnime    = {name = 'Bill',       face = {love.graphics.newImage('assets/img/billfull.png'), love.graphics.newImage('assets/img/animedullr.png')}}
-- Bill Left, Anime Guy Right Talk
local BillAnime2    = {name = 'Anime',       face = {love.graphics.newImage('assets/img/billdull.png'), love.graphics.newImage('assets/img/animefullr.png')}}


-- Anime Guy Left Talk, Querina Right
local AnimeQuerina = {name = 'Anime Guy',   face = {love.graphics.newImage('assets/img/animefull.png'), love.graphics.newImage('assets/img/querinadullr.png')}}
-- Anime Guy Left, Querina Right Talk
local AnimeQuerina2 = {name = 'Querina',   face = {love.graphics.newImage('assets/img/animedull.png'), love.graphics.newImage('assets/img/querinafullr.png')}}


-- Querina Left Talk, Anime Guy Right
local QuerinaAnime = {name = 'Querina',    face = {love.graphics.newImage('assets/img/querinafull.png'), love.graphics.newImage('assets/img/animedullr.png')}}
-- Querina Left, Anime Guy Right Talk
local QuerinaAnime2 = {name = 'Anime Guy',    face = {love.graphics.newImage('assets/img/querinadull.png'), love.graphics.newImage('assets/img/animefullr.png')}}


-- Querina Left Talk, Bill Right
local QuerinaBill  = {name = 'Querina',    face = {love.graphics.newImage('assets/img/querinafull.png'), love.graphics.newImage('assets/img/billdullr.png')}}
-- Querina Left, Bill Right Talk
local QuerinaBill2 = {name = 'Bill',       face = {love.graphics.newImage('assets/img/querinadull.png'), love.graphics.newImage('assets/img/billfullr.png')}}


-- Bill Left Talk, Querina Right
local BillQuerina  = {name = 'Bill',       face = {love.graphics.newImage('assets/img/billfull.png'), love.graphics.newImage('assets/img/querinadullr.png')}}
-- Bill Left, Querina Right Talk
local BillQuerina2  = {name = 'Querina',       face = {love.graphics.newImage('assets/img/billdull.png'), love.graphics.newImage('assets/img/querinafullr.png')}}


local Narration =   {x=320, y = 30, alx='m',alxb='m',wbox = 600,box=false,face_pos = {x=0,y=0,z=true}, face=love.graphics.newImage('assets/img/events/narratebg.png')}

return {
    [1] = {
        [1] = {
            replay = true,
            auto = true,
            dialog = {
                {'Strewn amongst the foliage and feebled trees are small statues of fairies. Some of them are wearing sombreros, while others have on panchos. Broken maracas litter the ground. Querina hurriedly flutters over to a statue; her face is somber.', Narration},
                {'Oh my GAWD! Ernesto!', Querina},
                {'Querina hugs what appears to be a small statue of a fairy. She has tears running down her cheeks.', Narration},
                {'You know him?', QuerinaBill2},
                {'He\'s my brother...', QuerinaBill},
                {'I\'m sorry. What the hell happened here?', QuerinaBill2},
                {'I think... I think the fog got them. I couldn\'t get it lifted here fast enough...', QuerinaBill},
                {'I thought that the fog just killed you.', QuerinaAnime2},
                {'Fairies are different.', QuerinaAnime},
                {'This is awful. Can we change them back?', QuerinaAnime2},
                {'A mysterious voice emanates from behind a tree.', Narration},
                {'You can. If you can get rid of the Evil Moon, BROTHER.', Narration}
            },
            after = function()
                Event:goto('woodspath2', 1, 2)
            end
        },

        -- Just to move the cloaked guy
        [2] = {
            before = function()
                Animate:moveObject('CloakedMan', {
                    {10, 6, 95},
                })
            end,
            replay = false,
            auto = true,
            dialog = {
                {'', {wait=3,box = false}},
            },
            after = function()
                Event:goto('woodspath2', 1, 3)
            end
        },
        -- End of moving the cloaked guy

        [3] = {
            replay = false,
            auto = true,
            dialog = {
                {'AND IT IS VERY EVIL, BROTHER!', HoganTwo},
                {'You\'re talking about that big ol\' orb thing in the sky, right?', Bill},
                {'It\'s not an orb, it\'s a moon, BROTHER.', HoganR},
                -- {''},
                -- {''},
            },
            after = function()
            end
                -- {''},
                -- {''},
                -- {''},
                -- {''},
                -- {''},
        }
    }
}
