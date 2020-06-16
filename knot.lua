
function loadKnots()
  knots = {}

  spawnKnot()
  spawnKnot()
  spawnKnot()
  spawnKnot()
  spawnKnot()
  spawnKnot()
  spawnKnot()
  spawnKnot()
  spawnKnot()
end

function updateKnots(dt)

end

function drawKnots()
  love.graphics.setColor(0, 1, 0)

  for i,knot in ipairs(knots) do
    love.graphics.rectangle(
        'fill',
        (knot.x - 1) * cellSize,
        (knot.y - 1) * cellSize,
        cellSize,
        cellSize
    )
  end
end

function spawnKnot()
  knot = {}
  knot.x = love.math.random(1, gridX/cellSize)
  knot.y = love.math.random(1, gridY/cellSize)

  table.insert(knots, knot)
end
