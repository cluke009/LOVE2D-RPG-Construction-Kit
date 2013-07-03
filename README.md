LÖVE2D RPG Construction Kit
=============
An old-school RPG construction kit meant to be fully usable from a series of config files and the Tiled Map Editor.

Config Files
------------
A series of lua tables where game data should be read from. These files are located in `assets/tables/`.

More info about how to use these files can be found in the comments or in the docs.

* `dialog.lua` - Add in game dialog.
* `enemies.lua` - Create new enemies.
* `equipment.lua` - Equipable items.
* `heroes.lua` - The heroes in your party.
* `items.lua` - Consumable items.
* `npcs.lua` - NPCs.
* `obj.lua` - Generic game objects for use in Tiled.

Tiled
------------
This construction kit comes with many built in objects for use in Tiled.
This is where you get to use all those config files you slaving over.
By placing objects in Tiled with specific names and properties you can start to build the game world.

Examples can be found in `assets/maps/`

* `Chest` - Items and equipment can go in here.
    * Add the property "item" / "equipment" with the "id" from the appropriate config file
* `Enemy` - Add the property "id" with the "id value" from `enemies.lua`.
    * Enemies act like NPCs right now. Eventually they will have custom behaviors.
* `NPC` - Add the property "id" with the "id value" from `npcs.lua`.
* `Obj` - Anything else that might go on your map.
    * These can be collideable or not by setting the property "solid" with a value of "false".
    * Add the property "id" with the "id value" from `obj.lua`.
* `Door` - Add the property "to" with the value "*mapname*" to load when passing over it.
* `Spawn` - Add the property "from" with the value "*mapname*" to specify the spawn point when coming from that location.

Triggers
------------
These are properties that you can add to "Obj"s in Tiled.
In `triggers.lua` you can create custom function to run when triggered in game.
There is an example you can run called test which will print "test" to the console when triggered.

Currently triggers do not support passing in function arguments.

Scenes
------------
These are a special type of trigger that plays the specified cutscene.
Examples of cutscenes can be found in `assets/cutscenes/`.
You can cutscenes by adding the property "scene" with a value of "*filename*" without the file extension.
This will load the lua file of the same name from the `assets/cutscenes/` folder.

This will be merged with the regular triggers once variables are supported.

Controls
------------
* "S" - saves the game
* "L" - loads the save
* "D" - deletes the save

----------

* "arrows" - move character
* "space" - brings up menu
* "enter" - interact
* "esc" - cancel action / close game

----------

* "ctr+alt+r" - reloads game
* "tab" - shows console



Requirements
------------
* [LÖVE 0.8.0](http://love2d.org/)
* [Zoetrope 1.4](http://libzoetrope.org) / packaged with source
* [Tiled 0.9.0](http://www.mapeditor.org/)
