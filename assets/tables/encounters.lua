--[[
    File: Encounters
    Define random encounters on a per map basis

    Properties:
        kind - 'normal', 'boss' determines if battle is random or as written
        rate - determine frequency of encounters
        bg - the background image for this encounter
        [tables] - the different group types on this map, IDs from enemies.lua

    Example Code:
    (begin code)
    {
        ['north'] = {
            kind = 'normal',
            rate = {150, 175},
            bg = 'path/to/img',
            {1,2},
            {3,4},
            {5,6,7}
        }
    }
    (end code)
--]]
return
{
    ['north'] = {
        kind = 'normal',
        rate = {150, 175},
        bg = 'path/to/img',
        {1,2},
        {3,4},
        {5,6,7}
    }
}
