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
      image = "../../../img/tiles/BlackAndWhite.png",
      imagewidth = 320,
      imageheight = 32,
      tileoffset = {
        x = 0,
        y = 0
      },
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
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1,
        1, 1, 1, 1, 10, 10, 10, 10, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        1, 1, 1, 1, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 10, 10, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10,
        1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 1, 1,
        1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1,
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
          rotation = 0,
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
          rotation = 0,
          visible = true,
          properties = {
            ["to"] = "town, 21, 8"
          }
        },
        {
          name = "Obj",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 256,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "2",
            ["id"] = "11"
          }
        },
        {
          name = "NPC",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "1",
            ["id"] = "10"
          }
        }
      }
    }
  }
}
