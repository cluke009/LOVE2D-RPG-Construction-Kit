return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 20,
  height = 12,
  tilewidth = 32,
  tileheight = 32,
  properties = {},
  tilesets = {
    {
      name = "BlackAndWhite",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/BlackAndWhite.png",
      imagewidth = 320,
      imageheight = 32,
      properties = {},
      tiles = {
        {
          id = 0,
          properties = {
            ["solid"] = "true"
          }
        },
        {
          id = 5,
          properties = {
            ["solid"] = "true"
          }
        },
        {
          id = 6,
          properties = {
            ["solid"] = "true"
          }
        },
        {
          id = 7,
          properties = {
            ["solid"] = "true"
          }
        },
        {
          id = 8,
          properties = {
            ["solid"] = "false"
          }
        },
        {
          id = 9,
          properties = {
            ["solid"] = "false"
          }
        }
      }
    },
    {
      name = "Dungeon_C",
      firstgid = 11,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/Dungeon_C.png",
      imagewidth = 512,
      imageheight = 512,
      transparentcolor = "#ff00ff",
      properties = {},
      tiles = {}
    },
    {
      name = "expandedAutotile",
      firstgid = 267,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/expandedAutotile.png",
      imagewidth = 256,
      imageheight = 192,
      transparentcolor = "#ff00ff",
      properties = {},
      tiles = {}
    },
    {
      name = "TileD",
      firstgid = 315,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/TileD.png",
      imagewidth = 512,
      imageheight = 512,
      transparentcolor = "#ff00ff",
      properties = {},
      tiles = {}
    },
    {
      name = "TileA4",
      firstgid = 571,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/TileA4.png",
      imagewidth = 512,
      imageheight = 480,
      transparentcolor = "#ff00ff",
      properties = {},
      tiles = {}
    },
    {
      name = "TileA5",
      firstgid = 811,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/TileA5.png",
      imagewidth = 256,
      imageheight = 512,
      transparentcolor = "#ff00ff",
      properties = {},
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "map",
      x = 0,
      y = 0,
      width = 20,
      height = 12,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "tilelayer",
      name = "background",
      x = 0,
      y = 0,
      width = 20,
      height = 12,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        271, 295, 295, 295, 295, 295, 295, 295, 295, 295, 295, 295, 295, 295, 295, 295, 295, 295, 295, 275,
        291, 625, 626, 625, 626, 625, 626, 625, 626, 625, 626, 625, 626, 625, 626, 625, 626, 625, 626, 283,
        291, 641, 642, 641, 642, 641, 642, 641, 642, 641, 642, 641, 642, 641, 642, 641, 642, 641, 642, 283,
        291, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 283,
        291, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 283,
        291, 925, 925, 925, 925, 925, 925, 925, 925, 925, 925, 925, 925, 925, 925, 925, 925, 925, 925, 283,
        291, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 283,
        291, 909, 909, 925, 925, 925, 909, 909, 909, 909, 909, 909, 909, 909, 925, 925, 925, 909, 909, 283,
        291, 909, 909, 925, 925, 925, 909, 909, 909, 909, 909, 909, 909, 909, 925, 925, 925, 909, 909, 283,
        291, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 909, 283,
        269, 287, 287, 287, 287, 287, 287, 287, 303, 909, 909, 909, 587, 287, 287, 287, 287, 287, 287, 268,
        0, 0, 0, 0, 0, 0, 0, 0, 291, 909, 909, 909, 283, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "sdf",
      x = 0,
      y = 0,
      width = 20,
      height = 12,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 507, 508, 509, 507, 508, 509, 472, 474, 412, 412, 472, 474, 507, 508, 509, 507, 508, 509, 0,
        0, 523, 524, 525, 523, 524, 525, 504, 506, 428, 428, 504, 506, 523, 524, 525, 523, 524, 525, 0,
        0, 539, 540, 541, 539, 540, 541, 0, 0, 444, 444, 0, 0, 539, 540, 541, 539, 540, 541, 0,
        0, 348, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 350, 0,
        0, 364, 365, 365, 365, 365, 365, 365, 365, 365, 365, 365, 365, 365, 365, 365, 365, 365, 366, 0,
        0, 0, 0, 424, 425, 426, 0, 0, 0, 0, 0, 0, 0, 0, 424, 425, 426, 0, 0, 0,
        0, 0, 0, 440, 441, 442, 0, 0, 0, 0, 0, 0, 0, 0, 440, 441, 442, 0, 0, 0,
        0, 0, 0, 456, 457, 458, 0, 0, 0, 0, 0, 0, 0, 0, 456, 457, 458, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          x = 288,
          y = 352,
          width = 96,
          height = 32,
          visible = true,
          properties = {
            ["to"] = "town,2,4"
          }
        },
        {
          name = "NPC",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 96,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["id"] = "7"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 160,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["event"] = "1",
            ["id"] = "1"
          }
        }
      }
    },
    {
      type = "tilelayer",
      name = "Tile Layer 4",
      x = 0,
      y = 0,
      width = 20,
      height = 12,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "foreground",
      x = 0,
      y = 0,
      width = 20,
      height = 12,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 349, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 424, 425, 426, 0, 0, 0, 0, 0, 0, 0, 0, 424, 425, 426, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
