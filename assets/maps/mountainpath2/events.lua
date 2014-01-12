local Bill =  		{name='Bill', face=love.graphics.newImage('assets/img/Woodsman.png'),
            		face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local AnimeGuy =    {name='Anime Guy', face=love.graphics.newImage('assets/img/AnimeGuy.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local Querina =     {name='Querina', face=love.graphics.newImage('assets/img/Querina1.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

return {
    [1] = {
        [1] = {
        	replay = false,
        	auto = true,
        	dialog = {
        		{'Is this that temple you were talkin\' about?', Bill},
        		{'Yep.', Querina},
        		{'So, what\'s in there?', AnimeGuy},
        		{'Well, they say the guardians of the land live in these temples.', Querina},
        		{'You think they could lift the fog?', Bill},
        		{'I dunno, I\'ve never seen or talked to one.', Querina},
        		{'Well, there\'s only one way to find out.', AnimeGuy},
        		-- {''},
        		-- {''},
        		-- {''},
        		-- {''},
        		-- {''},
        		-- {''},
        	},
        	after = function()
        	end
        },
        [2] = {
        },
    },
}
