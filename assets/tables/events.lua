



return {
    [1] = {
        [1] = {
            dialog = {'dialog 1.1\n go to the sign to trigger dialog 1.2'},
        },
        [2] = {
            dialog = {'dialog 1.2\n Dialog 2.2 now activated'},
            trigger = '2:2',
            func = {
                'restore,  mp = true',
                -- 'map, map = east'
            }
        }
    },
    [2] = {
        [1] = {
            dialog = {'dialog 2.1\n Dialog 1.2 now activated'},
            trigger = '1:2'
        },
        [2] = {
            dialog = {'dialog 2.2'},
        }
    },
    [3] = {
        [1] = {
            trigger = '3:2'
        },
        [2] = {
            dialog = {'dialog 3.2'},
        }
    }
}