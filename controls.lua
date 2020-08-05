Controls = {}
local B = require "button"
local Buttons

function Controls:init()
  self.background = love.graphics.newImage('asset/bg.png')

  local b_grid = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*2, TILE_SIZE*8)
  self.m_anim = Anim8.newAnimation(b_grid('1-2', 1), 0.5)
  self.r_anim = Anim8.newAnimation(b_grid('1-2', 2), 0.5)
  self.p_anim = Anim8.newAnimation(b_grid('1-2', 3), 0.5)
  self.down_anim = Anim8.newAnimation(b_grid('1-2', 4), 0.5)
  self.up_anim = Anim8.newAnimation(b_grid('1-2', 5), 0.5)
  self.right_anim = Anim8.newAnimation(b_grid('1-2', 6), 0.5)
  self.left_anim = Anim8.newAnimation(b_grid('1-2', 7), 0.5)

  local c_grid = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*3, TILE_SIZE*3)
  self.c_anim = Anim8.newAnimation(c_grid('1-3',1, '1-3',2, '1-3',3), {1, 0.1, 0.1, 0.2, 0.7, 0.2, 0.1, 0.1, 1})

  local k_grid = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*2, TILE_SIZE*3)
  self.k_anim = Anim8.newAnimation(k_grid('1-2',3), {2, 0.5})
end

function Controls:enter(previous)
  Buttons = B:new()
  Buttons:add("menu", 170, 600, "Go to Menu", false, Menu)
  Buttons:setActive(Buttons.menu)
end

function Controls:update(dt)
  Buttons:update(dt)
  self.m_anim:update(dt)
  self.r_anim:update(dt)
  self.p_anim:update(dt)
  self.down_anim:update(dt)
  self.up_anim:update(dt)
  self.right_anim:update(dt)
  self.left_anim:update(dt)

  self.c_anim:update(dt)
  self.k_anim:update(dt)
end

function Controls:draw()
  resetToDraw()
  love.graphics.draw(self.background, 0, 0)

  self.up_anim:draw(sprites.controls, 532, 100)
  self.down_anim:draw(sprites.controls, 532, 132)
  self.right_anim:draw(sprites.controls, 564, 132)
  self.left_anim:draw(sprites.controls, 500, 132)
  self.m_anim:draw(sprites.controls, 500, 305)
  self.r_anim:draw(sprites.controls, 510, 375)
  self.p_anim:draw(sprites.controls, 490, 445)

  self.k_anim:draw(sprites.knot, 480, 215)
  self.c_anim:draw(sprites.checkpoint, 740, 215)

  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(love.graphics.newFont(FONT, 16))

  love.graphics.printf("Move Marto with the arrows", 610, 120, 200, "left")
  love.graphics.printf("Gather knots to get long enough to wrap Marto around the checkpoints", 530, 200, 200, "left")
  love.graphics.printf("You can press M to go back to the menu", 550, 300, 200, "left")
  love.graphics.printf("Press R to reset the level when you are stuck", 560, 370, 200, "left")
  love.graphics.printf("To pause the level at any time press P", 540, 440, 200, "left")

  love.graphics.setColor(1, 1, 1)
  Buttons:draw()
  drawBorders()
end

function Controls:keyreleased(key, code)
  Buttons:keyreleased(key, code)
end

function Controls:mousemoved(x, y)
  Buttons:mousemoved(x, y)
end

function Controls:mousepressed(x, y)
  Buttons:mousepressed(x, y)
end

function Controls:mousereleased(x, y, mouseBtn)
  Buttons:mousereleased(x, y, mouseBtn)
end
