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
        name = 'Zu Zoo Beans',
        image = 'assets/img/beer.png',
        cost = 25,
        width = 64,
        height = 64,
        desc = 'Anime Guy\'s favorite! \n\n+50 Health',
        effect = {
            { 'hpmax', 20 },
            { 'hp', 50 },
        }
    },
    [2] = {
        name = 'Nasty Ale',
        image = 'img/img/coffee.png',
        cost = 50,
        width = 64,
        height = 64,
        desc = 'Perfect for \ncatching tears in.\n\n +50 Health',
        effect = {
            { 'mp', 20 },
        }
    },
    [3] = {
        name = 'Fairy Dust',
        image = 'img/assets/shake.png',
        cost = 50,
        width = 64,
        height = 64,
        desc = 'This is really just PCP. \n\n+50 Health',
        effect = {
            { 'mp', 20 },
        }
    },
    [4] = {
        name = 'Potion',
        image = 'img/dragon.png',
        cost = 100,
        width = 64,
        height = 64,
        desc = 'I forget. \n Turns you into a frog? \nMaybe? \n\n Seriously, I \ndon\'t remember.',
        effect = {
            { 'mp', 20 },
        }
    },
    [5] = {
        name = 'Phoenix Down',
        image = 'img/dragon.png',
        cost = 200,
        width = 64,
        height = 64,
        desc = 'A shitty album from \n some awful \n metalcore band. \n\nSaddens Enemies',
        effect = {
            { 'mp', 20 },
        }
    },
}
