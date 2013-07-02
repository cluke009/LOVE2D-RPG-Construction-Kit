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
    }
    (end code)
--]]
return
{
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
        exp = 300,

    },
    [2] = {
        name = 'Panda Dragon',
        image = 'assets/img/panda_dragon.gif',
        width = 64,
        height = 64,
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
    }
}
