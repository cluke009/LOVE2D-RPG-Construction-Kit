
return {
    [1] = {
        [1] = {
            -- NOTE: This event is attached to the bartender in the Inn.
            replay = true,
            auto = false,
            -- dialog = {
            --     { 'Test' },
            -- },
            after = function()
                Event:shop(1)
            end
        },
    }
}
