local lg = love.graphics

_navi.template  = {face_pos={x=0,y=0,z=true}, x=24, y=256, wbox=608, nrows=4, alxb='l', alyb='t', nrows=4,}

local Narration  = {x=320, y=30,           face = lg.newImage('assets/img/events/events/narratebg.png'), wbox=600, alx='m', alxb='m', nrows=2, box=false,}
local AnimeGuy   = {name = 'Anime Guy',    face = lg.newImage('assets/img/events/events/animeguyfull.png')}
local AnimeGuyR  = {name = 'Anime Guy',    face = lg.newImage('assets/img/events/events/animeguyfullr.png')}
local Bill       = {name = 'Bill',         face = lg.newImage('assets/img/events/events/billfull.png')}
local BillR      = {name = 'Bill',         face = lg.newImage('assets/img/events/events/billfullr.png')}
local Querina    = {name = 'Querina',      face = lg.newImage('assets/img/events/events/querinafull.png')}
local QuerinaR   = {name = 'Querina',      face = lg.newImage('assets/img/events/events/querinafullr.png')}
local Copernicus = {name = 'Copernicus',   face = lg.newImage('assets/img/events/events/copernicusfull.png')}
local Sherman    = {name = 'Sherman',      face = lg.newImage('assets/img/events/events/shermanfullr.png')}
local Bartender  = {name = 'Bill Montana', face = lg.newImage('assets/img/events/events/murrayfull.png')}

return {
    [1] = {
        [1] = {
            -- NOTE: This event is attached to the bartender in the Inn.
            replay = false,
            auto   = false,
            dialog = {
                {'Hey there, I\'m Bill Mu...', Bartender},
                {'Bill Montana. My name is Bill Montana. Did you happen to just fall out of the sky?', Bartender},
                {'Yeah buddy.', AnimeGuy},
                {'WELL, FUCK YOU.', Bartender},
                {'|:.|:.|:.', AnimeGuy},
                {'Sorry. I have this thing that\'s sort of like a cross between tourettes and alcoholism -|nI get piss-ass drunk and then swear at everyone. Had it since puberty.', Bartender},
                {'So, ya thirsty?', Bartender},
                { '', {
                        name = 'Anime Guy', nrows = 5, nvchs = 3,
                        face = lg.newImage('assets/img/events/events/animeguyfullr.png'),
                        choices = { 'Sure!', 'Not really...', '...' }
                    }
                }
            },
            after = function(choice)
                if choice == 1 then
                    Event:goto('inn', 1, 2)
                elseif choice == 2 then
                    Event:goto('inn', 1, 3)
                elseif choice == 3 then
                    Event:goto('inn', 1, 4)
                end
            end,
        },
        [2] = {
            -- Narrative - Bartender leaves.
            replay = false,
            auto   = true,
            before = function()
                Animate:moveObject('Bartender', {
                    {15, 3, 95},
                })
            end,
            dialog = {
                {'I\'ll be right back with your ALCOHOL, then.', Bartender},
                {'*...The Bartender turns off and heads towards the kitchen. He mutters something that sounds like \'muckin trunk\' as he opens the door.*', Narration}
            },
            after = function()
                Event:goto('inn', 1, 5)
            end,
        },
        [3] = {
            -- Narrative - Bartender leaves.
            replay = false,
            auto   = true,
            before = function()
                Animate:moveObject('Bartender', {
                    {15, 3, 95},
                })
            end,
            dialog = {
                {'FINE.', Bartender},
                {'I\'ll go drink by myself...', Bartender},
                {'|n*...Tears can be seen in the bartender\'s eyes as he holds back sniffles and runs into the kitchen.*', Narration}
            },
            after = function()
                Event:goto('inn', 1, 5)
            end
        },
        [4] = {
            -- Narrative - Bartender leaves.
            replay = false,
            auto   = true,
            before = function()
                Animate:moveObject('Bartender', {
                    {15, 3, 95},
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

            replay = false,
            auto   = true,
            before = function()
                Event:removeObj(3, 'NPC', 'inn')
            end,
            -- dialog = {{''}},
            after = function()
                Event:goto('inn', 1, 6)
            end
        },
        [6] = {
            -- Dialogue
            replay = false,
            auto   = true,
            dialog = {
                {'|n*The man sitting next to you at the bar turns his head...*', Narration},
                {'Did that crazy asshole just say that you fell out of the sky?', BillR},
                {'Sure did.', AnimeGuy},
                {'Well... where are you from? You ain\'t one of them Japs, are ya?', BillR},
                {'I don\'t remember where I\'m from. I just remember falling out of the sky.', AnimeGuy},
                {'', BillR},
                {'', AnimeGuy},
                {''},
                {'*The sweaty bartender hastily approaches, handing you a bowl of what appears to be... Baby food?*', Narration}
            },
            after = function()
                Event:restoreObj(3, 'NPC', 'inn')
                Event:goto('inn', 1, 7)
            end
        },
        [7] = {
            replay = false,
            auto   = true,
            before = function()
                Animate:moveObject('Bartender', {
                    {15, 5, 95},
                })
            end,
            dialog = {
                {'Here ya are! My signature Zu Zu Bean Soup! And, I couldn\'t help but over-hearin\' your conversation, so here are some extra beans to take for ya on your way. Best of luck.', Bartender},
                {'*You have acquired Zu Zu Beans!*', {name='', x=24, y=256, wbox=608, nrows=4, alxb='l', alyb='t', nrows=4,}},
                -- {'Alright then, once you finish, let\'s get our stuff together and hit the trail.', WhiskyBill},
                -- {'*Demolishes soup in record time!*', AnimeGuy},
                -- {'Well then, that didn\'t take long! Better make any preparations we need before we head out through the south.', WhiskyBill},
                {'WHISKY BILL has joined your party!', {x=24, y=256, wbox=608, nrows=4, alxb='l', alyb='t', nrows=4,}}
            },
            after = function()
                Event:putInventory('items', 1)
                Event:removeObj(8, 'NPC', 'inn')
                Event:party(2)
                Event:goto('north', 1, 2)
            end
        }
    },
    [2] = {
        [1] = {
            replay = true,
            auto   = false,
            after  = function()
                Event:battle(1)
            end
        }
    },
}
