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
        image = 'assets/img/enemies/water_dragon.gif',
        width = 128,
        height = 128,
        stats = {
            hp = 34,
            mp = 60,
            str = 24,
            con = 24,
            int = 24,
            wis = 14,
            spd = 22,
        },
        exp = 100,
        gold = 99,
        group = { 2, 1 },
        specials = { 1, 2, 3 }
        drops = {
            equipment = {1,2,3,4},
            items = {1,2}
        },
        img = {
            idle = {
                image = 'assets/img/enemies/water_dragon.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
            attack = {
                image = 'assets/img/enemies/water_dragon.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
            dmg = {
                image = 'assets/img/enemies/water_dragon.png',
                frames = { 1, 2, 3, },
                fps = 5
            },
        }
    }
    (end code)
--]]
return
{
    [1] = {
        name = 'Copernicus',
        stats = {
            hp = 20,
            mp = 60,
            str = 24,
            con = 24,
            int = 24,
            wis = 14,
            spd = 22,
        },
        exp = 3000,
        gold = 100,
        group = { 11 },
        img = {
            width = 32,
            height = 32,
            idle = {
                image = 'assets/img/enemies/Copernicus.png',
                frames = { 1,},
                fps = 7
            },
            dmg = {
                image = 'assets/img/enemies/Copernicus.png',
                frames = { 1,},
                fps = 7
            },
            attack = {
                image = 'assets/img/enemies/Copernicus.png',
                frames = { 1,},
                fps = 7
            },
        }
    },
    [2] = {
        name = 'Sherman',
        stats = {
            hp = 200,
            mp = 60,
            str = 24,
            con = 24,
            int = 24,
            wis = 14,
            spd = 22,
        },
        exp = 3000,
        gold = 100,
        group = { 11 },
        img = {
            width = 32,
            height = 32,
            idle = {
                image = 'assets/img/enemies/Sherman.png',
                frames = { 1,},
                fps = 7
            },
            dmg = {
                image = 'assets/img/enemies/Sherman.png',
                frames = { 1,},
                fps = 7
            },
            attack = {
                image = 'assets/img/enemies/Sherman.png',
                frames = { 1,},
                fps = 7
            },
        }
    },
    [3] = {
        name = 'Fire Bat',
        stats = {
            hp = 344,
            mp = 60,
            str = 24,
            con = 24,
            int = 24,
            wis = 14,
            spd = 22,
        },
        exp = 11,
        gold = 100,
        group = { 2, 1 },
        img = {
            width = 64,
            height = 64,
            idle = {
                image = 'assets/img/enemies/fire_bat.png',
                frames = { 4,5,6 },
                fps = 7
            },
            dmg = {
                image = 'assets/img/enemies/fire_bat.png',
                frames = { 1, 2, 3,},
                fps = 7
            },
            attack = {
                image = 'assets/img/enemies/fire_bat.png',
                frames = {  7, 8, 9, },
                fps = 7
            },
        }
    },
    [4] = {
        name = 'Jungle Bat',
        stats = {
            hp = 344,
            mp = 60,
            str = 24,
            con = 24,
            int = 24,
            wis = 14,
            spd = 22,
        },
        exp = 10,
        gold = 100,
        group = { 2, 1 },
        img = {
            width = 64,
            height = 64,
            idle = {
                image = 'assets/img/enemies/jungle_bat.png',
                frames = { 1, 2, 3, },
                fps = 7
            },
            dmg = {
                image = 'assets/img/enemies/jungle_bat.png',
                frames = { 1, 2, 3,},
                fps = 7
            },
            attack = {
                image = 'assets/img/enemies/jungle_bat.png',
                frames = {  7, 8, 9, },
                fps = 7
            },
        }
    },
    [5] = {
        name = 'GoldenMoonDragon',
        stats = {
            hp = 200,
            mp = 60,
            str = 24,
            con = 24,
            int = 24,
            wis = 14,
            spd = 22,
        },
        exp = 3000,
        gold = 100,
        group = { 11 },
        img = {
            width = 192,
            height = 128,
            idle = {
                image = 'assets/img/enemies/earth_dragon.png',
                frames = { 1,},
                fps = 7
            },
            dmg = {
                image = 'assets/img/enemies/earth_dragon.png',
                frames = { 1,},
                fps = 7
            },
            attack = {
                image = 'assets/img/enemies/earth_dragon.png',
                frames = { 1,},
                fps = 7
            },
        }
    },
    [6] = {
        name = 'Emerald Dragon',
        stats = {
            hp = 200,
            mp = 60,
            str = 24,
            con = 24,
            int = 24,
            wis = 14,
            spd = 22,
        },
        exp = 3000,
        gold = 100,
        group = { 11 },
        img = {
            width = 192,
            height = 128,
            idle = {
                image = 'assets/img/enemies/emerald_dragon.png',
                frames = { 1,},
                fps = 7
            },
            dmg = {
                image = 'assets/img/enemies/emerald_dragon.png',
                frames = { 1,},
                fps = 7
            },
            attack = {
                image = 'assets/img/enemies/emerald_dragon.png',
                frames = { 1,},
                fps = 7
            },
        }
    },
}
