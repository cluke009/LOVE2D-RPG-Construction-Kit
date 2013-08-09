--[[
    File: Heroes
    Base stats for when the hero joins your party.
    This table is copied directly to the STATE variable
    Stats will me modified automatically by the game.

    Properties:
        name - Name of hero
        image - Location of image
        width - Width of image
        height - Height of image
        stats - Hero stats like hp & mp
        active - Determines if a character is in your party.

    Example code:
    (begin code)
    [1] = {
        name = 'Hero',
        stats = {
            level = 1,
            hp = 5,
            hpmax = 5,
            mp = 5,
            mpmax = 5,
            exp = 0,
            expmax = 0,
            spd = 5,
            str = 5,
            con = 5,
            int = 5,
            wis = 5,
        },
        img = {
            width = 64,
            height = 64,
            -- Walk
            left = {
                image = 'assets/img/baldric.png',
                frames = { 10,11,12,13,14,15,16,17,18, },
                fps = 25
            },
            right = {
                image = 'assets/img/baldric.png',
                frames = { 28,29,30,31,32,33,34,35,36 },
                fps = 25
            },
            up = {
                image = 'assets/img/baldric.png',
                frames = { 1, 2, 3, 4, 5, 6, 7, 8, 9, },
                fps = 25
            },
            down = {
                image = 'assets/img/baldric.png',
                frames = { 19,20,21,22,23,24,25,26,27 },
                fps = 25
            },

        },
        active = true
    },
    (end code)
--]]

return
{
    [1] = {
        name = 'Hero',
        stats = {
            level = 1,
            hp = 5,
            hpmax = 5,
            mp = 5,
            mpmax = 5,
            exp = 0,
            expmax = 0,
            spd = 5,
            str = 5,
            con = 5,
            int = 5,
            wis = 5,
        },
        img = {
            width = 64,
            height = 64,
            -- Walk
            left = {
                image = 'assets/img/baldric.png',
                frames = { 10,11,12,13,14,15,16,17,18, },
                fps = 25
            },
            right = {
                image = 'assets/img/baldric.png',
                frames = { 28,29,30,31,32,33,34,35,36 },
                fps = 25
            },
            up = {
                image = 'assets/img/baldric.png',
                frames = { 1, 2, 3, 4, 5, 6, 7, 8, 9, },
                fps = 25
            },
            down = {
                image = 'assets/img/baldric.png',
                frames = { 19,20,21,22,23,24,25,26,27 },
                fps = 25
            },

        },
        active = true
    },
    [2] = {
        name = 'Tank',
        stats = {
            level = 2,
            hp = 5,
            hpmax = 5,
            mp = 5,
            mpmax = 5,
            exp = 0,
            expmax = 0,
            -- -- -- -- -- -- -- --
            -- -- -- -- -- -- -- --
            spd = 5,
            str = 5,
            con = 5,
            int = 5,
            wis = 5,
        },
        img = {
            width = 64,
            height = 64,
            -- Walk
            left = {
                image = 'assets/img/goldarmor.png',
                frames = { 10,11,12,13,14,15,16,17,18, },
                fps = 25
            },
            right = {
                image = 'assets/img/goldarmor.png',
                frames = { 28,29,30,31,32,33,34,35,36 },
                fps = 25
            },
            up = {
                image = 'assets/img/goldarmor.png',
                frames = { 1, 2, 3, 4, 5, 6, 7, 8, 9, },
                fps = 25
            },
            down = {
                image = 'assets/img/goldarmor.png',
                frames = { 19,20,21,22,23,24,25,26,27 },
                fps = 25
            },
        },
        active = true
    },
    [3] = {
        name = 'Mage',
        stats = {
            level = 3,
            hp = 5,
            hpmax = 5,
            mp = 5,
            mpmax = 5,
            exp = 0,
            expmax = 0,
            -- -- -- -- -- -- -- --
            -- -- -- -- -- -- -- --
            spd = 5,
            str = 5,
            con = 5,
            int = 5,
            wis = 5,
        },
        img = {
            width = 64,
            height = 64,
            -- Walk
            left = {
                image = 'assets/img/mage.png',
                frames = { 10,11,12,13,14,15,16,17,18, },
                fps = 25
            },
            right = {
                image = 'assets/img/mage.png',
                frames = { 28,29,30,31,32,33,34,35,36 },
                fps = 25
            },
            up = {
                image = 'assets/img/mage.png',
                frames = { 1, 2, 3, 4, 5, 6, 7, 8, 9, },
                fps = 25
            },
            down = {
                image = 'assets/img/mage.png',
                frames = { 19,20,21,22,23,24,25,26,27 },
                fps = 25
            },
        },
        active = true
    },
    [4] = {
        name = 'Princess',
        stats = {
            level = 4,
            hp = 5,
            hpmax = 5,
            mp = 5,
            mpmax = 5,
            exp = 0,
            expmax = 0,
            -- -- -- -- -- -- -- --
            -- -- -- -- -- -- -- --
            spd = 5,
            str = 5,
            con = 5,
            int = 5,
            wis = 5,
        },
        img = {
            width = 64,
            height = 64,
            -- Walk
            left = {
                image = 'assets/img/princess.png',
                frames = { 10,11,12,13,14,15,16,17,18, },
                fps = 25
            },
            right = {
                image = 'assets/img/princess.png',
                frames = { 28,29,30,31,32,33,34,35,36 },
                fps = 25
            },
            up = {
                image = 'assets/img/princess.png',
                frames = { 1, 2, 3, 4, 5, 6, 7, 8, 9, },
                fps = 25
            },
            down = {
                image = 'assets/img/princess.png',
                frames = { 19,20,21,22,23,24,25,26,27 },
                fps = 25
            },
        },
        active = true
    },
}
