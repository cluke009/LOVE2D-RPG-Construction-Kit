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
      image = "../../../../Jeph/Walkthrough/RPGKit/assets/maps/img/BlackAndWhite.png",
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
    },
    {
      name = "collision",
      firstgid = 11,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../../../Jeph/Walkthrough/RPGKit/assets/maps/img/collision.png",
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
      height = 28,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        11, 11, 11, 11, 0, 0, 0, 11, 11, 11, 11, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
        11, 11, 11, 11, 11, 0, 0, 0, 11, 11, 11, 11
      }
    },
    {
      type = "tilelayer",
      name = "background",
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
      type = "tilelayer",
      name = "foreground",
      x = 0,
      y = 0,
      width = 12,
      height = 28,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
          x = 128,
          y = 0,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["to"] = "south"
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
          rotation = 0,
          visible = true,
          properties = {
            ["to"] = "mountainpath2"
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
          rotation = 0,
          visible = true,
          properties = {
            ["from"] = "south"
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
          rotation = 0,
          visible = true,
          properties = {
            ["from"] = "mountainpath2"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 282,
          y = 294,
          width = 69,
          height = 50,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "12",
            ["id"] = "7"
          }
        }
      }
    }
  }
}