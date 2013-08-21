--[[
    File: Enemies
    Enemies are referenced in tiled by there numerical ID.
    Remember to update the ID number or the Enemy will be overwritten with the new value.

    Properties:
        name - Name of enemy
        exp - Amount of exp given
        gold - Amount of gold given
        group - enemies it fights with
        stats - Enemy stats like hp & mp
        img.width - Width of image
        img.height - Height of image
        drops - Items/Equipment given
            Not currently implemented.

    Example code:
    (begin code)
    [1] = {
        name = 'Bat',
        stats = {
            hp = 20,
            mp = 60,
            str = 4,
            con = 4,
            int = 4,
            wis = 4,
            spd = 4,
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
    },    (end code)
--]]
return
{
    [1] = {
        name = 'Bat',
        stats = {
            hp = 2,
            mp = 2,
            str = 22,
            con = 4,
            int = 4,
            wis = 4,
            spd = 4,
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
            hp = 2,
            mp = 2,
            str = 2,
            con = 2,
            int = 2,
            wis = 2,
            spd = 2,
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
            hp = 2,
            mp = 2,
            str = 2,
            con = 2,
            int = 2,
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
            hp = 2,
            mp = 2,
            str = 2,
            con = 2,
            int = 2,
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
            hp = 2,
            mp = 2,
            str = 2,
            con = 2,
            int = 2,
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
            hp = 2,
            mp = 2,
            str = 2,
            con = 2,
            int = 2,
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
            str = 2,
            con = 2,
            int = 2,
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
            str = 2,
            con = 2,
            int = 2,
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
            str = 2,
            con = 2,
            int = 2,
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
            str = 2,
            con = 2,
            int = 2,
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
