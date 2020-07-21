Info = {}
local B = require "button"
local Buttons

function Info:init()
  self.background = love.graphics.newImage('sprites/bg.png')

end

function Info:enter(previous, level)
  Buttons = B:new()
  Buttons:add("menu", 170, 600, "Go to Menu", false, Menu)
  Buttons:add("level", 915, 600, "Continue", false, Game, level+1)
  Buttons:setActive(Buttons.level)
end

function Info:update(dt)
  Buttons:update(dt)
end

function Info:draw()
  resetToDraw()
  love.graphics.draw(self.background, 0, 0)

  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(love.graphics.newFont(FONT, 16))

  love.graphics.printf("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id augue et ex hendrerit facilisis in id nunc. Pellentesque sollicitudin turpis nunc, vel efficitur nisi vulputate a. Maecenas sodales pharetra luctus. Nulla facilisi. Quisque vitae egestas ligula, in gravida arcu. Praesent ullamcorper quis nulla ut bibendum. Maecenas auctor nec nisi non maximus. Maecenas a ligula auctor ante pulvinar vulputate vel eget mauris. Vivamus tincidunt lorem non sem blandit posuere. Sed sagittis imperdiet felis, in finibus est fringilla et. Aenean fringilla massa risus, ac vehicula nunc faucibus vel. Morbi posuere molestie est id elementum. Mauris rhoncus semper venenatis. In sed purus id massa consectetur placerat. Maecenas dictum aliquam sodales. Donec vel urna nec neque convallis mattis. Aliquam gravida orci maximus accumsan lobortis. Praesent ac urna in sapien commodo consectetur. Pellentesque vel libero justo. Cras in sapien condimentum, pretium lorem id, auctor ipsum. Maecenas sed congue leo, at rhoncus nulla. Mauris vel velit ac quam pulvinar vehicula vel vitae lectus. Donec finibus arcu a porta auctor. Ut posuere lectus in mi sodales varius. Nulla euismod ornare est, at pellentesque sapien tincidunt sit amet. Nunc rhoncus facilisis enim, cursus molestie enim vestibulum ac.", 300, 120, 600, "left")

  love.graphics.setColor(1, 1, 1)
  Buttons:draw()
end

function Info:keyreleased(key, code)
  if key == "escape" then
   love.event.quit()
  end
  if key == 'm' then
    return Gamestate.switch(Menu)
  end
  Buttons:keyreleased(key, code)
end

function Info:mousemoved(x, y)
  Buttons:mousemoved(x, y)
end

function Info:mousepressed(x, y)
  Buttons:mousepressed(x, y)
end

function Info:mousereleased(x, y, mouseBtn)
  Buttons:mousereleased(x, y, mouseBtn)
end
