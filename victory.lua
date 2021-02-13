local Victory = {}
local Info = require 'info'
local Buttons

function Victory:init()
  local size = TILE_SIZE*4
  local grid = Anim8.newGrid(size, size, size*5, size)
  self.victory_anim = Anim8.newAnimation(grid('1-5', 1), 0.5, "pauseAtEnd")
end

function Victory:enter(from, level, screenshot)
  Buttons = B:new()
  Buttons:add("continue", 542, 350, false, Info, level)
  Buttons:setActive(Buttons.continue)
  if level == 8 then
    sounds.credits:play()
  else
    sounds.victory:play()
  end
  self.victory_anim:pauseAtStart()
  self.victory_anim:resume()
  self.screenshot = screenshot
end

function Victory:update(dt)
  self.victory_anim:update(dt)
end

function Victory:leave()
  self.screenshot = nil
  Buttons:clear()
end

function Victory:draw()
  love.graphics.draw(self.screenshot, 0, 0)
  resetToDraw()
  love.graphics.setColor(1,1,1, 0.7)
  love.graphics.rectangle('fill', 0, 0, ORIGINAL_GAME_X, ORIGINAL_GAME_Y)
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
