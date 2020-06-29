Wall = {}

function Wall:new(o, x, y)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y

   return o
end

function Wall:draw()
  love.graphics.draw(sprites.wall,
    self.x * CELL_SIZE,
    self.y * CELL_SIZE,
    nil,
    CELL_SIZE/TILE_SIZE, CELL_SIZE/TILE_SIZE)
end

W = {}

local function create(x, y)
  wall = Wall:new({}, x, y)
  W.walls.indices[x][y] = true
  table.insert(W.walls, wall)
end

function W.load(map)
  assert(map, "Walls needs a map to load.")
  assert(map.layers["walls"].objects, "No walls defined in the map")
  W.walls = {}
  W.walls.indices = {}

  for i = 0, (GAME_X/CELL_SIZE)-1 do
    local row = {}
    W.walls.indices[i] = row
    for j = 0, (GAME_Y/CELL_SIZE)-1 do
      row[j] = false
    end
  end

  Signal.register('create door', function(x,y) W.walls.indices[x][y] = true end)
  Signal.register('open door', function(x,y) W.walls.indices[x][y] = false end)

  for i,o in ipairs(map.layers["walls"].objects) do
    create(o.x/TILE_SIZE, o.y/TILE_SIZE)
  end
end

function W.draw()
  for _,wall in ipairs(W.walls) do
    wall:draw()
  end
end

function W.isWall(x, y)
  return W.walls.indices[x][y]
end

return W
