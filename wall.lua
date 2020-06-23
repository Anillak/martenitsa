
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


  for i=1,30 do
    createWall(i, 1)
    createWall(i, 16)
  end
  for j=1,16 do
    createWall(1, j)
    createWall(30, j)
  end
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
