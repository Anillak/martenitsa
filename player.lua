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
     o.segments[i] = self:createSegment(x-i, y)
   end

   o:composeSegments()
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
    segment.sprite = image.sprite
    segment.rotation = image.rotation
  end
end

function Player:update(dt)
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
  assert(self.segments[#self.segments-1], "Player is less than 2 segments long")
  assert(self.segments[#self.segments-2], "Player is less than 3 segments long")
  if (x == self.segments[#self.segments-2].x
  and y == self.segments[#self.segments-2].y) then
    return true
  end
  return false
end

function Player:findNeighbours(i, segment)
  local neighbours = {}
  if i == 1 then
    assert(self.segments[i+1], "Player is less than 2 segments long")
    neighbours[1] = checkNeighbour(segment, self.segments[i+1])
  elseif i == #self.segments then
    assert(self.segments[i-1], "Player is less than 2 segments long")
    neighbours[1] = checkNeighbour(segment, self.segments[i-1])
  else
    assert(self.segments[i-1], "Player is less than 3 segments long")
    neighbours[1] = checkNeighbour(segment, self.segments[i-1])
    assert(self.segments[i+1], "Player is less than 3 segments long")
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
      Signal.emit('hit water', self.segments[1].x, self.segments[1].y)
    else
      Signal.emit('hit wall', self.segments[1].x, self.segments[1].y)
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
  end
end

function Player:getCutBy(scissors)
  for i,s in ipairs(scissors) do
    s:cutPlayer(self)
  end
end

function Player:open(doors)
  for _,d in ipairs(doors) do
    d:checkIfOpenBy(self)
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

function Player:playDead()

end

function Player:playVictory()

end

function Player:keyPress(key)
  if key == "right"
    and self.direction[#self.direction] ~= "right"
    and self.direction[#self.direction] ~= "left" then
      table.insert(self.direction, "right")
  elseif key == "left"
    and self.direction[#self.direction] ~= "left"
    and self.direction[#self.direction] ~= "right" then
      table.insert(self.direction, "left")
  elseif key == "down"
    and self.direction[#self.direction] ~= "down"
    and self.direction[#self.direction] ~= "up" then
      table.insert(self.direction, "down")
  elseif key == "up"
    and self.direction[#self.direction] ~= "up"
    and self.direction[#self.direction] ~= "down" then
      table.insert(self.direction, "up")
  end
end

function Player:next()
  assert(self.segments[1], "Player disappeared")
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
    error("Wrong direction provided: " .. self.direction[1])
  end

  return newX, newY
end

return Player
