local Assets = require 'helpers.asset_helper'
local Event  = require 'helpers.event_helper'

return {
    [1] = {
        [1] = {
            replay = false,
            auto = true,
            goto = {'home', 1, 2},
            -- func = 'scene, scene = intro, anim = true'},
            -- dialog = {'test'}
        },
        [2] = {
            replay = false,
            auto = true,
            dialog = {
                {
                    --FemaleVoice
                    'Female voice:\n\n ... Are you... awake?',
                },
                {
                    --Priestess:
                    'Oh my goodness Doctor Alan! You did it!',
                    {Assets:get('npcs', 3, 'portraits')[1], 'right'}
                },
                {
                    --Doctor
                    'He’s up already? DAMN, I\'M GOOD.',
                    {Assets:get('npcs', 2, 'portraits')[1], 'right'}
                },
                {
                    'After a solid influx of willpower, the bandaged man manages to push himself upright in the bed to check out his surroundings.',
                },
                {
                    'Looking around, he sees a lovely blonde woman in religious garb, and an undoubtedly handsome doctor.',
                },
                {
                    '\n\n No homo.',
                },
                {
                    --Dr. Alan:
                    'Now, now, Tiffany- I didn\'t really do anything.',
                    {Assets:get('npcs', 2, 'portraits')[2], 'right'}
                },
                {
                    --Dr. Alan
                    'Besides bandage him up, push his broken limbs back into place, monitor him everyday, stop all of that blood from pouring out of his ears and administer my patented anti-coma brain massage.',
                    {Assets:get('npcs', 2, 'portraits')[3], 'right'}
                },
                {
                    --Anime Guy
                    '*Shakes head*',
                    {Assets:get('heroes', 1, 'portraits')[1], 'left'}
                },
                {
                    --Dr. Alan:
                    'Don\'t do that, though; I haven\'t drained your extra brain-fluid today.',
                    {Assets:get('npcs', 2, 'portraits')[4], 'right'}
                },
                {
                    --Dr. Alan:
                    'Oh, I almost forgot- I also gave you an extra pancreas! I had a spare one lying around.',
                    {Assets:get('npcs', 2, 'portraits')[1], 'right'}
                },
                {
                    --Anime Guy
                    '*Summons up super confused look.*',
                    {Assets:get('heroes', 1, 'portraits')[1], 'left'}
                },
                {
                    --Dr. Alan
                    'And let me know if you start craving mulch.',
                    {Assets:get('npcs', 2, 'portraits')[2], 'right'}
                },
                {
                    --Tiffany
                    'Why would he crave mulch?',
                    {Assets:get('npcs', 3, 'portraits')[2], 'right'}
                },
                {
                    --Dr. Alan
                    'No reason. So, how do you feel?',
                    {Assets:get('npcs', 2, 'portraits')[3], 'right'}
                },
                {
                    --Anime Guy
                    '*Jumps up off the bed with one fist high in the air; upon landing he juts his arm downward in an energetic manner as some sort of victory fanfare music plays in the background.*',
                    {Assets:get('heroes', 1, 'portraits')[1], 'left'}
                },
                {
                    --Tiffany
                    'What in the hell is that?',
                    {Assets:get('npcs', 3, 'portraits')[1], 'right'}
                },
                {
                    --Dr. Alan
                    'Sounds like music from that Endless Ecstasy game. Never played it, but my roommate in college did. He never got laid. Poor guy.',
                    {Assets:get('npcs', 2, 'portraits')[4], 'right'}
                },
                {
                    --Narrator
                    'The music fades away as a bit of normalcy returns to the room.',
                },
                {
                    --Tiffany
                    'Must be feeling better.',
                    {Assets:get('npcs', 3, 'portraits')[2], 'right'}
                },
                {
                    --Dr. Alan
                    'Probably starving though, eh?',
                    {Assets:get('npcs', 2, 'portraits')[1], 'right'}
                },
                {
                    --Anime Guy
                    '*Nods with vicious potency.*',
                    {Assets:get('heroes', 1, 'portraits')[1], 'left'}
                },
                {
                    --Dr. Alan
                    'Right. I think the extra pancreas makes you hungry. Or something. Maybe it makes you horny...',
                    {Assets:get('npcs', 2, 'portraits')[2], 'right'}
                },
                {
                    --Dr. Alan
                    'Are you like... WAY horny?',
                    {Assets:get('npcs', 2, 'portraits')[3], 'right'}
                },
                {
                    --Anime Guy
                    '*Assumes a look of mild terror.*',
                    {Assets:get('heroes', 1, 'portraits')[1], 'left'}
                },
                {
                    --Dr. Alan
                    'WAIT, No, it makes you feel violently nauseous! Duh.',
                    {Assets:get('npcs', 2, 'portraits')[4], 'right'}
                },
                {
                    --Dr. Alan
                    'Right, well, good luck with that. You might want something inside of you to forcibly vomit in unbearable pain later- trust me, it\'s WAY better than the dry-heaves.',
                    {Assets:get('npcs', 2, 'portraits')[1], 'right'}
                },
                {
                    --Anime Guy:
                    '*Nods his head! Let’s do this!*',
                    {Assets:get('heroes', 1, 'portraits')[1], 'left'}
                },
                {
                    --Dr. Alan
                    'Excellent then! The Inn is to the southeast of here.',
                    {Assets:get('npcs', 2, 'portraits')[2], 'right'}
                },
                {
                    --Dr. Alan
                    'It\'s the only real place to get food, because there\'s a terrible DEATH FOG around town completely barring all entry or exit.',
                    {Assets:get('npcs', 2, 'portraits')[3], 'right'}
                },
                {
                    --Dr. Alan
                    'It hasn\'t let up a bit since it showed up and the murderous, demonic monster-spawn are still ravaging people who attempt to leave to the south.',
                    {Assets:get('npcs', 2, 'portraits')[4], 'right'}
                },
                {
                    --Dr. Alan
                    'Which, like, REALLY SUCKS, cause it\'s the only place not completely covered in the Fog\'s awful, inescapable, suffocating Death-Mist.',
                    {Assets:get('npcs', 2, 'portraits')[1], 'right'}
                },
                {
                    --Narrator
                    'A moment of awkward silence ensues.',
                },
                {
                    --Tiffany
                    'So... HAVE FUN!',
                    {Assets:get('npcs', 3, 'portraits')[1], 'right'}
                },
                {
                    --Dr. Alan:
                    'I don\'t think the Inn has mulch, though.',
                    {Assets:get('npcs', 2, 'portraits')[2], 'right'}
                },
            },
        },
    },
}

