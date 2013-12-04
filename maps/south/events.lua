local Assets = require 'helpers.asset_helper'
local Event  = require 'helpers.event_helper'

return {
    [1] = {
        [1] = {
            -- NOTE:\n This is attached to the guard to the south after the Woodsman joins your party.
            replay = false,
            auto = false,
            goto = {'south', 1, 2},
            before = function ()
                Event:removeObj(20, 'Obj', 'south')
                -- print('before')

                -- body
            end,
            -- - Process - Remove Southern Gate Object
            -- func = 'removeObj, obj = 20, kind = Obj, map = south',
            dialog = {
                    {
                        '##### Southern Guard:\n\n You guys wanna leave eh? Fine, I can\'t stop the two of ya, but be careful. It\'s mighty dangerous.',
                        -- {Assets:get('npcs', 3, 'portraits')[1], 'right'},
                    },
                    {
                        'derp',
                        {Assets:get('npcs', 3, 'portraits')[1], 'right'},
                    }

            },
            after = function ()
                print('after')
                Event:removeObj(20, 'Obj', 'south')
            end,
        },
        [2] = {
            -- NOTE:\n This is attached to the guard to the south after the Woodsman joins your party.
            replay = false,
            auto = true,
            -- goto = {'south', 1, 3},
            before = function ()
                print('before2')
                -- Event:removeObj(20, 'Obj', 'south')
                -- body
            end,
            -- - Process - Remove Southern Gate Object
            -- func = 'removeObj, obj = 20, kind = Obj, map = south',
            dialog = {
                {'\n___________________________________________'},
            },
            after = function ()
                print('after2')
                -- Event:removeObj(20, 'Obj', 'south')
            end,
        },
        [3] = {
            -- NOTE:\n This is attached to the guard to the south after the Woodsman joins your party.
            replay = true,
            auto = false,
            -- goto = {'south', 1, 2, true},
            -- - Process - Remove Southern Gate Object
            -- func = 'removeObj, obj = 20, kind = Obj, map = south',
            dialog = {
                {'\n\ntestes'},
                {'\n\ntestes2'},
                {'\n\ntestes3'},
            },
        },
    },
}
