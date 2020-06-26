function love.load()
  gridX = 960
  gridY = 512
  love.graphics.setBackgroundColor(1, 1, 1)
  CELL_SIZE = 32

---[[
  font = love.graphics.newFont(15)
  console = ""
--]]

  Anim8 = require 'lib/anim8-master/anim8'
  Timer = require 'lib/hump-master/timer'
  Signal = require 'lib/hump-master/signal'
  Sti = require 'lib/sti-master/sti'
  require('wall')
  require('sprites')
  require('utils')
  Player = require 'player'
  require('knot')
  Goal = require 'checkpoint'
  require('door')
  require('scissors')

  function start()
    Timer.clear()
    map = Sti("maps/level1.lua")
    loadWalls()
    loadKnots()
    loadDoors()
    loadScissors()
    goal = Goal:new(map)
    player = Player:new({}, 6, 3, 5, "right")
    loadGame()
  end

  start()

end

function love.update(dt)
  goal:update(dt)
  map:update(dt)
  updateKnots(dt)
  updateDoors(dt)
  updateScissors(dt)
  player:updateAnimation(dt)
  Timer.update(dt)
end

function love.draw()
  map:drawLayer(map.layers["tiles"])
  map:drawLayer(map.layers["elements"])
  drawWalls()
  drawKnots()
  goal:draw()
  drawDoors()
  drawScissors()
  ---[[
  drawConsole()
  --]]
  player:draw()
end

function loadGame()
  Timer.every(0.3, function()
    player:update(dt)

    if player.dead then
      console = console .. "Player died :("
      start()
    elseif player.bound and goal:isComplete() then
      console = console .. "Woohoo won!"
    else
      newX, newY = player:next()

      if walls.indices[newX][newY] then
        player.dead = true
      end

      goal:check(player)
      openDoors()
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

  player:keyPress(key)
end
