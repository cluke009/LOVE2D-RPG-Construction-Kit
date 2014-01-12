
local AnimeGuy =    {name='Anime Guy', face=love.graphics.newImage('assets/img/AnimeGuy.png'),
                    face_border=false, face_pos='l', x=30, y=245, wbox = 600, nrows=4}

local Alan =        {name='Dr. Alan', face=love.graphics.newImage('assets/img/Alan1.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local AlanSmug =    {name='Dr. Alan', face=love.graphics.newImage('assets/img/Alan2.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local AlanConfused = {name='Dr. Alan', face=love.graphics.newImage('assets/img/Alan3.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local AlanDisgusted = {name='Dr. Alan', face=love.graphics.newImage('assets/img/Alan4.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local Tiffany = {name='Tiffany', face=love.graphics.newImage('assets/img/Tiffany1.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}
                    
local Narration = {x=320, y = 30, alx='m',alxb='m',box = false,wbox = 600,}

return {
    [1] = {
        [1] = {
            replay = false,
            auto = true,
            dialog = {
                {'Female voice... Are you... awake?', Narration},
                {'Oh my goodness Doctor Alan! You did it!', Tiffany},
                {'He\'s up already? DAMN, I\'M GOOD.', Alan,},
                {'You sit up in your bed, and looking around, you see a lovely blonde woman and a handsome doctor.', Narration},
                -- {'Looking around, he sees a lovely blonde woman in religious garb, and an undoubtedly handsome doctor.', {name='', x=30, y=245, wbox=600, nrows=4}},
                -- {'No homo.', {name='', x=30, y=245, wbox=600, nrows=4}},
                {'Oh my, be careful! How are you feeling, you poor thing?', Tiffany},
                { '',
                    {face=love.graphics.newImage('assets/img/AnimeGuy.png'),
                    face_border=false, face_pos='l', x=30, y=245, wbox=600, nrows=4,
                    nvchs=3, choices = { 'Hit on the blonde.', 'Hit on the doctor.', 'Ask where the hell you are.' }
                    }
                },
            },
            after = function(choice)
                if choice == 1 then
                    Event:goto('home', 1, 2)
                elseif choice == 2 then
                    Event:goto('home', 1, 3)
                elseif choice == 3 then
                    Event:goto('home', 1, 4)
                end
            end
        },
        [2] = {
            replay = false,
            auto = true,
            dialog = {
                {'... Well, more importantly, how are YOU feeling?', AnimeGuy},
                {'I\'m fine, silly!', Tiffany},
                {'Hey, HEY! Are you hitting on my woman?!', AlanDisgusted},
                {'Just kidding, I have three wives and none of them are her.|nSo, do you know where you are?', Alan},
                {'No. I don\'t remember much, besides crashing through a roof.', AnimeGuy},
            },
            after = function()
                Event:goto('home', 1, 4)
            end
        },
        [3] = {
            replay = false,
            auto = true,
            dialog = {
                {'I feel great, thanks to Dr. Alan.|n*Sly wink.*', AnimeGuy},
                {'OH MY GOD, ARE YOU HITTING ON ME?!', AlanDisgusted},
                {'KIDDING, it\'s okay. Happens all the time! I like girls, though...', Alan},
                {'Lots and lots of girls...', AlanSmug},
                {'YOU\'RE TELLING ME! TEE-HEE!|nSo, do you know where you are? What can you remember?', Tiffany},
                {'No. I don\'t remember much, besides crashing through a roof.', AnimeGuy},
            },
            after = function()
                Event:goto('home', 1, 4)
            end
        },
        [4] = {
            replay= false,
            auto = true,
            dialog = {
                {'Well, you\'re in the town church, which doubles as our infirmary. Actually, not a bad place to land!', Alan},
                {'I guess that\'s a good thing, then...', AnimeGuy},
                {'',
                    {
                        face=love.graphics.newImage('assets/img/AnimeGuy.png'), nvchs=2,
                        face_border=false, face_pos='l', x=30, y=245, wbox=600, nrows=4,
                        choices = { '...How long have I been here?', '...When can I go home?',}
                    }
                },
            },
            after = function(choice)
                if choice == 1 then
                    Event:goto('home', 1, 5)
                elseif choice == 2 then
                    Event:goto('home', 1, 7)
                end
            end
        },
        [5] = {
            replay = false,
            auto = true,
            dialog = {
                {'You\'ve only been here for a couple of days! You\'re a tough little guy!', Tiffany},
                {'Yeah, I mean, I AM pretty tough.', AnimeGuy},
                {'', {face=love.graphics.newImage('assets/img/AnimeGuy.png'),
                    face_border=false, face_pos='l', x=30, y=245, wbox=600, nrows=4,
                    nvchs=2, choices = { '...(She\'s into you. Be more forward.)', '...When can I go home?',}
                    }
                },
            },
            after = function(choice)
                if choice == 1 then
                    Event:goto('home', 1, 6)
                elseif choice == 2 then
                    Event:goto('home', 1, 7)
                end
            end
        },
        [6] = {
            replay = false,
            auto = true,
            dialog = {
                {'Could I stay here awhile? Maybe get to know you a little better?', AnimeGuy},
                {'You sort of have to!|nBut not like that. I can\'t date patients.', Tiffany},
                {'What do you mean I "sort of have to?"', AnimeGuy},
            },
            after = function()
                Event:goto('home', 1, 7)
            end
        },
        [7] = {
            replay = false,
            auto = true,
            dialog = {
                {'Well... That\'s the thing. You see, everyone is sort of stuck in this town.', Alan},
                {'Yeah, there\'s a DEATH-FOG surrounding the town right now!', Tiffany},
                {'A DEATH-FOG?!', AnimeGuy},
                {'Yeah, that\'s a fog that kills you. TOTALLY sucks.', AlanSmug},
                {'So, there is NOWHERE out of the town that isn\'t covered in this DEATH-FOG?', AnimeGuy},
                {'Actually, the area to the NORTH is not covered in the DEATH-FOG, but it is crawling with monsters and nobody is permitted to leave.', Alan},
                {'Hm, since the North is the only area not currently caked in this AWFUL DEATH-FOG, that\'s where I should check out.', AnimeGuy},
                {'OH MY GOD YOU GUYS, PLEASE STOP YELLING ABOUT THE DEATH-FOG!!', Tiffany},
                {'Oh no, we\'ve upset Tiffany. It\'s going to take hours of silence and ice cream to calm her down.', AlanConfused},
                {'I must care for her, but before you go North, you might want to check out the Inn. It\'s to the southeast of here, and it\'ll be a good idea to eat before you try leaving.', Alan},
                {'Thanks for everything. And, good luck with eating all of that ice cream in silence.', AnimeGuy},
                {'Thank you, sir. GODSPEED!', AlanSmug},
                },
            after = function()
            end
        },
        -- [8] = {},
        --         {'Now, now, Tiffany- I didn\'t really do anything. Besides bandage him up, push his broken limbs back into place, monitor him everyday, stop all of that blood from pouring out of his ears and administer my patented anti-coma brain massage.', Alan},
        --         {'*Shakes head*', AnimeGuy},
        --         {'Don\'t do that, though; I haven\'t drained your extra brain-fluid today. Oh, I also gave you an extra pancreas! I had a spare one lying around.', Alan},
        --         {'*SUPER CONFUSED LOOK*', AnimeGuy},
        --         {'And let me know if you start craving mulch.', AlanSmug},
        --         {'Why would he crave mulch?', Tiffany},
        --         {'No reason.', AlanConfused},
        --         {'So, how do you feel?', Alan},
        --         {'*Jumps up off the bed with one fist high in the air; upon landing he juts his arm downward in an energetic manner as some sort of victory fanfare music plays in the background.*', AnimeGuy},
        --         {'What in the hell is that?', Tiffany},
        --         {'Sounds like music from that Endless Ecstasy game. Never played it, but my roommate in college did. He never got laid. Poor guy.', AlanConfused},
        --         {'The music fades away as a bit of normalcy returns to the room.', {name='', x=30, y=245, wbox=600, nrows=4}},
        --         {'Must be feeling better.', Tiffany},
        --         {'Probably starving though, eh?', Alan},
        --         {'*Nods with vicious potency.*', AnimeGuy},
        --         {'Right. I think the extra pancreas makes you hungry. Or something. Or maybe...|n Maybe, it makes you horny...', AlanDisgusted},
        --         {'*Assumes a look of mild terror.*', AnimeGuy},
        --         {'WAIT, No, it makes you feel violently nauseous! Duh. Right, well, good luck with that. You might want something inside of you to forcibly vomit in unbearable pain later- trust me, it\'s WAY better than the dry-heaves.', AlanSmug},
        --         {'*Nods his head! Let’s do this!*', AnimeGuy},
        --         {'Excellent then! The Inn is to the southeast of here. It\'s the only real place to get food, because the Fog around town hasn\'t let up a bit and the murderous, demonic monster-spawn are still ravaging people who attempt to leave to the south, which is the only place not completely covered in the Fog\'s awful, suffocating death-mist.', Alan},
        --         {'So... HAVE FUN!', Tiffany}
        --     },
        -- },
    },
}

