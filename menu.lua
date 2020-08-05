Menu = {}
local B = require "button"
local Buttons
local video

function Menu:init()
  self.background = love.graphics.newImage('asset/bg.png')
  self.intro = love.graphics.newImage('asset/intro.jpg')
  self.name = love.graphics.newImage('asset/name.png')
  self.video = love.graphics.newVideo("asset/intro.ogv")
end

function Menu:enter(previous)
  sounds.birds:pause()
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
    love.graphics.draw(self.name, 370, 60)
  end
  love.graphics.draw(self.background, 0, 0)
  Buttons:draw()
  drawBorders()
end

function Menu:keyreleased(key, code)
  if key == "1" or key == "2" or key == "3" or key == "4" or key == "5" or key == "6" or key == "7" or key == "8" then
    Gamestate.switch(Info, tonumber(key))
  end
  Buttons:keyreleased(key, code)
end
