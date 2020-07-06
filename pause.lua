Pause = {}
function Pause:enter(from)
  self.from = from -- record previous state
end

function Pause:draw()
  self.from:draw()
  love.graphics.setColor(0,0,0, 0.7)
  love.graphics.rectangle('fill', 0, 0, GAME_X, GAME_Y)
  love.graphics.setColor(1,1,1)
  love.graphics.setFont(love.graphics.newFont(30))
  love.graphics.printf('PAUSE', 0, GAME_Y/2 - 30, GAME_X, 'center')
end

function Pause:keypressed(key)
  if key == "escape" then
   love.event.quit()
  end
  if key == 'p' then
    return Gamestate.pop()
  end
end
