--[[
    File: Weapons
    NOT YET IMPLEMENTED:
    Weapons are referenced in tiled by there numerical ID.

    Effects apply to hero stats of the same name.
    Effects are applied sequentially top to bottom.
    "max" effects are permanent buffs.

    Properties:
        name - Name of weapon
        image - Location of image
        width - Width of image
        height - Height of image
        kind - The type of weapon
        desc - Text that describes the weapon
        effect - Buffs the weapon has on characters
        use - The id or ids of the characters that can equip this weapon


    Example code:
    (begin code)
    [1] = {
        name = 'Rifle',
        image = 'assets/img/rifle.png',
        width = 64,
        height = 64,
        desc = 'Attack + 50',
        effect = {
            {'atk', 50},
        },
        use = {1},
    },
    (end code)
--]]
return
{
    [1] = {
        name = 'Rifle',
        image = 'assets/img/rifle.png',
        width = 64,
        height = 64,
        desc = 'Attack + 50',
        effect = {
            {'atk', 50},
        },
        use = {1},
    },
    [2] = {
        name = 'Machete',
        image = 'assets/img/machete.png',
        width = 64,
        height = 64,
        desc = 'Attack + 50',
        effect = {
            {'atk', 10},
            {'mag', 20},
            {'def', 30},
            {'mdef', 40},
        },
        use = {2},
    },
}
