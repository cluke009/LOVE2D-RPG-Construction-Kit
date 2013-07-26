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
        name = 'NPC 1',
        image = 'assets/img/npc.png',
        width = 32,
        height = 32,
    },
    [2] = {
        name = 'Betty',
        image = 'assets/img/betty_0.png',
        width = 48,
        height = 48
    }
}
