Menu = {}
local B = require "button"
local Buttons
local video

function Menu:init()
  self.background = love.graphics.newImage('sprites/bg.png')
  video = love.graphics.newVideo("asset/intro.ogv")
end

function Menu:enter(previous)
  video:rewind()
  video:play()
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
  love.graphics.draw(video, 0, 0)
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
