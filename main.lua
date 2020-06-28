Game = {}

function Game:init()
  gridX = 960
  gridY = 512
  CELL_SIZE = 32
  Anim8 = require 'lib/anim8-master/anim8'
  Timer = require 'lib/hump-master/timer'
  Signal = require 'lib/hump-master/signal'
  Sti = require 'lib/sti-master/sti'
  walls = require 'walls'
  Player = require 'player'
  knots = require 'knots'
  Goal = require 'goal'
  doors = require 'doors'
  scissors = require 'scissors'
end

function Game:enter(previous, level)
  Timer.clear()
  assert(level, "Game needs a level to load.")
  map = Sti(level)
  walls.load(map)
  knots.load(map)
  doors.load(map)
  scissors.load(map)
  goal = Goal:new(map)
  player = Player:new({}, 5, 1, 5, "right")
  Timer.every(0.3, function()
    player:update(dt)

    if player:isDead() then
      console = console .. "Player died :("
      Gamestate.switch(Menu)
    elseif player:isBound() and goal:isComplete() then
      console = console .. "Woohoo won!"
      Gamestate.switch(Menu)
    else
      goal:check(player)
      player:maybeHit(walls)
      player:open(doors.get())
      player:getCutBy(scissors.get())
      player:eat(knots.get())
    end
  end)
end

function Game:update(dt)
  map:update(dt)
  goal:update(dt)
  knots.update(dt)
  doors.update(dt)
  scissors.update(dt)
  player:updateAnimation(dt)
  Timer.update(dt)
end

function Game:draw()
  map:drawLayer(map.layers["tiles"])
  map:drawLayer(map.layers["elements"])
  walls.draw()
  knots.draw()
  goal:draw()
  doors.draw()
  scissors.draw()
  ---[[
  drawConsole()
  --]]
  player:draw()
end

function Game:keypressed(key)
  if key == "escape" then
   love.event.quit()
  end
  if key == 'p' then
    return Gamestate.push(Pause)
  end

  player:keyPress(key)
end

function drawConsole()
  love.graphics.setFont(love.graphics.newFont(15))
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, 470, 960, 42)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Console: " .. console, 10, 470)
  love.graphics.print("PFS: " .. love.timer.getFPS(), 10, 490)
end

function love.load()
  love.graphics.setBackgroundColor(1, 1, 1)
---[[
  console = ""
--]]

  Gamestate = require "lib/hump-master/gamestate"
  require 'sprites'
  require 'utils'
  require 'menu'
  require 'pause'

  Gamestate.registerEvents()
  Gamestate.switch(Menu)
end
