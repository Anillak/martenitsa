Game = {}
GAME_X, GAME_Y = love.window.getDesktopDimensions()
--GAME_X, GAME_Y = 1280, 704
GRID_X, GRID_Y = 40, 22
CELL_SIZE = math.min(GAME_X / GRID_X, GAME_Y / GRID_Y)
BORDERS = (GAME_Y - GRID_Y*CELL_SIZE) / 2
TILE_SIZE = 32
--SCALE = CELL_SIZE/TILE_SIZE
SCALE = tonumber(string.format("%.1f", CELL_SIZE/TILE_SIZE))

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
  local mapPath = string.format("maps/level%d.lua", level)
  map = Sti(mapPath)
  walls.load(map)
  knots.load(map)
  doors.load(map)
  scissors.load(map)
  goal = Goal:new(map)
  assert(map.layers["level"], "Map doesn't have level properties")
  local x = map.layers["level"].properties["x"]
  local y = map.layers["level"].properties["y"]
  local length = map.layers["level"].properties["length"]
  player = Player:new({}, x, y, length, "right")
  self.currentLevel = level
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
      if saveData.level < newLevel then
        saveData.level = newLevel
        love.filesystem.write("martenitsaSaveData.lua", table.show(saveData, "saveData"))
      end
      Timer.after(2, function() Gamestate.switch(Game, newLevel) end)
    else
      goal:check(player)
      player:eat(knots.get())
      player:maybeHit(walls)
      player:open(doors.get())
      player:getCutBy(scissors.get())
      player:maybeReach(goal)
      if not goal:isPossible(knots.available(), player:length(), map.layers["level"].properties["goal"]) then
        console = console .. "Not possible"
      end
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
  love.graphics.scale(SCALE)
  love.graphics.setBackgroundColor(0, 0, 0)
  love.graphics.translate(0, BORDERS)
  love.graphics.setColor(1, 1, 1)
  map:drawLayer(map.layers["tiles"])
  map:drawLayer(map.layers["tilesover"])
  knots.draw()
  goal:draw()
  doors.draw()
  scissors.draw()
  player:draw()
  map:drawLayer(map.layers["elements"])
  scissors.drawSecond()
  ---[[
  drawConsole()
  --]]
end

function Game:keypressed(key)
  if key == "escape" then
   love.event.quit()
  end
  if key == 'p' then
    return Gamestate.push(Pause)
  end
  if key == 'm' then
    return Gamestate.switch(Menu)
  end
  if key == 'r' then
    return Gamestate.switch(Game, Game.currentLevel)
  end

  player:keyPress(key)
end

function drawConsole()
  love.graphics.setFont(love.graphics.newFont(10))
  love.graphics.setColor(0.1, 0.1, 0.1)
  love.graphics.rectangle("fill", 0, GRID_Y*TILE_SIZE-50, GRID_X*TILE_SIZE, 50)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Console: " .. console, 10, GRID_Y*TILE_SIZE-45)
  pfs = "PFS: " .. love.timer.getFPS()
  cs = "    Cell size: " .. TILE_SIZE
  sr = "    Scale ratio: " .. SCALE
  res = "    Resolution: " .. GAME_X .. "x" .. GAME_Y
  b = "    Borders: " .. BORDERS
  --gc = "    Memory: " .. collectgarbage('count') .. "kb"
  text = pfs .. cs .. sr .. res ..b
  love.graphics.print(text, 10, GRID_Y*TILE_SIZE-22)
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
  require 'levels'
  require 'pause'

  Gamestate.registerEvents()
  Gamestate.switch(Menu)
end
