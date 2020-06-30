Game = {}
--GAME_X, GAME_Y = 960, 512
GAME_X, GAME_Y = love.window.getDesktopDimensions()
love.window.setMode( GAME_X, GAME_Y, {fullscreen = false} )
GRID_X, GRID_Y = 30, 16
CELL_SIZE = GAME_X / 30
BORDERS = (GAME_Y - GRID_Y*CELL_SIZE) / 2
TILE_SIZE = 32

function Game:init()
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
  mapPath = string.format("maps/level%d.lua", level)
  map = Sti(mapPath)
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
      Timer.clear()
      player:playDead()
      Timer.after(2, function() Gamestate.switch(Game, level) end)
    elseif player:isWon() then
      console = console .. "Woohoo won!"
      Timer.clear()
      player:playVictory()
      local newLevel = level + 1
      saveData.level = newLevel
      love.filesystem.write("martenitsaSaveData.lua", table.show(saveData, "saveData"))
      Timer.after(2, function() Gamestate.switch(Game, newLevel) end)
    else
      goal:check(player)
      player:maybeHit(walls)
      player:open(doors.get())
      player:getCutBy(scissors.get())
      player:eat(knots.get())
      player:maybeReach(goal)
    end
  end)
end

function Game:update(dt)
  map:update(dt)
  goal:update(dt)
  knots.update(dt)
  doors.update(dt)
  scissors.update(dt)
  Timer.update(dt)
end

function Game:draw()
  love.graphics.setBackgroundColor(0, 0, 0)
  love.graphics.translate(0, BORDERS)
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", 0, 0, GAME_X, GAME_Y-BORDERS*2)
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
  love.graphics.rectangle("fill", 0, GAME_Y-BORDERS-42, GAME_X, 42)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Console: " .. console, 10, GAME_Y-BORDERS-42)
  love.graphics.print("PFS: " .. love.timer.getFPS() .. "    Cell size: " .. CELL_SIZE .. "    Scale ratio: " .. CELL_SIZE/TILE_SIZE, 10, GAME_Y-BORDERS-22)
end

function love.load()
  love.graphics.setBackgroundColor(0, 0, 0)
---[[
  console = ""
--]]
  require 'save'
  saveData = {}
  saveData.level = 1
  if love.filesystem.getInfo("martenitsaSaveData.lua") then
    local data = love.filesystem.load("martenitsaSaveData.lua")
    data()
  end

  Gamestate = require "lib/hump-master/gamestate"
  require 'sprites'
  require 'utils'
  require 'menu'
  require 'pause'

  Gamestate.registerEvents()
  Gamestate.switch(Menu)
end
