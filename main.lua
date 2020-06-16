function love.load()
  gridX = 960
  gridY = 540
  love.window.setMode(gridX, gridY)
  cellSize = 30

  anim8 = require('anim8-master/anim8')
  require('sprites')
  require('player')
  require('knot')

  function start()
    loadPlayer()
    loadKnots()
    timer = 0
  end

  start()

end

function love.update(dt)
  updateKnots(dt)

  timer = timer + dt
  local timerLimit = 0.15
  if timer >= timerLimit then
    timer = timer - timerLimit
    updatePlayer(dt)

    if player.bound then
      start()
    else
      collected = -1

      for i,knot in ipairs(knots) do
        a = player.segments[1].x
        b = knot.x
        if player.segments[1].x == knot.x
          and player.segments[1].y == knot.y then
            collected = i
        end
      end

      if collected == -1 then
        table.remove(player.segments)
      else
        table.remove(knots, collected)
      end
    end

  end
end


function love.draw()
  drawPlayer()
  drawKnots()
end
