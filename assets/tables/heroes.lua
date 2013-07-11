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
            spd = 14,
            str = 24,
            con = 24,
            int = 24,
            wis = 14,
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
        name = 'Fighter',
        image = 'assets/img/hero.png',
        width = 32,
        height = 32,
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
        active = true
    },
    [2] = {
        name = 'Mage',
        image = 'assets/img/npc.png',
        width = 32,
        height = 32,
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
            spd = 14,
        },
        active = false
    },
    [3] = {
        name = 'Tank',
        image = 'assets/img/goblin_not_shitty.png',
        width = 32,
        height = 32,
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
            spd = 14,
        },
        active = false
    },
    [4] = {
        name = 'Hero 4',
        image = 'assets/img/some_fag.gif',
        width = 32,
        height = 32,
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
            spd = 14,
        },
        active = false
    },
}
