return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 30,
  height = 20,
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
          id = 2,
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
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "map",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 10, 10, 10, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 10, 10, 10, 10, 10, 10, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 10, 10, 10, 1, 1, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 10, 10, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 3, 3, 10, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 10, 3, 3, 10, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 10, 10, 10, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
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
          x = 416,
          y = 0,
          width = 96,
          height = 32,
          visible = true,
          properties = {
            ["to"] = "earthentrance"
          }
        },
        {
          name = "Spawn",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 64,
          width = 96,
          height = 32,
          visible = true,
          properties = {
            ["from"] = "earthentrance"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 864,
          y = 0,
          width = 64,
          height = 32,
          visible = true,
          properties = {
            ["to"] = "earth4"
          }
        },
        {
          name = "Spawn",
          type = "",
          shape = "rectangle",
          x = 832,
          y = 64,
          width = 96,
          height = 32,
          visible = true,
          properties = {
            ["from"] = "earth4"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 0,
          width = 64,
          height = 32,
          visible = true,
          properties = {
            ["to"] = "earth2"
          }
        },
        {
          name = "Spawn",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 64,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["from"] = "earth2"
          }
        },
        {
          name = "Spawn",
          type = "",
          shape = "rectangle",
          x = 704,
          y = 352,
          width = 64,
          height = 64,
          visible = true,
          properties = {
            ["from"] = "earth3"
          }
        }
      }
    }
  }
}
