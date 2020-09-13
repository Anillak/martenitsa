local Game = {}
local Victory = require 'victory'
local Pause = require 'pause'
local levelsInitialScores = {330,400,500,600,450,620,340,430}
local Sti
local effects
local walls
local Player
local tutorial
local knots
local Goal
local doors
local scissors

function Game:init()
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
  Signal.clearPattern('.*')
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
  player = Player:new({}, x, y, length, direction)

  self.required = map.layers["level"].properties["goal"]
  self.possible = true
  self.currentLevel = level
  self.tutorial = self.currentLevel == 1
  self.score = levelsInitialScores[level]
  self.deaths = saveData.deaths[level]

  sounds.birds:play()

  Timer.every(0.2, function() self:move() end)
end

local function saveDeaths(level, count)
  log("Player died in level " .. level)
  count = count + 1
  saveData.deaths[level] = count
end

local function saveOnLevelEnd(currentLevel, score)
  assert(currentLevel, "currentLevel not set")
  assert(score, "score not set")
  if saveData.scores[currentLevel] < score then
    saveData.scores[currentLevel] = score
  end
  local newLevel = currentLevel + 1
  if saveData.level < newLevel then
    saveData.level = newLevel
  end
end

function Game:move()
  if player:isDead() then
    saveDeaths(self.currentLevel, self.deaths)
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
    saveOnLevelEnd(self.currentLevel, self.score)
    Timer.after(0.2, function()
      Gamestate.switch(Victory, self.currentLevel)
    end)
  else
    player:starts()
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
  player:stops()
  sounds.birds:pause()
  Signal.clearPattern('.*')
  Timer.clear()
  player = nil
  map = nil
  goal = nil
  scissors.clear()
  doors.clear()
  knots.clear()
  walls.clear()
  effects.clear()
  tutorial.clear()
  love.filesystem.write("martenitsaSaveData.lua", table.show(saveData, "saveData"))
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
  if self.tutorial then
    Signal.emit('show eat knots')
    Signal.clear('show eat knots')
  end
  if self.tutorial and knots.available() == 0 then
    Signal.emit('show end condition')
    Signal.clear('show end condition')
    self.tutorial = false
  end
  if self.score > 0 then
    self.score = self.score - dt*10
    if self.score < 0 then
      self.score = 0
      sounds.coins:play()
    end
  end

end

function Game:draw()
  resetToDraw()
  map:drawLayer(map.layers["tiles"])
  map:drawLayer(map.layers["tilesover"])
  knots.draw()
  goal:draw()
  scissors.draw()
  doors.drawKeys()
  map:drawLayer(map.layers["elements"])
  player:draw()
  -- from here on everything will be drawn over the player
  map:drawLayer(map.layers["over"])
  doors.draw()
  if map.layers["forest"] then
    map:drawLayer(map.layers["forest"])
  end
  scissors.drawSecond()
  effects.draw()
  tutorial.draw()
  drawScore(self.score)
  drawBorders()
end

function Game:keyreleased(key)
  if key == 'm' then
    return Gamestate.switch(Menu)
  end
  if key == 'p' then
    player:stops()
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

return Game
