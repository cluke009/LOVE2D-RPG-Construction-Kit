_navi.template  = {face_pos={x=0,y=0,z=true}, x=24, y=256, wbox=608, nrows=4, alxb='l', alyb='t', nrows=4,}

local lg = love.graphics

local Narration   = {x=320, y=30,           face = lg.newImage('assets/img/events/narratebg.png'), wbox=600, alx='m', alxb='m', nrows=2, box=false,}
local AnimeGuy    = {name = 'Anime Guy',    face = lg.newImage('assets/img/animeguyfull.png')}
local AnimeGuyR   = {name = 'Anime Guy',    face = lg.newImage('assets/img/animeguyfullr.png')}
local Bill        = {name = 'Bill',         face = lg.newImage('assets/img/billfull.png')}
local BillR       = {name = 'Bill',         face = lg.newImage('assets/img/billfullr.png')}
local Querina     = {name = 'Querina',      face = lg.newImage('assets/img/querinafull.png')}
local QuerinaR    = {name = 'Querina',      face = lg.newImage('assets/img/querinafullr.png')}
local Copernicus  = {name = 'Copernicus',   face = lg.newImage('assets/img/copernicusfull.png')}
local CopernicusR = {name = 'Copernicus',   face = lg.newImage('assets/img/copernicusfullr.png')}
local CopernicusD = {name = 'First Voice',  face = lg.newImage('assets/img/copernicusdark.png')}
local Sherman     = {name = 'Sherman',      face = lg.newImage('assets/img/shermanfull.png')}
local ShermanR    = {name = 'Sherman',      face = lg.newImage('assets/img/shermanfullr.png')}
local ShermanD    = {name = 'Second Voice', face = lg.newImage('assets/img/shermandark.png')}

return {

    [1] = {
        [1] = {
            -- NOTE:\n Initiated upon entering Mountain Path 1 for the first time.
            replay = false,
            auto   = true,
            dialog = {
                {'*Up ahead, voices can be heard amongst boulders...*', Narration},
                {'No, no, listen to me. She is not Cuban, you can tell from the way she pronounces her \'R\'s.', CopernicusD},
                {'I understand this, Copernicus, but I don\'t quite think you\'re listening to me.', ShermanD},
                {'Judging from the designs upon her pancho, which is QUITE OBVIOUSLY native to Cuba, circa 1972, there can be no misgivings here.', ShermanD},
                {'Well, then Sherman, how do you explain those maracas we found on her person?', Copernicus},
                {'They\'re fun.', ShermanR},
                {'FUN! HAR-HAR! You really are a hoot! Anyways, how should we cook her?', Copernicus},
                {'We can\'t cook her, silly. We need her to enter the temple! Only a fairy can do that...', ShermanR},
                {'Oh yes, Sherman, I know this. But, we must keep her frightened or she won\'t cooperate with us.', Copernicus},
                {'Right, right. Ahem, so... WELL THERE MY FELLOW, FEARSOME GOBLIN- HOW SHALL WE COOK THIS DELICIOUS, FRIGHTENED, LITTLE PIXIE?!', ShermanR},
                {'*Muffled sounds can be heard emanating from a small burlap sack*', Narration},
                {'WHY, I\'M NOT SURE MY FEROCIOUS ORCLING FRIEND. IF ONLY WE COULD ENTER THE TEMPLE UP YONDER WE COULD LOCATE MORE DELICIOUS THINGS TO EAT WITHIN.', Copernicus},
                {'High-Pitch Pixie Voice|nOH MY BUENO! SOMEBODY PLEASE HELP MEEE!!!', Narration},
                {'You hear that? They have a fairy... Maybe we should go help her out.', Bill},
                { '', {
                        name = 'Anime Guy', nrows = 5, nvchs = 3,
                        face = lg.newImage('assets/img/animeguyfullr.png'),
                        choices = { 'YEAH! HEROES TO THE RESCUE!', 'I guess. She can get us into a temple...', 'Nah. Fuck that slut.', }
                    }
                }
            },
            after = function(choice)
                if choice == 1 then
                    Event:goto('mountainpath1', 1, 2)
                elseif choice == 2 then
                    Event:goto('mountainpath1', 1, 2)
                elseif choice == 3 then
                    Event:goto('mountainpath1', 1, 3)
                end
            end
        },
        [2] = {
            replay = false,
            auto   = true,
            dialog = {
                {'HEY YOU JERKS! Let that fairy go!', AnimeGuy},
                {'Yeah, or that sack won\'t be the only one we take off of you today!', BillR},
                {'This brings about a moment of awkward silence.', Narration},
                {'', {wait = .35, box = false}},
                {'Really Bill? That sounded kinda gay.', AnimeGuy},
                {'Whatever. I\'m not the main character, you come up with something better.', BillR},
                {'Uhh...|nErrr...|nLET\'S FIGHT!', AnimeGuy},
            },
            after = function()
                Event:goto('mountainpath1', 1, 4)
            end
        },
        [3] = {
            replay = false,
            auto   = true,
            dialog = {
                {'Ehhh... you really think it\'s a good idea?', AnimeGuy},
                {'No. But I hate sweater vests.', BillR},
                {'Good enough for me. Let\'s go.', AnimeGuy},
                {'DIE YOU BASTARDS!', BillR},
            },
            after = function()
                Event:goto('mountainpath1', 1, 4)
            end
        },
        [4] = {
            replay = false,
            auto   = true,
            before = function()
                Animate:moveObject('Sherman', {
                    {8, 15, 120},
                })
                Animate:moveObject('Copernicus', {
                    {10, 15, 120},
                })
            end,
            dialog = {
                {'The goblins approach!', Narration},
                -- {'', {wait = 1.5, box = false}},
            },
            after = function()
                Event:goto('mountainpath1', 1, 5)
            end
        },
        [5] = {
            replay = false,
            auto   = true,
            dialog = {
                {'', Narration, {wait= 1, box = false}},
                {'THESE NIGGAS GO HARD.  And, of course, our heroes win.', Narration},
            },
            after = function()
                Event:goto('mountainpath1', 1, 6)
            end
        },
        [6] = {
            replay = false,
            auto   = true,
            before = function()
                Animate:moveObject('Sherman', {
                    {8, 1, 90},
                })
                Animate:moveObject('Copernicus', {
                    {10, 1, 90},
                })
            end,
            dialog = {
                {'', {wait=1,box=false}},
                {'Okay we got em. Let\'s go get her out of that PRISON OF HORRORS!', AnimeGuy},
                {'Yeah. Let\'s go open that bag.', BillR}
            },
            after = function()
                Event:removeObj(5, 'NPC', 'mountainpath1')
                Event:removeObj(4, 'NPC', 'mountainpath1')

            end
        }
    },
    [2] = {
        [1] = {
            -- Happens when you check tha baggg after the fight.
            replay = false,
            auto   = false,
            before = function()
                Event:removeObj(9, 'Obj', 'mountainpath1')
            end,
            dialog = {
                {'Oh my goodness! Thank you boys so much! You just saved my life!', Querina},
                {'Oh, it\'s no problem.', AnimeGuyR},
                {'Yeah, I hate goblins. And I hate argyle.', Bill},
                {'Yeah, who doesn\'t hate goblins?', QuerinaR},
                {'Hippies....', Bill},
                {'Right. Well, I should really be going...', QuerinaR},
                {'Where are you off to?', AnimeGuy},
                {'I\'m off to the temple up here on top of the mountain. How about you guys?', QuerinaR},
                {'Umm... errr... We\'re going to the same place, actually.', Bill},
                {'What a coincidence! We should all travel together!', QuerinaR},
                {'What do you think, Ryu?', Bill},
                {'', {
                        name = 'Anime Guy', nvchs = 2, wait = 1,
                        face = lg.newImage('assets/img/animeguyfullr.png'),
                        choices = { 'SURE! Why not!', 'No way Bill. She\'ll just slow us down.', }
                    }
                },
            },
            after = function(choice)
                if choice == 1 then
                    Event:goto('mountainpath1', 2, 2)
                elseif choice == 2 then
                    Event:goto('mountainpath1', 2, 3)
                end
            end
        },
        [2] = {
            replay = false,
            auto   = true,
            dialog = {
                {'YAY!', Querina, {wait=1.25}},
                {'Let\'s get a move-on. At least we have a real destination now.', BillR}
            },
            after = function()
                Event:party(3)
            end
        },
        [3] = {
            replay = false,
            auto   = true,
            dialog = {
                {'Well then, how do you plan on getting into the temple up ahead?', Querina},
                {'Yeah, we need her. I\'ve heard people say that only fairies can get into these things.', BillR},
                {'Fine. But try not to get stuffed into any more burlap sacks.', AnimeGuy},
            },
            after = function()
                Event:party(3)
            end
        }
    }
}
