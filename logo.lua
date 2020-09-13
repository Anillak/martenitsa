local Logo = {}
local LOGO_TIME = 3
local SIZE = 130
local Intro = require 'intro'
local logo

function Logo:init()
  local grid = Anim8.newGrid(SIZE, SIZE, SIZE*5, SIZE*4)
  logo = Anim8.newAnimation(grid('1-5',1, '1-5',2, '1-5',3, '1-5',4),
    {0.3, 0.3, 0.3, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.5},
    'pauseAtEnd')
  logo:pauseAtStart()
end

function Logo:enter(previous)
  sounds.intro:play()
  logo:resume()
  Timer.after(LOGO_TIME, function() Gamestate.switch(Intro) end)
end

function Logo:update(dt)
  logo:update(dt)
  Timer.update(dt)
end

function Logo:draw()
  resetToDraw()
  logo:draw(sprites.logo, getCenteredHorizontalPosition(SIZE), 300)
  drawBorders()
end

function Logo:keyreleased(key, code)
  Gamestate.switch(Intro)
end

return Logo
