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
--         image = 'assets/img/objs/water_dragon.gif',
--         width = 128,
--         height = 128
--     },
--     (end code)
--
return
{
    [1] = {
        name = 'Clear1',
        image = 'assets/img/objs/clear.png',
    },
    [2] = {
        name = 'Clear2',
        image = 'assets/img/objs/clear.png',
    },
    [3] = {
        name = 'Clear3',
        image = 'assets/img/objs/clear.png',
    },
    [4] = {
        name = 'Clear4',
        image = 'assets/img/objs/clear.png',
    },
    [5]= {
        name = 'Clear5',
        image = 'assets/img/objs/clear.png',
    },
    [6] = {
        name = 'Clear6',
        image = 'assets/img/objs/clear.png',
    },
    [7] = {
        name = 'Clear7',
        image = 'assets/img/objs/clear.png',
    },
    [8] = {
        name = 'AnimTest',
        image = 'assets/img/objs/modern4d.png',
        width = 43,
        height = 64,
        sequences = {
            auto = {fps = 7,frames = {1, 2, 3}}
        }
    },
    [9] = {
        name = 'BurlapSack',
        image = 'assets/img/objs/burlap.png',
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
        image = 'assets/img/objs/eastgate.png',
        width = 128,
        height = 32
    },
    [20] = {
        name = 'Northgate',
        image = 'assets/img/objs/northgate.png',
        width = 128,
        height = 32
    },
    [21] = {
        name = 'Southgate',
        image = 'assets/img/objs/southgate.png',
        width = 128,
        height = 32
    },
    [22] = {
        name = 'Shovel',
        image = 'assets/img/objs/shovel_icon.jpg',
        width = 32,
        height = 32
    },
    [23] = {
        name = 'FloorCrack',
        image = 'assets/img/objs/floor_crack.png',
        width = 32,
        height = 32
    },
    [24] = {
        name = 'GoldenDoor',
        image = 'assets/img/objs/goldendoor.png',
        width = 96,
        height = 64
    },
    [25] = {
        name = 'EarthWall',
        image = 'assets/img/objs/earthwall.png',
        width = 160,
        height = 96
    },
    [26] = {
        name = 'Southgate',
        image = 'assets/img/objs/southgate.png',
        width = 128,
        height = 32
    },
    [27] = {
        name = 'Girl Fairy Statue',
        image = 'assets/img/objs/statue.png',
        width = 32,
        height = 32
    },
    [28] = {
        name = 'Boy Fairy Statue',
        image = 'assets/img/objs/statue.png',
        width = 32,
        height = 32
    },
    [29] = {
        name = 'Girl Fairy Statue2',
        image = 'assets/img/objs/statue.png',
        width = 32,
        height = 32
    },
    [30] = {
        name = 'EarthSwitch',
        image = 'assets/img/objs/earthswitch.png',
        width = 32,
        height = 32
    },
    [31] = {
        name = 'GoldenDoorActivated',
        image = 'assets/img/objs/goldendoor2.png',
        width = 96,
        height = 64
    },
    [32] = {
        name = 'TownGrass',
        image = 'assets/img/objs/towngrass.png',
        width = 96,
        height = 96
    },
    [33] = {
        name = 'DoorShadow',
        image = 'assets/img/objs/doorshadow.png',
        width = 96,
        height = 64
    },
    [34] = {
        name = 'Torch',
        image = 'assets/img/objs/torch.png',
        width = 32,
        height = 32,
        sequences = {
            auto = {fps = 4,frames = {1, 2, 3, 4}}
        }
    },
    [35] = {
        name = 'Torchlight',
        image = 'assets/img/objs/torchlight.png',
        width = 64,
        height = 96,
        sequences = {
            auto = {fps = 2,frames = {1, 2, 3, 4, 5, 6, 7, 8}}
        }
    },
    [36] = {
        name = 'TorchlightReverse',
        image = 'assets/img/objs/torchlight.png',
        width = 64,
        height = 96,
        sequences = {
            auto = {fps = 2,frames = {8, 7, 6, 5, 4, 3, 2, 1}}
        }
    },
    [37] = {
        name = 'Coffin',
        image = 'assets/img/objs/coffin.png',
        width = 32,
        height = 64
    },
    [38] = {
        name = 'BossCoffin',
        image = 'assets/img/objs/bosscoffin.png',
        width = 32,
        height = 64
    },
}
