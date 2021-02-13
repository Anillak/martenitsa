local Pause = {}

function Pause:init()
  self.grid = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*2, TILE_SIZE*8)
  self.esc_anim = Anim8.newAnimation(self.grid('1-2', 3), 0.5)
  self.m_anim = Anim8.newAnimation(self.grid('1-2', 1), 0.5)
end

function Pause:enter(from)
  self.from = from
end

function Pause:update(dt)
  self.esc_anim:update(dt)
  self.m_anim:update(dt)
end

function Pause:draw()
  self.from:draw()
  love.graphics.setColor(0,0,0, 0.7)
  love.graphics.rectangle('fill', 0, 0, ORIGINAL_GAME_X, ORIGINAL_GAME_Y)
  love.graphics.setColor(1,1,1)
  love.graphics.setFont(fonts.pause)
  love.graphics.printf(localization.pause.title[LANGUAGE], 0, ORIGINAL_GAME_Y/2 - 30, ORIGINAL_GAME_X, 'center')
  love.graphics.setFont(fonts.pauseDesc)
  love.graphics.printf(localization.pause.continue[LANGUAGE], 0, ORIGINAL_GAME_Y/2 + 20, ORIGINAL_GAME_X, 'center')
  love.graphics.printf(localization.pause.menu[LANGUAGE], 0, ORIGINAL_GAME_Y/2 + 50, ORIGINAL_GAME_X, 'center')
  self.esc_anim:draw(sprites.controls, localization.pause.continuePosition[LANGUAGE], 365)
  self.m_anim:draw(sprites.controls, localization.pause.menuPosition[LANGUAGE], 395)
  drawBorders()
end

function Pause:keyreleased(key)
  if key == 'escape' then
    return Gamestate.pop()
  end
  if key == 'm' then
    return Gamestate.switch(Menu)
  end
end

return Pause
