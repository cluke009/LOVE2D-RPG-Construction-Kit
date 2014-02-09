return {
    [1] = {
        [1] = {
            replay = false,
            auto   = true,
            after  = function()
                Event:removeObj(32, 'Obj', 'testtown')
            end,
        }
    },
    [2] = {
        [1] = {
            replay = true,
            auto = true,
            before = function()
				Event:restoreObj(32, 'Obj', 'testtown')
			end,
            after  = function()
				Event:restoreObj(32, 'Obj', 'testtown')
            end,
        }
    }
}
