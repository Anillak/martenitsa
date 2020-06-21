
function loadScissors(x, y)
  scissors = {}
  scissors.x = x
  scissors.y = y
  scissors.timer = 0
  scissors.cutting = false

  scissors.grid = anim8.newGrid(60, 60, 240, 60)
  scissors.animation = anim8.newAnimation(scissors.grid('1-4',1), 0.25)
  scissors.animation:pause()
end

function updateScissors(dt)
  local timeToCut = 5
  scissors.timer = scissors.timer + dt
  if scissors.timer >= timeToCut then
    scissors.timer = scissors.timer - timeToCut
    scissors.cutting = true
    scissors.animation:resume()
  end

  scissors.animation:update(dt)
end

function drawScissors()
  scissors.animation:draw(
    sprites.scissors,
    (scissors.x - 1) * cellSize,
    (scissors.y - 1) * cellSize)
end
