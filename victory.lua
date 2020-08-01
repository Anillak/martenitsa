Victory = {}
local B = require "button"
local Buttons

function Victory:init()
  local size = TILE_SIZE*4
  local grid = Anim8.newGrid(size, size, size*5, size)
  self.victory_anim = Anim8.newAnimation(grid('1-5', 1), 0.5)
end

function Victory:enter(from, level)
  self.from = from
  Buttons = B:new()
  Buttons:add("continue", 542, 350, "Continue", false, Info, level)
  Buttons:setActive(Buttons.continue)
end

function Victory:update(dt)
  Buttons:update(dt)
  self.victory_anim:update(dt)
end

function Victory:draw()
  self.from:draw()
  love.graphics.setColor(1,1,1, 0.7)
  love.graphics.rectangle('fill', 0, 0, GAME_X, GAME_Y)
  self.victory_anim:draw(sprites.playerVictory, 576, 200)
  Buttons:draw()
end

function Victory:keyreleased(key, code)
  if key == "escape" then
   love.event.quit()
  end
  Buttons:keyreleased(key, code)
end

function Victory:mousemoved(x, y)
  Buttons:mousemoved(x, y)
end

function Victory:mousepressed(x, y)
  Buttons:mousepressed(x, y)
end

function Victory:mousereleased(x, y, mouseBtn)
  Buttons:mousereleased(x, y, mouseBtn)
end
