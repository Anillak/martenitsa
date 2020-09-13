local Victory = {}
local Info = require 'info'
local Buttons

function Victory:init()
  local size = TILE_SIZE*4
  local grid = Anim8.newGrid(size, size, size*5, size)
  self.victory_anim = Anim8.newAnimation(grid('1-5', 1), 0.5, "pauseAtEnd")
end

function Victory:enter(from, level)
  Buttons = B:new()
  Buttons:add("continue", 542, 350, "Continue", false, Info, level)
  Buttons:setActive(Buttons.continue)
  if level == 8 then
    sounds.credits:play()
  else
    sounds.victory:play()
  end
end

function Victory:update(dt)
  self.victory_anim:update(dt)
end

function Victory:leave()
  Buttons:clear()
end

function Victory:draw()
  resetToDraw()
  love.graphics.setColor(1,1,1, 1)
  self.victory_anim:draw(sprites.playerVictory, 576, 200)
  Buttons:draw()
  drawBorders()
end

function Victory:keyreleased(key, code)
  Buttons:keyreleased(key, code)
end

function Victory:keypressed(key, code)
  Buttons:keypressed(key, code)
end

return Victory
