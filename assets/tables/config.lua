--
-- Class: State
-- Initialize any empty game data that needs to be present before we load.
--
-- Properties:
--
--     map - Map to load when game starts.
--     hud - Boolean to display hud.
--     font - Game font
--     gold - Starting gold
--     heroStartX - Starting X position.
--     heroStartY - Starting Y position.
--     inventory -
--         - item - Array of items in inventory
--         - equipment - Array of equipment in inventory
--
STATE = STATE:new {
    font = {'assets/font/press_start_2p/PressStart2P.ttf', 16},
    map = 'west',
    gold = 600
}
