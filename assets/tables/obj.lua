--[[
    File: OBJ
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
        name = 'ItemSign',
        image = 'assets/img/itemsign.png',
        width = 32,
        height = 32
    },
    [6] = {
        name = 'ArmorSign',
        image = 'assets/img/armorsign.png',
        width = 32,
        height = 32
    },
    [7] = {
        name = 'Inn',
        image = 'assets/img/innsign.png',
        width = 32,
        height = 32
    },
    [8] = {
        name = 'Clear',
        image = 'assets/img/clear.png',
        width = 32,
        height = 32
    },
    [9] = {
        name = 'CabinRoof',
        image = 'assets/maps/img/CabinClosed96x96.png',
        width = 96,
        height = 96
    },
    [11] = {
        name = 'CabinDoor',
        image = 'assets/maps/img/CabinDoor.png',
        width = 32,
        height = 32
    },
    [20] = {
        name = 'Northgate',
        image = 'assets/img/northgate.png',
        width = 128,
        height = 32
    },
    [21] = {
        name = 'RescueObj',
        image = 'assets/img/clear.png',
        width = 320,
        height = 32
    },
    [22] = {
        name = 'Shovel',
        image = 'assets/img/shovel_icon.jpg',
        width = 32,
        height = 32
    },
    [23] = {
        name = 'FloorCrack',
        image = 'assets/img/floor_crack.png',
        width = 32,
        height = 32
    },
    [24] = {
        name = 'GoldenDoor',
        image = 'assets/img/golden_door.png',
        width = 64,
        height = 32
    },
}
