--[[
    File: Events
    Define in-game events

    Properties:
        replay - true|false should event repeat default false
        auto - true|false should event autoplay default false
        dialog - Any dialog associatted with event
        trigger - What event is unlocked when this one is activated
        func - function to run after dialog, uses triggers.lua

    Example Code:
    (begin code)
    [1] = {
        [1] = {
            replay = true,
            auto = true,
            dialog = {'dialog 1.1\n go to the sign to trigger dialog 1.2'},
            func = 'removeObj, obj = 5',
            trigger = '3:2'
        },
        [2] = {
            replay = true,
            dialog = {'dialog 1.2\n Dialog 2.2 now activated'},
            trigger = '2:2',
        }
    },
    [2] = {
        [1] = {
            replay = true,
            dialog = {'dialog 2.1\n Dialog 1.2 now activated'},
            trigger = '1:2'
        },
        [2] = {
            dialog = {'dialog 2.2'},
        }
    },
    (end code)
--]]
return {
    [1] = {
        [1] = {
            replay = true,
            auto = true,
            dialog = {
                'This would be a good place to go and get a quest from the king or queen',
                'It\'s to bad we haven\'t built that yet :)'
            },
        },
        [2] = {
            replay = true,
            dialog = {'dialog 1.2\n Dialog 2.2 now activated'},
            trigger = '2:2',
        }
    },
    [2] = {
        [1] = {
            replay = true,
            dialog = {'dialog 2.1\n Dialog 1.2 now activated'},
            trigger = '1:2'
        },
        [2] = {
            dialog = {'dialog 2.2'},
        }
    },
    [3] = {
        [1] = {
            replay = true,
            auto = true,
            trigger = '4:2'
        },
        [2] = {
            func = 'scene, scene = scene1',
        },
    },
    [4] = {
        [1] = {
            dialog = {'dialog should only play once'},
        }
    },
    [5] = {
        [1] = {
            replay = false,
            auto = false,
            dialog = {'dialog 1.1\n go to the sign to trigger dialog 1.2'},
            func = 'party, heroes = 4',
        }
    },
    [6] = {
        [1] = {
            replay = true,
            auto = false,
            dialog = {'you feel refreshed'},
            func = 'restore, hp = true',
        }
    }
}
