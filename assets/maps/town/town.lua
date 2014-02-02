return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 23,
  height = 21,
  tilewidth = 32,
  tileheight = 32,
  properties = {},
  tilesets = {
    {
      name = "TownTiles",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/TownTiles.png",
      imagewidth = 576,
      imageheight = 1120,
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
      width = 23,
      height = 21,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1,
        0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1,
        1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1,
        1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1,
        1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1,
        1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1,
        1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,
        0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1,
        1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1,
        1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1,
        1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "tilelayer",
      name = "background",
      x = 0,
      y = 0,
      width = 23,
      height = 21,
      visible = true,
      opacity = 0.9,
      properties = {},
      encoding = "lua",
      data = {
        323, 323, 305, 341, 341, 323, 323, 323, 323, 323, 324, 323, 323, 323, 323, 323, 323, 288, 323, 323, 323, 323, 323,
        324, 324, 323, 341, 341, 323, 323, 323, 323, 323, 324, 323, 323, 323, 323, 323, 323, 323, 323, 324, 323, 323, 323,
        323, 323, 323, 341, 341, 341, 341, 323, 323, 323, 324, 323, 323, 323, 323, 323, 323, 323, 324, 324, 323, 323, 323,
        323, 323, 331, 323, 323, 341, 324, 341, 341, 341, 341, 341, 341, 341, 341, 341, 324, 324, 324, 323, 323, 323, 323,
        324, 324, 323, 323, 323, 323, 323, 323, 341, 341, 324, 324, 323, 323, 323, 341, 323, 209, 324, 323, 323, 323, 323,
        323, 323, 324, 324, 323, 323, 323, 323, 324, 341, 324, 324, 324, 324, 324, 323, 323, 323, 324, 324, 324, 323, 323,
        323, 323, 342, 323, 324, 324, 305, 323, 323, 324, 324, 323, 324, 324, 342, 324, 323, 323, 323, 270, 324, 323, 323,
        323, 323, 323, 323, 323, 323, 324, 324, 324, 324, 324, 324, 323, 323, 324, 324, 324, 324, 324, 324, 324, 323, 323,
        323, 323, 323, 323, 323, 323, 270, 323, 324, 324, 341, 323, 323, 323, 323, 323, 323, 323, 323, 323, 324, 323, 323,
        323, 323, 323, 331, 323, 323, 323, 324, 324, 323, 341, 288, 323, 323, 323, 323, 323, 323, 270, 323, 323, 323, 323,
        323, 323, 323, 323, 323, 323, 324, 324, 323, 323, 323, 341, 323, 323, 323, 323, 323, 323, 305, 323, 323, 323, 323,
        323, 323, 323, 323, 323, 323, 324, 323, 323, 323, 324, 341, 341, 341, 324, 323, 323, 323, 323, 323, 323, 323, 323,
        323, 323, 323, 323, 270, 323, 323, 323, 323, 324, 324, 323, 270, 341, 323, 323, 323, 323, 323, 323, 323, 323, 323,
        323, 323, 323, 323, 323, 323, 131, 323, 323, 324, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323,
        323, 323, 323, 342, 323, 323, 324, 324, 324, 324, 324, 324, 323, 323, 323, 323, 323, 323, 281, 323, 323, 323, 323,
        323, 323, 323, 323, 323, 341, 270, 341, 341, 341, 305, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323,
        323, 323, 323, 324, 323, 323, 341, 323, 323, 323, 323, 341, 341, 341, 341, 323, 323, 323, 323, 323, 323, 323, 323,
        323, 323, 323, 324, 324, 324, 288, 341, 323, 323, 323, 323, 323, 323, 323, 341, 341, 323, 323, 323, 323, 323, 323,
        323, 323, 281, 323, 323, 323, 324, 341, 341, 341, 341, 341, 341, 341, 342, 341, 341, 323, 323, 323, 323, 209, 323,
        323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323,
        323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323, 323
      }
    },
    {
      type = "tilelayer",
      name = "path",
      x = 0,
      y = 0,
      width = 23,
      height = 21,
      visible = true,
      opacity = 0.57,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 22, 34, 34,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61, 60, 0, 0, 0, 0, 0, 0, 0, 0, 26, 34,
        0, 0, 0, 0, 0, 0, 61, 65, 65, 65, 65, 66, 66, 65, 65, 67, 0, 0, 0, 0, 0, 26, 34,
        0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 26, 34,
        0, 57, 66, 66, 66, 69, 68, 0, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 26, 34,
        0, 0, 0, 0, 58, 70, 64, 0, 0, 0, 0, 0, 0, 0, 0, 60, 61, 66, 66, 64, 0, 26, 34,
        0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 58, 68, 0, 0, 0, 0, 26, 34,
        0, 0, 0, 0, 0, 58, 65, 67, 0, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 25, 33, 34, 34,
        0, 0, 0, 0, 0, 0, 0, 60, 0, 61, 66, 66, 66, 67, 0, 0, 62, 65, 65, 240, 241, 241, 241,
        0, 0, 0, 0, 0, 0, 61, 66, 65, 68, 0, 0, 0, 62, 65, 65, 64, 0, 0, 26, 34, 34, 34,
        0, 0, 0, 62, 66, 65, 64, 0, 0, 58, 65, 69, 65, 64, 0, 0, 0, 0, 0, 22, 30, 34, 34,
        0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 34,
        65, 65, 65, 68, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 58, 67, 0, 0, 0, 0, 0, 57, 66, 67, 0, 55, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 58, 70, 66, 66, 63, 55, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 55, 58, 65, 65, 65, 65, 65, 63, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 57, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 62, 69, 69, 67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 58, 66, 66, 66, 66, 66, 66, 65, 65, 65, 69, 65, 65, 65, 65, 65, 65, 65, 66, 64, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "foreground",
      x = 0,
      y = 0,
      width = 23,
      height = 21,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 101, 0, 0, 0, 123, 105, 144, 0, 123, 105, 102, 0, 0, 0, 0, 0, 0, 0,
        0, 289, 290, 291, 292, 101, 101, 0, 126, 0, 123, 0, 0, 118, 123, 120, 154, 155, 156, 157, 0, 0, 0,
        102, 307, 308, 309, 310, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 172, 173, 174, 175, 0, 0, 0,
        120, 325, 0, 327, 328, 0, 0, 0, 0, 145, 146, 147, 148, 149, 118, 0, 190, 191, 192, 193, 102, 0, 0,
        101, 0, 0, 0, 0, 0, 0, 71, 72, 163, 164, 165, 166, 167, 118, 0, 208, 0, 210, 211, 120, 0, 0,
        101, 101, 0, 0, 0, 0, 0, 89, 90, 181, 182, 183, 184, 185, 0, 0, 0, 0, 0, 0, 101, 0, 0,
        100, 100, 0, 0, 0, 0, 0, 107, 108, 199, 200, 201, 202, 203, 0, 0, 0, 104, 0, 0, 0, 0, 0,
        100, 293, 294, 295, 296, 0, 0, 0, 118, 217, 218, 219, 220, 221, 0, 0, 0, 122, 0, 0, 0, 0, 0,
        102, 311, 312, 313, 314, 0, 0, 0, 118, 0, 0, 0, 0, 0, 118, 118, 0, 0, 0, 0, 0, 0, 0,
        120, 329, 330, 0, 332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        100, 0, 0, 0, 0, 91, 92, 93, 0, 0, 0, 0, 0, 0, 0, 0, 222, 223, 224, 225, 0, 0, 0,
        0, 0, 0, 0, 0, 109, 110, 111, 102, 0, 0, 0, 0, 0, 0, 0, 240, 241, 242, 243, 0, 0, 100,
        101, 101, 0, 0, 0, 127, 0, 129, 120, 0, 0, 0, 0, 103, 0, 0, 258, 259, 260, 261, 0, 0, 100,
        101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0, 101, 276, 277, 0, 279, 101, 0, 100,
        101, 226, 227, 228, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 150, 151, 152, 153,
        102, 244, 245, 246, 247, 0, 0, 0, 104, 94, 95, 96, 0, 0, 0, 94, 95, 96, 0, 168, 169, 170, 171,
        120, 262, 263, 264, 265, 0, 0, 0, 122, 112, 113, 114, 0, 0, 0, 112, 113, 114, 104, 186, 187, 188, 189,
        102, 280, 0, 282, 283, 0, 0, 0, 0, 130, 0, 132, 0, 0, 0, 130, 0, 132, 122, 204, 205, 0, 207,
        120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101,
        140, 141, 141, 141, 141, 141, 141, 141, 141, 141, 141, 142, 0, 140, 141, 141, 141, 141, 141, 141, 141, 142, 101
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
          x = 352,
          y = 224,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["solid"] = "false",
            ["to"] = "home,10,10"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 704,
          y = 256,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["solid"] = "false",
            ["to"] = "east, 1, 6"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 0,
          width = 32,
          height = 0,
          visible = true,
          properties = {
            ["solid"] = "false",
            ["to"] = "north, 17, 31"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 384,
          width = 0,
          height = 32,
          visible = true,
          properties = {
            ["solid"] = "false",
            ["to"] = "west,24,7"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 640,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["solid"] = "false",
            ["to"] = "south,12,1"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 96,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["to"] = "itemshop,10,10"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 128,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["to"] = "mayorhouse"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 288,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["solid"] = "false",
            ["to"] = "equipshop,9,11"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 416,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["solid"] = "false",
            ["to"] = "house2,10,10"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 576,
          y = 448,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["to"] = "inn,12,11"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 576,
          width = 32,
          height = 32,
          visible = true,
          properties = {
            ["solid"] = "false",
            ["to"] = "house1,10,10"
          }
        }
      }
    }
  }
}
