Levels = {}
local B = require "button"
local Buttons

function Levels:init()
  self.background = love.graphics.newImage('asset/bg.png')
end

function Levels:enter()
  Buttons = B:new()
  local width = Buttons.getWidth()
  for i=0,LEVELS_AMOUNT-1 do
    local col = i % 4
    local row = math.floor(i / 4)
    local positionX = width*col + 170 + 50*col
    local positionY = math.random(250 + 100*row, 250 + 100*row)
    local level = i+1
    local inactive = level > saveData.level
    Buttons:add(level, positionX, positionY, level, inactive, Game, level)
  end
  Buttons:add("menu", 170, 600, "Go to Menu", false, Menu)
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
  Buttons:keyreleased(key, code)
end

function Levels:mousemoved(x, y)
  Buttons:mousemoved(x, y)
end

function Levels:mousepressed(x, y)
  Buttons:mousepressed(x, y)
end

function Levels:mousereleased(x, y, mouseBtn)
  Buttons:mousereleased(x, y, mouseBtn)
end
