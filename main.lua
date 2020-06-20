function love.load()
  gridX = 960
  gridY = 540
  love.graphics.setBackgroundColor(1, 1, 1)
  cellSize = 30

---[[
  font = love.graphics.newFont(15)
  console = ""
--]]

  anim8 = require('anim8-master/anim8')
  require('sprites')
  require('player')
  require('knot')
  require('door')

  function start()
    loadPlayer()
    loadKnots()
    loadDoor(10, 10)
    timer = 0
  end

  start()

end

function love.update(dt)
  updateKnots(dt)
  updateDoor(dt)
  updatePlayerAnimation(dt)

  timer = timer + dt
  local timerLimit = 0.15
  if timer >= timerLimit then
    timer = timer - timerLimit
    updatePlayer(dt)

    if player.bound then
      start()
    else
      for i,key in ipairs(door.keys) do
        if player.segments[1].x == key.x
          and player.segments[1].y == key.y then
            pressKey(key)
        end
      end

      collected = -1

      for i,knot in ipairs(knots) do
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
  drawDoor()
  drawConsole()
end

function drawConsole()
  love.graphics.setFont(font)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, 500, 960, 40)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Console: " .. console, 10, 500)
end

function love.keypressed(key)
  if key == "escape" then
   love.event.quit()
  end

  keyPressPlayer(key)
end
