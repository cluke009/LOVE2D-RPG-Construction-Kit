STRICT = true
DEBUG = true
io.stdout:setvbuf("no")

STATE = {

    map = 'home',
    hud = true,
    init = true,
    heroStartX = 480,
    heroStartY = 480,
    heroes = require 'assets.tables.heroes',
    inventory = {
        item = {},
        equipment = {},
    },
    equip = {},
    menu = {
        update = false
    },
}









