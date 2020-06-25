function love.load()
  gridX = 960
  gridY = 512
  love.graphics.setBackgroundColor(1, 1, 1)
  CELL_SIZE = 32

---[[
  font = love.graphics.newFont(15)
  console = ""
--]]

  Anim8 = require('anim8-master/anim8')
  Timer = require('hump-master/timer')
  require('wall')
  require('sprites')
  require('utils')
  require('player')
  require('knot')
  require('checkpoint')
  require('door')
  require('scissors')

  function start()
    Timer.clear()
    loadWalls()
    loadKnots()
    loadDoor(10, 10)
    loadScissors()
    loadGoal()
    loadPlayer()
    loadGame()
  end

  start()

end

function love.update(dt)
  updateWalls(dt)
  updateKnots(dt)
  goal:update(dt)
  updateDoor(dt)
  updateScissors(dt)
  updatePlayerAnimation(dt)
  Timer.update(dt)
end

function love.draw()
  drawWalls()
  drawKnots()
  goal:draw()
  drawDoor()
  drawScissors()
  ---[[
  drawConsole()
  --]]
  drawPlayer()
end

function loadGame()
  Timer.every(0.3, function()
    updatePlayer(dt)

    if player.dead then
      console = console .. "Player died :("
      start()
    elseif player.bound and goal.complete then
      console = console .. "Woohoo won!"
    else
      newX, newY = nextPosition()
      if walls.indices[newX][newY] then
        player.dead = true
      end

      ---[[
      for _,key in ipairs(door.keys) do
        local pressed = false
        for _,segment in ipairs(player.segments) do
          if hit(segment, key) then
            pressed = true
          end
        end
        if pressed then pressKey(key)
        else releaseKey(key) end
      end
      --]]

      ---[[
      goal:checkForComplete(player)
      --]]

      getCutByScissors()
      eatKnots()

    end
  end)
end


function drawConsole()
  love.graphics.setFont(font)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, 470, 960, 42)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Console: " .. console, 10, 470)
  love.graphics.print("PFS: " .. love.timer.getFPS(), 10, 490)
end

function love.keypressed(key)
  if key == "escape" then
   love.event.quit()
  end

  keyPressPlayer(key)
end
