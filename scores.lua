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

local function drawTable(title, saveItem, offset)
  love.graphics.setFont(love.graphics.newFont(FONT, 30))
  love.graphics.setColor(0, 0, 0)
  local width = 200
  local titleText = title
  love.graphics.printf(titleText, offset, 100, width, "center")
  for i=1,LEVELS_AMOUNT do
    love.graphics.setFont(love.graphics.newFont(FONT_SECOND, 24))
    local itemText = "Level " .. i .. ":"
    love.graphics.print(itemText, offset + 30, 150 + i*40)
  end
  for i=1,LEVELS_AMOUNT do
    love.graphics.setColor(0.5, 0, 0)
    love.graphics.setFont(love.graphics.newFont(FONT_SECOND, 24))
    local display = math.ceil(saveData[saveItem][i])
    love.graphics.print(display, offset + 130, 150 + i*40)
  end
end

function Scores:draw()
  resetToDraw()
  love.graphics.draw(self.background, 0, 0)
  love.graphics.draw(self.image, 250, 50)
  drawTable("High Scores", "scores", 450)
  drawTable("Death Count", "deaths", 650)

  Buttons:draw()
  drawBorders()
end

function Scores:keyreleased(key, code)
  Buttons:keyreleased(key, code)
end

function Scores:keypressed(key, code)
  Buttons:keypressed(key, code)
end
