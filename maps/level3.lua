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
  nextlayerid = 14,
  nextobjectid = 219,
  properties = {},
  tilesets = {
    {
      name = "[M]Various",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 10,
      image = "assets/various.png",
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
    },
    {
      name = "[M]flower",
      firstgid = 41,
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
      firstgid = 77,
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
      firstgid = 461,
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
      firstgid = 605,
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
      firstgid = 641,
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
      data = "tQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAALUCAAC1AgAAtQIAAA=="
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
      data = "kAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAiQIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAK0CAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJsCAACQAgAAkAIAAJACAAC2AgAAkAIAAJACAACQAgAAkAIAAKQCAACQAgAAkAIAAJACAACQAgAAkAIAAJACAAC2AgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAKACAAC6AgAAuwIAALwCAAChAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAApAIAAJACAACQAgAAkAIAAJACAACQAgAArQIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAoAIAAJkCAACaAgAAAAAAAAAAAAAAAAAAAAAAAKECAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAiQIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAoAIAAJoCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACPAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkgIAAJACAAC2AgAAkAIAAJICAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAKkCAACIAgAAAAAAAAAAAAAAAAAAAAAAAAAAAACGAgAAqgIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAApAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJsCAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkQIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAjwIAAJACAACQAgAAkAIAAJsCAACQAgAArQIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAALkCAAC6AgAAuwIAALwCAAC9AgAAuQIAALoCAAC7AgAAvAIAAL0CAAC5AgAAuwIAAJoCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJgCAAC9AgAAoQIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAIkCAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACgAgAAuwIAALwCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJgCAAC5AgAAugIAALsCAAC8AgAAvQIAALkCAAC6AgAAuwIAALwCAAC9AgAAuQIAALoCAAC7AgAAvAIAAL0CAAC5AgAAmgIAAAAAAAAAAAAAsAIAALECAACyAgAAswIAALQCAACwAgAAsQIAALICAACzAgAAtAIAALACAACxAgAAsgIAALMCAAC0AgAAsAIAALECAACyAgAAswIAALQCAACIAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIYCAACwAgAAsQIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACSAgAAqQIAALACAACxAgAAsgIAALMCAAC0AgAAsAIAALECAACyAgAAswIAALQCAACwAgAAsQIAALICAACzAgAAtAIAALACAACqAgAAkAIAAJACAACQAgAAkAIAAJACAACtAgAAkAIAAJACAACQAgAAkAIAAJACAACkAgAAkAIAAIkCAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACtAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAKQCAACQAgAAkAIAAJsCAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAmwIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAK0CAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAApAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAALYCAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJICAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAKQCAACQAgAAkAIAAJACAACQAgAAkAIAAK0CAACQAgAAkAIAAJACAACQAgAAkAIAAJsCAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAtgIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAApAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAKQCAACQAgAAkgIAAJACAACtAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkgIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJsCAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAApAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAJACAACtAgAAkAIAAJACAACQAgAAkAIAAJACAACQAgAAkAIAAA=="
    },
    {
      type = "tilelayer",
      id = 6,
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
      data = "CQIAAAoCAAALAgAADAIAAA0CAAAOAgAADwIAABACAAARAgAAEgIAABMCAAAUAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABUCAAAWAgAAFwIAABgCAAAZAgAAGgIAABsCAAAcAgAAHQIAAB4CAAAfAgAAIAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEMBAABEAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABNAAAATgAAAE8AAABQAAAAAAAAAAAAAAAhAgAAIgIAACMCAAAkAgAAJQIAACYCAAAnAgAAKAIAACkCAAAqAgAAKwIAACwCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABbAQAAXAEAAAAAAAAAAAAAUQAAAFIAAAAAAAAAVQAAAFYAAAAAAAAAAAAAAAAAAAAAAAAAZQAAAGYAAABnAAAAaAAAAAAAAAAAAAAALQIAAC4CAAAvAgAAMAIAADECAAAyAgAAMwIAADQCAAA1AgAANgIAADcCAAA4AgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGkAAABqAAAAAAAAAG0AAABuAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADkCAAA6AgAAOwIAADwCAAA9AgAAPgIAAD8CAABAAgAAQQIAAEICAABDAgAARAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFQAAABYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABZAQAAAAAAAAAAAAAAAAAAAAAAAAAAAABFAgAARgIAAEcCAABIAgAASQIAAEoCAABLAgAATAIAAE0CAABOAgAATwIAAFACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB8AAAAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAUQIAAFICAABTAgAAVAIAAFUCAABWAgAAVwIAAFgCAABZAgAAWgIAAFsCAABcAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAuAACALQAAgCwAAIArAACAKgAAgCkAAIApAAAAKgAAACsAAAAsAAAALQAAAC4AAAAAAAAAAAAAAAAAAADNAQAAzgEAAM8BAADQAQAA0QEAANIBAADTAQAA1AEAANUBAADWAQAA1wEAANgBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA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"
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
