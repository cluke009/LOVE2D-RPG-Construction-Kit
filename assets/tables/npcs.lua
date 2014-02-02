--
--     File: NPCs
--     NPCs are referenced in tiled by there numerical ID.
--     NPCs inherit the properties of Objs and can trigger Dialog and Cutscenes in Tiled.

--     Properties:
--         name - Name of NPC
--         image - Location of image
--         width - Width of image
--         height - Height of image

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
        name = 'Alan',
        image = 'assets/img/Alan.png',
        width = 32,
        height = 32,
        portraits = {
            [1] = 'assets/img/Alan1.png',
            [2] = 'assets/img/Alan2.png',
            [3] = 'assets/img/Alan3.png',
            [4] = 'assets/img/Alan4.png',
        },
    },
    [2] = {
        name = 'Tiffany',
        image = 'assets/img/priest.png',
        width = 32,
        height = 64,
        portraits = {
            [1] = 'assets/img/Tiffany1.png',
            [2] = 'assets/img/Tiffany2.png',
            [3] = 'assets/img/Tiffany3.png',
            [4] = 'assets/img/Tiffany4.png',
        },
    },
    [3] = {
        name = 'Bartender',
        image = 'assets/img/barbarian.gif',
        width = 32,
        height = 32,
        portraits = {
            [1] = 'assets/img/Bartender.png',
        },
    },
    [4] = {
        name = 'Sherman',
        image = 'assets/img/Sherman.png',
        width = 32,
        height = 32
    },
    [5] = {
        name = 'Copernicus',
        image = 'assets/img/Copernicus.png',
        width = 32,
        height = 32
    },
    [6] = {
        name = 'Prince',
        image = 'assets/img/prince_head.png',
        width = 96,
        height = 96
    },
    [7] = {
        name = 'Mayor',
        image = 'assets/img/mayor.png',
        width = 32,
        height = 64
    },
    [8] = {
        name = 'Cloaked Man',
        image = 'assets/img/cloaked_man.png',
        width = 32,
        height = 32
    },
    [9] = {
        name = 'Catarina',
        image = 'assets/img/npc.png',
        width = 32,
        height = 32
    },
    [10] = {
        name = 'EasternGuard',
        image = 'assets/img/eastguard.png',
        width = 32,
        height = 32
    },
    [11] = {
        name = 'NorthernGuard',
        image = 'assets/img/guardlaxsleep.png',
        width = 32,
        height = 32
    },
    [12] = {
        name = 'SouthernGuard',
        image = 'assets/img/guardlaxsleep.png',
        width = 32,
        height = 32
    },
    [13] = {
        name = 'WesternGuard',
        image = 'assets/img/westguard.png',
        width = 32,
        height = 32
    },
    [14] = {
        name = 'Earth Dragon',
        image = 'assets/img/earth_dragon.png',
        width = 128,
        height = 128
    },
    [15] = {
        name = 'Forest Dragon',
        image = 'assets/img/emerald_dragon.png',
        width = 128,
        height = 128
    },
}
