local Player = {}

function Player:new(o, x, y, length, direction)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.segments = {}
   o.bound = false
   o.dead = false
   o.direction = {direction}

   for i=0,length-1 do
     table.insert(o.segments, self:createSegment(x-i, y))
   end
   return o
end

function Player:createSegment(x, y)
  segment = {}
  segment.x = x
  segment.y = y
  segment.grid = Anim8.newGrid(CELL_SIZE, CELL_SIZE, CELL_SIZE*3, CELL_SIZE)
  segment.animation = Anim8.newAnimation(segment.grid('1-3', 1), 0.1)
  return segment
end

function Player:updateAnimation(dt)
  for _,segment in ipairs(self.segments) do
    segment.animation:update(dt)
  end
end

function Player:update(dt)
  if #self.direction > 1 then
    table.remove(self.direction, 1)
  end
  local newX, newY = self:next()
  self.bound = self:isBound(newX, newY)
  table.insert(self.segments, 1, self:createSegment(newX, newY))
end

function Player:isBound(x, y)
  assert(self.segments[#self.segments-1], "Player is less than 2 segments long")
  assert(self.segments[#self.segments-2], "Player is less than 3 segments long")
  if (x == self.segments[#self.segments-1].x
  and y == self.segments[#self.segments-1].y)
  or (x == self.segments[#self.segments-2].x
  and y == self.segments[#self.segments-2].y) then
    return true
  end
end

function Player:draw()
  for i,segment in ipairs(self.segments) do
    local neighbours = self:findNeighbours(i, segment)
    local image = self:getSpriteAccordingToNeighbors(i, neighbours)
    segment.sprite = image.sprite
    segment.rotation = image.rotation

    segment.animation:draw(
      image.sprite,
      segment.x * CELL_SIZE + CELL_SIZE/2,
      segment.y * CELL_SIZE + CELL_SIZE/2,
      math.rad(image.rotation),
      1,
      1,
      CELL_SIZE/2,
      CELL_SIZE/2
    )
  end
end

function Player:findNeighbours(i, segment)
  local neighbours = {}
  if i == 1 then
    assert(self.segments[i+1], "Player is less than 2 segments long")
    neighbours[self:checkNeighbour(segment, self.segments[i+1])] = true
  elseif i == #self.segments then
    assert(self.segments[i-1], "Player is less than 2 segments long")
    neighbours[self:checkNeighbour(segment, self.segments[i-1])] = true
  else
    assert(self.segments[i-1], "Player is less than 3 segments long")
    neighbours[self:checkNeighbour(segment, self.segments[i-1])] = true
    assert(self.segments[i+1], "Player is less than 3 segments long")
    neighbours[self:checkNeighbour(segment, self.segments[i+1])] = true
  end
  return neighbours
end

function Player:checkNeighbour(segment, neighbour)
  assert(neighbour, "Player segment (" .. segment.x .. ", " .. segment.y .. ") doesn't have a neighbour")
  if neighbour.y == segment.y and neighbour.x == previousXPosition(segment.x) then
    return "left"
  end
  if neighbour.y == segment.y and neighbour.x == nextXPosition(segment.x) then
    return "right"
  end
  if neighbour.x == segment.x and neighbour.y == previousYPosition(segment.y) then
    return "up"
  end
  if neighbour.x == segment.x and neighbour.y == nextYPosition(segment.y) then
    return "down"
  end
  error("Player segment (" .. segment.x .. ", " .. segment.y .. ") has a neighbour (" .. neighbour.x .. ", " .. neighbour.y .. ") too far away from it)")
end

function Player:getSpriteAccordingToNeighbors(i, neighbours)
  local image = {}

  if i == 1 then
    image.sprite = sprites.playerHead
    if neighbours["left"] then
      image.rotation = 0
    elseif neighbours["right"] then
      image.rotation = 180
    elseif neighbours["up"] then
      image.rotation = 90
    elseif neighbours["down"] then
      image.rotation = 270
    end
  elseif i == #self.segments then
    image.sprite = sprites.playerTail
    if neighbours["right"] then
      image.rotation = 0
    elseif neighbours["left"] then
      image.rotation = 180
    elseif neighbours["down"] then
      image.rotation = 90
    elseif neighbours["up"] then
      image.rotation = 270
    end
  elseif neighbours["left"] and neighbours["right"] then
    image.sprite = sprites.playerMid
    image.rotation = 0
  elseif neighbours["up"] and neighbours["down"] then
    image.sprite = sprites.playerMid
    image.rotation = 270
  elseif neighbours["left"] and neighbours["down"] then
    image.sprite = sprites.playerCurve
    image.rotation = 0
  elseif neighbours["left"] and neighbours["up"] then
    image.sprite = sprites.playerCurve
    image.rotation = 90
  elseif neighbours["right"] and neighbours["up"] then
    image.sprite = sprites.playerCurve
    image.rotation = 180
  elseif neighbours["right"] and neighbours["down"] then
    image.sprite = sprites.playerCurve
    image.rotation = 270
  end

  return image
end

function Player:maybeHit(walls)
  if walls.isWall(self.segments[1].x, self.segments[1].y) then
    self.dead = true
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

function Player:isBound()
  return self.bound
end

function Player:isDead()
  return self.dead
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

local function nextPos(pos, gridSize)
  pos = pos + 1
  if pos > gridSize/CELL_SIZE-1 then
    pos = 0
  end
  return pos
end

local function previousPos(pos, gridSize)
  pos = pos - 1
  if pos < 0 then
    pos = gridSize/CELL_SIZE-1
  end
  return pos
end

function nextXPosition(x)
  return nextPos(x, gridX)
end

function previousXPosition(x)
  return previousPos(x, gridX)
end

function nextYPosition(y)
  return nextPos(y, gridY)
end

function previousYPosition(y)
  return previousPos(y, gridY)
end

return Player
