Levels = {}
local B = require "button"
local Buttons

function Levels:init()
  self.background = love.graphics.newImage('asset/levels-bg.jpg')
  self.positions = {250, 200, 220, 200, 400, 350, 370, 320}
end

function Levels:enter()
  Buttons = B:new()
  local width = Buttons.getWidth()
  for i=0,LEVELS_AMOUNT-1 do
    local col = i % 4
    local positionX = width*col + 170 + 50*col
    local level = i+1
    local positionY = self.positions[level]
    local inactive = level > saveData.level
    Buttons:add(level, positionX, positionY, level, inactive, Game, level)
  end
  Buttons:add("menu", Buttons.getCenteredHorizontalPosition(), 600, "Go to Menu", false, Menu)
  Buttons:setActive(Buttons[1])
end

function Levels:update(dt)
  Buttons:update(dt)
end

function Levels:draw()
  resetToDraw()
  love.graphics.draw(self.background, 0, 0)
  Buttons:draw()
  drawBorders()
end

function Levels:keyreleased(key, code)
  Buttons:keyreleased(key, code)
end

function Levels:keypressed(key, code)
  Buttons:keypressed(key, code)
end
