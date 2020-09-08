Intro = {}

function Intro:init()
  self.background = love.graphics.newImage('asset/bg-real.png')
  self.video = love.graphics.newVideo("asset/intro.ogv")
end

function Intro:enter(previous)
  self.video:play()
end

function Intro:update(dt)

end

function Intro:draw()
  resetToDraw()
  love.graphics.draw(self.video, 0, 0)
  love.graphics.draw(self.background, 0, 0)
  if not self.video:isPlaying() then
    Gamestate.switch(Menu)
  end
  drawBorders()
end

function Intro:leave()
  self.video = nil
end

function Intro:keyreleased(key, code)
  Gamestate.switch(Menu)
end
