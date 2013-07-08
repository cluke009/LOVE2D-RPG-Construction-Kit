--[[
    File: Items
    Items are referenced in tiled by there numerical ID.

    Effects apply to hero stats of the same name.
    Effects are applied sequentially top to bottom.
    "max" effects are permanent buffs.

    Properties:
        name - Name of item
        image - Location of image
            -- Not currently implemented.
        width - Width of image
            -- Not currently implemented.
        height - Height of image
            -- Not currently implemented.
        desc - Text that describes the item
        effect - Buffs the item has on characters

    Example code:
    (begin code)
    [1] = {
        name = 'Beer',
        image = 'assets/img/beer.png',
        width = 64,
        height = 64,
        desc = 'Max HP + 20, HP + 10',
        effect = {
            {'hpmax', 20},
            {'hp', 50},
        }
    },
    (end code)
--]]
return
{
    [1] = {
        name = 'Beer',
        image = 'assets/img/beer.png',
        width = 64,
        height = 64,
        desc = 'Max HP + 20, HP + 10',
        effect = {
            {'hpmax', 20},
            {'hp', 50},
        }
    },
    [2] = {
        name = 'Coffee',
        image = 'img/img/coffee.png',
        width = 64,
        height = 64,
        desc = 'MP + 20',
        effect = {
            {'mp', 20},
        }
    },
    [3] = {
        name = 'Protein Shake',
        image = 'img/assets/shake.png',
        width = 64,
        height = 64,
        desc = 'A tasty shake that restores 20 MP',
        effect = {
            {'mp', 20},
        }
    },
    [4] = {
        name = 'item4',
        image = 'img/dragon.png',
        width = 64,
        height = 64,
        effect = {
            {'mp', 20},
        }
    },
    [5] = {
        name = 'item5',
        image = 'img/dragon.png',
        width = 64,
        height = 64,
        effect = {
            {'mp', 20},
        }
    },
}