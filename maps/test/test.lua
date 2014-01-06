return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 40,
  height = 32,
  tilewidth = 32,
  tileheight = 32,
  properties = {},
  tilesets = {
    {
      name = "town_forest_tiles2",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "town_forest_tiles2.png",
      imagewidth = 320,
      imageheight = 352,
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
      width = 40,
      height = 32,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        101, 101, 101, 101, 0, 0, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 0, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 101, 101, 0, 0, 0, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 101, 101, 0, 101, 101, 0, 0, 0, 0, 0, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 101, 0, 101, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 101, 101, 101, 0, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 0, 101, 101, 101, 0, 0, 0, 0, 0, 101, 101, 0, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 0, 0, 0, 101, 101, 101, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 0, 0, 0, 101, 101, 101, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 0, 0, 0, 101, 101, 101, 0, 0, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 0, 0, 0, 101, 101, 101, 0, 0, 0, 101, 101, 101, 0, 0, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 0, 0, 0, 101, 101, 101, 101, 101, 101, 101, 101, 0, 101, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 0, 101, 0, 0, 0, 101, 101, 101, 101, 101, 101, 101, 101, 0, 101, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101,
        101, 0, 0, 0, 101, 101, 101, 0, 0, 0, 0, 0, 0, 101, 0, 0, 101, 0, 0, 0, 0, 0, 0, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101,
        101, 0, 0, 0, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 101, 101, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101,
        101, 0, 0, 0, 101, 0, 101, 0, 0, 0, 0, 0, 0, 0, 101, 101, 0, 0, 0, 0, 0, 0, 0, 101, 101, 0, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 0,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 0, 0, 101, 0, 0, 0, 0, 0, 0, 101, 101, 0, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 0,
        101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101,
        101, 0, 0, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 0, 101, 101, 101, 101, 101, 101, 0, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
        101, 0, 0, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 0, 101, 101, 101, 101, 101, 101, 0, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
        0, 0, 0, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 0, 0, 0, 101, 101, 0, 0, 0, 0, 0, 0, 101, 101, 101, 101, 101, 101, 0, 0,
        0, 0, 0, 101, 0, 101, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 0, 0, 0, 101, 101, 0, 0, 0, 0, 0, 0, 101, 101, 101, 0, 101, 101, 101, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 101, 0, 0, 0, 0, 101, 0, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 0, 101, 0, 101, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 101, 0, 0, 0, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 0, 0, 0, 101, 0, 0, 0, 0, 0,
        101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 0, 0, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 0, 0, 0, 101, 0, 0, 0, 0, 0,
        101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 0, 0, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 101, 101, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "bg1",
      x = 0,
      y = 0,
      width = 40,
      height = 32,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        86, 86, 86, 86, 0, 0, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 86, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0,
        0, 0, 36, 37, 0, 0, 0, 38, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 47, 36, 0, 36, 48, 0, 0, 0, 0, 0, 36, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 46, 46, 46, 46, 46, 0, 0, 0, 0, 0, 0, 47, 36, 36, 0, 36, 36, 37, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46, 46, 46, 0, 46, 46, 0, 0, 0, 0, 0, 0, 86, 86, 0, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 0, 0, 0, 86, 86, 86, 86, 86, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 0, 0, 0, 86, 86, 86, 86, 86, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 0, 0, 0, 86, 86, 86, 0, 0, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 0, 0, 0, 86, 86, 86, 0, 0, 86, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 0, 0, 0, 0, 0, 0, 36, 37, 86, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 46, 46, 46, 46, 46, 46, 0, 46, 47, 36, 36, 36, 36, 0, 0, 0, 0, 0, 0, 0,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46, 46, 46, 46, 46, 0, 0, 0, 0, 0, 0, 0,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 0, 0, 86, 0, 0, 0, 0, 0, 0, 86, 0, 0, 0, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95, 95, 0, 0, 0, 0, 0, 0, 0, 86, 0, 0, 0, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95, 95, 0, 0, 0, 0, 0, 0, 0, 86, 0, 0, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 0,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 0, 0, 86, 0, 0, 0, 0, 0, 0, 86, 86, 0, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 0,
        86, 0, 0, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86,
        86, 0, 0, 86, 86, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 86, 86, 86, 86, 86, 86, 0, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86,
        86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 86, 86, 86, 86, 86, 86, 0, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86, 86,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 86, 86, 86, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 0, 86, 86, 86, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 86, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 0, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 86, 86, 86, 86, 86, 86, 0, 0, 0, 0, 86, 86, 86, 86, 0, 0, 0, 86, 0, 99, 99, 99, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99, 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 0, 99, 99, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99, 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95, 95, 95, 86, 0, 99, 99, 0, 0,
        99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "background",
      x = 0,
      y = 0,
      width = 40,
      height = 32,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        55, 71, 72, 13, 87, 87, 13, 71, 72, 71, 72, 71, 72, 53, 55, 61, 62, 61, 62, 61, 62, 61, 62, 61, 62, 61, 62, 61, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 73, 73, 73, 71, 72, 71, 72, 71, 72, 71, 72, 71, 72, 71, 72, 71, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 21, 22, 23, 29, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        87, 87, 0, 0, 87, 95, 87, 0, 0, 87, 87, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 23, 23, 23, 28, 28, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        12, 87, 87, 0, 0, 46, 0, 0, 87, 87, 87, 87, 12, 0, 0, 87, 87, 95, 87, 87, 87, 87, 95, 4, 2, 4, 4, 4, 4, 61, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        87, 87, 87, 0, 0, 0, 0, 0, 87, 87, 87, 87, 87, 87, 0, 0, 0, 78, 0, 0, 0, 87, 95, 95, 95, 95, 86, 86, 86, 71, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        87, 87, 87, 87, 87, 0, 87, 87, 87, 87, 87, 87, 87, 87, 0, 0, 0, 78, 0, 0, 49, 87, 87, 87, 87, 87, 13, 13, 86, 63, 61, 62, 0, 0, 0, 0, 0, 0, 0, 0,
        62, 87, 87, 87, 87, 87, 87, 87, 87, 12, 12, 87, 87, 87, 87, 87, 87, 95, 61, 62, 49, 87, 87, 87, 61, 62, 61, 62, 61, 62, 71, 72, 0, 0, 0, 0, 0, 0, 0, 0,
        72, 87, 87, 87, 87, 95, 87, 87, 87, 12, 12, 87, 87, 87, 87, 87, 87, 95, 71, 72, 49, 87, 87, 87, 71, 72, 71, 72, 71, 72, 61, 62, 0, 0, 0, 0, 0, 0, 0, 0,
        62, 87, 87, 95, 95, 95, 87, 87, 87, 87, 87, 86, 86, 86, 86, 86, 87, 95, 61, 62, 49, 87, 87, 87, 61, 62, 73, 87, 87, 73, 71, 72, 0, 0, 0, 0, 0, 0, 0, 0,
        72, 87, 12, 95, 11, 11, 11, 11, 11, 87, 87, 86, 23, 28, 28, 86, 87, 95, 71, 72, 49, 87, 87, 87, 71, 72, 73, 87, 87, 61, 62, 61, 62, 0, 0, 0, 0, 0, 33, 34,
        62, 87, 87, 95, 11, 12, 12, 12, 11, 87, 87, 86, 23, 28, 28, 86, 87, 95, 61, 62, 47, 36, 36, 36, 36, 36, 78, 0, 0, 71, 72, 71, 72, 0, 0, 0, 0, 0, 43, 44,
        72, 87, 87, 95, 11, 12, 12, 12, 11, 87, 87, 86, 4, 2, 4, 86, 87, 95, 71, 72, 0, 46, 46, 46, 46, 46, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 36, 36,
        62, 87, 12, 95, 11, 11, 11, 11, 11, 87, 87, 87, 87, 95, 87, 87, 15, 95, 87, 87, 87, 87, 87, 87, 87, 87, 95, 87, 0, 0, 0, 0, 0, 78, 78, 78, 78, 46, 46, 46,
        72, 87, 87, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 87, 87, 87, 12, 95, 12, 87, 87, 87, 87, 87, 87, 95, 95, 87, 87, 61, 62,
        62, 87, 87, 87, 87, 87, 87, 87, 95, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 87, 87, 71, 72,
        72, 87, 87, 87, 87, 87, 87, 87, 95, 87, 87, 95, 95, 95, 95, 95, 95, 95, 95, 87, 87, 95, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 95, 95, 87, 87, 61, 62,
        62, 87, 87, 11, 11, 11, 11, 11, 95, 87, 87, 95, 87, 87, 95, 95, 87, 87, 95, 87, 87, 95, 87, 13, 13, 13, 13, 13, 87, 87, 87, 87, 95, 95, 95, 95, 95, 87, 71, 72,
        72, 87, 87, 11, 23, 28, 28, 11, 95, 87, 87, 95, 87, 13, 95, 95, 13, 87, 95, 87, 87, 95, 87, 13, 23, 28, 28, 13, 87, 87, 87, 87, 95, 12, 87, 12, 95, 87, 86, 73,
        62, 87, 87, 11, 23, 28, 28, 11, 95, 87, 87, 95, 95, 95, 15, 15, 95, 95, 95, 87, 87, 95, 87, 13, 23, 28, 28, 13, 87, 87, 87, 87, 95, 87, 12, 87, 95, 87, 13, 13,
        72, 87, 87, 11, 4, 2, 5, 11, 95, 87, 87, 95, 95, 95, 16, 16, 95, 95, 95, 87, 87, 95, 87, 13, 4, 2, 4, 13, 87, 87, 87, 87, 95, 12, 87, 12, 95, 87, 73, 86,
        62, 87, 87, 87, 87, 95, 87, 87, 95, 87, 87, 95, 12, 13, 95, 95, 13, 12, 95, 87, 87, 95, 87, 13, 13, 95, 13, 13, 87, 87, 87, 87, 95, 87, 12, 87, 95, 87, 73, 86,
        72, 87, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 87, 12, 95, 95, 12, 87, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 87, 13, 13,
        62, 87, 95, 13, 13, 13, 13, 13, 95, 87, 87, 95, 95, 95, 95, 95, 95, 95, 95, 61, 62, 86, 61, 62, 61, 62, 61, 62, 95, 61, 62, 61, 62, 61, 62, 61, 62, 61, 62, 61,
        72, 87, 95, 23, 23, 28, 28, 28, 95, 87, 87, 87, 87, 87, 87, 87, 87, 87, 87, 71, 72, 86, 71, 72, 71, 72, 71, 72, 95, 71, 72, 71, 72, 71, 72, 71, 72, 71, 72, 71,
        87, 87, 95, 23, 23, 28, 28, 28, 95, 87, 87, 87, 87, 87, 87, 12, 87, 87, 87, 61, 62, 86, 82, 82, 61, 62, 82, 82, 95, 95, 95, 95, 23, 28, 28, 28, 73, 73, 86, 38,
        87, 87, 95, 4, 2, 4, 2, 4, 95, 87, 87, 12, 87, 87, 87, 87, 87, 87, 87, 71, 72, 86, 86, 82, 71, 72, 82, 86, 95, 95, 95, 95, 23, 28, 28, 2, 63, 63, 63, 50,
        87, 87, 95, 12, 95, 12, 95, 12, 95, 38, 36, 36, 37, 89, 87, 87, 86, 19, 86, 61, 62, 86, 86, 86, 87, 87, 86, 86, 86, 61, 62, 95, 4, 2, 4, 86, 86, 86, 86, 50,
        87, 87, 95, 95, 95, 95, 95, 95, 95, 50, 46, 46, 49, 87, 87, 87, 19, 19, 19, 71, 72, 82, 82, 87, 87, 87, 87, 82, 82, 71, 72, 95, 95, 95, 63, 86, 20, 20, 20, 50,
        36, 36, 36, 36, 36, 36, 36, 36, 36, 48, 20, 20, 47, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 37, 95, 95, 95, 63, 86, 20, 20, 14, 50,
        46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 20, 20, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 49, 73, 89, 73, 63, 86, 20, 20, 86, 50,
        20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 47, 36, 36, 36, 36, 36, 36, 36, 36, 48
      }
    },
    {
      type = "objectgroup",
      name = "objects",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {}
    }
  }
}
