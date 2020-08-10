Logo = {}
local LOGO_TIME = 3

function Logo:init()
  local grid = Anim8.newGrid(128, 128, 640, 512)
  self.logo = Anim8.newAnimation(grid('1-5',1, '1-5',2, '1-5',3, '1-5',4),
    {0.3, 0.3, 0.3, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.5},
    'pauseAtEnd')
  self.logo:pauseAtStart()
end

function Logo:enter(previous)
  self.logo:resume()
  Timer.after(LOGO_TIME, function() Gamestate.switch(Intro) end)
end

function Logo:update(dt)
  self.logo:update(dt)
  Timer.update(dt)
end

function Logo:draw()
  resetToDraw()
  self.logo:draw(sprites.logo, getCenteredHorizontalPosition(128), 300)
  drawBorders()
end

function Logo:keyreleased(key, code)
  Gamestate.switch(Menu)
end
