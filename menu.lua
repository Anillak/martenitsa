local Menu = {}
local Survival = require 'survival'
local Controls = require 'controls'
local Levels = require 'levels'
local Scores = require 'scores'
local Buttons

function Menu:init()
  self.background = love.graphics.newImage('asset/bg-real.png')
  self.intro = love.graphics.newImage('asset/intro.jpg')
  self.name = love.graphics.newImage('asset/name.png')

  local b_grid = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*2, TILE_SIZE*8)
  self.l_anim = Anim8.newAnimation(b_grid('1-2', 8), 0.5)
end

function Menu:update(dt)
  self.l_anim:update(dt)
end

function Menu:enter(previous, active)
  sounds.birds:pause()

  Buttons = B:new()
  local position = 510
  Buttons:add("start", position, 210, false, Game, 1)
  Buttons:add("continue", position, 265, (not (saveData.level > 1)), Levels)
  Buttons:add("survival", position, 320, (saveData.survival.complete ~= 7), Survival)
  Buttons:add("scores", position, 375, (not (saveData.level > 8)), Scores)
  Buttons:add("controls", position, 430, false, Controls)
  Buttons:add("exit", position, 485, false)
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

  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(fonts.controls)
  love.graphics.printf(localization.menu.switchLanguages[LANGUAGE], 200, 630, 400, "left")
  love.graphics.setColor(1, 1, 1)
  self.l_anim:draw(sprites.controls, localization.menu.switchLanguagesPosition[LANGUAGE], 623)

  drawBorders()
end

function Menu:keyreleased(key, code)
  Buttons:keyreleased(key, code)
end

function Menu:keypressed(key, code)
  Buttons:keypressed(key, code)
end

return Menu
