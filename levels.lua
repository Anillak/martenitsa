Levels = {}
local B = require "button"
local Buttons
local levelsAmount = 1

function Levels:init()
  self.background = love.graphics.newImage('sprites/bg.png')
  levelsAmount = 7
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
  resetToDraw()
  love.graphics.draw(self.background, 0, 0)
  Buttons:draw()
end

function Levels:keyreleased(key, code)
  if key == "escape" then
   love.event.quit()
  end
  if key == 'm' then
    return Gamestate.switch(Menu)
  end
  if key == 'up' or key == 'left' then
    self:selectPrevious()
  end
  if key == 'down' or key == 'right' then
    self:selectNext()
  end
  if key == 'return' then
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

function Levels:mousemoved(x, y)
  local button = Buttons:hovered(x, y)
end

function Levels:mousepressed(x, y)
  local button = Buttons:hovered(x, y)
end

function Levels:mousereleased(x, y, mouseBtn)
  local button = Buttons:hovered(x, y)
  if button then
    Buttons:setActive(button)
      if mouseBtn == 1 then
        button:onClick()
      end
    end
end
