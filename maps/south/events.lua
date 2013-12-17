local Assets = require 'helpers.asset_helper'
local Event  = require 'helpers.event_helper'
local Animate = require 'helpers.animation'

return {
    [1] = {
        [1] = {
            replay = false,
            auto = false,
            before =  function (  )
                
                Animate:moveObject('guard', {
                    {11, 15, 190},
                    {11, 18, 90},
                    {8, 18, 50},
                    {11, 18, 290}
                })
                -- Animate:moveObject('guard', 128, 512)
            end,
            dialog = {
                -- {
                --     'You guys wanna leave eh? |:Fine, I can\'t stop the two of ya, but be careful. |mIt\'s mighty dangerous.',
                --     {name='Southern Guard', x=30, y=255, wbox = 600, nrows=4},
                -- },
                -- {
                --     'derp',
                --     {name='Southern Guard', x=30, y=255, wbox = 600, nrows=4},
                -- },
                {
                    'Alright! Now for an (easy) question.|,.|,.|, What does "Navi refer to?"', 
                    {x=30, y=255, wbox = 600, nrows=4, name='litearc', nvchs=3, choices = {
                        'The aliens in Avatar', 'The little fairy from Zelda', 'Short for "navigator"', 'A village in Estonia'
                    }},
                },
            },
            after = function (choice)
                -- print(choice)
                if choice == 2 then 
                    Event:goto('south', 1, 2) 
                elseif choice == 1 then 
                    Event:goto('south', 1, 3)
                end
                
                -- Event:removeObj(20, 'Obj', 'south')
                -- print(self.choice)
            end,
        },
        [2] = {
            replay = false,
            auto = false,
            before = function ()
                print('sout.1.2')
            end,
            dialog = {
                {
                    'derp',
                    {name='Southern Guard', x=30, y=255, wbox = 600, nrows=4},
                },
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
