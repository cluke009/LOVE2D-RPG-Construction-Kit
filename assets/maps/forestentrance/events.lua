_navi.template = {face_pos={x=0,y=0,z=true}, box_anim=false, x=30, y=245, wbox=600, wbox=600, alxb='l', alyb='t', nrows=4,}

local AnimeGuy   = {name = 'Anime Guy',  face = love.graphics.newImage('assets/img/animeguyfull.png')}
local AnimeGuyR  = {name = 'Anime Guy',  face = love.graphics.newImage('assets/img/animeguyfullr.png')}
local Bill       = {name = 'Bill',       face = love.graphics.newImage('assets/img/billfull.png')}
local BillR      = {name = 'Bill',       face = love.graphics.newImage('assets/img/billfullr.png')}
local Querina    = {name = 'Querina',    face = love.graphics.newImage('assets/img/querinafull.png')}
local QuerinaR   = {name = 'Querina',    face = love.graphics.newImage('assets/img/querinafullr.png')}
local Copernicus = {name = 'Copernicus', face = love.graphics.newImage('assets/img/copernicusfull.png')}
local Sherman    = {name = 'Sherman',    face = love.graphics.newImage('assets/img/shermanfullr.png')}
local Hogan      = {name = 'Cloaked Man',face = love.graphics.newImage('assets/img/hoganfull.png')}
local HoganR     = {name = 'Cloaked Man',face = love.graphics.newImage('assets/img/hoganfullr.png')}

local HoganTwo     = {name = 'Cloaked Man',face = {love.graphics.newImage('assets/img/hoganfull.png'), love.graphics.newImage('assets/img/hoganfullr.png')}}
local Narration =   {x=320, y = 30, alx='m',alxb='m',wbox = 600,box=false,face_pos = {x=0,y=0,z=true}, face=love.graphics.newImage('assets/img/events/narratebg.png')}


return {
    [1] = {
        [1] = {
        	replay = false,
        	auto = true,
            before = function()
                Event:battle(1)
            end,
        	dialog = {
        		{'Familiar voices can be heard amongst trees. Will you listen in?', Narration},
                { '',
                    {
                        face=love.graphics.newImage('assets/img/animeguyfullr.png'),
                        nvchs=2,
                        choices = { 'Yeah, let\'s hear what they\'re up to...', 'No, we\'re busy.'},
                    }
                }
            },
            after = function(choice)
                if choice == 1 then
                    Event:goto('forestentrance', 1, 2)
                elseif choice == 2 then
                    Event:goto('forestentrance', 1, 3)
                end
            end
        },
        [2] = {
        	replay = false,
        	auto = true,
        	dialog = {
        		{'Shhh. Let\'s listen in on these creeps...', AnimeGuyR}
        	},
        	after = function()
        		Event:goto('forestentrance', 1, 4)
        	end
        },
        [3] = {
        	replay = false,
        	auto = true,
        	dialog = {
        		{'Oh whatever! I wanna hear what they\'re talking about...', Querina}
        	},
        	after = function()
        		Event:goto('forestentrance', 1, 4)
        	end
        },
        [4] = {
        	replay = false,
        	auto = true,
        	dialog = {
                {'You hear the goblins speak...', Narration},
        		{'Well, we appear to be in quite the pickle now. What do you have to say for yourself?', Copernicus},
        		{'I can\'t believe you think this is my fault.', Sherman},
        		{'You convinced me to go on this silly adventure in the first place. Mother always said you were a terrible influence...', Copernicus},
        		{'What other choice did we have?', Sherman},
        		{'We should have asked them nicely.', Copernicus},
        		{'Ask them nicely?! We are GOBLINS. Nobody helps GOBLINS!', Sherman},
        		{'I suppose you are right. Still...', Copernicus},
        		{'It doesn\'t matter now. Now we must wait until they show up again.', Sherman},
        		{'And what if they don\'t show up?', Copernicus},
        		{'They will. They made it through the Northern Temple. And if not, then...', Sherman},
        		{'Then, I suppose I will come up with a new plan.', Sherman},
                {'Well, if that\'s the case, good luck finding another fairy...', Copernicus},
                {'True. Well, I am going to go over here to keep an eye out for them.', Sherman},
                {'I shall come with you!', Copernicus},
            },
            after = function()
                Event:goto('forestentrance', 1, 5)
            end
        },
        [5] = {
            before = function()
                Animate:moveObject('copernicus', {
                    {16, 10, 95},
                })
                Animate:moveObject('sherman', {
                    {16, 9, 95},
                })
            end,
            replay = false,
            auto = true,
            dialog = {
                {'', {wait=3,box = false}},
            },
            after = function()
                Event:goto('forestentrance', 1, 6)
            end
        },
        [6] = {
            replay = false,
            auto = true,
            dialog = {
                {'BY JOVE! It is those heroes we have spoken of!', Copernicus},
                {'Hand over your fairy, and we will show mercy upon you!', Sherman},
                {'Fuggit. Time to fight.', Narration},
                {'', {wait=1,box = false}},

            },
            after = function()

                Event:goto('forestentrance', 1, 7)
            end
        },
        [7] = {
            before = function()
                Animate:moveObject('copernicus', {
                    {33, 10, 195},
                })
                Animate:moveObject('sherman', {
                    {33, 9, 195},
                })
            end,
            replay = false,
            auto = true,
            dialog = {
                {'', {wait=2,box=false}},
                {'WE HAVE WHOOPED THE ASSES OF THESE UPSTART GOBLINS!', Bill},
                {'Oh my! DEFEATED AGAIN!', Sherman},
                {'LET US FLEE NOW! RETREAT! RETREAT!', Copernicus},
            },
            after = function()
                Event:removeObj(5, 'NPC', 'forestentrance')
                Event:removeObj(4, 'NPC', 'forestentrance')
                Event:removeObj(29, 'Obj', 'woodspath2')
            end
        }
    },
}


            -- before = function()
            --     Animate:moveObject('CloakedMan', {
            --         {10, 6, 95},
            --     })
            -- end,
