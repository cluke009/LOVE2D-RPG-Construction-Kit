--
--     File: OBJ
--     Objects are referenced in tiled by there numerical ID.
--     You can use this to place generic in game objects.
--
--     Properties:
--         name - Name of object
--         image - Location of image
--         width - Width of image
--         height - Height of image
--
--     Example code:
--     (begin code)
--     [1] = {
--         name = 'NPC 1',
--         image = 'assets/img/water_dragon.gif',
--         width = 128,
--         height = 128
--     },
--     (end code)
--
return
{
    [1] = {
        name = 'Clear1',
        image = 'assets/img/clear.png',
    },
    [2] = {
        name = 'Clear2',
        image = 'assets/img/clear.png',
    },
    [3] = {
        name = 'Clear3',
        image = 'assets/img/clear.png',
    },
    [4] = {
        name = 'Clear4',
        image = 'assets/img/clear.png',
    },
    [5]= {
        name = 'Clear5',
        image = 'assets/img/clear.png',
    },
    [6] = {
        name = 'Clear6',
        image = 'assets/img/clear.png',
    },
    [7] = {
        name = 'Clear7',
        image = 'assets/img/clear.png',
    },
    [8] = {
        name = 'AnimTest',
        image = 'assets/img/modern4d.png',
        width = 43,
        height = 64,
        sequences = {
            auto = {fps = 7,frames = {1, 2, 3}}
        }
    },
    [9] = {
        name = 'BurlapSack',
        image = 'assets/img/burlap.png',
        width = 32,
        height = 32
    },
    [10] = {
        name = 'Westgate',
        image = 'assets/maps/img/westgate.png',
        width = 128,
        height = 96
    },
    [11] = {
        name = 'Eastgate',
        image = 'assets/img/eastgate.png',
        width = 128,
        height = 32
    },
    [20] = {
        name = 'Northgate',
        image = 'assets/img/northgate.png',
        width = 128,
        height = 32
    },
    [21] = {
        name = 'Southgate',
        image = 'assets/img/southgate.png',
        width = 128,
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
        width = 96,
        height = 48
    },
    [25] = {
        name = 'EarthWall',
        image = 'assets/img/earthwall.png',
        width = 160,
        height = 64
    },
    [26] = {
        name = 'Southgate',
        image = 'assets/img/southgate.png',
        width = 128,
        height = 32
    },
    [27] = {
        name = 'Girl Fairy Statue',
        image = 'assets/img/statue.png',
        width = 32,
        height = 32
    },
    [28] = {
        name = 'Boy Fairy Statue',
        image = 'assets/img/statue.png',
        width = 32,
        height = 32
    },
    [29] = {
        name = 'Girl Fairy Statue2',
        image = 'assets/img/statue.png',
        width = 32,
        height = 32
    },
    [30] = {
        name = 'EarthSwitch',
        image = 'assets/img/earthswitch.png',
        width = 32,
        height = 32
    }
}
