
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

function loadWalls()
  walls = {}
  walls.indices = {}

  for i = 1, gridX/CELL_SIZE do
    local row = {}
    walls.indices[i] = row
    for j = 1, gridY/CELL_SIZE do
      row[j] = false
    end
  end

  Signal.register('open door', function(x,y) walls.indices[x][y] = false end)

  for i,o in ipairs(map.layers["walls"].objects) do
    createWall(o.x/CELL_SIZE, o.y/CELL_SIZE)
  end
end

function drawWalls()
  for _,wall in ipairs(walls) do
    wall:draw()
  end
end

function createWall(x, y)
  wall = Wall:new({}, x, y)
  walls.indices[x][y] = true
  table.insert(walls, wall)
end
