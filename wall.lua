
function loadWalls()
  walls = {}
end

function updateWalls(dt)

end

function drawWalls()
  for i,wall in ipairs(walls) do
    love.graphics.draw(sprites.wall, wall.x, wall.y)
  end
end

function createWall(x, y)
  wall = {}
  wall.x = x
  wall.y = y

  table.insert(walls, wall)
end
