Victory = {}
local B = require "button"
local Buttons

function Victory:init()
  local size = TILE_SIZE*4
  local grid = Anim8.newGrid(size, size, size*5, size)
  self.victory_anim = Anim8.newAnimation(grid('1-5', 1), 0.5, "pauseAtEnd")
end

function Victory:enter(from, level)
  self.from = from
  Buttons = B:new()
  Buttons:add("continue", 542, 350, "Continue", false, Info, level)
  Buttons:setActive(Buttons.continue)
  sounds.victory:play()
end

function Victory:update(dt)
  Buttons:update(dt)
  self.victory_anim:update(dt)
end

function Victory:draw()
  self.from:draw()
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
