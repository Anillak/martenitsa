function loadScissors(x, y)
  scissors = {}
  scissors.x = x
  scissors.y = y
  scissors.cutting = false

  scissors.grid = Anim8.newGrid(60, 60, 240, 60)
  scissors.animation = Anim8.newAnimation(scissors.grid('1-4',1), 0.25)
  scissors.animation:pause()

  Timer.every(5, function()
    scissors.animation:resume()
    Timer.after(0.25, function()
      scissors.cutting = true
    end)
    Timer.after(0.75, function()
      scissors.cutting = false
    end)
    Timer.after(1, function()
      scissors.animation:pause()
    end)
  end)
end

function updateScissors(dt)
  scissors.animation:update(dt)
end

function drawScissors()
  scissors.animation:draw(
    sprites.scissors,
    (scissors.x - 1) * cellSize,
    (scissors.y - 1) * cellSize)
end
