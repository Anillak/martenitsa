local Intro = {}
local background
local video

function Intro:init()
  background = love.graphics.newImage('asset/bg-real.png')
  video = love.graphics.newVideo("asset/intro.ogv")
end

function Intro:enter(previous)
  video:play()
end

function Intro:update(dt)

end

function Intro:draw()
  resetToDraw()
  love.graphics.draw(video, 0, 0)
  love.graphics.draw(background, 0, 0)
  if not video:isPlaying() then
    Gamestate.switch(Menu)
  end
  drawBorders()
end

function Intro:leave()
  video = nil
  background = nil
end

function Intro:keyreleased(key, code)
  Gamestate.switch(Menu)
end

return Intro
