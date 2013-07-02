--[[
    File: Equipment
    NOT YET IMPLEMENTED:
    Equipment is referenced in tiled by there numerical ID.

    Effects apply to hero stats of the same name.
    Effects are applied sequentially top to bottom.
    "max" effects are permanent buffs.

    Properties:
        name - Name of equipment
        image - Location of image
        width - Width of image
        height - Height of image
        kind - The type of equipment
        desc - Text that describes the equipment
        effect - Buffs the equipment has on characters
        use - The id or ids of the characters that can use this equipment

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
            {'spd', 30},
            {'def', 10},
        },
        use = {1},
    },
    (end code)
--]]
return
{
    [1] = {
        name = 'Sweater',
        image = 'assets/img/sweater.png',
        width = 64,
        height = 64,
        kind = 'Armor',
        desc = 'Defense + 50',
        effect = {
            def = 50,
        },
        use = {1},
    },
    [2] = {
        name = 'Hoody',
        image = 'assets/img/hoody.png',
        width = 64,
        height = 64,
        kind = 'Armor',
        desc = 'Defense + 10, Magic Defense + 20',
        effect = {
            def = 10,
            mdef = 20,
        },
        use = {2},
    },
    [3] = {
        name = 'Speed Boots',
        image = 'assets/img/sboots.png',
        width = 64,
        height = 64,
        kind = 'Boots',
        desc = 'Speed + 30, Defense + 10',
        effect = {
            spd = 30,
            def = 10,
        },
        use = {1},
    },
    [4] = {
        name = 'Rifle',
        image = 'assets/img/rifle.png',
        width = 64,
        height = 64,
        desc = 'Attack + 50',
        kind = 'Weapon',
        effect = {
            atk = 50,
        },
        use = {1},
    },
    [5] = {
        name = 'Machete',
        image = 'assets/img/machete.png',
        width = 64,
        height = 64,
        desc = 'Attack + 50',
        kind = 'Weapon',
        effect = {
            atk = 10,
            mag = 20,
            def = 30,
            mdef = 40,
        },
        use = {2},
    },
}
