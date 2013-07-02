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
        name = 'Hero 1',
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
        active = true
    },
    (end code)
--]]

return
{
    [1] = {
        name = 'Hero 1',
        image = 'assets/img/hero.png',
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
            def = 21,
            mdef = 11,
            spd = 10,
            atk = 21,
            mag = 21,
        },
        active = true
    },
    [2] = {
        name = 'Hero 2',
        image = 'assets/img/npc.png',
        width = 64,
        height = 64,
        stats = {
            level = 2,
            hp = 100,
            hpmax = 110,
            mp = 50,
            mpmax = 60,
            exp = 50,
            expmax = 100,
            atk = 22,
            mag = 22,
            def = 22,
            mdef = 12,
            spd = 10,
        },
        active = true
    },
    [3] = {
        name = 'Hero 3',
        image = 'assets/img/goblin_not_shitty.png',
        width = 64,
        height = 64,
        stats = {
            level = 1,
            hp = 100,
            hpmax = 280,
            mp = 60,
            mpmax = 70,
            exp = 50,
            expmax = 100,
            atk = 23,
            mag = 23,
            def = 23,
            mdef = 13,
            spd = 10,
        },
        active = true
    },
    [4] = {
        name = 'Hero 4',
        image = 'assets/img/some_fag.gif',
        width = 64,
        height = 64,
        stats = {
            level = 1,
            hp = 100,
            hpmax = 280,
            mp = 60,
            mpmax = 70,
            exp = 50,
            expmax = 100,
            atk = 24,
            mag = 24,
            def = 24,
            mdef = 14,
            spd = 10,
        },
        active = true
    },
}
