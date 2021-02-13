local Info = {}
local Buttons
local width = 680
local baseY
local namesCount = 17
local namesHeight = 20

function Info:init()
  self.level = 0
  self.bgReal = love.graphics.newImage('asset/bg-real2.png')
  self.pp = love.graphics.newImage('asset/info1.png')
  self.corn = love.graphics.newImage('asset/info2.png')
  self.stroke = love.graphics.newImage('asset/info3.png')
  self.logo = love.graphics.newImage('asset/logo.png')
  self.ravnecLogo = love.graphics.newImage('asset/ravnec-logo.png')
  self.tiledLogo = love.graphics.newImage('asset/tiled-logo.png')
  self.pyxelLogo = love.graphics.newImage('asset/pyxel-edit-logo.png')
  self.loveLogo = love.graphics.newImage('asset/love2d-logo.png')
  self.luaLogo = love.graphics.newImage('asset/lua-logo.png')
end

function Info:enter(previous, level)
  self.level = level
  Buttons = B:new()
  if level ~= LEVELS_AMOUNT then
    Buttons:add("menu", 400, 600, false, Menu)
    Buttons:add("level", 685, 600, false, Game, level+1)
    Buttons:setActive(Buttons.level)
  elseif level == LEVELS_AMOUNT then
    Buttons:add("menu", 850, 600, false, Menu)
    Buttons:setActive(Buttons.menu)
    baseY = 704
  else
    Buttons:add("menu", Buttons.getCenteredHorizontalPosition(), 600, false, Menu)
    Buttons:setActive(Buttons.menu)
  end
end

function Info:leave()
  sounds.credits:pause()
  Buttons:clear()
end

function Info:update(dt)
  if self.level == 8 and baseY > -(970 + namesCount*namesHeight) then
    baseY = baseY - dt*40
  end
end

function Info:draw()
  resetToDraw()
  love.graphics.draw(self.bgReal, 0, 0)

  if self.level == 1 then
    love.graphics.draw(self.corn, getCenteredHorizontalPosition(227), 380)
  elseif self.level == 2 then
    love.graphics.draw(self.stroke, getCenteredHorizontalPosition(300), 320)
  elseif self.level == 3 then
    love.graphics.draw(self.pp, getCenteredHorizontalPosition(300), 320)
  elseif self.level == 8 then
    love.graphics.draw(self.logo, getCenteredHorizontalPosition(64), baseY + 95)
    love.graphics.draw(self.ravnecLogo, getCenteredHorizontalPosition(126), baseY + 210)
    love.graphics.draw(self.pyxelLogo, getCenteredHorizontalPosition(179), baseY + namesCount*namesHeight + 430)
    love.graphics.draw(self.tiledLogo, getCenteredHorizontalPosition(184), baseY + namesCount*namesHeight + 575)
    love.graphics.draw(self.luaLogo, getCenteredHorizontalPosition(100), baseY + namesCount*namesHeight + 710)
    love.graphics.draw(self.loveLogo, getCenteredHorizontalPosition(129), baseY + namesCount*namesHeight + 850)
    love.graphics.draw(sprites.martenitsaCredits, getCenteredHorizontalPosition(375), baseY + namesCount*namesHeight + 1250)
  end

  love.graphics.setColor(0, 0, 0)

  -- localization
  if self.level == 1 then
    love.graphics.setFont(fonts.infoTitle)
    love.graphics.printf(localization.info.level1Title[LANGUAGE], getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText)
    love.graphics.printf(localization.info.level1Text[LANGUAGE], getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 2 then
    love.graphics.setFont(fonts.infoTitle)
    love.graphics.printf(localization.info.level2Title[LANGUAGE], getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText)
    love.graphics.printf(localization.info.level2Text[LANGUAGE], getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 3 then
    love.graphics.setFont(fonts.infoTitle)
    love.graphics.printf(localization.info.level3Title[LANGUAGE], getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText)
    love.graphics.printf(localization.info.level3Text[LANGUAGE], getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 4 then
    love.graphics.setFont(fonts.infoTitle)
    love.graphics.printf(localization.info.level4Title[LANGUAGE], getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText)
    love.graphics.printf(localization.info.level4Text[LANGUAGE], getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 5 then
    love.graphics.setFont(fonts.infoTitle)
    love.graphics.printf(localization.info.level5Title[LANGUAGE], getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText2)
    love.graphics.printf(localization.info.level5Text[LANGUAGE], getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 6 then
    love.graphics.setFont(fonts.infoTitle)
    love.graphics.printf(localization.info.level6Title[LANGUAGE], getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText)
    love.graphics.printf(localization.info.level6Text[LANGUAGE], getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 7 then
    love.graphics.setFont(fonts.infoTitle)
    love.graphics.printf(localization.info.level7Title[LANGUAGE], getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText)
    love.graphics.printf(localization.info.level7Text[LANGUAGE], getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 8 then
    love.graphics.setFont(fonts.credits)
    love.graphics.printf(localization.info.playing[LANGUAGE], getCenteredHorizontalPosition(width), baseY, width, "center")
    love.graphics.printf(localization.info.developed[LANGUAGE], getCenteredHorizontalPosition(width), baseY + 60, width, "center")
    love.graphics.printf(localization.info.music[LANGUAGE], getCenteredHorizontalPosition(width), baseY + 180, width, "center")
    love.graphics.printf(localization.info.thanks[LANGUAGE], getCenteredHorizontalPosition(width), baseY + 325, width, "center")
    love.graphics.setFont(fonts.creditsNames)
    love.graphics.printf(localization.info.names[LANGUAGE], getCenteredHorizontalPosition(width), baseY + 355, width, "center")
    love.graphics.setFont(fonts.credits)
    love.graphics.printf(localization.info.support[LANGUAGE], getCenteredHorizontalPosition(width), baseY + namesCount*namesHeight + 350, width, "center")
    love.graphics.printf(localization.info.graphics[LANGUAGE], getCenteredHorizontalPosition(width), baseY + namesCount*namesHeight + 400, width, "center")
    love.graphics.printf(localization.info.levels[LANGUAGE], getCenteredHorizontalPosition(width), baseY + namesCount*namesHeight + 540, width, "center")
    love.graphics.printf(localization.info.written[LANGUAGE], getCenteredHorizontalPosition(width), baseY + namesCount*namesHeight + 680, width, "center")
    love.graphics.printf(localization.info.with[LANGUAGE], getCenteredHorizontalPosition(width), baseY + namesCount*namesHeight + 820, width, "center")
  end
  love.graphics.setColor(1, 1, 1)
  Buttons:draw()
  drawBorders()
end

function Info:keyreleased(key, code)
  Buttons:keyreleased(key, code)
end

function Info:keypressed(key, code)
  Buttons:keypressed(key, code)
end

return Info
