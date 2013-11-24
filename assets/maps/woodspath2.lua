return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 12,
  height = 28,
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
      image = "img/BlackAndWhite.png",
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
          id = 9,
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
      width = 12,
      height = 28,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 10, 10, 10, 1, 1, 1, 1, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 1, 1, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 1, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 1, 1, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 1, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 1, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 1, 10, 10, 10, 10, 1, 10, 10, 10, 1,
        1, 10, 1, 10, 10, 10, 10, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 1, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 1, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 1, 1, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 1, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 1, 10, 10, 1, 1, 1,
        1, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 1, 1, 1, 1, 10, 10, 10, 1, 1, 1, 1
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
          x = 128,
          y = 0,
          width = 96,
          height = 32,
          visible = true,
          properties = {
            ["to"] = "forestentrance"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 864,
          width = 96,
          height = 32,
          visible = true,
          properties = {
            ["to"] = "woodspath1"
          }
        },
        {
          name = "Spawn",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 64,
          width = 64,
          height = 32,
          visible = true,
          properties = {
            ["from"] = "forestentrance"
          }
        },
        {
          name = "Spawn",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 800,
          width = 64,
          height = 32,
          visible = true,
          properties = {
            ["from"] = "woodspath1"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 480,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["dialog"] = "45",
            ["id"] = "11"
          }
        }
      }
    }
  }
}
