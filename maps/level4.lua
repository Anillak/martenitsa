return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.3.5",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 40,
  height = 22,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 16,
  nextobjectid = 221,
  properties = {},
  tilesets = {
    {
      name = "[M]flower",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 6,
      image = "assets/[M]flower.png",
      imagewidth = 192,
      imageheight = 192,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 36,
      tiles = {}
    },
    {
      name = "[M]Rocks2",
      firstgid = 37,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 24,
      image = "assets/[M]Rocks2.png",
      imagewidth = 768,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 384,
      tiles = {}
    },
    {
      name = "[M]Daisy",
      firstgid = 421,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 12,
      image = "assets/[M]Daisy.png",
      imagewidth = 384,
      imageheight = 384,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 144,
      tiles = {}
    },
    {
      name = "[M]Narcis",
      firstgid = 565,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 6,
      image = "assets/[M]Narcis.png",
      imagewidth = 192,
      imageheight = 192,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 36,
      tiles = {}
    },
    {
      name = "[M]Grass",
      firstgid = 601,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 9,
      image = "assets/[M]Grass.png",
      imagewidth = 288,
      imageheight = 224,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 63,
      tiles = {}
    },
    {
      name = "[M]Various",
      firstgid = 664,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 10,
      image = "assets/[M]Various.png",
      imagewidth = 320,
      imageheight = 128,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 40,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "tiles",
      x = 0,
      y = 0,
      width = 40,
      height = 22,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      data = "jQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAaAIAAGgCAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAGgCAABoAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAGgCAABoAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAABoAgAAaAIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAI0CAACNAgAAjQIAAA=="
    },
    {
      type = "tilelayer",
      id = 12,
      name = "tilesover",
      x = 0,
      y = 0,
      width = 40,
      height = 22,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      data = "aAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAYQIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAIUCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAHMCAABoAgAAaAIAAGgCAACOAgAAaAIAAGgCAABoAgAAaAIAAHwCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAACOAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAHgCAACSAgAAkwIAAJQCAAB5AgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAfAIAAGgCAABoAgAAaAIAAGgCAABoAgAAhQIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAeAIAAHECAAByAgAAAAAAAAAAAAAAAAAAAAAAAHkCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAYQIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAeAIAAHICAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABnAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAagIAAGgCAACOAgAAaAIAAGoCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAIECAABgAgAAAAAAAAAAAAAAAAAAAAAAAAAAAABeAgAAggIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAACFAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAfAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAHMCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaQIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAZwIAAGgCAABoAgAAaAIAAHMCAABoAgAAhQIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAJECAACSAgAAkwIAAJQCAACVAgAAkQIAAJICAACTAgAAlAIAAJUCAACRAgAAkwIAAHICAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHACAACVAgAAeQIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGECAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAAB4AgAAkwIAAJQCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHACAACRAgAAkgIAAJMCAACUAgAAlQIAAJECAACSAgAAkwIAAJQCAACVAgAAkQIAAJICAACTAgAAlAIAAJUCAACRAgAAcgIAAAAAAAAAAAAAiAIAAIkCAACKAgAAiwIAAIwCAACIAgAAiQIAAIoCAACLAgAAjAIAAIgCAACJAgAAigIAAIsCAACMAgAAiAIAAIkCAACKAgAAiwIAAIwCAABgAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAF4CAACIAgAAiQIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABqAgAAgQIAAIgCAACJAgAAigIAAIsCAACMAgAAiAIAAIkCAACKAgAAiwIAAIwCAACIAgAAiQIAAIoCAACLAgAAjAIAAIgCAACCAgAAaAIAAGgCAABoAgAAaAIAAGgCAACFAgAAaAIAAGgCAABoAgAAaAIAAGgCAAB8AgAAaAIAAGECAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAACFAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAHwCAABoAgAAaAIAAHMCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAcwIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAIUCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAfAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAI4CAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGoCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAHwCAABoAgAAaAIAAGgCAABoAgAAaAIAAIUCAABoAgAAaAIAAGgCAABoAgAAaAIAAHMCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAHwCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAjgIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAfAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAHwCAABoAgAAagIAAGgCAACFAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAagIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAHMCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAfAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAGgCAACFAgAAaAIAAGgCAABoAgAAaAIAAGgCAABoAgAAaAIAAA=="
    },
    {
      type = "tilelayer",
      id = 15,
      name = "elements",
      x = 0,
      y = 0,
      width = 40,
      height = 22,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      data = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABsBAAAcAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlAAAAJgAAACcAAAAoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzAQAANAEAAAAAAAAAAAAAKQAAACoAAAAAAAAALQAAAC4AAAAAAAAAAAAAAAAAAAAAAAAAPQAAAD4AAAA/AAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEEAAABCAAAAAAAAAEUAAABGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAxAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAiQAAAIoAAACLAAAAjAAAAI0AAACOAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKEAAACiAAAAowAAAKQAAAClAAAApgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAWwAAAFwAAABdAAAAXgAAABkBAAAaAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHMAAAB0AAAAdQAAAHYAAAAxAQAAMgEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=="
    },
    {
      type = "tilelayer",
      id = 6,
      name = "over",
      x = 0,
      y = 0,
      width = 40,
      height = 22,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      data = "4QEAAOIBAADjAQAA5AEAAOUBAADmAQAA5wEAAOgBAADpAQAA6gEAAOsBAADsAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO0BAADuAQAA7wEAAPABAADxAQAA8gEAAPMBAAD0AQAA9QEAAPYBAAD3AQAA+AEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD5AQAA+gEAAPsBAAD8AQAA/QEAAP4BAAD/AQAAAAIAAAECAAACAgAAAwIAAAQCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQIAAAYCAAAHAgAACAIAAAkCAAAKAgAACwIAAAwCAAANAgAADgIAAA8CAAAQAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABECAAASAgAAEwIAABQCAAAVAgAAFgIAABcCAAAYAgAAGQIAABoCAAAbAgAAHAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAArgIAAK8CAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdAgAAHgIAAB8CAAAgAgAAIQIAACICAAAjAgAAJAIAACUCAAAmAgAAJwIAACgCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALgCAAC5AgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKQIAACoCAAArAgAALAIAAC0CAAAuAgAALwIAADACAAAxAgAAMgIAADMCAAA0AgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGAACABQAAgAQAAIADAACAAgAAgAEAAIABAAAAAgAAAAMAAAAEAAAABQAAAAYAAAAAAAAAAAAAAAAAAAClAQAApgEAAKcBAACoAQAAqQEAAKoBAACrAQAArAEAAK0BAACuAQAArwEAALABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA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"
    },
    {
      type = "objectgroup",
      id = 13,
      name = "level",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {
        ["goal"] = 14,
        ["length"] = 4,
        ["x"] = 11,
        ["y"] = 12
      },
      objects = {}
    },
    {
      type = "objectgroup",
      id = 3,
      name = "walls",
      visible = true,
      opacity = 0.97,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 166,
          name = "",
          type = "",
          shape = "rectangle",
          x = 832,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 182,
          name = "",
          type = "",
          shape = "rectangle",
          x = 800,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 183,
          name = "",
          type = "",
          shape = "rectangle",
          x = 896,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 184,
          name = "",
          type = "",
          shape = "rectangle",
          x = 928,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 195,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 196,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 197,
          name = "",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 198,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 199,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 200,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 201,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 202,
          name = "",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 203,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 204,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 213,
          name = "",
          type = "",
          shape = "rectangle",
          x = 704,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 214,
          name = "",
          type = "",
          shape = "rectangle",
          x = 672,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 215,
          name = "",
          type = "",
          shape = "rectangle",
          x = 704,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 216,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1120,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 217,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1152,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 218,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1088,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 219,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1088,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 220,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 512,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      id = 2,
      name = "knots",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 156,
          name = "",
          type = "",
          shape = "rectangle",
          x = 928,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 157,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1120,
          y = 576,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 185,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 186,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 32,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 191,
          name = "",
          type = "",
          shape = "rectangle",
          x = 864,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 192,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1152,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 209,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 210,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 211,
          name = "",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 212,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      id = 7,
      name = "checkpoints",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 37,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 448,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 188,
          name = "",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 448,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 189,
          name = "",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      id = 8,
      name = "scissors",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 172,
          name = "",
          type = "",
          shape = "rectangle",
          x = 832,
          y = 128,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 193,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 544,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["interval"] = 4
          }
        }
      }
    },
    {
      type = "objectgroup",
      id = 9,
      name = "doors",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {
        ["Number"] = 1
      },
      objects = {
        {
          id = 176,
          name = "",
          type = "",
          shape = "rectangle",
          x = 864,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["Number"] = 1
          }
        },
        {
          id = 206,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["Number"] = 2
          }
        }
      }
    },
    {
      type = "objectgroup",
      id = 11,
      name = "keys",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 178,
          name = "",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["Door"] = 1
          }
        },
        {
          id = 179,
          name = "",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 544,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["Door"] = 1
          }
        },
        {
          id = 207,
          name = "",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["Door"] = 2
          }
        },
        {
          id = 208,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 160,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["Door"] = 2
          }
        }
      }
    }
  }
}
