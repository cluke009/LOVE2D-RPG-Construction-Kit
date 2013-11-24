return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 26,
  height = 14,
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
      width = 26,
      height = 14,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        1, 10, 10, 10, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        1, 10, 10, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 1, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 1, 1, 10, 10, 10, 1,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 10, 10, 10, 1, 10, 10, 10, 1,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        1, 10, 10, 10, 10, 10, 10, 1, 1, 1, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
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
          x = 800,
          y = 192,
          width = 32,
          height = 96,
          visible = true,
          properties = {
            ["to"] = "beachpath1"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 160,
          width = 32,
          height = 96,
          visible = true,
          properties = {
            ["to"] = "town"
          }
        },
        {
          name = "Spawn",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 192,
          width = 32,
          height = 64,
          visible = true,
          properties = {
            ["from"] = "town"
          }
        },
        {
          name = "Spawn",
          type = "",
          shape = "rectangle",
          x = 736,
          y = 224,
          width = 32,
          height = 64,
          visible = true,
          properties = {
            ["from"] = "beachpath1"
          }
        },
        {
          name = "Test",
          type = "",
          shape = "rectangle",
          x = 260,
          y = 75,
          width = 32,
          height = 64,
          visible = true,
          properties = {
            ["id"] = "2"
          }
        }
      }
    }
  }
}
