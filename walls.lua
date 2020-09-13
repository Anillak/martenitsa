local Wall = {}

function Wall:new(o, x, y)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y

   return o
end

local W = {}

local function create(x, y, isWater)
  wall = Wall:new({}, x, y)
  W.walls.indices[x][y] = {true, isWater}
  table.insert(W.walls, wall)
end

function W.load(map)
  assertWithLogging(map, "Walls needs a map to load.")
  assertWithLogging(map.layers["walls"], "No walls defined in the map")
  W.walls = {}
  W.walls.indices = {}

  for i = 0, (ORIGINAL_GAME_X/TILE_SIZE)-1 do
    local row = {}
    W.walls.indices[i] = row
    for j = 0, (ORIGINAL_GAME_Y/TILE_SIZE)-1 do
      row[j] = {false, false}
    end
  end

  Signal.register('create door', function(x,y) W.walls.indices[x][y] = {true, false} end)
  Signal.register('open door', function(x,y) W.walls.indices[x][y] = {false, false} end)

  for _,o in ipairs(map.layers["walls"].objects) do
    create(o.x/TILE_SIZE, o.y/TILE_SIZE)
  end
  if map.layers["water"] then
    for _,o in ipairs(map.layers["water"].objects) do
      create(o.x/TILE_SIZE, o.y/TILE_SIZE, true)
    end
  end
  for _,o in ipairs(map.layers["walls"].objects) do
    create(o.x/TILE_SIZE, o.y/TILE_SIZE)
  end
end

function W.draw()
  for _,wall in ipairs(W.walls) do
    wall:draw()
  end
end

function W.isWall(x, y)
  return W.walls.indices[x][y][1], W.walls.indices[x][y][2]
end

function W.clear()
  for _,w in ipairs(W.walls) do
    w = nil
  end
end

return W
