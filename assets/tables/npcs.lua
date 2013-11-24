--[[
    File: NPCs
    NPCs are referenced in tiled by there numerical ID.
    NPCs inherit the properties of Objs and can trigger Dialog and Cutscenes in Tiled.

    Properties:
        name - Name of NPC
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
        name = 'Bartender',
        image = 'assets/img/barbarian.gif',
        width = 35,
        height = 35
    },
    [2] = {
        name = 'NPC 2',
        image = 'assets/img/hero.png',
        width = 32,
        height = 32
    },
    [3] = {
        name = 'Priest',
        image = 'assets/img/priest.png',
        width = 32,
        height = 64
    },
    [4] = {
        name = 'Priestess',
        image = 'assets/img/priestess.png',
        width = 32,
        height = 64
    },
    [5] = {
        name = 'Mayor',
        image = 'assets/img/mayor.png',
        width = 32,
        height = 64
    },
    [6] = {
        name = 'Argus',
        image = 'assets/img/npc.png',
        width = 32,
        height = 32
    },
    [7] = {
        name = 'Catarina',
        image = 'assets/img/npc.png',
        width = 32,
        height = 32
    },
    [8] = {
        name = 'SouthernGuard',
        image = 'assets/img/guard.gif',
        width = 32,
        height = 32
    },
    [9] = {
        name = 'NorthernGuard',
        image = 'assets/img/npc.png',
        width = 32,
        height = 32
    },
    [10] = {
        name = 'earthdragon',
        image = 'assets/img/earth_dragon2.png',
        width = 192,
        height = 128
    },
}

