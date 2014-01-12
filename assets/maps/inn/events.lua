
local AnimeGuy =    {name='Anime Guy', face=love.graphics.newImage('assets/img/AnimeGuy.png'),
                    face_border=false, face_pos='l', x=30, y=245, wbox = 600, nrows=4}

local Bartender =   {name='Bartender', face=love.graphics.newImage('assets/img/Bartender.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local WhiskyBill =  {name='Lumberjack', face=love.graphics.newImage('assets/img/Woodsman.png'),
                    face_border=false, face_pos='r', x=30, y=245, wbox = 600, nrows=4}

local Narration = {x=320, y = 30, alx='m',alxb='m',box = false,wbox = 600,}

return {
    [1] = {
        [1] = {
            -- NOTE: This event is attached to the bartender in the Inn.
            replay = false,
            auto = false,
            dialog = {
                -- {'Hey there, you must be that fella that fell right outta the sky, eh?', Bartender},
                -- {'*Smiles and nods*', AnimeGuy},
                -- {'WELL, FUCK YOU.', Bartender},
                -- {'|:.|:.|:.', AnimeGuy},
                -- {'Just kidding. Thirsty?', Bartender},
                { '',
                    {face=love.graphics.newImage('assets/img/AnimeGuy.png'),
                    face_border=false, face_pos='l', x=30, y=245, wbox=600, nrows=4,
                    nvchs=3, choices = { 'Sure!', 'Not really...', '...' }
                    }
                },
            },
            after = function(choice)
                if choice == 1 then
                    Event:goto('inn', 1, 2)
                elseif choice == 2 then
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
            before = function()
            end,
            dialog = {
                {'I\'ll be right back with your ALCOHOL, then.', Bartender},
                {'*...The Bartender turns off and heads towards the kitchen. He mutters something that sounds like \'muckin trunk\' as he opens the door.*', Narration}
            },
            after = function()
                Animate:moveObject('Bartender', {
                    {15, 3, 190},
                })
                Event:goto('inn', 1, 5)
            end
        },
        [3] = {
            -- Narrative - Bartender leaves.
            replay = false,
            auto = true,
            dialog = {
                {'FINE.', Bartender},
                {'I\'ll go drink by myself...', Bartender},
                {'|n*...Tears can be seen in the bartender\'s eyes as he holds back sniffles and runs into the kitchen.*', {name='', x=30, y=245, wbox=600, nrows=4}}
            },
            after = function()
                Animate:moveObject('Bartender', {
                    {15, 3, 190},
                })
                Event:goto('inn', 1, 5)
            end
        },
        [4] = {
            -- Narrative - Bartender leaves.
            replay = false,
            auto = true,
            before = function()
                Animate:moveObject('Bartender', {
                    {15, 3, 190},
                })
            end,
            dialog = {
                {'WELL THEN, WHAT THE HELL DO YOU NEED ME FOR?!', Bartender},
                {'|n*...The Bartender storms off wielding his spatula like some sort of culinary lunatic.*', Narration}
            },
            after = function()
                Event:goto('inn', 1, 5)
            end
        },
        [5] = {
            -- Dialogue
            replay = false,
            auto = true,
            before = function()
                Event:removeObj(3, 'NPC', 'inn')
            end,
            dialog = {
                {'|n*The man sitting next to you at the bar turns his head...*', Narration},
                {'Fell outta the sky, huh?', WhiskyBill},
                {'*Smiles and nods*', AnimeGuy},
                {'The outside world... been almost a year since I been back home. Where you from?', WhiskyBill},
                {'*Shakes head*', AnimeGuy},
                {'Don\'t remember? Musta taken a pretty good knock on the head. Probably better off not rememberin\' anyways, cause ya can\'t ever go back.', WhiskyBill},
                {'*Shrugs*', AnimeGuy},
                {'Oh, so you think you can make it outta here?', WhiskyBill},
                {'*Nods*', AnimeGuy},
                {'And how do you plan on doin\' that, Mr. Tough-Guy?', WhiskyBill},
                {'*Points to the south*', AnimeGuy},
                {'Really now? Well... about time someone showed some guts around here. I thought about doin\' that myself, but they won\'t let you leave the town alone.', WhiskyBill},
                {'I bet they let the two of us go though, hell, they probably be excited to get ridda me fer awhile! Hahahahah!', WhiskyBill},
                {'You ain\'t so bad. I admire your courage, kid, how about we bust outta here together?', WhiskyBill},
                {'*Nods with approval*', AnimeGuy},
                {'An\' don\'t worry, I was a woodsman back home, so I know my way with an axe.', WhiskyBill},
                {'Well, then, let\'s get this show on the road, whaddaya say?', WhiskyBill},
                {'*Shakes head*', AnimeGuy},
                {'*The sweaty bartender hastily approaches, shakily handing you a bowl of what appears to be... Baby food?*', Narration}
            },
            after = function()
                Event:restoreObj(3, 'NPC', 'inn')
                Event:goto('inn', 1, 6)
            end
        },
        [6] = {
            -- Process - Add Zu Zu Beans to inventory.
            -- Dialogue
            replay = false,
            auto = true,
            dialog = {
                {'Here ya are! My signature Zu Zu Bean Soup! And, I couldn\'t help but over-hearin\' your conversation, so here are some extra beans to take for ya on your way. Best of luck.', Bartender},
                {'*You have acquired Zu Zu Beans!*', {name='', x=30, y=245, wbox = 600, nrows=4}},
                {'Alright then, once you finish, let\'s get our stuff together and hit the trail.', WhiskyBill},
                {'*Demolishes soup in record time!*', AnimeGuy},
                {'Well then, that didn\'t take long! Better make any preparations we need before we head out through the south.', WhiskyBill},
                {'WHISKY BILL has joined your party!', {x=30, y=245, wbox = 600, nrows=4}}
            },
            after = function()
                Event:putInventory('items', 1)
                Event:removeObj(8, 'NPC', 'inn')
                Event:party(2)
                Event:goto('north', 1, 2)
            end
        },
    }
}
