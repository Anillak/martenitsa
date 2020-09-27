local Menu = {}
local Survival = require 'survival'
local Controls = require 'controls'
local Levels = require 'levels'
local Scores = require 'scores'
local Buttons

function Menu:init()
  self.background = love.graphics.newImage('asset/bg-real.png')
  self.intro = love.graphics.newImage('asset/intro.jpg')
  self.name = love.graphics.newImage('asset/name.png')
end

function Menu:enter(previous, active)
  sounds.birds:pause()

  Buttons = B:new()
  local position = 510
  Buttons:add("start", position, 210, "New Game", false, Game, 1)
  Buttons:add("continue", position, 265, "Continue", (not (saveData.level > 1)), Levels)
  Buttons:add("scores", position, 320, "Scores", (not (saveData.level > 8)), Scores)
  Buttons:add("survival", position, 375, "Survival Mode", (not saveData.survival), Survival)
  Buttons:add("controls", position, 430, "Controls", false, Controls)
  Buttons:add("exit", position, 485, "Exit", false)
  if not active then
    Buttons:setActive(Buttons.start)
  else
    Buttons:setActive(Buttons[active])
  end

end

function Menu:leave()
  Buttons:clear()
end

function Menu:draw()
  resetToDraw()
  love.graphics.draw(self.intro, 0, 0)
  love.graphics.draw(self.name, 370, 60)
  love.graphics.draw(self.background, 0, 0)
  Buttons:draw()
  drawBorders()
end

function Menu:keyreleased(key, code)
  Buttons:keyreleased(key, code)
end

function Menu:keypressed(key, code)
  Buttons:keypressed(key, code)
end

return Menu
