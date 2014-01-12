
local AnimeGuy =    {name='Anime Guy', face=love.graphics.newImage('assets/img/AnimeGuy.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local Bill =        {name='Bill', face=love.graphics.newImage('assets/img/Woodsman.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local Querina =     {name='Querina', face=love.graphics.newImage('assets/img/Querina1.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local Copernicus =  {name='Copernicus', face=love.graphics.newImage('assets/img/Copernicus1.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local Sherman =     {name='Sherman', face=love.graphics.newImage('assets/img/Sherman1.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local CMystery =    {name='First Voice', face=love.graphics.newImage('assets/img/CMystery.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local SMystery =    {name='Second Voice', face=love.graphics.newImage('assets/img/SMystery.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local Narration =   {x=320, y = 30, alx='m',alxb='m',box = false,wbox = 600,}

return {

    [1] = {
        [1] = {
            -- NOTE:\n Initiated upon entering Mountain Path 1 for the first time.
            replay = false,
            auto = true,
            before = function()
                local bgm = love.audio.newSource("assets/sound/Game 8.mp3", "stream")
                bgm:setLooping(true)
                love.audio.play(bgm)
            end,
            dialog = {
                {'*Up ahead, voices can be heard amongst the trees...*', Narration},
                {'No, no, listen to me. She is not Cuban, you can tell from the way she pronounces her \'R\'s.', CMystery},
                {'I understand this, Copernicus, but I don\'t quite think you\'re listening to me.', SMystery},
                {'Judging from the make of those maracas, with their handles that are QUITE OBVIOUSLY native to Cuba, circa 1944, there can be no misgivings here.', SMystery},
                {'Well, then Sherman, how do you explain the clearly Aztec designs upon her pancho?', Copernicus},
                {'They\'re fashionable.', Sherman},
                {'FASHIONABLE! HAR-HAR! You really are a hoot! Anyways, how should we cook her?', Copernicus},
                {'We can\'t cook her, silly. We need her to find our way to the temple!', Sherman},
                {'*In a whisper:*|nOh yes, Sherman, I know this. But, we must keep her frightened or she won\'t cooperate with us.', Copernicus},
                {'Right, right. Ahem, so... WELL THERE MY FELLOW, FEARSOME GOBLIN- HOW SHALL WE COOK THIS DELICIOUS, FRIGHTENED, LITTLE PIXIE?!', Sherman},
                {'*Muffled sounds can be heard emanating from a small burlap sack beside a roasting fire.*', Narration},
                {'You hear that? Maybe we should go help that pixie out.', Bill},
                { '',
                    {face=love.graphics.newImage('assets/img/AnimeGuy.png'),
                    face_border=false, face_pos='l', x=30, y=255, wbox=600, nrows=4,
                    nvchs=3, choices = { 'YEAH!', 'I guess. She can get us to a temple...', 'Nah. Fuck that slut.' }
                    }
                },
            },
            after = function(choice)
                -- if choice == 1 then
                --     Event:goto('mountainpath1', 1, 2)
                -- elseif choice == 2 then
                --     Event:goto('mountainpath1', 1, 3)
                -- elseif choice == 3 then
                --     Event:goto('mountainpath1', 1, 4)
                -- end
                -- Event:removeObj(4, 'NPC', 'mountainpath1')

                Animate:moveObject('Sherman', {
                    {8, 1, 190},
                })
                Animate:moveObject('Copernicus', {
                    {10, 1, 190},
                })
            end
        },
    },
    [2] = {
        [1] = {
            -- NOTE:\n Initiated after successfully completing battle in 1.3a.
            replay = false,
            auto = true,
            dialog = {
                {'Oh my goodness! Thank you boys so much! You just saved my life!', Querina},
                {'Oh, it\'s no problem.', AnimeGuy},
                {'Yeah, I hate goblins. And I hate argyle.', Bill},
                {'Yeah, who doesn\'t hate argyle?', Querina},
                {'Hippies....', Bill},
                {'Right. Well, I\'ll just get going then.', Querina},
                {'Where are you off to?', AnimeGuy},
                {'I\'m off to the temple up here on top of the mountain. How about you guys?', Querina},
                {'Umm... errr... We\'re going to the same place, actually.', Bill},
                {'What a coincidence! We should all travel together!', Querina},
                {'Anime Guy: *Dialog Choice* Always ends with her joining though. Ta-da!', AnimeGuy},
            },
            before = function(choice)
                Event:removeObj(4, 'NPC', 'mountainpath1')
                Event:removeObj(5, 'NPC', 'mountainpath1')
            end
        },
    },
}
