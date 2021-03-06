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
      image = "../../img/tiles/BlackAndWhite.png",
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
          id = 4,
          properties = {
            ["solid"] = "false"
          }
        },
        {
          id = 7,
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
      name = "simple tilwe",
      firstgid = 11,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/simple tilwe.jpg",
      imagewidth = 512,
      imageheight = 32,
      properties = {},
      tiles = {}
    },
    {
      name = "Castle_exterior_TileC",
      firstgid = 27,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/Castle_exterior_TileC.png",
      imagewidth = 512,
      imageheight = 512,
      properties = {},
      tiles = {}
    },
    {
      name = "Castle_exterior_TileD",
      firstgid = 283,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/Castle_exterior_TileD.png",
      imagewidth = 512,
      imageheight = 512,
      properties = {},
      tiles = {}
    },
    {
      name = "Castle_exterior_TileE",
      firstgid = 539,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/Castle_exterior_TileE.png",
      imagewidth = 512,
      imageheight = 512,
      properties = {},
      tiles = {}
    },
    {
      name = "Castle_interior_TileB",
      firstgid = 795,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/Castle_interior_TileB.png",
      imagewidth = 512,
      imageheight = 512,
      properties = {},
      tiles = {}
    },
    {
      name = "GoldenTempleTiles3",
      firstgid = 1051,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/GoldenTempleTiles3.png",
      imagewidth = 320,
      imageheight = 384,
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
      properties = {
        ["solid"] = "true"
      },
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,
        1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1
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
        26, 26, 26, 26, 26, 26, 26, 159, 159, 159, 159, 159, 159, 159, 159, 159, 159, 159, 26, 26,
        193, 193, 193, 193, 193, 193, 193, 193, 193, 193, 193, 193, 193, 193, 193, 193, 193, 193, 193, 26,
        209, 209, 209, 209, 209, 209, 209, 209, 209, 209, 209, 209, 209, 209, 209, 209, 209, 209, 209, 26,
        26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
        26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
        26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
        26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
        26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
        26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
        26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
        26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
        26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26
      }
    },
    {
      type = "tilelayer",
      name = "shadows",
      x = 0,
      y = 0,
      width = 20,
      height = 12,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 97, 0, 0, 0, 0, 97, 0, 0, 0, 0, 0, 0, 97, 0, 0, 0, 0, 97, 0,
        0, 0, 734, 705, 706, 734, 0, 811, 812, 641, 642, 811, 812, 0, 734, 673, 674, 734, 0, 0,
        0, 0, 750, 721, 722, 750, 0, 827, 828, 657, 658, 827, 828, 0, 750, 689, 690, 750, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 891, 0,
        0, 0, 1005, 1006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 907, 0,
        0, 0, 1021, 1022, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 1037, 1038, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 891, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 907, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 25, 25, 25, 25, 25, 25, 23, 0, 0, 0, 0, 17, 25, 25, 25, 25, 25, 25, 0,
        0, 0, 0, 0, 0, 0, 0, 24, 22, 22, 22, 22, 18, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 813, 814, 814, 815, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "Tile Layer 6",
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1122, 1122, 1122, 1122, 1122, 1122, 1122, 0, 0, 0, 0, 1122, 1122, 1122, 1122, 1122, 1122, 1122, 0,
        1123, 1123, 1123, 1123, 1123, 1123, 1123, 1122, 0, 0, 0, 0, 1122, 1123, 1123, 1123, 1123, 1123, 1123, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "walls",
      x = 0,
      y = 0,
      width = 20,
      height = 12,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        161, 307, 177, 177, 177, 177, 307, 177, 177, 177, 177, 177, 177, 307, 177, 177, 177, 177, 307, 161,
        162, 323, 0, 0, 0, 0, 323, 0, 0, 0, 0, 0, 0, 323, 0, 0, 0, 0, 323, 160,
        162, 323, 0, 0, 0, 0, 323, 0, 0, 0, 0, 0, 0, 323, 0, 0, 0, 0, 323, 160,
        162, 339, 0, 0, 0, 0, 339, 0, 0, 0, 0, 0, 0, 339, 0, 0, 0, 0, 339, 160,
        162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 160,
        162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 160,
        162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 160,
        162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 160,
        162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 160,
        162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 160,
        162, 145, 145, 145, 145, 145, 145, 146, 0, 0, 0, 0, 144, 145, 145, 145, 145, 145, 145, 160,
        161, 161, 161, 161, 161, 161, 161, 162, 0, 0, 0, 0, 160, 161, 161, 161, 161, 161, 161, 161
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 891, 0,
        0, 0, 1005, 1006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 891, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
          name = "NPC",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 128,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["id"] = "2"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 352,
          width = 128,
          height = 32,
          visible = true,
          properties = {
            ["to"] = "town, 11, 8"
          }
        },
        {
          name = "NPC",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 224,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["id"] = "1"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 140,
          y = 153,
          width = 64,
          height = 64,
          visible = true,
          properties = {
            ["event"] = "1",
            ["id"] = "1",
            ["solid"] = "false"
          }
        }
      }
    }
  }
}
