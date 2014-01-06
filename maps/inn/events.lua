local Assets = require 'helpers.asset_helper'
local Event  = require 'helpers.event_helper'

local Bartender = {name='Bartender', face=love.graphics.newImage('assets/img/bradytime.png'),
                    face_x = 0, face_y= 0, x=30, y=245, wbox = 600, nrows=4, box_anim = false}

local AnimeGuy = {name='Anime Guy', face=love.graphics.newImage('assets/img/jesus.png'),
                    face_x = 0, face_y= 0, x=30, y=245, wbox = 600, nrows=4, box_anim = false}
return {
    [1] = {
        [1] = {
            -- NOTE: This event is attached to the bartender in the Inn.
            replay = false,
            auto = false,
            dialog = {
                { 'Hey there, you must be that fella that fell right outta the sky, eh?', Bartender },
                {'*Smiles and nods*', AnimeGuy},
                {'WELL, FUCK YOU.', Bartender },
                {'|:.|:.|:.', AnimeGuy},
                {'Just kidding. Thirsty?', Bartender },
                {'', {
                    face=love.graphics.newImage('assets/img/jesus.png'),
                    face_x = 0, face_y= 0, x=30, y=255, wbox=600, nrows=4,
                    nvchs=3, choices = { 'Sure!', 'Not really...', '...' }
                    }
                },
            },
            after = function(choice)
                if choice == 2 then
                    Event:goto('inn', 1, 2)
                elseif choice == 1 then
                    Event:goto('inn', 1, 3)
                elseif choice == 3 then
                    Event:goto('inn', 1, 4)
                end
            end
        },
        [2] = {
            -- Narrative - Bartender leaves.
            replay = false,
            auto = true,
            dialog = {
                {
                    '|n*...The Bartender storms off wielding his spatula like some sort of culinary lunatic.*',
                },
            },
            after = function()
                Event:removeObj(1, 'NPC', 'inn')
            end
        },
        [3] = {
            -- Dialogue
            replay = false,
            auto = true,
            dialog = {
                {
                    '|n*The man sitting next to you at the bar turns his head...*',
                }, {
                    'Fell outta the sky, huh?',
                    {name='Man at the Bar', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    '*Smiles and nods*',
                    {name='Anime Guy', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    'The outside world... been almost a year since I been back home. Where you from?',
                    {x=30, y=255, wbox = 600, nrows=4}
                }, {
                    '*Shakes head*',
                    {name='Anime Guy', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    'Don\'t remember? Musta taken a pretty good knock on the head. Probably better off not rememberin\' anyways, cause ya can\'t ever go back.',
                    {name='Man at the Bar', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    '*Shrugs*',
                    {name='Anime Guy', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    'Oh, so you think you can make it outta here?',
                    {name='Man at the Bar', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    '*Nods*',
                    {name='Anime Guy', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    'And how do you plan on doin\' that, Mr. Tough-Guy?',
                    {name='Man at the Bar', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    '*Points to the south*',
                    {name='Anime Guy', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    'Really now? Well... about time someone showed some guts around here. I thought about doin\' that myself, but they won\'t let you leave the town alone cause it\'s \'too dangerous.\'',
                    {name='Man at the Bar', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    'I bet they let the two of us go though, hell, they probably be excited to get ridda me fer awhile! Hahahahah!',
                    {name='Man at the Bar', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    'You ain\'t so bad. I admire your courage, kid, how about we bust outta here together?',
                    {name='Man at the Bar', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    '*Nods with approval*',
                    {name='Anime Guy', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    'An\' don\'t worry, I was a woodsman back home, so I know my way with an axe.',
                    {name='Man at the Bar', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    'Well, then, let\'s get this show on the road, whaddaya say?',
                    {name='Man at the Bar', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    '*Shakes head*',
                    {name='Anime Guy', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    '*The sweaty bartender hastily approaches, shakily handing you a bowl of what appears to be... |nBaby food?*',
                    {x=30, y=255, wbox = 600, nrows=4}
                }
            },
            after = function()
                -- Event:restoreObj(1, 'NPC', 'inn')
            end
        },
        [4] = {
            -- Process - Add Zu Zu Beans to inventory.
            -- Dialogue
            replay = false,
            auto = true,
            dialog = {
                {
                    'Here ya are! My signature Zu Zu Bean Soup! And, I couldn\'t help but over-hearin\' your conversation, so here are some extra beans to take for ya on your way. Best of luck.',
                    {name='Bartender', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    '*You have acquired Zu Zu Beans!*',
                    {name='Anime Guy', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    'Alright then, once you finish, let\'s get our stuff together and hit the trail.',
                    {name='Woodsman', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    '*Demolishes soup in record time!*',
                    {name='Anime Guy', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    'Well then, that didn\'t take long! Better make any preparations we need before we head out through the south.',
                    {name='Woodsman', x=30, y=255, wbox = 600, nrows=4}
                }, {
                    'WOODSMAN has joined your party!',
                    {x=30, y=255, wbox = 600, nrows=4}
                }
            },
            before = function()
                -- Event:restoreObj(1, 'NPC', 'inn')
                -- 'inventory, kind = item, op = put, id = 1',
            end,
            after = function()
                -- 'party, heroes = 2',
                Event:removeObj(8, 'NPC', 'inn')
            end
        },
    }
}
