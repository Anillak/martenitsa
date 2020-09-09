Menu = {}

function Menu:init()
  self.background = love.graphics.newImage('asset/bg-real.png')
  self.intro = love.graphics.newImage('asset/intro.jpg')
  self.name = love.graphics.newImage('asset/name.png')
end

function Menu:enter(previous, active)
  sounds.birds:pause()
  Buttons = B:new()
  local position = 510
  Buttons:add("start", position, 230, "Start", false, Game, 1)
  Buttons:add("continue", position, 285, "Continue", (not (saveData.level > 1)), Levels)
  Buttons:add("scores", position, 340, "Scores", (not (saveData.level > 8)), Scores)
  Buttons:add("controls", position, 395, "Controls", false, Controls)
  Buttons:add("exit", position, 450, "Exit", false)
  if not active then
    Buttons:setActive(Buttons.start)
  else
    Buttons:setActive(Buttons[active])
  end

end

function Menu:leave()
  Buttons:clear()
end

function Menu:draw()
  resetToDraw()
  love.graphics.draw(self.intro, 0, 0)
  love.graphics.draw(self.name, 370, 60)
  love.graphics.draw(self.background, 0, 0)
  Buttons:draw()
  drawBorders()
end

function Menu:keyreleased(key, code)
  -- remove later
  if key == "1" or key == "2" or key == "3" or key == "4" or key == "5" or key == "6" or key == "7" or key == "8" then
    Gamestate.switch(Info, tonumber(key))
  end
  Buttons:keyreleased(key, code)
end

function Menu:keypressed(key, code)
  Buttons:keypressed(key, code)
end
