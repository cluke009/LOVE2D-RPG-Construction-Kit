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
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11,
        11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 11,
        11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11,
        11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11,
        11, 0, 0, 0, 0, 10, 10, 0, 0, 0, 0, 11,
        11, 11, 11, 11, 11, 10, 10, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 10, 10, 11, 11, 11, 11, 11
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
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4,
        4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4,
        4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4,
        4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 4,
        4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4,
        4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4,
        4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4,
        1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 4, 4, 4, 4, 0, 0, 4, 4, 4, 4, 0,
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
          x = 160,
          y = 352,
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
          x = 160,
          y = 288,
          width = 64,
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
          x = 256,
          y = 128,
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
            ["event"] = "11",
            ["id"] = "8",
            ["solid"] = "false"
          }
        }
      }
    }
  }
}
