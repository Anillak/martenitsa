local Scores = {}
local Buttons

function Scores:init()
  self.background = love.graphics.newImage('asset/bg-real2.png')
  self.image = love.graphics.newImage('asset/info1.png')
  Buttons = B:new()
  Buttons:add("menu", Buttons.getCenteredHorizontalPosition(), 600, false, Menu, "scores")
end

function Scores:enter()
  Buttons:setActive(Buttons.menu)
end

-- localization
local function drawTable(title, saveItem, offset)
  love.graphics.setFont(fonts.scoresTitle)
  love.graphics.setColor(0, 0, 0)
  local width = 200
  local titleText = title
  love.graphics.printf(titleText, offset, 100, width, "center")
  for i=1,LEVELS_AMOUNT do
    love.graphics.setFont(fonts.scoresTable)
    local itemText = localization.scores.level[LANGUAGE] .. " " .. i .. ":"
    love.graphics.print(itemText, offset + 30, 150 + i*40)
  end
  if saveData[saveItem]["survival"] ~= 0 then
    love.graphics.print(localization.scores.survival[LANGUAGE] ..":", offset + 30, 510)
  end
  for i=1,LEVELS_AMOUNT do
    love.graphics.setColor(0.5, 0, 0)
    love.graphics.setFont(fonts.scoresTable)
    local display = math.ceil(saveData[saveItem][i])
    love.graphics.print(display, offset + 130, 150 + i*40)
  end
  if saveData[saveItem]["survival"] ~= 0 then
    love.graphics.print(saveData[saveItem]["survival"], offset + 130, 510)
  end
end

function Scores:draw()
  resetToDraw()
  love.graphics.draw(self.background, 0, 0)
  love.graphics.draw(self.image, 250, 50)
  drawTable(localization.scores.high[LANGUAGE], "scores", 450)
  drawTable(localization.scores.death[LANGUAGE], "deaths", 650)

  Buttons:draw()
  drawBorders()
end

function Scores:keyreleased(key, code)
  Buttons:keyreleased(key, code)
end

function Scores:keypressed(key, code)
  Buttons:keypressed(key, code)
end

return Scores
