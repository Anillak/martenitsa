Levels = {}
local B = require "button"
local Buttons
local levelsAmount = 1

function Levels:init()
  self.background = love.graphics.newImage('sprites/bg.png')
  levelsAmount = 5
end

function Levels:enter()
  Buttons = B:new()
  local width = Buttons.getWidth()
  for i=0,levelsAmount-1 do
    local col = i % 4
    local row = math.floor(i / 4)
    local positionX = width*col + 170 + 50*col
    local positionY = math.random(250 + 100*row, 250 + 100*row)
    local level = i+1
    local inactive = level > saveData.level
    Buttons:add(level, positionX, positionY, level, inactive, Game, level)
  end
  Buttons:setActive(Buttons[1])
end

function Levels:update(dt)
  Buttons:update(dt)
end

function Levels:draw()
  love.graphics.setBackgroundColor(1, 1, 1)
  love.graphics.setColor(1, 1, 1)
  love.graphics.translate(0, BORDERS)
  love.graphics.scale(SCALE)
  love.graphics.draw(self.background, 0, 0)
  Buttons:draw()
end

function Levels:keyreleased(key, code)
  if key == "escape" then
   love.event.quit()
  end
  if key == 'up' or key == 'left' then
    self:selectPrevious()
  elseif key == 'down' or key == 'right' then
    self:selectNext()
  elseif key == 'return' then
    Buttons.active:onClick()
  end
end

function Levels:selectNext()
  local next = Buttons:getActive() + 1
  if next <= levelsAmount then
    Buttons:setActive(Buttons[next])
  end
end

function Levels:selectPrevious()
  local previous = Buttons:getActive() - 1
  if previous > 0 then
    Buttons:setActive(Buttons[previous])
  end
end