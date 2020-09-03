Scores = {}
local B = require "button"
local Buttons

function Scores:init()
  self.background = love.graphics.newImage('asset/bg-real2.png')
  self.image = love.graphics.newImage('asset/info1.png')
end

function Scores:enter()
  Buttons = B:new()
  Buttons:add("menu", Buttons.getCenteredHorizontalPosition(), 600, "Go to Menu", false, Menu, "scores")
  Buttons:setActive(Buttons.menu)
end

function Scores:update(dt)
  Buttons:update(dt)
end

function Scores:draw()
  resetToDraw()
  love.graphics.draw(self.background, 0, 0)
  love.graphics.draw(self.image, 350, 20)
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(love.graphics.newFont(FONT, 30))
  local width = 400
  local titleText = "High Scores"
  love.graphics.printf(titleText, getCenteredHorizontalPosition(width), 70, width, "center")
  for i=1,LEVELS_AMOUNT do
    love.graphics.setFont(love.graphics.newFont(FONT_SECOND, 24))
    local levelText = "Level " .. i .. ":"
    love.graphics.print(levelText, 560, 120 + i*40)
  end
  for i=1,LEVELS_AMOUNT do
    love.graphics.setColor(0.5, 0, 0)
    love.graphics.setFont(love.graphics.newFont(FONT_SECOND, 24))
    local score = math.ceil(saveData[i])
    love.graphics.print(score, 670, 120 + i*40)
  end

  Buttons:draw()
  drawBorders()
end

function Scores:keyreleased(key, code)
  Buttons:keyreleased(key, code)
end

function Scores:keypressed(key, code)
  Buttons:keypressed(key, code)
end
