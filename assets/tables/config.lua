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

-- STATE.conf.font = {'helpers/navi/fonts/font.png'," abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`'*#=[]\""}
STATE.conf.font = {'assets/font/goodfonts/chary___.ttf', 18}
STATE.conf.map = 'south'
STATE.conf.auto_start = true
STATE.conf.heroStartX = 428
STATE.conf.heroStartY = 550
STATE.inventory.gold = 600
