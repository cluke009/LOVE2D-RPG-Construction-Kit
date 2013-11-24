return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 20,
  height = 26,
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
          id = 5,
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
      width = 20,
      height = 26,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        1, 1, 10, 10, 10, 6, 10, 10, 10, 10, 10, 1, 1, 1, 10, 10, 10, 10, 1, 1,
        1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10,
        1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10,
        1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 10, 10, 10, 10,
        1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 10, 10, 1, 1,
        1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 10, 10, 1, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 10, 1, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 10, 1, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1
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
          x = 608,
          y = 128,
          width = 32,
          height = 96,
          visible = true,
          properties = {
            ["to"] = "forest2"
          }
        },
        {
          name = "Spawn",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 128,
          width = 32,
          height = 96,
          visible = true,
          properties = {
            ["from"] = "forest2"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 800,
          width = 96,
          height = 32,
          visible = true,
          properties = {
            ["to"] = "forestentrance"
          }
        },
        {
          name = "Spawn",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 736,
          width = 96,
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
          x = 160,
          y = 96,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["from"] = "forest4"
          }
        }
      }
    }
  }
}
