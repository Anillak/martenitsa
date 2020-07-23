Menu = {}
local B = require "button"
local Buttons
local video

function Menu:init()
  self.background = love.graphics.newImage('asset/bg.png')
  self.intro = love.graphics.newImage('asset/intro.jpg')
  self.video = love.graphics.newVideo("asset/intro.ogv")
end

function Menu:enter(previous)
  self.video:play()
  Buttons = B:new()
  local position = 510
  Buttons:add("start", position, 240, "Start", false, Game, 1)
  Buttons:add("continue", position, 300, "Continue", (not (saveData.level > 1)), Levels)
  Buttons:add("controls", position, 360, "Controls", false, Controls)
  Buttons:add("exit", position, 420, "Exit", false)
  Buttons:setActive(Buttons.start)
end

function Menu:update(dt)
  Buttons:update(dt)
end

function Menu:draw()
  resetToDraw()
  if self.video:isPlaying() then
    love.graphics.draw(self.video, 0, 0)
  else
    love.graphics.draw(self.intro, 0, 0)
  end
  love.graphics.draw(self.background, 0, 0)
  Buttons:draw()
end

function Menu:keyreleased(key, code)
  if key == "escape" then
   love.event.quit()
  end
  Buttons:keyreleased(key, code)
end

function Menu:mousemoved(x, y)
  Buttons:mousemoved(x, y)
end

function Menu:mousepressed(x, y)
  Buttons:mousepressed(x, y)
end

function Menu:mousereleased(x, y, mouseBtn)
  Buttons:mousereleased(x, y, mouseBtn)
end
