Menu = {}
local B = require "button"
local Buttons
local video

function Menu:init()
  self.background = love.graphics.newImage('sprites/bg.png')
  video = love.graphics.newVideo("asset/intro.ogv")
end

function Menu:enter(previous)
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
  love.graphics.setBackgroundColor(1, 1, 1)
  love.graphics.setColor(1, 1, 1)
  love.graphics.translate(0, BORDERS)
  love.graphics.scale(SCALE)
  love.graphics.draw(video, 0, 0)
  love.graphics.draw(self.background, 0, 0)
  Buttons:draw()
end

function Menu:selectNext()
  if Buttons.active == Buttons.start then
    if Buttons.continue.inactive then
      Buttons:setActive(Buttons.controls)
    else
      Buttons:setActive(Buttons.continue)
    end
  elseif Buttons.active == Buttons.continue then Buttons:setActive(Buttons.controls)
  elseif Buttons.active == Buttons.controls then Buttons:setActive(Buttons.exit)
  elseif Buttons.active == Buttons.exit then Buttons:setActive(Buttons.start)
  end
end

function Menu:selectPrevious()
  if Buttons.active == Buttons.start then Buttons:setActive(Buttons.exit)
  elseif Buttons.active == Buttons.continue then Buttons:setActive(Buttons.start)
  elseif Buttons.active == Buttons.controls then
    if Buttons.continue.inactive then
      Buttons:setActive(Buttons.start)
    else
      Buttons:setActive(Buttons.continue)
    end
  elseif Buttons.active == Buttons.exit then
    Buttons:setActive(Buttons.controls)
  end
end

function Menu:keyreleased(key, code)
  if key == "escape" then
   love.event.quit()
  end
  if key == 'up' or key == 'left' then
    self:selectPrevious()
  elseif key == 'down' or key == 'right' then
    self:selectNext()
  elseif key == 'return' then
    Buttons.active:onClick()
  end
end

function Menu:mousemoved(x, y)
  local button = Buttons:hovered(x, y)
end

function Menu:mousepressed(x, y)
  local button = Buttons:hovered(x, y)
end

function Menu:mousereleased(x, y, mouseBtn)
  local button = Buttons:hovered(x, y)
  if button then
    Buttons:setActive(button)
      if mouseBtn == 1 then
        button:onClick()
      end
    end
end
