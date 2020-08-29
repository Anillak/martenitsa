local Player = {}
require 'playerUtils'

function Player:new(o, x, y, length, direction)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.segments = {}
   o.bound = false
   o.won = false
   o.dead = false
   o.direction = {direction}

   local grid_dead = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*4, TILE_SIZE)
   o.animation_dead = Anim8.newAnimation(grid_dead('1-4',1), {0.8, 0.5, 0.5, 0.8})

   for i=1,length do
     local next
     if direction ~= "left" then next = x-i else next = x+i end
     o.segments[i] = self:createSegment(next, y)
   end
   o:composeSegments()
   o:starts()
   return o
end

function Player:createSegment(x, y)
  segment = {}
  segment.x = x
  segment.y = y
  segment.sprite = "playerHead"
  segment.rotation = 0
  return segment
end

function Player:composeSegments()
  for i,segment in ipairs(self.segments) do
    local neighbours = self:findNeighbours(i, segment)
    local image = getSpriteAccordingToNeighbors(i, neighbours, #self.segments)
    if not image.sprite or not image.rotation then
      log("Image sprite or rotation not set, something went wrong with the player, reverting to original")
    end
    if image.sprite then segment.sprite = image.sprite end
    if image.rotation then segment.rotation = image.rotation end
  end
end

function Player:update()
  if not self.dead and not self.won then
    if #self.direction > 1 then
      table.remove(self.direction, 1)
    end
    local newX, newY = self:next()
    self.bound = self:checkIfBound(newX, newY)
    table.insert(self.segments, 1, self:createSegment(newX, newY))
  end
end

function Player:animationUpdate(dt)
  if self.dead then
    self.animation_dead:update(dt)
  end
end

function Player:checkIfBound(x, y)
  assertWithLogging(self.segments[#self.segments-1], "Player is less than 2 segments long")
  assertWithLogging(self.segments[#self.segments-2], "Player is less than 3 segments long")
  if (x == self.segments[#self.segments-2].x
  and y == self.segments[#self.segments-2].y) then
    return true
  end
  return false
end

function Player:findNeighbours(i, segment)
  local neighbours = {}
  if i == 1 then
    assertWithLogging(self.segments[i+1], "Player is less than 2 segments long")
    neighbours[1] = checkNeighbour(segment, self.segments[i+1])
  elseif i == #self.segments then
    assertWithLogging(self.segments[i-1], "Player is less than 2 segments long")
    neighbours[1] = checkNeighbour(segment, self.segments[i-1])
  else
    assertWithLogging(self.segments[i-1], "Player is less than 3 segments long")
    neighbours[1] = checkNeighbour(segment, self.segments[i-1])
    assertWithLogging(self.segments[i+1], "Player is less than 3 segments long")
    neighbours[2] = checkNeighbour(segment, self.segments[i+1])
  end
  return neighbours
end

local function drawAlivePlayer(segment)
  love.graphics.draw(
    sprites[segment.sprite],
    segment.x * TILE_SIZE + TILE_SIZE/2,
    segment.y * TILE_SIZE + TILE_SIZE/2,
    math.rad(segment.rotation),
    1,
    1,
    TILE_SIZE/2,
    TILE_SIZE/2
  )
end

local function drawDeadPlayer(animation, segment)
  animation:draw(
    sprites[segment.sprite .. "Cut"],
    segment.x * TILE_SIZE + TILE_SIZE/2,
    segment.y * TILE_SIZE + TILE_SIZE/2,
    math.rad(segment.rotation),
    1,
    1,
    TILE_SIZE/2,
    TILE_SIZE/2
  )
end

function Player:draw()
  for j=1,#self.segments do
    i = #self.segments-j+1
    local segment = self.segments[i]

    if not self.dead then
      drawAlivePlayer(segment)
    else
      drawDeadPlayer(self.animation_dead, segment)
    end
  end
end

function Player:maybeHit(walls)
  isWall, isWater = walls.isWall(self.segments[1].x, self.segments[1].y)
  if isWall then
    self.dead = true
    if isWater then
      log("Player hit water")
      Signal.emit('hit water', self.segments[1].x, self.segments[1].y)
      sounds.waterHit:play()
    else
      log("Player hit wall")
      Signal.emit('hit wall', self.segments[1].x, self.segments[1].y)
      sounds.wallHit:play()
    end
  end
end

function Player:eat(knots)
  collected = -1
  for i,knot in ipairs(knots) do
    if hit(self.segments[1], knot) then
      collected = i
    end
  end
  if collected == -1 then
    table.remove(self.segments)
  else
    table.remove(knots, collected)
    sounds.knotEat:play()
  end
end

function Player:getCutBy(scissors)
  for i,s in ipairs(scissors) do
    s:cutPlayer(self)
  end
end

function Player:maybeReach(goal)
  self.won = self.bound and goal:isComplete()
end

function Player:isDead()
  return self.dead
end

function Player:isWon()
  return self.won
end

function Player:length()
  return #self.segments
end

function Player:starts()
  sounds.walking:play()
end

function Player:stops()
  sounds.walking:pause()
end

function Player:keyPress(key)
  if (key == "right" or key == "d")
    and self.direction[#self.direction] ~= "right"
    and self.direction[#self.direction] ~= "left" then
      table.insert(self.direction, "right")
      sounds.turning:play()
  elseif (key == "left" or key == "a")
    and self.direction[#self.direction] ~= "left"
    and self.direction[#self.direction] ~= "right" then
      table.insert(self.direction, "left")
      sounds.turning:play()
  elseif (key == "down" or key == "s")
    and self.direction[#self.direction] ~= "down"
    and self.direction[#self.direction] ~= "up" then
      table.insert(self.direction, "down")
      sounds.turning:play()
  elseif (key == "up" or key == "w")
    and self.direction[#self.direction] ~= "up"
    and self.direction[#self.direction] ~= "down" then
      table.insert(self.direction, "up")
      sounds.turning:play()
  end
end

function Player:next()
  assertWithLogging(self.segments[1], "Player disappeared")
  local newX = self.segments[1].x
  local newY = self.segments[1].y

  if self.direction[1] == "right" then
    newX = nextXPosition(newX)
  elseif self.direction[1] == "left" then
    newX = previousXPosition(newX)
  elseif self.direction[1] == "down" then
    newY = nextYPosition(newY)
  elseif self.direction[1] == "up" then
    newY = previousYPosition(newY)
  else
    errorWithLogging("Wrong direction provided: " .. self.direction[1])
  end

  return newX, newY
end

return Player
