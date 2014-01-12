local AnimeGuy =    {name='Anime Guy', face=love.graphics.newImage('assets/img/AnimeGuy.png'),
                    face_border=false, face_pos='l', x=30, y=245, wbox = 600, nrows=4}

local Bill =  {name='Bill', face=love.graphics.newImage('assets/img/Woodsman.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local Guard = {name='Guard', face=love.graphics.newImage('assets/img/guardlax.png'),
              x=30, y=245, wbox=600, nrows=4,face_pos='r',}

local Narration = {x=320, y = 30, alx='m',alxb='m',box = false,wbox = 600,}

return {
    [1] = {
        [1] = {
            replay = true,
            auto = false,
            dialog = {
                {'Zzzzzz.....zz.....zzzZzz....', Guard},
                {'The old guard is sleeping.', AnimeGuy},
            },
            after = function()
            end
        },
        [2] = {
            replay = false,
            auto = false,
            dialog = {
                {'Watch this.', Bill},
                {'|nBill tosses a mug of ale at the sleeping guard\'s face.', Narration},
                {'Oh, hey Bill! What\'s up?', Guard},
                {'Nothing. Let us through', Bill},
                {'You know I can\'t do that. There\'s monsters and stuff out here!|nGRRR!', Guard},
                {'Yeah, but I have that guy that fell from the sky with me. He\'s a protagonist. Look at his hair and stuff.', Bill},
                {'Oh damn! You are absolutely right! Alright man, I\'ll open the gate up for you. But, be careful.', Guard},
                {'Alrighty then, you guys have fun with all your leveling up and such.', Guard},
                {'*sigh* Kids these days...', Guard}
            },
            after = function()
                Event:removeObj(20, 'Obj', 'north')
            end
        }
    },
    [2] = {
        [1] = {
            replay = true,
            auto = false,
            dialog = {
                {'"NORTHERN GATE"', Narration},
            },
            after = function()
            end
        },
    }
}
