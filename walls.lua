
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
    (self.x - 1) * CELL_SIZE,
    (self.y - 1) * CELL_SIZE)
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

  for i = 1, gridX/CELL_SIZE do
    local row = {}
    W.walls.indices[i] = row
    for j = 1, gridY/CELL_SIZE do
      row[j] = false
    end
  end

  Signal.register('open door', function(x,y) W.walls.indices[x][y] = false end)

  for i,o in ipairs(map.layers["walls"].objects) do
    create(o.x/CELL_SIZE, o.y/CELL_SIZE)
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
