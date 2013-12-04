local Assets = require 'helpers.asset_helper'

return {
    [1] = {
        [1] = {
            -- NOTE:\n Initiated upon entering Mountain Path 1 for the first time.
            replay = false,
            auto = true,
            dialog = {
                {'Frightened Girl Voice:\n\n Help! Help me! They\'re trying to kill me!'},
                {'Anime Guy:\n\n *!!!!!!!!!!!!!!!!!*'},
            },
            -- Process - Start Battle:\n 2 Goblins
        },
    },
    [2] = {
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
}
