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
        name = 'Bat',
        stats = {
            hp = 100,
            mp = 60,
            str = 24,
            con = 24,
            int = 24,
            wis = 14,
            spd = 35,
        },
        exp = 10,
        gold = 100,
        group = { 2, 1 },
        img = {
            width = 32,
            height = 32,
            idle = {
                image = 'assets/img/bat_battle.png',
                frames = { 1,2,3 },
                fps = 7
            },
            dmg = {
                image = 'assets/img/bat_battle.png',
                frames = { 10,11,12,13,14,15},
                fps = 7
            },
            attack = {
                image = 'assets/img/bat_battle.png',
                frames = {  4,5,6,7, 8, 9, },
                fps = 7
            },
        }
    },
    [2] = {
        name = 'Bee',
        stats = {
            hp = 34,
            mp = 60,
            str = 24,
            con = 24,
            int = 24,
            wis = 14,
            spd = 22,
        },
        exp = 5,
        gold = 100,
        group = { 2, 1 },
        img = {
            width = 32,
            height = 32,
            idle = {
                image = 'assets/img/bee.png',
                frames = { 1, 2, 3, },
                fps = 7
            },
            dmg = {
                image = 'assets/img/bee.png',
                frames = { 1, 2, 3,},
                fps = 7
            },
            attack = {
                image = 'assets/img/bee.png',
                frames = {  7, 8, 9, },
                fps = 7
            },
        }
    },
    [3] = {
        name = 'Big Worm',
        stats = {
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
            width = 35,
            height = 50,
            idle = {
                image = 'assets/img/big_worm.png',
                frames = { 1, 2, 3, },
                fps = 7
            },
            dmg = {
                image = 'assets/img/big_worm.png',
                frames = { 1, 2, 3,},
                fps = 7
            },
            attack = {
                image = 'assets/img/big_worm.png',
                frames = {  7, 8, 9, },
                fps = 7
            },
        }
    },
    [4] = {
        name = 'EyeBall',
        stats = {
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
            width = 32,
            height = 38,
            idle = {
                image = 'assets/img/eyeball.png',
                frames = { 4,5,6 },
                fps = 7
            },
            dmg = {
                image = 'assets/img/eyeball.png',
                frames = { 1, 2, 3,},
                fps = 7
            },
            attack = {
                image = 'assets/img/eyeball.png',
                frames = {  7, 8, 9, },
                fps = 7
            },
        }
    },
    [5] = {
        name = 'Ghost',
        stats = {
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
            width = 40,
            height = 46,
            idle = {
                image = 'assets/img/ghost.png',
                frames = { 1, 2, 3, },
                fps = 7
            },
            dmg = {
                image = 'assets/img/ghost.png',
                frames = { 1, 2, 3,},
                fps = 7
            },
            attack = {
                image = 'assets/img/ghost.png',
                frames = {  7, 8, 9, },
                fps = 7
            },
        }
    },
    [6] = {
        name = 'Flower Power',
        stats = {
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
            width = 60,
            height = 76,
            idle = {
                image = 'assets/img/man_eater_flower.png',
                frames = { 1, 2, 3, },
                fps = 7
            },
            dmg = {
                image = 'assets/img/man_eater_flower.png',
                frames = { 1, 2, 3,},
                fps = 7
            },
            attack = {
                image = 'assets/img/man_eater_flower.png',
                frames = {  7, 8, 9, },
                fps = 7
            },
        }
    },
    [7] = {
        name = 'PumpKing',
        stats = {
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
            width = 46,
            height = 46,
            idle = {
                image = 'assets/img/pumpking.png',
                frames = { 4,5,6 },
                fps = 7
            },
            dmg = {
                image = 'assets/img/pumpking.png',
                frames = { 1, 2, 3,},
                fps = 7
            },
            attack = {
                image = 'assets/img/pumpking.png',
                frames = {  7, 8, 9, },
                fps = 7
            },
        }
    },
    [8] = {
        name = 'Slime',
        stats = {
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
            width = 32,
            height = 32,
            idle = {
                image = 'assets/img/slime.png',
                frames = { 1, 2, 3, },
                fps = 7
            },
            dmg = {
                image = 'assets/img/slime.png',
                frames = { 1, 2, 3,},
                fps = 7
            },
            attack = {
                image = 'assets/img/slime.png',
                frames = {  7, 8, 9, },
                fps = 7
            },
        }
    },
    [9] = {
        name = 'Small Worm',
        stats = {
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
            width = 32,
            height = 32,
            idle = {
                image = 'assets/img/small_worm.png',
                frames = { 1, 2, 3, },
                fps = 7
            },
            dmg = {
                image = 'assets/img/small_worm.png',
                frames = { 1, 2, 3,},
                fps = 7
            },
            attack = {
                image = 'assets/img/small_worm.png',
                frames = {  7, 8, 9, },
                fps = 7
            },
        }
    },
    [10] = {
        name = 'Snake',
        stats = {
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
            width = 32,
            height = 32,
            idle = {
                image = 'assets/img/snake.png',
                frames = { 4,5,6 },
                fps = 7
            },
            dmg = {
                image = 'assets/img/snake.png',
                frames = { 1, 2, 3,},
                fps = 7
            },
            attack = {
                image = 'assets/img/snake.png',
                frames = {  7, 8, 9, },
                fps = 7
            },
        }
    },
}
