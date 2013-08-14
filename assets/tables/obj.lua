--[[
    File: Obj
    Objects are referenced in tiled by there numerical ID.
    You can use this to place generic in game objects.

    Properties:
        name - Name of object
        image - Location of image
        width - Width of image
        height - Height of image

    Example code:
    (begin code)
    [1] = {
        name = 'NPC 1',
        image = 'assets/img/water_dragon.gif',
        width = 128,
        height = 128
    },
    (end code)
--]]
return
{
    [1] = {
        name = 'Info',
        image = 'assets/img/sign.png',
        width = 32,
        height = 32
    },
    [2] = {
        name = 'Weapons',
        image = 'assets/img/wpn.png',
        width = 32,
        height = 32
    },
    [3] = {
        name = 'Items',
        image = 'assets/img/items.png',
        width = 32,
        height = 32
    },
    [4] = {
        name = 'Armor',
        image = 'assets/img/armor.png',
        width = 32,
        height = 32
    },
    [5] = {
        name = 'HP',
        image = 'assets/img/hpfountain.png',
        width = 64,
        height = 64
    },
    [6] = {
        name = 'MP',
        image = 'assets/img/mpfountain.png',
        width = 64,
        height = 64
    },
    [7] = {
        name = 'Portal',
        image = 'assets/img/portal.png',
        width = 64,
        height = 64
    },
}
