Controls = {}

function Controls:init()

end

function Controls:enter(previous)

end

function Controls:update(dt)

end

function Controls:draw()
  love.graphics.setBackgroundColor(1, 1, 1)
  love.graphics.setColor(1, 1, 1)
  love.graphics.translate(0, BORDERS)
  love.graphics.scale(SCALE)

end

function Controls:keyreleased(key, code)
  if key == "escape" then
   love.event.quit()
  end
  if key == 'm' then
    return Gamestate.switch(Menu)
  end
end
