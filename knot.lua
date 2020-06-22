
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
      (knot.x - 1) * CELL_SIZE,
      (knot.y - 1) * CELL_SIZE)
  end
end

function spawnKnot()
  knot = {}
  knot.x = love.math.random(1, gridX/CELL_SIZE)
  knot.y = love.math.random(1, gridY/CELL_SIZE)

  knot.grid = Anim8.newGrid(CELL_SIZE, CELL_SIZE, CELL_SIZE*3, CELL_SIZE*3)
  knot.animation = Anim8.newAnimation(knot.grid('1-3',1, '1-3',2, '1-2',3), 0.05)

  table.insert(knots, knot)
end
