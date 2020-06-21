function loadScissors(x, y)
  scissors = {}
  scissors.x = x
  scissors.y = y
  scissors.cutting = false
  scissors.deadSegments = {}

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

  if #scissors.deadSegments > 0 then
    for i=#scissors.deadSegments,1 do
      scissors.deadSegments[i].animation:pause()
    end
    Timer.after(1, function()
      for k,v in pairs(scissors.deadSegments) do
        table.remove(scissors.deadSegments)
      end
    end)
  end

end

function drawScissors()
  scissors.animation:draw(
    sprites.scissors,
    (scissors.x - 1) * cellSize,
    (scissors.y - 1) * cellSize)

  for _,segment in ipairs(scissors.deadSegments) do
    segment.animation:draw(
      segment.sprite,
      (segment.x-1) * cellSize + cellSize/2,
      (segment.y-1) * cellSize + cellSize/2,
      math.rad(segment.rotation),
      1,
      1,
      cellSize/2,
      cellSize/2
    )
  end
end
