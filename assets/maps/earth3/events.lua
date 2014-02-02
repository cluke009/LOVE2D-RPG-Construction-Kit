local Narration = {x=320, y = 30, alx='m',alxb='m',box = false,wbox = 600,}

return {
    [1] = {
        [1] = {
            replay = false,
            auto = false,
            dialog = {
                {'You found a SHOVEL!', Narration},
                {'It\'s rusty as hell, but you can now DIG!', Narration}
            },
            after = function()
                Event:putInventory('equipment', 2, 1)
                Event:removeObj(22, 'Obj', 'earth3')
            end
        },
    }
}
