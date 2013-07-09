return {
    version = "1.1",
    luaversion = "5.1",
    orientation = "orthogonal",
    width = 30,
    height = 30,
    tilewidth = 32,
    tileheight = 32,
    properties = {},
    tilesets = {
        {
            name = "Tiles",
            firstgid = 1,
            tilewidth = 32,
            tileheight = 32,
            spacing = 0,
            margin = 0,
            image = "img/tiles.png",
            imagewidth = 128,
            imageheight = 32,
            properties = {},
            tiles = {
                {
                    id = 0,
                    properties = {
                        ["solid"] = "false"
                    }
                },
                {
                    id = 1,
                    properties = {
                        ["solid"] = "false"
                    }
                }
            }
        }
    },
    layers = {
        {
            type = "tilelayer",
            name = "map",
            x = 0,
            y = 0,
            width = 30,
            height = 30,
            visible = true,
            opacity = 1,
            properties = {},
            encoding = "lua",
            data = {
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
                2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1
            }
        },
        {
            type = "objectgroup",
            name = "objects",
            visible = true,
            opacity = 1,
            properties = {},
            objects = {
                {
                    name = "Door",
                    type = "",
                    shape = "rectangle",
                    x = 929,
                    y = 325,
                    width = 25,
                    height = 307,
                    visible = true,
                    properties = {
                        ["to"] = "east"
                    }
                },
                {
                    name = "Door",
                    type = "",
                    shape = "rectangle",
                    x = 6,
                    y = 330,
                    width = 25,
                    height = 307,
                    visible = true,
                    properties = {
                        ["to"] = "west"
                    }
                },
                {
                    name = "Door",
                    type = "",
                    shape = "rectangle",
                    x = 331,
                    y = 7,
                    width = 298,
                    height = 24,
                    visible = true,
                    properties = {
                        ["to"] = "north"
                    }
                },
                {
                    name = "Door",
                    type = "",
                    shape = "rectangle",
                    x = 331,
                    y = 932,
                    width = 298,
                    height = 24,
                    visible = true,
                    properties = {
                        ["to"] = "south"
                    }
                },
                {
                    name = "Spawn",
                    type = "",
                    shape = "rectangle",
                    x = 331,
                    y = 52,
                    width = 298,
                    height = 24,
                    visible = true,
                    properties = {
                        ["from"] = "north"
                    }
                },
                {
                    name = "Spawn",
                    type = "",
                    shape = "rectangle",
                    x = 331,
                    y = 889,
                    width = 298,
                    height = 24,
                    visible = true,
                    properties = {
                        ["from"] = "south"
                    }
                },
                {
                    name = "Spawn",
                    type = "",
                    shape = "rectangle",
                    x = 894,
                    y = 326,
                    width = 25,
                    height = 307,
                    visible = true,
                    properties = {
                        ["from"] = "east"
                    }
                },
                {
                    name = "Spawn",
                    type = "",
                    shape = "rectangle",
                    x = 38,
                    y = 330,
                    width = 25,
                    height = 307,
                    visible = true,
                    properties = {
                        ["from"] = "west"
                    }
                },
                {
                    name = "Chest",
                    type = "",
                    shape = "rectangle",
                    x = 416,
                    y = 352,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["item"] = "2"
                    }
                },
                {
                    name = "Obj",
                    type = "",
                    shape = "rectangle",
                    x = 224,
                    y = 352,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["dialog"] = "1",
                        ["id"] = "1"
                    }
                },
                {
                    name = "Chest",
                    type = "",
                    shape = "rectangle",
                    x = 544,
                    y = 352,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["item"] = "1"
                    }
                },
                {
                    name = "Chest",
                    type = "",
                    shape = "rectangle",
                    x = 608,
                    y = 352,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["item"] = "1"
                    }
                },
                {
                    name = "Chest",
                    type = "",
                    shape = "rectangle",
                    x = 480,
                    y = 352,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["item"] = "1"
                    }
                },
                {
                    name = "Obj",
                    type = "",
                    shape = "rectangle",
                    x = 352,
                    y = 352,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["id"] = "3"
                    }
                },
                {
                    name = "Chest",
                    type = "",
                    shape = "rectangle",
                    x = 416,
                    y = 576,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["equipment"] = "4"
                    }
                },
                {
                    name = "Obj",
                    type = "",
                    shape = "rectangle",
                    x = 352,
                    y = 576,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["id"] = "2"
                    }
                },
                {
                    name = "Obj",
                    type = "",
                    shape = "rectangle",
                    x = 768,
                    y = 352,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["id"] = "4"
                    }
                },
                {
                    name = "Chest",
                    type = "",
                    shape = "rectangle",
                    x = 768,
                    y = 544,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["equipment"] = "3"
                    }
                },
                {
                    name = "Chest",
                    type = "",
                    shape = "rectangle",
                    x = 768,
                    y = 480,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["equipment"] = "2"
                    }
                },
                {
                    name = "Chest",
                    type = "",
                    shape = "rectangle",
                    x = 768,
                    y = 416,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["equipment"] = "1"
                    }
                },
                {
                    name = "Chest",
                    type = "",
                    shape = "rectangle",
                    x = 480,
                    y = 576,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["equipment"] = "4"
                    }
                },
                {
                    name = "Chest",
                    type = "",
                    shape = "rectangle",
                    x = 544,
                    y = 576,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["equipment"] = "4"
                    }
                },
                {
                    name = "Chest",
                    type = "",
                    shape = "rectangle",
                    x = 608,
                    y = 576,
                    width = 32,
                    height = 32,
                    visible = true,
                    properties = {
                        ["equipment"] = "5"
                    }
                }
            }
        }
    }
}
