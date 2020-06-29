Menu = {}
local B = require "button"
local Buttons

function Menu:init()
  self.background = love.graphics.newImage('sprites/bg.png')
end

function Menu:enter(previous)
  Buttons = B:new()
  Buttons:setActive(Buttons.start)
end

function Menu:update(dt)
  Buttons:update(dt)
end

function Menu:draw()
  love.graphics.draw(self.background, 0, 0)
  Buttons:draw()
end

function Menu:keyreleased(key, code)
  if key == "escape" then
   love.event.quit()
  end
  if key == 'up' or key == 'left' then
    Buttons:selectPrevious()
  elseif key == 'down' or key == 'right' then
    Buttons:selectNext()
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
