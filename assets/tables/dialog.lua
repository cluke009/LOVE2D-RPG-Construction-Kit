--[[
    File: Dialog
    Dialog is referenced in tiled by its numerical ID.
    The amount of dialog that will fit in a single box depends on the font properties.

    Example Code:
    (begin code)
    {
       [1] = {'Text for a single dialog box'}
       [2] = {'Text can span multiple Dialog boxes', 'By seperating text'}
       [3] = {'\n will create a line break'}
    }
    (end code)
--]]
return
{
    ['items'] = 'Recieved $item. Its a good one',
    ['enemies'] = 'I am a $enemy and this a placeholder until we have a battle system.',
    [1] = { 'Controls \n"S" - saves, "L" loads save, "D" deletes save' },
    [2] = {
        'Custom Dialog can be added to chests!!!',
        'It can even span multiple dialog boxes.\n You can add dialog by assigning a dialog property with the ID of your text.\n Edit "assets/tables/dialog.lua"'
    },
    [3] = { 'Even enemies can have custom dialog. \nLike this panda dragon here.' },
    [4] = { 'You can even trigger cutscenes from tiled.',
         'Just add the property "scene" and the filename.',
         '\nEdit: "assets/cutscenes/<filename>" ' },
    [5] = { 'I\'m an NPC I can do all the things Obj can do' },
}
