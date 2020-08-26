Game = {}

function Game:init()
  Signal = require 'lib/hump-master/signal'
  Sti = require 'lib/sti-master/sti'
  effects = require 'effects'
  walls = require 'walls'
  Player = require 'player'
  tutorial = require 'tutorial'
  knots = require 'knots'
  Goal = require 'goal'
  doors = require 'doors'
  scissors = require 'scissors'
end

function Game:enter(previous, level)
  Signal.clear()
  Timer.clear()
  assertWithLogging(level, "Game needs a level to load.")
  local mapPath = string.format("maps/level%d.lua", level)
  map = Sti(mapPath)
  effects.load()
  walls.load(map)
  knots.load(map)
  doors.load(map)
  scissors.load(map)
  tutorial.load(level)
  goal = Goal:new(map)
  assertWithLogging(map.layers["level"], "Map doesn't have level properties")
  local x = map.layers["level"].properties["x"]
  local y = map.layers["level"].properties["y"]
  local length = map.layers["level"].properties["length"]
  local direction = map.layers["level"].properties["direction"]
  self.required = map.layers["level"].properties["goal"]
  self.possible = true
  player = Player:new({}, x, y, length, direction)
  self.currentLevel = level
  if level > 1 then
    sounds.birds:play()
  end
  Timer.every(0.2, function() self:move() end)
end

function Game:move()
  if player:isDead() then
    log("Player died in level " .. self.currentLevel)
    scissors.stop()
    Timer.clear()
    player:stops()
    sounds.dying:play()
    Timer.after(2, function() Gamestate.switch(Game, self.currentLevel) end)
  elseif player:isWon() then
    log("Player won in level " .. self.currentLevel)
    scissors.stop()
    Timer.clear()
    player:stops()
    local newLevel = self.currentLevel + 1
    if saveData.level < newLevel then
      saveData.level = newLevel
      love.filesystem.write("martenitsaSaveData.lua", table.show(saveData, "saveData"))
    end
    if self.currentLevel == 8 then
      Timer.after(0.2, function() Gamestate.switch(Info, self.currentLevel) end)
    else
      Timer.after(0.2, function() Gamestate.switch(Victory, self.currentLevel) end)
    end
  else
    player:update()
    tutorial.update()
    player:eat(knots.get())
    player:maybeHit(walls)
    player:composeSegments()
    player:getCutBy(scissors.get())
    player:maybeReach(goal)
    if not goal:isPossible(knots.available(), player:length(), self.required) then
      if self.possible then
        self.possible = false
        log("Not possible to finish level " .. self.currentLevel)
        Signal.emit('show r')
      end
    end
  end
end

function Game:leave()
  sounds.birds:pause()
  player:stops()
end

function Game:update(dt)
  map:update(dt)
  goal:update(dt, player, knots.available())
  knots.update(dt)
  doors.update(dt, player)
  scissors.update(dt)
  player:animationUpdate(dt)
  Timer.update(dt)
  effects.update(dt)
end

function Game:draw()
  resetToDraw()
  map:drawLayer(map.layers["tiles"])
  map:drawLayer(map.layers["tilesover"])
  knots.draw()
  goal:draw()
  scissors.draw()
  doors.drawKeys()
  player:draw()
  -- from here on everything will be drawn over the player
  map:drawLayer(map.layers["elements"])
  doors.draw()
  map:drawLayer(map.layers["over"])
  scissors.drawSecond()
  effects.draw()
  tutorial.draw()
  drawBorders()
end

function Game:keyreleased(key)
  if key == 'p' then
    Gamestate.push(Pause)
  end
  if key == 'r' then
    log("Player reset " .. self.currentLevel)
    Gamestate.switch(Game, self.currentLevel)
  end
end

function Game:keypressed(key)
  player:keyPress(key)
end
