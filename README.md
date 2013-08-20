LÖVE2D RPG Construction Kit
=============
An old-school RPG construction kit meant to be fully usable from a series of config files and the Tiled Map Editor.

Notice
------------
This readme and the current map files are out of date. Current documentation can be found in the "_docs" folder. This readme ill be updated again once things stabilize a bit more.

Config Files
------------
A series of lua tables where game data should be read from. These files are located in `assets/tables/`.

More info about how to use these files can be found in the comments or in the docs.

* `config.lua` - Game properties.
* `encounters.lua` - Define enemy groups by map.
* `enemies.lua` - Create new enemies.
* `equipment.lua` - Equipable items.
* `events.lua` - Define in-game events.
* `heroes.lua` - The heroes in your party.
* `items.lua` - Consumable items.
* `npcs.lua` - NPCs.
* `obj.lua` - Generic game objects for use in Tiled.
* `shop.lua` - Items and equipment at shops.
* `sound.lua` - Sound effects and music. Not fully implemented.
* `specials.lua` - shared Magic/Special attacks. Not yet implemented.

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

Creating Maps
------------
A typical map will have 4 layers in this order:

* `objects` - This is where you will place "NPC", "Obj", "Chest" etc..
* `foreground` - A special layer that will be drawn above the player sprite
* `background` - The sprite will be placed above this layer
* `map` - This layer is drawn behind everything and used as a collision layer

We use `map` for collision because of the way Zoetrope works. This allows us to avoid adding "solid":"false" property to every tile we want to walk on.

Events
------------
These are properties that you can add to "Obj"s and "NPC"s in Tiled. They are created in `events.lua`.
Events can include dialog and function calls from `triggers.lua`. Events will always play the first entry unless another has been triggered by a previous event.
You can trigger new events by adding the trigger property to `events.lua`. The value will be a string like "4:2".
This will trigger the second option in event "4" the next time you interact with it.


Scenes
------------
These are a special type of trigger that plays the specified cutscene.
Examples of cutscenes can be found in `assets/cutscenes/`.
You can add cutscenes by adding "func = 'scene, scene = filename'" to an event.
This will load the lua file of the same name from the `assets/cutscenes/` folder.

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
In battle
* "1-5" - chooses which enemy to attack

----------
In game
* "1-3" - correspnd to save slots

----------
* "ctr+alt+r" - reloads game
* "tab" - shows console



Requirements
------------
* [LÖVE 0.8.0](http://love2d.org/)
* [Zoetrope 1.4](http://libzoetrope.org) / packaged with source
* [Tiled 0.9.0](http://www.mapeditor.org/)
