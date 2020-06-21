function love.load()
  gridX = 960
  gridY = 540
  love.graphics.setBackgroundColor(1, 1, 1)
  cellSize = 30

---[[
  font = love.graphics.newFont(15)
  console = ""
--]]

  Anim8 = require('anim8-master/anim8')
  Timer = require('hump-master/timer')
  require('sprites')
  require('utils')
  require('player')
  require('knot')
  require('checkpoint')
  require('door')
  require('scissors')

  function start()
    Timer.clear()
    loadKnots()
    loadDoor(10, 10)
    loadScissors(20, 10)
    loadCheckpoints()
    loadPlayer()
    loadGame()
  end

  start()

end

function love.update(dt)
  updateKnots(dt)
  updateCheckpoints(dt)
  updateDoor(dt)
  updateScissors(dt)
  updatePlayerAnimation(dt)
  Timer.update(dt)
end

function love.draw()
  drawKnots()
  drawCheckpoints()
  drawDoor()
  drawScissors()
  ---[[
  drawConsole()
  --]]
  drawPlayer()
end

function loadGame()
  Timer.every(0.2, function()
    updatePlayer(dt)

    if player.dead then
      console = console .. "Player died :("
      start()
    elseif player.bound and complete then
      console = console .. "Woohoo won!"
    else
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
      for _,checkpoint in ipairs(checkpoints) do
        local pressed = false
        for _,segment in ipairs(player.segments) do
          if hit(segment, checkpoint) then
            pressed = true
          end
        end
        if pressed then check(checkpoint)
        else uncheck(checkpoint) end
      end
      --]]

      ---[[
      cutTail = -1
      for i,segment in ipairs(player.segments) do
        if segment.x == scissors.x + 1 and
        segment.y == scissors.y and
        scissors.cutting then
          if i == 1 or i == 2 then
            player.dead = true
          end
          scissors.cutting = false
          console = console .. "cutting at " .. i
          cutTail = #player.segments - i
          break
        end
      end
      if cutTail ~= -1 and player.dead == false then
        for i=1,cutTail do
          table.insert(scissors.deadSegments, table.remove(player.segments))
        end
      end
      --]]

      ---[[
      collected = -1
      for i,knot in ipairs(knots) do
        if hit(player.segments[1], knot) then
          collected = i
        end
      end
      if collected == -1 then
        table.remove(player.segments)
      else
        table.remove(knots, collected)
      end
      --]]

    end
  end)
end


function drawConsole()
  love.graphics.setFont(font)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, 500, 960, 40)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Console: " .. console, 10, 500)
  love.graphics.print("PFS: " .. love.timer.getFPS(), 10, 520)
end

function love.keypressed(key)
  if key == "escape" then
   love.event.quit()
  end

  keyPressPlayer(key)
end
