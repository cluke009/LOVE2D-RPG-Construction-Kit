
return {
    [1] = {
        [1] = {
            -- NOTE: This event is attached to the bartender in the Inn.

            -- dialog = {

            --     { '',
            --         { x=30, y=245, wbox=300, nrows=5,
            --         nvchs=4, choices = { 'attack', 'magic', 'defend', 'run'}
            --         }
            --     },
            -- },
            after = function()
                Event:shop()
            end
        },
    }
}
