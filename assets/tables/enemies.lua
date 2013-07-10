--[[
    File: Enemies
    Enemies are referenced in tiled by there numerical ID.
    Remember to update the ID number or the Enemy will be overwritten with the new value.

    Properties:
        name - Name of enemy
        image - Location of image
        width - Width of image
        height - Height of image
        stats - Enemy stats like hp & mp
            Not currently implemented.
        exp - Amount of exp given
            Not currently implemented.
        gold - Amount of gold given
            Not currently implemented.
        drops - Items/Equipment given
            Not currently implemented.

    Example code:
    (begin code)
    [1] = {
        name = 'Water Dragon',
        image = 'assets/img/water_dragon.gif',
        width = 128,
        height = 128,
        stats = {
            level = 1,
            hp = 275,
            hpmax = 280,
            mp = 60,
            mpmax = 70,
            exp = 50,
            expmax = 100,
            def = 20,
            mdef = 10,
            spd = 10,
        },
        exp = 100,
        gold = 99,
        drops = {
            equipment = {1,2,3,4},
            items = {1,2}
        }
    }
    (end code)
--]]
return
{
    [1] = {
        name = 'Water Dragon',
        image = 'assets/img/water_dragon.gif',
        width = 128,
        height = 74,
        stats = {
            def = 24,
            ----------------------
            hp = 34,
            mp = 60,
            str = 24,
            con = 24,
            int = 24,
            wis = 14,
            spd = 22,
        },
        exp = 300,
        gold = 100,
        group = { 2, 1 },
        img = {
            idle = {
                image = 'assets/img/water_dragon.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
            attack = {
                image = 'assets/img/water_dragon.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
            dmg = {
                image = 'assets/img/water_dragon.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
        }
    },
    [2] = {
        name = 'Panda Dragon',
        image = 'assets/img/panda_dragon.gif',
        width = 64,
        height = 64,
        stats = {
            def = 24,
            ----------------------
            hp = 44,
            mp = 60,
            str = 24,
            con = 24,
            int = 24,
            wis = 14,
            spd = 25,
        },
        exp = 300,
        gold = 120,
        group = { 1, 2 },
        img = {
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
        }
    },
    [3] = {
        name = 'Panda Dragon',
        image = 'assets/img/panda_dragon.gif',
        width = 64,
        height = 64,
        stats = {
            level = 1,
            hp = 280,
            hpmax = 280,
            mp = 60,
            mpmax = 70,
            exp = 50,
            expmax = 100,
            atk = 24,
            mag = 24,
            def = 24,
            mdef = 14,
            spd = 30,
        },
        exp = 300,
        group = { 1, 2 },
        skills = { 'heal', 'water1' },
        img = {
            idle = {
                path = 'assets/img/panda_dragon.png',
                frames = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 },
                fps = 15
            },
            attack = {
                path = 'path/',
                frames = { 17, 19, 18, 19, 17, 19, 18, 19, 17, 19, 18, 19, 17, 19, 18, 19, 17, 19, },
                fps = 5
            },
            heal = {
                path = 'path/',
                frames = {},
                fps = 30
            },
            water1 = {
                path = 'path/',
                frames = {},
                fps = 30
            },
            dmg = {
                path = 'path/',
                frames = {},
                fps = 30
            },
        }
    },
    [4] = {
        name = 'Water Dragon',
        image = 'assets/img/water_dragon.gif',
        width = 128,
        height = 128,
        stats = {
            level = 1,
            hp = 280,
            hpmax = 280,
            mp = 60,
            mpmax = 70,
            exp = 50,
            expmax = 100,
            atk = 24,
            mag = 24,
            def = 24,
            mdef = 14,
            spd = 5,
        },
        exp = 300,
        group = { 1, 2 },
        skills = { 'heal', 'water1' },
        img = {
            idle = {
                path = 'assets/img/water_dragon.png',
                frames = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, },
                fps = 15
            },
            attack = {
                path = 'path/',
                frames = {},
                fps = 30
            },
            heal = {
                path = 'path/',
                frames = {},
                fps = 30
            },
            water1 = {
                path = 'path/',
                frames = {},
                fps = 30
            },
        }
    },
}
