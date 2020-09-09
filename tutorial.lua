local Shadow = {}
require 'playerUtils'

function Shadow:new(o, x, y, length, direction)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.segments = {}
   o.direction = {direction}
   o.doneCount = 1

   local grid_dead = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*4, TILE_SIZE)
   o.animation_dead = Anim8.newAnimation(grid_dead('1-4',1), {0.8, 0.5, 0.5, 0.8})

   for i=1,length do
     local next
     if direction ~= "left" then next = x-i else next = x+i end
     o.segments[i] = self:createSegment(next, y)
   end

   o:composeSegments()
   return o
end

function Shadow:createSegment(x, y)
  segment = {}
  segment.x = x
  segment.y = y
  segment.sprite = "playerHead"
  segment.rotation = 0
  return segment
end

function Shadow:composeSegments()
  for i,segment in ipairs(self.segments) do
    local neighbours = self:findNeighbours(i, segment)
    local image = getSpriteAccordingToNeighbors(i, neighbours, #self.segments)
    if image.sprite then segment.sprite = image.sprite end
    if image.rotation then segment.rotation = image.rotation end
  end
end

function Shadow:update()
  if #self.direction > 1 then
    table.remove(self.direction, 1)
    local newX, newY = self:next()
    table.insert(self.segments, 1, self:createSegment(newX, newY))
    table.remove(self.segments)
    self:composeSegments()
    if self.doneCount < 5 then
      self.doneCount = self.doneCount + 1
    end
  else
    self.doneCount = self.doneCount - 1
  end
end

function Shadow:isAlive()
  return #self.direction > 1 or self.doneCount > 0
end

function Shadow:findNeighbours(i, segment)
  local neighbours = {}
  if i == 1 then
    neighbours[1] = checkNeighbour(segment, self.segments[i+1])
  elseif i == #self.segments then
    neighbours[1] = checkNeighbour(segment, self.segments[i-1])
  else
    neighbours[1] = checkNeighbour(segment, self.segments[i-1])
    neighbours[2] = checkNeighbour(segment, self.segments[i+1])
  end
  return neighbours
end

function Shadow:draw()
  love.graphics.setColor(1,1,1,(self.doneCount/10))
  for j=1,#self.segments do
    i = #self.segments-j+1
    local segment = self.segments[i]
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
  love.graphics.setColor(1,1,1,1)
end

function Shadow:next()
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

function Shadow:addDirection(direction)
  table.insert(self.direction, direction)
end

local Text = {}

function Text:new(o, x, y, text)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y
   o.text = text
   o.doneCount = 1
   o.hiding = false
   return o
end

function Text:draw()
  love.graphics.setFont(love.graphics.newFont(FONT_SECOND, 16))
  love.graphics.setColor(0,0,0,(self.doneCount/10))
  love.graphics.printf(self.text, self.x, self.y, 300, "center")
  love.graphics.setColor(1,1,1,1)
end

function Text:update()
  if self.hiding then
    self.doneCount = self.doneCount - 1
  else
    self.doneCount = self.doneCount + 1
    if self.doneCount == 15 then self.hiding = true end
  end

end

function Text:isAlive()
  return self.doneCount > 0
end

Arrow = {}

function Arrow:new(o, x, y, flipped)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y
   o.doneCount = 1
   o.hiding = false
   o.flipped = flipped
   return o
end

function Arrow:draw()
  local arrow
  if not self.flipped then
    arrow = love.graphics.newImage('asset/arrow.png')
  else
    arrow = love.graphics.newImage('asset/arrow-flip.png')
  end
  love.graphics.setColor(1,1,1,(self.doneCount/10))
  love.graphics.draw(arrow, self.x, self.y)
  love.graphics.setColor(1,1,1,1)
end

function Arrow:update()
  if self.hiding then
    self.doneCount = self.doneCount - 1
  else
    self.doneCount = self.doneCount + 1
    if self.doneCount == 15 then self.hiding = true end
  end

end

function Arrow:isAlive()
  return self.doneCount > 0
end

local Tutorial = {}
local steps = {}

local function eatKnotsText()
  return Text:new({}, 200, 600, "Eat the knots to grow longer.")
end

local function eatKnotsArrow()
  return Arrow:new({}, 150, 580, false)
end

local function endConditionText()
  return Text:new({}, 830, 400, "Wrap yourself around the checkoints to finish the level.")
end

local function endConditionArrow()
  return Arrow:new({}, 730, 400, false)
end

local function endCondition()
  local shadow = Shadow:new({}, 25, 9, 14, "left")
  shadow:addDirection("left")
  shadow:addDirection("left")
  shadow:addDirection("left")
  shadow:addDirection("left")
  shadow:addDirection("left")
  shadow:addDirection("left")
  shadow:addDirection("left")
  shadow:addDirection("left")
  shadow:addDirection("down")
  shadow:addDirection("down")
  shadow:addDirection("down")
  shadow:addDirection("right")
  shadow:addDirection("right")
  shadow:addDirection("right")
  shadow:addDirection("up")
  shadow:addDirection("up")
  shadow:addDirection("up")
  return shadow
end

local function resetArrow()
  return Arrow:new({}, 1100, 20, true)
end

function Tutorial.load(level)
  steps = {}
  if level == 1 then
    Signal.register('show eat knots', function()
      table.insert(steps, eatKnotsText())
      table.insert(steps, eatKnotsArrow())
    end)
    Signal.register('show end condition', function()
      table.insert(steps, endCondition())
      table.insert(steps, endConditionText())
      table.insert(steps, endConditionArrow())
    end)
  end

  Signal.register('show r', function() table.insert(steps, resetArrow()) end)
end

function Tutorial.draw()
  for _,s in ipairs(steps) do
    s:draw()
  end
end

function Tutorial.update()
  for i=#steps,1,-1 do
    if not steps[i]:isAlive() then
      table.remove(steps, i)
    end
  end
  for _,s in ipairs(steps) do
    s:update()
  end
end

function Tutorial.clear()
  for _,s in pairs(steps) do s = nil end
end

return Tutorial
