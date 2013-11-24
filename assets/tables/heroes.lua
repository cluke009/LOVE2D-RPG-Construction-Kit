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
        name = 'Fighter',
        image = 'assets/img/hero.png',
        width = 32,
        height = 32,
        stats = {
            lvl = 1,
            spd = 9,
            str = 8,
            con = 7,
            int = 6,
            wis = 5,
        },
        special = {name1,name2},
        img = {
            -- Walk
            left = {
                image = 'assets/img/panda_dragon_idle.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
            right = {
                image = 'assets/img/panda_dragon_idle.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
            up = {
                image = 'assets/img/panda_dragon_idle.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
            down = {
                image = 'assets/img/panda_dragon_idle.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
            -- Battle
            idle = {
                image = 'assets/img/panda_dragon_idle.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
            attack = {
                image = 'assets/img/panda_dragon_attack.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
            dmg = {
                image = 'assets/img/panda_dragon_dmg.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
            -- Specials
            name1 = {
                image = 'assets/img/panda_dragon_dmg.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
            name2 = {
                image = 'assets/img/panda_dragon_dmg.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
        },
        active = true
    },
    (end code)
--]]

return
{
    [1] = {
        name = 'Anime Guy',
        stats = {
            level = 1,
            hp = 200,
            hpmax = 200,
            mp = 60,
            mpmax = 70,
            exp = 50,
            expmax = 100,
            -- -- -- -- -- -- -- --
            -- -- -- -- -- -- -- --
            spd = 24,
            str = 24,
            con = 24,
            int = 24,
            wis = 24,
        },
        img = {
            width = 35,
            height = 50,
            -- Walk
            left = {
                image = 'assets/img/baldric2.png',
                frames = { 10,11,12,13,14,15,16,17,18, },
                fps = 25
            },
            right = {
                image = 'assets/img/baldric2.png',
                frames = { 28,29,30,31,32,33,34,35,36 },
                fps = 25
            },
            up = {
                image = 'assets/img/baldric2.png',
                frames = { 1, 2, 3, 4, 5, 6, 7, 8, 9, },
                fps = 25
            },
            down = {
                image = 'assets/img/baldric2.png',
                frames = { 19,20,21,22,23,24,25,26,27 },
                fps = 25
            },

        },
        active = true
    },
    [2] = {
        name = 'The Woodsman',
        stats = {
            level = 2,
            hp = 200,
            hpmax = 200,
            mp = 60,
            mpmax = 70,
            exp = 50,
            expmax = 100,
            -- -- -- -- -- -- -- --
            -- -- -- -- -- -- -- --
            spd = 24,
            str = 24,
            con = 24,
            int = 24,
            wis = 24,
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
        active = false
    },
    [3] = {
        name = 'The Fairy',
        stats = {
            level = 1,
            hp = 200,
            hpmax = 200,
            mp = 60,
            mpmax = 70,
            exp = 50,
            expmax = 100,
            -- -- -- -- -- -- -- --
            -- -- -- -- -- -- -- --
            spd = 24,
            str = 24,
            con = 24,
            int = 24,
            wis = 24,
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
        active = false
    },
    [4] = {
        name = 'Princess',
        stats = {
            level = 1,
            hp = 200,
            hpmax = 200,
            mp = 60,
            mpmax = 70,
            exp = 50,
            expmax = 100,
            -- -- -- -- -- -- -- --
            -- -- -- -- -- -- -- --
            spd = 24,
            str = 24,
            con = 24,
            int = 24,
            wis = 24,
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
        active = false
    },
}
