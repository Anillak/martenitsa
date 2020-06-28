Pause = {}
function Pause:enter(from)
  self.from = from -- record previous state
end

function Pause:draw()
  local W, H = love.graphics.getWidth(), love.graphics.getHeight()
  self.from:draw()
  love.graphics.setColor(0,0,0, 0.7)
  love.graphics.rectangle('fill', 0,0, W,H)
  love.graphics.setColor(1,1,1)
  love.graphics.setFont(love.graphics.newFont(30))
  love.graphics.printf('PAUSE', 0, H/2 - 30, W, 'center')
end

function Pause:keypressed(key)
  if key == "escape" then
   love.event.quit()
  end
  if key == 'p' then
    return Gamestate.pop()
  end
end
