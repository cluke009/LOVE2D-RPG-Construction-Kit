local Assets = require 'helpers.asset_helper'
local Event  = require 'helpers.event_helper'

return {
    [1] = {
        [1] = {
            -- NOTE: This event is attached to the bartender in the Inn.
            replay = false,
            auto = false,
            goto = {'inn', 1, 2},
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
            -- Narrative - Bartender leaves.
            replay = false,
            auto = true,
            goto = {'inn', 1, 3},
            dialog = {
                {'\n *...The Bartender storms off wielding his spatula like some sort of culinary lunatic.*'},
            },
            after = function()
                Event:removeObj(1, 'NPC', 'inn')
            end
        },
        [3] = {
            -- Dialogue
            replay = false,
            auto = true,
            goto = {'inn', 1, 4},
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
                {'Bartender:\n\n Here ya are! My signature Zu Zu Bean Soup! And, I couldn\'t help but over-hearin\' your conversation, so here are some extra beans to take for ya on your way. Best of luck.'},
                {'\n *You have acquired Zu Zu Beans!*'},
                {'Woodsman:\n\n Alright then, once you finish, let\'s get our stuff together and hit the trail.'},
                {'Anime Guy:\n\n *Demolishes soup in record time!*'},
                {'Woodsman:\n\n Well then, that didn\'t take long! Better make any preparations we need before we head out through the south.'},
                {'\n WOODSMAN has joined your party!'},
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