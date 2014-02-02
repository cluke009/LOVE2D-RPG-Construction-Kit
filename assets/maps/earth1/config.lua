return {
    name = 'Earth 1',
    bg = 'assets/img/narratebg.png',
    encounters = {
        rate = {50, 150},
        active = false,
        max = 20,
        random = {
            {1,2},
            {3,4}
        },
        scripted = {
            [1] = {4,5}
        }
    }
}
