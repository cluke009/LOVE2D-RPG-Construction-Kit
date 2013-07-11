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
            hp = 222222,
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
            hp = 222222,
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
}
