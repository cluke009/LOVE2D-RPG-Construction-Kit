



return {
    [1] = {
        [1] = {
            replay = true,
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
    [4] = {{ func = 'restore, hp = true' }}
}