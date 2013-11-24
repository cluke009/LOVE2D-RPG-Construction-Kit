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
    [6] = { 'IT IS A KEY!' },
    [7] = { 'What\'s up man?!' },
    [8] = { 'How you been my dawg?' },
    [9] = { '"ITEM SHOP' },
    [10] = {'EQUIPMENT SHOP' },
    [11] = { 'Hello, my child. You have fallen from the sky. You are our savior.' },
    [12] = { 'You look much better now, thanks to my healing magic.' },
    [13] = { 'I am the mayor. I am a giant douchebag.' },
    [14] = { 'Want to buy anything?' },
    [15] = { 'Care for a drink?' },
    [16] = {'"INN"' },
    [17] = { 'Hey, I\'m a guard. Be careful out there.' },
    [18] = { '[18] \n Intro',
            'NOTE: \n FOR NOW, YOU MAY ONLY CLICK ON GOLDEN SIGNS.',
            'Anyways, please continue onto the introduction. Thank you.',
            'Anime Guy lands in the church. \n The priest and priestess treat him for a day while he recovers.',
            'The next day, during the evening, the Mayor comes down to see what has happened.' },
    [19] = { '[19] \n Anime Guy awakens. He doesn\'t know where or who he is. \n The others in the church inform him that he has fallen from the sky.',
            'When he inquires about returning to where home may be, he learns of the fate that has befallen the town.' },
    [20] = { '[20] \n The priest tells him that the only exit from the town that has not been held by the mist, is to the south, and that it is now overrun with monsters. \n Nobody has ventured out and returned.',
            'Anime Guy decides to venture out to the south, to see if he can discover a way out.' },
    [21] = { '[21] \n As he gets up to begin his adventure, his stomach rumbles loudly. He is starving! \n The Mayor advises him to visit the local Inn, which has a tavern.' },
    [22] = { '[22] \n The Inn is to the southeast.' },
    [23] = { '[23] \nAt the Inn, Anime Guy sits down and orders a meal. \n The bartender asks him a few questions, the last of which is what Anime Guy plans on doing.' },
    [24] = { '[24] \n Upon hearing Anime Guy\'s plans, a man sitting at a table behind him quickly sobers up and walks over. \n He asks if Anime Guy is truly serious about venturing out to the south. \n He nods.' },
    [25] = { '[25] \n The Drunken Woodsman then offers to join the party, stating that he would like to \'give it a shot\' before the Town perishes.',
            'The player now has Anime Guy and the Drunken Woodsman in his party.' },
    [26] = { '[26] \n Very little changes within the Town at this point, save for the guard to the south. \n Upon seeing the Woodsman he decides to let them both pass. \n The player may now head down the mountain path.' },
    [27] = { '[27] \nThis is the exit to the south. \n The player must go here after getting the Woodsman in his party from the Inn',
            'This leads to \'south\'' },
    [28] = { '[28] \n Keep heading down until you see the guard.' },
    [29] = { '[29] \n Before the player gets the Woodsman in his party, this area of the map is closed via the gate next to the guard.',
            'However, if he is in the party, then the guard opens the gate for the player.',
            'The player may then venture down the southern Mountain Path.',
            'Go ahead and proceed south if you have the Woodsman in your party.' },
    [30] = { '[30] \n This is the exit to the first screen of the Mountain Path. \n \'mountainpath1\'' },
    [31] = { '[31] \n Near the end of the first screen of the mountain path, the two heroes come across a pair of goblins assaulting a fairy.',
            'They jump in and rescue the small lass.' },
    [32] = { '[32] \n Afterwards the Fairy inquires as to the motivation of the two. \n Upon hearing that they are heading south to find a solution to the problem of the mist, the Fairy eagerly asks to join.',
            'She is accepted and the party is completed.',
            'She then mentions something about a \'Moon Temple\' farther down the mountain path. \n The three of them press onward.' },
    [33] = { '[33] \n The second screen of the mountain path is purely exploratory. \n The player ventures through, continuing south.'},
    [34] = { '[34] \n The last screen of the mountain path is the entrance to the Golden Moon Temple.',
            'The Fairy states that this is the palace she was referring to, and that she believes it is connected to the land and the mist.',
            'She also recommends that they prepare before going inside.',
            'Continue south to enter the temple.' },
    [35] = { '[35] \n NOTE: The precise layout of the temple and the events contained within have not been decided upon yet.',
            'Proceed to the dragon encounter, which is down, to the right, and then back up.',
            'You may also explore the placholder temple if you are super fucking bored.' },
    [36] = { '[36] \n There\'s a dragon over here. \n So be careful, bitch.' },
    [37] = { '[37] \n Right about now you\'re gonna encounter your first true boss, the Dragon of the Golden Moon Temple, Platus.',
            ' You probably shouldn\'t go up and click him right now, cause chances are that he\'ll eat your ass up good.',
            'Instead, we can assume that you get REALLY lucky and beat him, so go ahead and click the last Golden Event Sign up and to the left, just behind him.' },
    [38] = { '[38] \n Upon defeating Platus, the Dragon\'s eyes change from the harsh red hue, to a normal tone, and he speaks helpfully to the player.',
            'He states, "Thank you for freeing me of my curse. Now, please head to the North, in the Brandished Woods, to help my brethren."',
            'A cutscene plays where the player sees the Golden Moon return to the sky.',
            'Please check the Emerald Event Sign to the right to signify the beginning of Chapter 2.' },
    [39] = { '[39] \n Upon the completion of the cutscene, Chapter 1 will have officially ended and Chapter 2 begins. \n You may now click Emerald Signs in the order you encounter them.',
            'The player may now exit the temple via a teleport of some sort. \n Once back in town, the next path that opens up is to the North.',
            'Please check the Emerald Sign next to the church before continuing on.' },
    [40] = { '[40] \n The grass has returned to the soil in the town.',
            'The shops now have new items to sell.',
            'Dialogue now changes within the town, and the priest directs the player to the north. \n The gate to the north is now open.',
            'The player must now head, you guessed it.... \n \n \n ... North.' },
    [41] = { '[41] CHURCH DESCRIPTION: \n The church of the 5 Moons is surprisingly well-decorated and grand compared to the rest of the Town.',
            'It is primarily carved from a grey stone, with silver trimming and ornate designs on the walls.',
            'There are murals of moons etched into the main room, and silver lanters light the entryway.',
            'Its grandeur, though contained in such a small size, hints to the secret of what this church really is.' },
    [42] = { '[42] \n This exit takes the player to the north.',
            'Although you can enter this area whenever, the gate within will only be open if you have completed the Golden Moon Temple.' },
    [43] = { 'Now you get the Drunken Woodsman in your party.' },
    [44] = { 'This first screen of the Forest Trail is purely exploratory. The player ventures through.' },
    [45] = { 'As the player continues through this screen, the scene "The Statue" plays, revealing more information about the Fairy and her tale.' },
    [46] = { 'The gate ahead will not be open until you complete the Golden Moon Temple.'}
}
