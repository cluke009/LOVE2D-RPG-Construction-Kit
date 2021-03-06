return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 30,
  height = 24,
  tilewidth = 32,
  tileheight = 32,
  properties = {},
  tilesets = {
    {
      name = "GoldenTempleTiles3",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/GoldenTempleTiles3.png",
      imagewidth = 320,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "GoldenTempleTiles3-20",
      firstgid = 161,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/GoldenTempleTiles3-20.png",
      imagewidth = 320,
      imageheight = 320,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "goldenstuff",
      firstgid = 261,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/goldenstuff.png",
      imagewidth = 288,
      imageheight = 224,
      tileoffset = {
        x = 0,
        y = 0
      },
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
      width = 30,
      height = 24,
      visible = true,
      opacity = 1,
      properties = {
        ["solid"] = ""
      },
      encoding = "lua",
      data = {
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10,
        0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 10, 0, 10,
        10, 10, 10, 10, 10, 0, 0, 0, 0, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 10, 10, 10, 10, 0, 0, 0, 0, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 10, 0, 0, 10,
        10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 10, 0, 0, 0, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10,
        10, 0, 10, 10, 10, 10, 10, 0, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 10, 0, 0, 0, 10, 10, 10, 10, 10,
        10, 0, 0, 0, 0, 10, 10, 0, 0, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10,
        10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10,
        10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10,
        10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10,
        10, 10, 10, 0, 0, 0, 0, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10,
        10, 10, 10, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 0, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10
      }
    },
    {
      type = "tilelayer",
      name = "floor",
      x = 0,
      y = 0,
      width = 30,
      height = 24,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85,
        94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95,
        84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 86, 85, 86, 85, 86, 86, 84, 85, 84, 85, 86, 85, 86, 85,
        94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95,
        84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85,
        94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95,
        84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85,
        94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95,
        84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85,
        94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95,
        84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 86, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85,
        94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95,
        84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85,
        94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95,
        84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85,
        94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95,
        84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85,
        94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95,
        84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85,
        94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95,
        84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85,
        94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95,
        84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85, 84, 85,
        94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95, 94, 95
      }
    },
    {
      type = "tilelayer",
      name = "background",
      x = 0,
      y = 0,
      width = 30,
      height = 24,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 124, 125, 126, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134, 135, 136, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134, 135, 136, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134, 135, 136, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 134, 135, 136, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134, 135, 136, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134, 135, 136, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134, 135, 136, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134, 135, 136, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134, 135, 136, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 144, 145, 146, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "shadows",
      x = 0,
      y = 0,
      width = 30,
      height = 24,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        90, 90, 90, 90, 90, 90, 90, 90, 100, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 74, 74, 74, 74, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 74, 74, 74, 74, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 100, 0, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74,
        74, 74, 74, 74, 74, 74, 74, 74, 74, 100, 0, 0, 0, 100, 195, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74,
        74, 74, 74, 74, 74, 74, 74, 74, 74, 100, 0, 0, 0, 100, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74,
        74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 100, 0, 0, 100, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74,
        74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 100, 100, 0, 100, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74,
        100, 100, 100, 100, 74, 74, 74, 74, 74, 74, 100, 100, 0, 100, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74,
        100, 100, 100, 100, 100, 74, 74, 74, 74, 74, 74, 100, 100, 100, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 100,
        100, 100, 100, 100, 100, 100, 74, 74, 74, 74, 74, 100, 100, 0, 100, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 100, 100,
        100, 100, 100, 100, 100, 100, 74, 74, 74, 74, 74, 74, 100, 0, 100, 100, 100, 100, 0, 74, 74, 74, 74, 74, 74, 74, 74, 100, 100, 100,
        0, 0, 100, 100, 100, 100, 74, 74, 74, 74, 74, 74, 0, 100, 0, 0, 0, 0, 100, 74, 74, 74, 74, 74, 74, 74, 74, 100, 100, 100,
        0, 0, 0, 0, 0, 0, 74, 74, 74, 74, 74, 74, 0, 0, 0, 0, 0, 0, 0, 133, 74, 74, 74, 74, 74, 74, 74, 100, 100, 100,
        74, 74, 74, 0, 0, 0, 74, 74, 74, 74, 74, 74, 0, 0, 0, 0, 0, 0, 0, 74, 74, 74, 74, 74, 74, 74, 74, 100, 100, 100,
        74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 0, 0, 0, 0, 0, 74, 74, 74, 74, 74, 74, 74, 74, 74, 100, 100, 100,
        74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 0, 0, 0, 74, 74, 74, 74, 74, 74, 74, 74, 74, 100, 100, 100,
        74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 100, 100, 100,
        74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 100, 100, 100,
        0, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 100, 100, 100,
        0, 0, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 100, 100, 100,
        0, 0, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 100, 100, 100,
        0, 74, 74, 74, 74, 74, 74, 74, 100, 100, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 0, 100, 100, 100, 100,
        0, 74, 74, 74, 74, 74, 74, 100, 100, 100, 100, 100, 100, 100, 74, 74, 74, 74, 74, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
        0, 74, 74, 74, 74, 74, 74, 100, 100, 100, 100, 100, 100, 100, 74, 74, 74, 74, 74, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
      }
    },
    {
      type = "tilelayer",
      name = "ceiling",
      x = 0,
      y = 0,
      width = 30,
      height = 24,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        59, 59, 59, 59, 59, 59, 59, 59, 58, 100, 100, 100, 100, 57, 78, 52, 52, 52, 52, 52, 52, 58, 0, 0, 0, 57, 52, 52, 52, 19,
        52, 52, 53, 52, 52, 52, 52, 52, 19, 100, 100, 100, 100, 19, 52, 52, 52, 52, 52, 52, 52, 58, 0, 0, 0, 57, 52, 51, 52, 19,
        52, 52, 52, 52, 52, 52, 53, 52, 19, 100, 100, 100, 100, 19, 58, 55, 55, 55, 55, 55, 55, 0, 0, 0, 0, 55, 55, 55, 56, 19,
        55, 55, 55, 55, 55, 55, 55, 55, 77, 68, 100, 100, 100, 19, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19,
        0, 0, 0, 0, 0, 0, 0, 0, 57, 19, 100, 100, 100, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19,
        0, 0, 0, 0, 0, 0, 0, 0, 55, 77, 68, 100, 100, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19,
        9, 9, 9, 9, 68, 0, 0, 0, 0, 57, 19, 100, 100, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19,
        0, 0, 0, 0, 19, 0, 0, 0, 0, 55, 19, 100, 100, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19,
        0, 0, 0, 0, 77, 49, 68, 0, 0, 0, 77, 68, 100, 77, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 78,
        0, 0, 0, 0, 0, 57, 58, 0, 0, 0, 57, 19, 100, 100, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 78, 0,
        67, 9, 68, 0, 0, 57, 58, 0, 0, 0, 55, 77, 68, 100, 77, 9, 9, 9, 68, 0, 0, 0, 0, 0, 0, 0, 67, 78, 0, 0,
        19, 52, 77, 9, 9, 53, 58, 0, 0, 0, 0, 57, 77, 68, 100, 100, 100, 100, 57, 68, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0,
        19, 52, 52, 52, 52, 77, 78, 0, 0, 0, 0, 57, 52, 77, 9, 9, 9, 9, 59, 78, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0,
        19, 55, 57, 52, 52, 52, 58, 0, 0, 0, 0, 57, 52, 52, 51, 52, 52, 51, 52, 58, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0,
        19, 0, 55, 55, 55, 57, 58, 0, 0, 0, 0, 55, 57, 52, 52, 52, 52, 52, 52, 58, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0,
        19, 0, 0, 0, 0, 55, 55, 0, 0, 0, 0, 0, 55, 57, 52, 52, 52, 52, 53, 58, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0,
        19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 55, 55, 55, 55, 55, 55, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0,
        57, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0,
        57, 52, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0,
        57, 58, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0,
        57, 58, 58, 0, 0, 0, 0, 67, 9, 9, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0,
        57, 58, 56, 0, 0, 0, 67, 78, 0, 0, 77, 9, 9, 9, 68, 0, 0, 0, 67, 9, 9, 9, 9, 9, 9, 9, 78, 0, 0, 0,
        57, 58, 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        77, 59, 9, 9, 9, 9, 78, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "walls",
      x = 0,
      y = 0,
      width = 30,
      height = 24,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132, 132, 132, 132, 132, 132, 133, 0, 0, 0, 131, 132, 132, 132, 0,
        132, 132, 132, 132, 132, 132, 132, 132, 0, 0, 0, 0, 0, 0, 132, 132, 132, 132, 132, 132, 132, 133, 0, 0, 0, 131, 132, 132, 132, 0,
        132, 132, 132, 132, 132, 132, 132, 132, 0, 0, 0, 0, 0, 0, 132, 142, 142, 142, 142, 142, 142, 143, 0, 0, 0, 141, 142, 142, 142, 0,
        142, 142, 142, 142, 142, 142, 142, 142, 0, 0, 0, 0, 0, 0, 143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 132, 132, 132, 132, 0, 0, 0, 0, 0, 0, 131, 131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 142, 132, 132, 132, 132, 133, 0, 0, 0, 0, 131, 131, 131, 132, 132, 132, 132, 132, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 141, 142, 142, 132, 133, 0, 0, 0, 0, 141, 131, 131, 132, 132, 132, 132, 132, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 141, 143, 0, 0, 0, 0, 0, 141, 131, 132, 132, 132, 132, 132, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 141, 142, 142, 142, 142, 142, 143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "decoration",
      x = 0,
      y = 0,
      width = 30,
      height = 24,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 74, 74, 74, 0, 0, 74, 0, 0, 0, 74, 0, 0, 74, 0,
        74, 0, 0, 74, 74, 0, 0, 74, 0, 0, 0, 0, 0, 0, 74, 74, 74, 74, 74, 0, 0, 74, 0, 0, 0, 74, 0, 0, 74, 0,
        74, 0, 0, 74, 74, 0, 0, 74, 0, 0, 0, 0, 0, 0, 74, 74, 74, 74, 74, 0, 0, 74, 0, 0, 0, 74, 0, 0, 74, 0,
        74, 0, 0, 74, 74, 0, 0, 74, 0, 0, 0, 0, 0, 0, 74, 0, 0, 0, 286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 286, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 286, 0, 0, 0, 0, 0, 0, 0, 286, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 286, 0, 0, 0, 0, 0, 286, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 283, 0, 0, 0, 283, 0, 0, 0, 0,
        0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 74, 0, 0, 74, 0, 0, 0, 0, 0, 0, 74, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 74, 0, 0, 74, 74, 74, 0, 0, 0, 0, 74, 74, 74, 74, 74, 74, 74, 74, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 74, 74, 74, 0, 0, 0, 0, 74, 74, 74, 0, 0, 74, 0, 0, 74, 0, 286, 0, 0, 0, 286, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 74, 74, 0, 0, 0, 0, 0, 74, 74, 0, 0, 74, 0, 0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, 0, 74, 0, 0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "foreground",
      x = 0,
      y = 0,
      width = 30,
      height = 24,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 268, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 277, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 0, 268, 0, 0, 0, 0, 0, 0, 0, 268, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 288, 277, 0, 0, 0, 0, 0, 0, 0, 277, 288, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 297, 0, 268, 0, 0, 0, 0, 0, 268, 0, 297, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 306, 288, 277, 0, 0, 0, 0, 0, 277, 288, 306, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 297, 0, 0, 0, 0, 0, 0, 0, 297, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 297, 288, 268, 0, 0, 0, 268, 288, 297, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 306, 297, 277, 0, 0, 0, 277, 297, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 306, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 288, 0, 0, 0, 288, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 268, 0, 0, 0, 268, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 277, 0, 0, 0, 277, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 288, 0, 0, 0, 288, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 297, 0, 0, 0, 297, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 306, 0, 0, 0, 306, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          x = 0,
          y = 128,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["to"] = "earth2, 33, 23"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 736,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["to"] = "earthentrance, 15, 1"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 128,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "1",
            ["id"] = "2",
            ["solid"] = "false"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "2",
            ["id"] = "8"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 512,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "4",
            ["id"] = "2",
            ["solid"] = "false"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 704,
          y = 0,
          width = 96,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "31"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 704,
          y = 0,
          width = 96,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "3",
            ["id"] = "24"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 704,
          y = 64,
          width = 96,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "33",
            ["solid"] = "false"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 624,
          y = 32,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "34",
            ["solid"] = "true"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 848,
          y = 32,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "34",
            ["solid"] = "true"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "34",
            ["solid"] = "true"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "34",
            ["solid"] = "true"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "34",
            ["solid"] = "true"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "34",
            ["solid"] = "true"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "34",
            ["solid"] = "true"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 608,
          y = 0,
          width = 64,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "35",
            ["solid"] = "false"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 832,
          y = 0,
          width = 64,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "35",
            ["solid"] = "false"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 448,
          width = 64,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "35",
            ["solid"] = "false"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 448,
          width = 64,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "35",
            ["solid"] = "false"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 384,
          width = 64,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "35",
            ["solid"] = "false"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 32,
          width = 64,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "35",
            ["solid"] = "false"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 32,
          width = 64,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["id"] = "35",
            ["solid"] = "false"
          }
        }
      }
    }
  }
}
