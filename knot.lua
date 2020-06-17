
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
  for i,knot in ipairs(knots) do
    knot.animation:update(dt)
  end
end

function drawKnots()
  for i,knot in ipairs(knots) do
    knot.animation:draw(
      sprites.knotsSheet,
      (knot.x - 1) * cellSize,
      (knot.y - 1) * cellSize)
  end
end

function spawnKnot()
  knot = {}
  knot.x = love.math.random(1, gridX/cellSize)
  knot.y = love.math.random(1, gridY/cellSize)

  knot.grid = anim8.newGrid(41, 42, 123, 126)
  knot.animation = anim8.newAnimation(knot.grid('1-3',1, '1-3',2, '1-2',3), 0.1)

  table.insert(knots, knot)
end
