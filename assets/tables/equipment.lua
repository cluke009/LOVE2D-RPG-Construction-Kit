--[[
    File: Equipment
    Equipment is referenced in tiled by there numerical ID.

    Effects apply to hero stats of the same name.
    Effects are applied sequentially top to bottom.
    "max" effects are permanent buffs.

    Properties:
        name - Name of equipment
        image - Location of image
            -- Not currently implemented.
        width - Width of image
            -- Not currently implemented.
        height - Height of image
            -- Not currently implemented.
        kind - The type of equipment.
            This property can be anything and will be updated in game.
            Only one of any kind of item can be equipped.
        desc - Text that describes the equipment
        effect - Buffs the equipment has on characters.
            These will only apply if stats of the same name are found on the heroes.
        use - The id or ids of the characters that can use this equipment
            -- Not currently implemented.
        value - Cost to buy
            -- Not currently implemented.

    Example code:
    (begin code)
    [1] = {
        name = 'Speed Boots',
        image = 'assets/img/sboots.png',
        width = 64,
        height = 64,
        kind = 'Boots',
        desc = 'Speed + 30, Defense + 10',
        effect = {
            def = 10,
            mdef = 20,
        },
        use = {1},
    },
    (end code)
--]]
return
{
    [1] = {
        name = 'ULTIMA WEAPON!',
        image = 'assets/img/sweater.png',
        cost = 50,
        width = 64,
        height = 64,
        kind = 'Weapon',
        desc = 'KIDDING. \n It\'s just Masamune. \n\nAttack + 5',
        effect = {
            str = 50,
        },
        use = { 1 },
    },
    [2] = {
        name = 'Rusty Shovel',
        image = 'assets/img/hoody.png',
        cost = 50,
        width = 64,
        height = 64,
        kind = 'Weapon',
        desc = 'Trusty Rusty\n\nAttack + 10',
        effect = {
            con = 25,
            str = 25,
        },
        use = { 2 },
    },
    [3] = {
        name = 'Warrior Skirt',
        image = 'assets/img/sboots.png',
        cost = 50,
        width = 64,
        height = 64,
        kind = 'Armor',
        desc = 'A little too much\ngroin coverage. \n\nDefense + 5',
        effect = {
            spd = 10,
            con = 5,
        },
        use = { 1 },
    },
    [4] = {
        name = 'Air Force Ones',
        image = 'assets/img/rifle.png',
        cost = 50,
        width = 64,
        height = 64,
        desc = 'Get ta stompin\' \n\nSpeed + 5',
        kind = 'Boots',
        effect = {
            spd = 50,
        },
        use = { 1 },
    },
    [5] = {
        name = 'First Dragon Sphere',
        image = 'assets/img/machete.png',
        cost = 50,
        width = 64,
        height = 64,
        desc = 'Collect all 6! \n\n Grants 1/6th of a wish.',
        kind = 'Accessory',
        effect = {
            spd = 20,
        },
        use = { 2 },
    },
    [6] = {
        name = 'Seashell Bracelet',
        image = 'assets/img/machete.png',
        cost = 50,
        width = 64,
        height = 64,
        desc = 'She sells she shel... \nOh, fuck it. \n\n Halves damage from \nWater sources.',
        kind = 'Gauntlets',
        effect = {
            con = 17,
        },
        use = { 2 },
    },
}
