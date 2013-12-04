local Assets = require 'helpers.asset_helper'

return {
    [1] = {
        [1] = {
            -- NOTE:\n This is attached to the guard to the south after the Woodsman joins your party.
            replay = false,
            auto = true,
            trigger = 'south:1:2',
            -- - Process - Remove Southern Gate Object
            func = 'removeObj, obj = 20, kind = Obj, map = south',
            dialog = {
                {'##### Southern Guard:\n\n You guys wanna leave eh? Fine, I can\'t stop the two of ya, but be careful. It\'s mighty dangerous.'},
            },
        },
    },
}
