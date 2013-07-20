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
        value - Cost to buy
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
        value = 100,
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
            { 'hpmax', 20 },
            { 'hp', 50 },
        },
        cost = 101
    },
    [2] = {
        name = 'Coffee',
        image = 'img/img/coffee.png',
        width = 64,
        height = 64,
        desc = 'MP + 20',
        effect = {
            { 'mp', 20 },
        },
        cost = 102
    },
    [3] = {
        name = 'Protein Shake',
        image = 'img/assets/shake.png',
        width = 64,
        height = 64,
        desc = 'A tasty shake that restores 20 MP',
        effect = {
            { 'mp', 20 },
        }
        ,
        cost = 103
    },
    [4] = {
        name = 'Item 4',
        image = 'img/assets/shake.png',
        width = 64,
        height = 64,
        desc = ' restores 20 MP',
        effect = {
            { 'mp', 20 },
        },
        cost = 104
    },
    [5] = {
        name = 'item5',
        image = 'img/assets/shake.png',
        desc = ' restores 20 MP',
        width = 64,
        height = 64,
        effect = {
            { 'mp', 20 },
        },
        cost = 105
    },
}
