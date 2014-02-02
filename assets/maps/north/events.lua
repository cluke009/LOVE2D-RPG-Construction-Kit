_navi.template  = {face_pos={x=0,y=0,z=true}, x=24, y=256, wbox=608, nrows=4, alxb='l', alyb='t', nrows=4,}

local lg = love.graphics

local Narration  = {x=320, y=30,             face = lg.newImage('assets/img/narratebg.png'), wbox=600, alx='m', alxb='m', nrows=2, box=false,}
local AnimeGuy   = {name = 'Anime Guy',      face = lg.newImage('assets/img/animeguyfull.png')}
local AnimeGuyR  = {name = 'Anime Guy',      face = lg.newImage('assets/img/animeguyfullr.png')}
local Bill       = {name = 'Bill',           face = lg.newImage('assets/img/billfull.png')}
local BillR      = {name = 'Bill',           face = lg.newImage('assets/img/billfullr.png')}
local Querina    = {name = 'Querina',        face = lg.newImage('assets/img/querinafull.png')}
local QuerinaR   = {name = 'Querina',        face = lg.newImage('assets/img/querinafullr.png')}
local Copernicus = {name = 'Copernicus',     face = lg.newImage('assets/img/copernicusfull.png')}
local Sherman    = {name = 'Sherman',        face = lg.newImage('assets/img/shermanfullr.png')}
local Hogan      = {name = 'Cloaked Man',    face = lg.newImage('assets/img/hoganfull.png')}
local Guard      = {name = 'Northern Guard', face = lg.newImage('assets/img/guardlaxfull.png')}
local GuardBeer  = {name = 'Northern Guard', face = lg.newImage('assets/img/guardlaxbeer.png'), box_anim=false,}
local GuardBeer2 = {name = 'Northern Guard', face = lg.newImage('assets/img/guardlaxbeer2.png'), box_anim=false,}
local GuardBeer3 = {name = 'Northern Guard', face = lg.newImage('assets/img/guardlaxbeer3.png'), box_anim=false,}
local GuardBeer4 = {name = 'Northern Guard', face = lg.newImage('assets/img/guardlaxbeer4.png'), box_anim=false,}
local GuardD     = {name = 'Northern Guard', face = lg.newImage('assets/img/guardlaxd.png')}

return {
    [1] = {
        [1] = {
            replay = true,
            auto   = false,
            dialog = {
                {'Zzzzzz.....zz.....zzzZzz....', Guard},
                {'The old guard is sleeping.', AnimeGuy},
            },
        },
        [2] = {
            replay = false,
            auto   = false,
            dialog = {
                {'Watch this.', Bill},
                {'', GuardD, {wait=3, box=false}},
                {'', GuardBeer, {wait=3, box=false}},
                {'', GuardBeer2, {wait=3, box=false}},
                {'', GuardBeer3, {wait=3, box=false}},
                {'The freshly awoken guard manages to get most of the beer off of his face.|n|nMost.', Narration},
                {'Oh, hey Bill! What\'s up?', GuardBeer4},
                {'Nothing. Let us through', Bill},
                {'You know I can\'t do that. There\'s monsters and stuff out here!|nGRRR!', GuardBeer4},
                {'Yeah, but I have that guy that fell from the sky with me. He\'s a protagonist. Look at his hair and stuff.', Bill},
                {'Oh damn! You are absolutely right! Alright man, I\'ll open the gate up for you. But, be careful.', GuardBeer4},
            },
            after = function()
                Event:goto('north', 1, 3)
            end
        },
        [3] = {
            replay = false,
            auto   = true,
            before = function()
                Animate:moveObject('northguard', {
                    {18, 18, 95},
                })
            end,
            dialog = {
                {'', {wait=1.25,box = false}},
            },
            after = function()
                Event:goto('north', 1, 4)
            end
        },
        [4] = {
            replay = false,
            auto   = true,
            before = function()
                Event:removeObj(20, 'Obj', 'north')
            end,
            dialog = {
                {'The gate disappears!', Narration},
            },
            after = function()
                Event:goto('north', 1, 5)
            end
        },
        [5] = {
            replay = false,
            auto   = true,
            before = function()
                Animate:moveObject('northguard', {
                    {18, 22, 95},
                })
            end,
            dialog = {
                {'', {wait=1.45,box=false}},
                {'Alrighty then, you guys have fun with all your leveling up and such.', GuardBeer4},
            },
            after = function()
                Event:goto('north', 1, 6)
            end
        },
        [6] = {
            replay = true,
            auto   = false,
            dialog = {
                {'*sigh* Kids these days... OH! DON\'T FORGET YOUR POTIONS!!', GuardBeer4}
            },
        }
    },
    [2] = {
        [1] = {
            replay = true,
            auto   = false,
            dialog = {
                {'"NORTHERN GATE"', Narration},
            },
        },
    }
}
