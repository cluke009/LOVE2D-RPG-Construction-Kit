return {
    [1] = {
        [1] = {
            replay = false,
            auto = true,
            trigger = '1:2',
            -- func = 'scene, scene = intro, anim = true',
            -- dialog = {'test'}
        },
        [2] = {
            replay = false,
            auto = true,
            dialog = {
                'Female voice:\n\n ... Are you... awake?',
                -- 'Priestess:\n\n Look, he\'s up. How do you feel?',
                -- 'Anime Guy:\n\n Gives her the silent protagonist treatment.',
                -- 'Priestess:\n\n (Ahem) Well then... you gave us quite a scare! Do you remember anything of what happened?',
                -- 'Anime Guy:\n\n Shakes head',
                -- 'Priestess:\n\n A few days ago, you came falling straight from the sky and crashed right through the roof and into our church! I\'ve never seen anything like it!',
                -- 'Priest:\n\n Yes, it was the most marvelous thing! You seem to have recovered spectacularly, though. It\'s amazing that you can stand up right now!',
                -- 'Priest:\n\n Oh, of course, I\'m sorry, I\'ve forgotten to introduce us! I am the local priest and this is the local priestess. We maintain this small church together, and have looked after you while you were unconscious.',
                -- 'Anime Guy:\n\n Smiles with a sense of gratitude.',
                -- 'Priest:\n\n Oh, yes, no need to thank us. We\'re just happy to see someone from the outside!',
                -- 'Anime Guy:\n\n Raises eyebrows in confusion.',
                -- 'Priestess:\n\n Ah, that must sound odd to a stranger who has never been here before, eh? None of us have been able to leave the town for quite some time, sadly.',
                -- 'Priest:\n\n Yes, because of this accursed fog we have all been stuck here for quite some time, and nobody has been able to visit from outside the town, either.',
                -- 'Anime Guy:\n\n Summons up Super-Confused Look.',
                -- 'Priest:\n\n Mmm, it seems you may have to stay here awhile until it clears up- IF it clears up that is. The fog is dangerous and suffocating, it can kill a man quickly. Do not enter it, or your fate is sealed.',
                -- 'Priestess:\n\n The only area not cloaked in its hateful presence is to the south, but monsters and beasts roam the southern mountains, and it is unknown how far to the south the fog has been held off.',
                -- 'Anime Guy:\n\n Turns towards the south with a look of resolution',
                -- 'Priestess:\n\n You aren\'t thinking about venturing to the south are you? It\'s extremely dangerous and you just woke up from your fall!',
                -- 'Priest:\n\n Yes, she is right. The guard may not even let you pass to the mountain path in your current condition! Perhaps you should eat and rest up some more. The tavern in the eastern part of town would be a great place to get yourself some food and relax.',
                -- 'Anime Guy:\n\n A loud rumbling sound emanates from within Anime Guy\'s tummy.',
                -- 'Priestess:\n\n Yes, I think some food would be a great idea! Go, to the inn eastward of here, and fill your tummy up before making any rash decisions!',
                -- 'Anime Guy:\n\n Nods his head in agreement. Let\'s do this!',
            },
        },
    },

    [2] = {
        [1] = {
            -- NOTE: This event is attached to the bartender in the Inn.
            replay = false,
            auto = false,
            trigger = '2:2:true',
            -- func = 'party, heroes = 2',
            dialog = {
                'Bartender:\n\n Hey there, you must be that fella that fell right outta the sky, eh?',
                'Anime Guy:\n\n *Smiles and nods.*',
                'Bartender:\n\n Right then, pleased ta meet ya! So, what can I do fer ya?',
                'Anime Guy:\n\n *Stomach rumbles as loud as an earthquake!*',
                'Bartender:\n\n Whoa now! I hear ya loud and clear, food comin\' right up. How does my patented Zu Zu Bean Soup sound?',
                'Anime Guy:\n\n *Nods enthusiastically.*',
                'Bartender:\n\n Alrighty then, I\'ll be right back with your meal!',
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
                '\n *...The Bartender storms off wielding his spatula like some sort of culinary lunatic.*',
            },
        },
        [4] = {
            -- Dialogue
            replay = false,
            auto = false,
            trigger = '2:5:true',
            dialog = {
                '\n *The man sitting next to you at the bar turns his head...*',
                'Man at the Bar:\n\n Fell outta the sky, huh?',
                'Anime Guy:\n\n *Smiles and nods*',
                'Man at the Bar:\n\n The outside world... been almost a year since I been back home. Where you from?',
                'Anime Guy:\n\n *Shakes head*',
                'Man at the Bar:\n\n Don\'t remember? Musta taken a pretty good knock on the head. Probably better off not rememberin\' anyways, cause ya can\'t ever go back.',
                'Anime Guy:\n\n *Shrugs*',
                'Man at the Bar:\n\n Oh, so you think you can make it outta here?',
                'Anime Guy:\n\n *Nods*',
                'Man at the Bar:\n\n And how do you plan on doin\' that, Mr. Tough-Guy?',
                'Anime Guy:\n\n *Points to the south*',
                'Man at the Bar:\n\n Really now? Well... about time someone showed some guts around here. I thought about doin\' that myself, but they won\'t let you leave the town alone cause it\'s \'too dangerous.\'',
                'Man at the Bar: \n\n I bet they let the two of us go though, hell, they probably be excited to get ridda me fer awhile! Hahahahah!',
                'Man at the Bar:\n\n You ain\'t so bad. I admire your courage, kid, how about we bust outta here together?',
                'Anime Guy:\n\n *Nods with approval*',
                'Man at the Bar:\n\n An\' don\'t worry, I was a woodsman back home, so I know my way with an axe.',
                'Man at the Bar: \n\n Well, then, let\'s get this show on the road, whaddaya say?',
                'Anime Guy:\n\n *Shakes head*',
                '\n *The sweaty bartender hastily approaches, shakily handing you a bowl of what appears to be... \n Baby food?*',
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
                'Bartender:\n\n Here ya are! My signature Zu Zu Bean Soup! And, I couldn\'t help but over-hearin\' your conversation, so here are some extra beans to take for ya on your way. Best of luck.',
                '\n *You have acquired Zu Zu Beans!*',
                'Woodsman:\n\n Alright then, once you finish, let\'s get our stuff together and hit the trail.',
                'Anime Guy:\n\n *Demolishes soup in record time!*',
                'Woodsman:\n\n Well then, that didn\'t take long! Better make any preparations we need before we head out through the south.',
            },
        },
        [7] = {
            -- Process - Add Woodsman to party.
            replay = false,
            auto = true,
            trigger = '2:8:true',
            func = 'party, heroes = 2',
            dialog = {
                '\n WOODSMAN has joined your party!',
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
                'Southern Guard:\n\n You guys wanna leave eh? Fine, I can\'t stop the two of ya, but be careful. It\'s mighty dangerous.',
            },
        },
    },

    [4] = {
        [1] = {
            -- NOTE:\n Initiated upon entering Mountain Path 1 for the first time.
            replay = false,
            auto = true,
            dialog = {
                'Frightened Girl Voice:\n\n Help! Help me! They\'re trying to kill me!',
                'Anime Guy:\n\n *!!!!!!!!!!!!!!!!!*',
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
                'Girl Fairy:\n\n Gracias! If not for you guys I\'d be go\'lin munch! But, what are you guys doin\' oot here?!',
                'Woodsman:\n\n We\'re trying to find a way out of this place, past the fog. This is the only way we can go.',
                'Girl Fairy:\n\n Really? Hmm, well I knoo aboot a special place further up the moontain. I can take you guys there. One condition, thoo - Ya gotta let me go all the way with you. Hoo aboot it?',
                'Woodsman:\n\n Hmm, well, what do ya think there, partner?',
                'Anime Guy:\n\n *Nods head and gives a thumbs up.*',
                'Girl Fairy:\n\n That set\'les it! Alright guys, it\'ll be up this moontain path a bit further. Vamos!',
            },
        },
    },

    [6] = {
        [1] = {
            -- NOTE:\n Initiated upon entering Earth Entrance for the first time.
            replay = false,
            auto = true,
            dialog = {
                'Fairy:\n\n "It\'s right up ahead, ya see it?',
                'Anime Guy:\n\n *Squints eyes so much, he actually appears Asian for a second.*',
                'Fairy:\n\n Pret\'y big ain\'t it?',
                'Woodsman:\n\n Yeah, dat\'s a big ol\' temple alright. You sure it\'s safe to go inside?',
                'Fairy:\n\n No, boot what else can we do?',
                'Anime Guy:\n\n *Nods and looks at companions.*',
                'Woodsman:\n\n Well then, let\'s git a move on!',
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
                'Golden Moon Dragon:\n Ah, I am awake again! Thank you all so much!',
                'Anime Guy:\n *Confused look upon his face.*',
                'Golden Moon Dragon:\n Oh, you look as confused as me! Well, some time ago, that large evil Orb appeared in the sky and I was suddenly overpowered by a deep and dark Corruption. I do not remember anything after that- it is as if I have been sleeping until now.',
                'Woodsman:\n Believe me pal, you was awake not too long ago when you tried gobblin\' us all up!',
                'Golden Moon Dragon:\n Oh my! I\'m so sorry! I remember nothing of the sort. Oh, and I hope this does not soil my relationship with the Fairy Kingdom, young Princess! Please, please forgive me!',
                'Anime Guy:\n *Eyes shift towards the Fairy...*',
                'Woodsman:\n Damn, you\'re a princess?!',
                'Fairy:\n Good Dragon of the Golden Moon, I know that you were not yoo\'self just noo. Hoo\'ever, sadly, the Fairy Kingdom is lost to the Fog, hidden to us by whatever evil Corrupted you, I fear.',
                'Golden Moon Dragon:\n This is grave news. If the Fairy Kingdom is unable to fight this dark force, then I fear you all may be our only hope. Will you give my brethren and me aid, Princess Querina?',
                'Fairy:\n Yes... I will. I was hoping that you could help my family.',
                'Golden Moon Dragon:\n Fairest of the Fair, I fear this dark Corruption is beyond me. With my ties to the land; however, I can use some of my magic- weakened though it may be- to clear the fog from your way to the Northern Forest. There, you may see your people once more and perhaps learn of a way to help. My brother, of the Emerald Moon, resides in the Wooded Temple to the North as well. I fear he may be under a spell as I was.',
            },
        },
    },
    [9] = {
        [1] = {
            -- NOTE: REMOVE HOUSE ROOFS.
            replay = true,
            auto = true,
            trigger = '9:2:true',
            func = 'removeObj, obj = 9, kind = Obj, map = town',
        },
        [2] = {
            -- NOTE: REMOVE HOUSE ROOFS.
            replay = true,
            auto = true,
            trigger = '9:3:true',
            func = 'restoreObj, obj = 9, kind = Obj, map = town',
        },
        },
    [10] = {
        [1] = {
            replay = false,
            auto = true,
            func = 'battle',
        },
    },
}
--     -- ITEM SHOP HERE! --
--     [10] = {
--         -- BEGINNING ITEM SHOP --
--         [1] = {
--             replay = true,
--             auto = false,
--             dialog = {'You should stock up on some items.'
--             },
--             func = 'shop, shop = 1',
--         },
--         -- AFTER GOLDEN MOON TEMPLE ITEM SHOP --
--         [2] = {
--             replay = true,
--             auto = false,
--             dialog = {'Wow, the grass is back! Wanna buy anything?'
--             },
--             func = 'shop, shop = 3',
--         },
--         -- AFTER EMERALD MOON TEMPLE ITEM SHOP --
--         [3] = {
--             replay = true,
--             auto = false,
--             dialog = {'I can\'t believe we have trees again! Need anything?'
--             },
--             func = 'shop, shop = 5',
--         },
--         -- AFTER AZURE MOON TEMPLE ITEM SHOP --
--         [4] = {
--             replay = true,
--             auto = false,
--             dialog = {'It\'s great to see the lake again! What do you need?'
--             },
--             func = 'shop, shop = 7',
--         },
--         -- AFTER CRIMSON MOON TEMPLE ITEM SHOP --
--         [5] = {
--             replay = true,
--             auto = false,
--             dialog = {'With the hearths working again, I can brew the best items for you! Wanna try em?'
--             },
--             func = 'shop, shop = 9',
--         },
--     },
--     -- EQUIPMENT SHOP HERE! --
--     [11] = {
--         -- BEGINNING EQUIP SHOP --
--         [1] = {
--             replay = true,
--             auto = false,
--             dialog = {'Want some equipment?'
--             },
--             func = 'shop, shop = 2',
--         },
--         -- AFTER GOLDEN MOON TEMPLE EQUIP SHOP --
--         [2] = {
--             replay = true,
--             auto = false,
--             dialog = {'Grass outside again, heh. Whatcha need?'
--             },
--             func = 'shop, shop = 4',
--         },
--         -- AFTER EMERALD MOON TEMPLE EQUIP SHOP --
--         [3] = {
--             replay = true,
--             auto = false,
--             dialog = {'The animals and trees are back. Maybe the kids will play outside more and bug me less now...'
--             },
--             func = 'shop, shop = 6',
--         },
--         -- AFTER AZURE MOON TEMPLE EQUIP SHOP --
--         [4] = {
--             replay = true,
--             auto = false,
--             dialog = {'The lake is back... Don\'t try swimming in armor...'
--             },
--             func = 'shop, shop = 8',
--         },
--         -- AFTER CRIMSON MOON TEMPLE EQUIP SHOP --
--         [5] = {
--             replay = true,
--             auto = false,
--             dialog = {'Finally! With a working forge again I can get you the best stuff. Take a look.'
--             },
--             func = 'shop, shop = 10',
--         },
--     },
