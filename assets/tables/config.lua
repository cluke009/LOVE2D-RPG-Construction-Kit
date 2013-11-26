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
STATE.conf.font = {'assets/font/press_start_2p/PressStart2P.ttf', 16}
STATE.conf.map = 'equipshop'
STATE.conf.heroStartX = 250
STATE.conf.heroStartY = 200
STATE.conf.log = true
STATE.inventory.gold = 600
