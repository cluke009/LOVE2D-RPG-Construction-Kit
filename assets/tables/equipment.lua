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
        name = 'Sweater',
        image = 'assets/img/sweater.png',
        width = 64,
        height = 64,
        kind = 'Armor',
        desc = 'Defense + 50',
        effect = {
            def = 50,
        },
        use = { 1 },
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
        use = { 2 },
    },
    [3] = {
        name = 'Speed Boots',
        image = 'assets/img/sboots.png',
        width = 64,
        height = 64,
        kind = 'Boots',
        desc = 'Speed + 30, Defense + 10',
        effect = {
            spd = 10,
            def = 5,
        },
        use = { 1 },
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
        use = { 1 },
    },
    [5] = {
        name = 'Machete',
        image = 'assets/img/machete.png',
        width = 64,
        height = 64,
        desc = 'Attack + 50',
        kind = 'Weapon',
        effect = {
            atk = 170,
        },
        use = { 2 },
    },
}
