
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

  createWall(18, 5)
  createWall(18, 6)
  createWall(18, 7)
  createWall(19, 8)
end

function updateWalls(dt)

end

function drawWalls()
  for i,wall in ipairs(walls) do
    love.graphics.draw(sprites.wall,
      (wall.x - 1) * CELL_SIZE,
      (wall.y - 1) * CELL_SIZE)
  end
end

function createWall(x, y)
  wall = {}
  wall.x = x
  wall.y = y

  walls.indices[x][y] = true
  table.insert(walls, wall)
end
