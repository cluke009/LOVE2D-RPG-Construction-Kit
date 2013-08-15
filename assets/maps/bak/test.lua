return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 2,
  height = 2,
  tilewidth = 32,
  tileheight = 32,
  properties = {},
  tilesets = {
    {
      name = "tiles",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "assets/img/tiles.png",
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
      width = 2,
      height = 2,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        2, 1,
        2, 1
      }
    },
    {
      type = "tilelayer",
      name = "objects",
      x = 0,
      y = 0,
      width = 2,
      height = 2,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0,
        0, 0
      }
    }
  }
}
