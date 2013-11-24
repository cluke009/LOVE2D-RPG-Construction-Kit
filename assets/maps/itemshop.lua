return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 12,
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
      name = "collision",
      firstgid = 11,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "img/collision.png",
      imagewidth = 32,
      imageheight = 32,
      properties = {},
      tiles = {}
    },
    {
      name = "house interior 128x128",
      firstgid = 12,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../../../../Chris/Pickle/houses/house interior 128x128.png",
      imagewidth = 128,
      imageheight = 128,
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
      width = 12,
      height = 12,
      visible = true,
      opacity = 0.45,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 0,
        0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 0,
        0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 11, 0,
        0, 0, 0, 0, 0, 11, 0, 0, 0, 11, 11, 0,
        0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 11, 0,
        0, 0, 0, 0, 0, 11, 11, 0, 0, 11, 11, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "background",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "foreground",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 12, 13, 14, 15, 0, 0,
        0, 0, 0, 0, 0, 0, 16, 17, 18, 19, 0, 0,
        0, 0, 0, 0, 0, 0, 20, 21, 22, 23, 0, 0,
        0, 0, 0, 0, 0, 0, 24, 25, 26, 27, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          x = 224,
          y = 160,
          width = 64,
          height = 32,
          visible = true,
          properties = {
            ["to"] = "town"
          }
        },
        {
          name = "Spawn",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 128,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["from"] = "town"
          }
        },
        {
          name = "NPC",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 64,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["dialog"] = "14",
            ["id"] = "7",
            ["solid"] = "false"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 192,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["event"] = "10",
            ["id"] = "8",
            ["solid"] = "false"
          }
        }
      }
    }
  }
}
