local Survival = {}
local Pause = require 'pause'
local Sti
local effects
local walls
local Player
local knots
local doors
local scissors
local possible
local forbidden

function Survival:init()
  Sti = require 'lib/sti-master/sti'
  effects = require 'effects'
  walls = require 'walls'
  Player = require 'player'
  knots = require 'knots'
  doors = require 'doors'
  scissors = require 'scissors'
end

local function loadForbidden(map)
  assertWithLogging(map.layers["forbidden"], "Map doesn't have forbidden properties")
  local forbidden = {}
  for i = 0, GRID_X-1 do
    local row = {}
    forbidden[i] = row
    for j = 0, GRID_Y-1 do
      row[j] = false
    end
  end
  for _,o in ipairs(map.layers["forbidden"].objects) do
    forbidden[o.x/TILE_SIZE][o.y/TILE_SIZE] = true
  end
  return forbidden
end

local function getPossibleKnots()
  local possible = {}
  for x=0,GRID_X-1 do
    for y=0,GRID_Y-1 do
      if not walls.isWall(x, y) and not forbidden[x][y] then
        table.insert(possible, {x, y})
      end
    end
  end
  return possible
end

function Survival:enter(previous)
  Signal.clearPattern('.*')
  Timer.clear()
  map = Sti("maps/survival.lua")
  effects.load()
  walls.load(map)
  knots.load(map)
  doors.load(map)
  scissors.load(map)
  forbidden = loadForbidden(map)
  possible = getPossibleKnots()
  assertWithLogging(map.layers["level"], "Map doesn't have level properties")
  local x = map.layers["level"].properties["x"]
  local y = map.layers["level"].properties["y"]
  local length = map.layers["level"].properties["length"]
  local direction = map.layers["level"].properties["direction"]
  player = Player:new({}, x, y, length, direction)

  self.deaths = saveData.deaths["survival"]

  sounds.birds:play()

  Timer.every(0.15, function() self:move() end)
end

local function saveDeaths(count)
  count = count + 1
  saveData.deaths["survival"] = count
end

local function saveOnLevelEnd(score)
  assert(score, "score not set")
  if saveData.scores["survival"] < score then
    saveData.scores["survival"] = score
  end
end

local function generateKnot()
  math.randomseed(os.time())
  random = math.random(0, #possible)
  knots.create(possible[random][1], possible[random][2])
end

function Survival:move()
  if player:isDead() then
    saveOnLevelEnd(player:length())
    saveDeaths(self.deaths)
    scissors.stop()
    Timer.clear()
    player:stops()
    sounds.dying:play()
    Timer.after(2, function() Gamestate.switch(Survival) end)
  else
    player:starts()
    player:update()
    player:eat(knots.get())
    player:maybeHit(walls)
    player:composeSegments()
    player:getCutBy(scissors.get())
    if knots.available() == 0 then
      generateKnot()
    end
  end
end

function Survival:leave()
  saveOnLevelEnd(player:length())
  player:stops()
  sounds.birds:pause()
  Signal.clearPattern('.*')
  Timer.clear()
  player = nil
  map = nil
  scissors.clear()
  doors.clear()
  knots.clear()
  walls.clear()
  effects.clear()
  love.filesystem.write("martenitsaSaveData.lua", table.show(saveData, "saveData"))
end

function Survival:update(dt)
  map:update(dt)
  knots.update(dt)
  doors.update(dt, player)
  scissors.update(dt)
  player:animationUpdate(dt)
  Timer.update(dt)
  effects.update(dt)
end

function Survival:draw()
  resetToDraw()
  map:drawLayer(map.layers["tiles"])
  map:drawLayer(map.layers["tilesover"])
  scissors.draw()
  doors.drawKeys()
  map:drawLayer(map.layers["elements"])
  knots.draw()
  player:draw()
  -- from here on everything will be drawn over the player
  map:drawLayer(map.layers["over"])
  doors.draw()
  if map.layers["forest"] then
    map:drawLayer(map.layers["forest"])
  end
  scissors.drawSecond()
  effects.draw()
  drawScore(player:length())
  drawBorders()
end

function Survival:keyreleased(key)
  if key == 'm' then
    return Gamestate.switch(Menu)
  end
  if key == 'escape' then
    player:stops()
    Gamestate.push(Pause)
  end
  if key == 'r' then
    Gamestate.switch(Survival)
  end
end

function Survival:keypressed(key)
  player:keyPress(key)
end

return Survival
