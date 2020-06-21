
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
  for _,knot in ipairs(knots) do
    knot.animation:update(dt)
  end
end

function drawKnots()
  for _,knot in ipairs(knots) do
    knot.animation:draw(
      sprites.knot,
      (knot.x - 1) * cellSize,
      (knot.y - 1) * cellSize)
  end
end

function spawnKnot()
  knot = {}
  knot.x = love.math.random(1, gridX/cellSize)
  knot.y = love.math.random(1, gridY/cellSize)

  knot.grid = Anim8.newGrid(30, 30, 90, 90)
  knot.animation = Anim8.newAnimation(knot.grid('1-3',1, '1-3',2, '1-2',3), 0.05)

  table.insert(knots, knot)
end
