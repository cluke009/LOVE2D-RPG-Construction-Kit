local Assets = require 'helpers.asset_helper'

return {
    [1] = {
        [1] = {
            replay = false,
            auto = true,
            trigger = '1:2',
            -- func = 'scene, scene = intro, anim = true'},
            -- dialog = {'test'}
        },
        [2] = {
            replay = false,
            auto = true,
            dialog = {
                {
                    --FemaleVoice
                    {'Female voice:\n\n ... Are you... awake?'},
                },
                {
                    --Priestess:
                    {'Oh my goodness Doctor Alan! You did it!'},
                    {Assets:get('npcs', 3, 'portraits')[1], 'right'}
                },
                {
                    --Doctor
                    {'He’s up already? DAMN, I\'M GOOD.'},
                    {Assets:get('npcs', 2, 'portraits')[1], 'right'}
                },
                {
                    {'After a solid influx of willpower, the bandaged man manages to push himself upright in the bed to check out his surroundings.'},
                },
                {
                    {'Looking around, he sees a lovely blonde woman in religious garb, and an undoubtedly handsome doctor.'},
                },
                {
                    {'\n\n No homo.'},
                },
                {
                    --Dr. Alan:
                    {'Now, now, Tiffany- I didn\'t really do anything.'},
                    {Assets:get('npcs', 2, 'portraits')[2], 'right'}
                },
                {
                    --Dr. Alan
                    {'Besides bandage him up, push his broken limbs back into place, monitor him everyday, stop all of that blood from pouring out of his ears and administer my patented anti-coma brain massage.'},
                    {Assets:get('npcs', 2, 'portraits')[3], 'right'}
                },
                {
                    --Anime Guy
                    {'*Shakes head*'},
                    {Assets:get('heroes', 1, 'portraits')[1], 'left'}
                },
                {
                    --Dr. Alan:
                    {'Don\'t do that, though; I haven\'t drained your extra brain-fluid today.'},
                    {Assets:get('npcs', 2, 'portraits')[4], 'right'}
                },
                {
                    --Dr. Alan:
                    {'Oh, I almost forgot- I also gave you an extra pancreas! I had a spare one lying around.'},
                    {Assets:get('npcs', 2, 'portraits')[1], 'right'}
                },
                {
                    --Anime Guy
                    {'*Summons up super confused look.*'},
                    {Assets:get('heroes', 1, 'portraits')[1], 'left'}
                },
                {
                    --Dr. Alan
                    {'And let me know if you start craving mulch.'},
                    {Assets:get('npcs', 2, 'portraits')[2], 'right'}
                },
                {
                    --Tiffany
                    {'Why would he crave mulch?'},
                    {Assets:get('npcs', 3, 'portraits')[2], 'right'}
                },
                {
                    --Dr. Alan
                    {'No reason. So, how do you feel?'},
                    {Assets:get('npcs', 2, 'portraits')[3], 'right'}
                },
                {
                    --Anime Guy
                    {'*Jumps up off the bed with one fist high in the air; upon landing he juts his arm downward in an energetic manner as some sort of victory fanfare music plays in the background.*'},
                    {Assets:get('heroes', 1, 'portraits')[1], 'left'}
                },
                {
                    --Tiffany
                    {'What in the hell is that?'},
                    {Assets:get('npcs', 3, 'portraits')[1], 'right'}
                },
                {
                    --Dr. Alan
                    {'Sounds like music from that Endless Ecstasy game. Never played it, but my roommate in college did. He never got laid. Poor guy.'},
                    {Assets:get('npcs', 2, 'portraits')[4], 'right'}
                },
                {
                    --Narrator
                    {'The music fades away as a bit of normalcy returns to the room.'},
                },
                {
                    --Tiffany
                    {'Must be feeling better.'},
                    {Assets:get('npcs', 3, 'portraits')[2], 'right'}
                },
                {
                    --Dr. Alan
                    {'Probably starving though, eh?'},
                    {Assets:get('npcs', 2, 'portraits')[1], 'right'}
                },
                {
                    --Anime Guy
                    {'*Nods with vicious potency.*'},
                    {Assets:get('heroes', 1, 'portraits')[1], 'left'}
                },
                {
                    --Dr. Alan
                    {'Right. I think the extra pancreas makes you hungry. Or something. Maybe it makes you horny...'},
                    {Assets:get('npcs', 2, 'portraits')[2], 'right'}
                },
                {
                    --Dr. Alan
                    {'Are you like... WAY horny?'},
                    {Assets:get('npcs', 2, 'portraits')[3], 'right'}
                },
                {
                    --Anime Guy
                    {'*Assumes a look of mild terror.*'},
                    {Assets:get('heroes', 1, 'portraits')[1], 'left'}
                },
                {
                    --Dr. Alan
                    {'WAIT, No, it makes you feel violently nauseous! Duh.'},
                    {Assets:get('npcs', 2, 'portraits')[4], 'right'}
                },
                {
                    --Dr. Alan
                    {'Right, well, good luck with that. You might want something inside of you to forcibly vomit in unbearable pain later- trust me, it\'s WAY better than the dry-heaves.'},
                    {Assets:get('npcs', 2, 'portraits')[1], 'right'}
                },
                {
                    --Anime Guy:
                    {'*Nods his head! Let’s do this!*'},
                    {Assets:get('heroes', 1, 'portraits')[1], 'left'}
                },
                {
                    --Dr. Alan
                    {'Excellent then! The Inn is to the southeast of here.'},
                    {Assets:get('npcs', 2, 'portraits')[2], 'right'}
                },
                {
                    --Dr. Alan
                    {'It\'s the only real place to get food, because there\'s a terrible DEATH FOG around town completely barring all entry or exit.'},
                    {Assets:get('npcs', 2, 'portraits')[3], 'right'}
                },
                {
                    --Dr. Alan
                    {'It hasn\'t let up a bit since it showed up and the murderous, demonic monster-spawn are still ravaging people who attempt to leave to the south.'},
                    {Assets:get('npcs', 2, 'portraits')[4], 'right'}
                },
                {
                    --Dr. Alan
                    {'Which, like, REALLY SUCKS, cause it\'s the only place not completely covered in the Fog\'s awful, inescapable, suffocating Death-Mist.'},
                    {Assets:get('npcs', 2, 'portraits')[1], 'right'}
                },
                {
                    --Narrator
                    {'A moment of awkward silence ensues.'},
                },
                {
                    --Tiffany
                    {'So... HAVE FUN!'},
                    {Assets:get('npcs', 3, 'portraits')[1], 'right'}
                },
                {
                    --Dr. Alan:
                    {'I don\'t think the Inn has mulch, though.'},
                    {Assets:get('npcs', 2, 'portraits')[2], 'right'}
                },
            },
        },
    },
    [2] = {
        [1] = {
            -- NOTE: This event is attached to the bartender in the Inn.
            replay = false,
            auto = false,
            trigger = '2:2:true',
            -- func = 'party, heroes = 2'},
            dialog = {
                {'Bartender:\n\n Hey there, you must be that fella that fell right outta the sky, eh?'},
                {'Anime Guy:\n\n *Smiles and nods.*'},
                {'Bartender:\n\n Right then, pleased ta meet ya! So, what can I do fer ya?'},
                {'Anime Guy:\n\n *Stomach rumbles as loud as an earthquake!*'},
                {'Bartender:\n\n Whoa now! I hear ya loud and clear, food comin\' right up. How does my patented Zu Zu Bean Soup sound?'},
                {'Anime Guy:\n\n *Nods enthusiastically.*'},
                {'Bartender:\n\n Alrighty then, I\'ll be right back with your meal!'},
            },
        },
        [2] = {
            -- Process - Remove the Bartender's graphic.
            replay = false,
            auto = false,
            trigger = '2:3:true',
            func = 'removeObj, obj = 1, kind = NPC, map = inn',
        },
        [3] = {
            -- Narrative - Bartender leaves.
            replay = false,
            auto = false,
            trigger = '2:4:true',
            dialog = {
                {'\n *...The Bartender storms off wielding his spatula like some sort of culinary lunatic.*'},
            },
        },
        [4] = {
            -- Dialogue
            replay = false,
            auto = false,
            trigger = '2:5:true',
            dialog = {
                {'\n *The man sitting next to you at the bar turns his head...*'},
                {'Man at the Bar:\n\n Fell outta the sky, huh?'},
                {'Anime Guy:\n\n *Smiles and nods*'},
                {'Man at the Bar:\n\n The outside world... been almost a year since I been back home. Where you from?'},
                {'Anime Guy:\n\n *Shakes head*'},
                {'Man at the Bar:\n\n Don\'t remember? Musta taken a pretty good knock on the head. Probably better off not rememberin\' anyways, cause ya can\'t ever go back.'},
                {'Anime Guy:\n\n *Shrugs*'},
                {'Man at the Bar:\n\n Oh, so you think you can make it outta here?'},
                {'Anime Guy:\n\n *Nods*'},
                {'Man at the Bar:\n\n And how do you plan on doin\' that, Mr. Tough-Guy?'},
                {'Anime Guy:\n\n *Points to the south*'},
                {'Man at the Bar:\n\n Really now? Well... about time someone showed some guts around here. I thought about doin\' that myself, but they won\'t let you leave the town alone cause it\'s \'too dangerous.\''},
                {'Man at the Bar: \n\n I bet they let the two of us go though, hell, they probably be excited to get ridda me fer awhile! Hahahahah!'},
                {'Man at the Bar:\n\n You ain\'t so bad. I admire your courage, kid, how about we bust outta here together?'},
                {'Anime Guy:\n\n *Nods with approval*'},
                {'Man at the Bar:\n\n An\' don\'t worry, I was a woodsman back home, so I know my way with an axe.'},
                {'Man at the Bar: \n\n Well, then, let\'s get this show on the road, whaddaya say?'},
                {'Anime Guy:\n\n *Shakes head*'},
                {'\n *The sweaty bartender hastily approaches, shakily handing you a bowl of what appears to be... \n Baby food?*'},
            },
        },
        [5] = {
            -- Process - Restore Bartender's graphic.
            replay = false,
            auto = false,
            trigger = '2:6:true',
            func = 'restoreObj, obj = 1, kind = NPC, map = inn',
        },
        [6] = {
            -- Process - Add Zu Zu Beans to inventory.
            -- Dialogue
            replay = false,
            auto = false,
            trigger = '2:7:true',
            func = 'inventory, kind = item, op = put, id = 1',
            dialog = {
                {'Bartender:\n\n Here ya are! My signature Zu Zu Bean Soup! And, I couldn\'t help but over-hearin\' your conversation, so here are some extra beans to take for ya on your way. Best of luck.'},
                {'\n *You have acquired Zu Zu Beans!*'},
                {'Woodsman:\n\n Alright then, once you finish, let\'s get our stuff together and hit the trail.'},
                {'Anime Guy:\n\n *Demolishes soup in record time!*'},
                {'Woodsman:\n\n Well then, that didn\'t take long! Better make any preparations we need before we head out through the south.'},
            },
        },
        [7] = {
            -- Process - Add Woodsman to party.
            replay = false,
            auto = true,
            trigger = '2:8:true',
            func = 'party, heroes = 2',
            dialog = {
                {'\n WOODSMAN has joined your party!'},
            },
        },
        [8] = {
            -- Process - Remove Woodsman's graphic.
            replay = false,
            auto = true,
            func = 'removeObj, obj = 8, kind = NPC, map = inn',
        },
    },

    [3] = {
        [1] = {
            -- NOTE:\n This is attached to the guard to the south after the Woodsman joins your party.
            replay = false,
            auto = false,
            -- - Process - Remove Southern Gate Object
            func = 'removeObj, obj = 20, kind = Obj, map = south',
            dialog = {
                {'Southern Guard:\n\n You guys wanna leave eh? Fine, I can\'t stop the two of ya, but be careful. It\'s mighty dangerous.'},
            },
        },
    },

    [4] = {
        [1] = {
            -- NOTE:\n Initiated upon entering Mountain Path 1 for the first time.
            replay = false,
            auto = true,
            dialog = {
                {'Frightened Girl Voice:\n\n Help! Help me! They\'re trying to kill me!'},
                {'Anime Guy:\n\n *!!!!!!!!!!!!!!!!!*'},
                },
                -- - Process - Start Battle:\n 2 Goblins
            },
        },

    [5] = {
        [1] = {
            -- NOTE:\n Initiated after successfully completing battle in 1.3a.
            replay = false,
            auto = true,
            dialog = {
                {'Girl Fairy:\n\n Gracias! If not for you guys I\'d be go\'lin munch! But, what are you guys doin\' oot here?!'},
                {'Woodsman:\n\n We\'re trying to find a way out of this place, past the fog. This is the only way we can go.'},
                {'Girl Fairy:\n\n Really? Hmm, well I knoo aboot a special place further up the moontain. I can take you guys there. One condition, thoo - Ya gotta let me go all the way with you. Hoo aboot it?'},
                {'Woodsman:\n\n Hmm, well, what do ya think there, partner?'},
                {'Anime Guy:\n\n *Nods head and gives a thumbs up.*'},
                {'Girl Fairy:\n\n That set\'les it! Alright guys, it\'ll be up this moontain path a bit further. Vamos!'},
            },
        },
    },

    [6] = {
        [1] = {
            -- NOTE:\n Initiated upon entering Earth Entrance for the first time.
            replay = false,
            auto = true,
            dialog = {
                {'Fairy:\n\n "It\'s right up ahead, ya see it?'},
                {'Anime Guy:\n\n *Squints eyes so much, he actually appears Asian for a second.*'},
                {'Fairy:\n\n Pret\'y big ain\'t it?'},
                {'Woodsman:\n\n Yeah, dat\'s a big ol\' temple alright. You sure it\'s safe to go inside?'},
                {'Fairy:\n\n No, boot what else can we do?'},
                {'Anime Guy:\n\n *Nods and looks at companions.*'},
                {'Woodsman:\n\n Well then, let\'s git a move on!'},
                -- - Image - Picture of The Golden Moon Temple. Fades to first screen of temple.
            },
        },
    },
    -- [7] = {
    --     [1] = {
    --         -- NOTE:\n ###1.5a The Temple of the Golden Moon (Pre-Dragon)
    --         -- PlaceHolder
    --         replay = false,
    --         auto = true,
    --         dialog = {
    --         },
    --     },
    -- },
    [8] = {
        [1] = {
            -- NOTE:\n Initiated upon entering Earth Entrance for the first time.
            replay = false,
            auto = false,
            dialog = {
                {'Golden Moon Dragon:\n Ah, I am awake again! Thank you all so much!'},
                {'Anime Guy:\n *Confused look upon his face.*'},
                {'Golden Moon Dragon:\n Oh, you look as confused as me! Well, some time ago, that large evil Orb appeared in the sky and I was suddenly overpowered by a deep and dark Corruption. I do not remember anything after that- it is as if I have been sleeping until now.'},
                {'Woodsman:\n Believe me pal, you was awake not too long ago when you tried gobblin\' us all up!'},
                {'Golden Moon Dragon:\n Oh my! I\'m so sorry! I remember nothing of the sort. Oh, and I hope this does not soil my relationship with the Fairy Kingdom, young Princess! Please, please forgive me!'},
                {'Anime Guy:\n *Eyes shift towards the Fairy...*'},
                {'Woodsman:\n Damn, you\'re a princess?!'},
                {'Fairy:\n Good Dragon of the Golden Moon, I know that you were not yoo\'self just noo. Hoo\'ever, sadly, the Fairy Kingdom is lost to the Fog, hidden to us by whatever evil Corrupted you, I fear.'},
                {'Golden Moon Dragon:\n This is grave news. If the Fairy Kingdom is unable to fight this dark force, then I fear you all may be our only hope. Will you give my brethren and me aid, Princess Querina?'},
                {'Fairy:\n Yes... I will. I was hoping that you could help my family.'},
                {'Golden Moon Dragon:\n Fairest of the Fair, I fear this dark Corruption is beyond me. With my ties to the land; however, I can use some of my magic- weakened though it may be- to clear the fog from your way to the Northern Forest. There, you may see your people once more and perhaps learn of a way to help. My brother, of the Emerald Moon, resides in the Wooded Temple to the North as well. I fear he may be under a spell as I was.'},
            },
        },
    },
    [9] = {
        [1] = {
            -- NOTE: REMOVE HOUSE ROOFS.
            replay = true,
            auto = false,
            func = 'removeObj, obj = 9, kind = Obj, map = town',
            trigger = '10:2',
        },
    },
    [10] = {
        [1] = {
            replay = true,
            auto = false,
        },
        [2] = {
            replay = true,
            auto = true,
            func = 'restoreObj, obj = 9, kind = Obj, map = town',
            trigger = '10:1',
        },
    },
    [11] = {
        [1] = {
            replay = false,
            auto = false,
            func = 'inventory, kind = equip, op = put, id = 2',
            trigger = '12:2',
            dialog = {
                {'Hey, A SHOVEL!'},
                {'Now you can dig holes wherever the dirt is all weak and shitty!'},
                {'YAY!'},
            },
        },
    },
    [12] = {
        [1] = {
            replay = false,
            auto = false,
        },
        [2] = {
            replay = false,
            auto = false,
            dialog = {
                {'Time to dig, BITCH.'}
            },
        },
    },
}
