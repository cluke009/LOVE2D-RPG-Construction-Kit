local Assets = require 'helpers.asset_helper'
local Event  = require 'helpers.event_helper'

return {
    [1] = {
        [1] = {
            replay = false,
            auto = false,
            before = function ()
            end,
            dialog = {
                {'##### Southern Guard:\n\n You guys wanna leave eh? Fine, I can\'t stop the two of ya, but be careful. It\'s mighty dangerous.',},
                {'derp',}
            },
            after = function ()
            end,
        },
        [2] = {
            replay = false,
            auto = true,
            before = function ()
            end,
            dialog = {
                {'\n___________________________________________'},
            },
            after = function ()
            end,
        },
        [3] = {
            replay = true,
            auto = false,
            dialog = {
                {'\n\ntestes'},
                {'\n\ntestes2'},
                {'\n\ntestes3'},
            },
        },
    },
    [2] = {
        [1] = {
            replay = false,
            auto = false,
            dialog = {
                {'derptown is that way',}
            },
        },
        [2] = {
            replay = false,
            auto = false,
            before = function()
            end,
            dialog = {
                {'======================================================'},
            },
            after = function()
            end,
        },
    }
}
