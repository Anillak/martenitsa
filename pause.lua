local Pause = {}

function Pause:init()
  self.grid = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*2, TILE_SIZE*8)
  self.p_anim = Anim8.newAnimation(self.grid('1-2', 3), 0.5)
end

function Pause:enter(from)
  self.from = from
end

function Pause:update(dt)
  self.p_anim:update(dt)
end

function Pause:draw()
  self.from:draw()
  love.graphics.setColor(0,0,0, 0.7)
  love.graphics.rectangle('fill', 0, 0, ORIGINAL_GAME_X, ORIGINAL_GAME_Y)
  love.graphics.setColor(1,1,1)
  love.graphics.setFont(fonts.pause)
  love.graphics.printf('PAUSE', 0, ORIGINAL_GAME_Y/2 - 30, ORIGINAL_GAME_X, 'center')
  love.graphics.setFont(fonts.pauseDesc)
  love.graphics.printf('Press                 again to continue', 0, ORIGINAL_GAME_Y/2 + 20, ORIGINAL_GAME_X, 'center')
  self.p_anim:draw(sprites.controls, 583, 365)
  drawBorders()
end

function Pause:keyreleased(key)
  if key == 'p' then
    return Gamestate.pop()
  end
end

return Pause
