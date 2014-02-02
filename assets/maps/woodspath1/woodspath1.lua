return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 20,
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
      image = "../../img/tiles/BlackAndWhite.png",
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
    },
    {
      name = "Cave_Dungeon_TileA2",
      firstgid = 11,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/Cave_Dungeon_TileA2.png",
      imagewidth = 512,
      imageheight = 384,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "!BeachE",
      firstgid = 203,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/!BeachE.png",
      imagewidth = 512,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "DSPlus_TileA2_ModernExterior",
      firstgid = 459,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../img/tiles/DSPlus_TileA2_ModernExterior.png",
      imagewidth = 512,
      imageheight = 384,
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
      width = 20,
      height = 28,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 1, 1, 1, 1, 10, 10, 10, 1, 1, 1, 1, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 0, 0, 0, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 1, 1, 1, 1, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 1, 1, 10, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 1, 1, 10, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 1, 1, 10, 10, 10, 1, 1, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 1, 1, 10, 10, 10, 1, 1, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 10, 1, 1, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 10, 1, 1, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 1, 1, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 1, 1, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 1, 1, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 1, 1, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 1, 1, 1, 1, 10, 10, 1, 1, 1, 1, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 1, 1, 1, 1, 10, 10, 1, 1, 1, 1, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 1, 1, 1, 1, 10, 10, 1, 1, 1, 1, 1, 0, 0, 0, 0
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
          x = 256,
          y = 0,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["to"] = "south, 17, 38"
          }
        },
        {
          name = "Door",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 864,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["to"] = "woodspath2, 5, 1"
          }
        }
      }
    },
    {
      type = "tilelayer",
      name = "Tile Layer 4",
      x = 0,
      y = 0,
      width = 20,
      height = 28,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18
      }
    },
    {
      type = "tilelayer",
      name = "Tile Layer 2",
      x = 0,
      y = 0,
      width = 20,
      height = 28,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        247, 248, 247, 248, 232, 231, 232, 231, 232, 0, 0, 231, 232, 231, 232, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 215, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 0, 0, 0, 0, 0, 215, 216, 215, 216, 0, 215, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 0, 0, 0, 0, 0, 231, 247, 248, 232, 0, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 0, 0, 0, 0, 0, 215, 263, 264, 216, 0, 215, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 0, 0, 0, 0, 0, 231, 232, 231, 232, 0, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 215, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 0, 215, 216, 0, 0, 0, 0, 0, 0, 0, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 0, 231, 232, 0, 0, 0, 0, 0, 0, 0, 215, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 0, 215, 216, 0, 0, 0, 215, 216, 0, 0, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 0, 231, 232, 0, 0, 0, 231, 232, 0, 0, 215, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 0, 0, 0, 0, 0, 0, 215, 216, 0, 0, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 0, 0, 0, 0, 0, 0, 231, 232, 0, 0, 215, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 215, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 0, 0, 215, 216, 0, 0, 0, 0, 0, 0, 215, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 0, 0, 231, 232, 0, 0, 0, 0, 0, 0, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 0, 0, 215, 216, 0, 0, 0, 0, 0, 0, 215, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 0, 0, 231, 232, 0, 0, 0, 0, 0, 0, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 215, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 0, 0, 0, 0, 0, 0, 0, 215, 216, 215, 263, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 0, 0, 0, 0, 0, 0, 0, 231, 232, 231, 247, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 215, 216, 215, 216, 0, 0, 215, 216, 215, 216, 215, 263, 264, 263, 264,
        247, 248, 247, 248, 232, 231, 232, 231, 232, 0, 0, 231, 232, 231, 232, 231, 247, 248, 247, 248,
        263, 264, 263, 264, 216, 215, 216, 215, 216, 0, 0, 215, 216, 215, 216, 215, 263, 264, 263, 264
      }
    }
  }
}
