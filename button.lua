Button = {}
local width = 197
local height = 53

function Button:new(o, x, y, label, link, args)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  o.x = x
  o.y = y
  o.label = label
  o.link = link
  o.inactive = false
  o.hovered = false
  o.active = false
  o.args = args

  return o
end

function Button:onClick()
  if not self.inactive then
    if self.label == "Exit" then
      love.event.quit()
    end
    Gamestate.switch(self.link, self.args)
  end
end

function Button:update(dt)

end

function Button:draw()
  love.graphics.setFont(love.graphics.newFont(20))
  if self.inactive then
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(sprites.buttonInactive, self.x, self.y)
    love.graphics.setColor(0, 0, 0)
  elseif self.active then
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(sprites.buttonActive, self.x, self.y)
    love.graphics.setColor(0, 0, 0)
  elseif self.hovered then
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(sprites.buttonHover, self.x, self.y)
    love.graphics.setColor(1, 0.7, 0)
  else
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(sprites.button, self.x, self.y)
    love.graphics.setColor(0.6, 0, 0)
  end
  love.graphics.printf(self.label, self.x, self.y + 15, width, "center")
end

Buttons = {}

function Buttons:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  local position = (960 - width) / 2
  o.start = Button:new({}, position, 70, "Start", Game, 1)
  o.continue = Button:new({}, position, 130, "Continue", Game, saveData.level)
  o.continue.inactive = not (saveData.level > 1)
  o.options = Button:new({}, position, 190, "Options")
  o.options.inactive = true
  o.exit = Button:new({}, position, 250, "Exit")

  o.active = o.start
  return o
end

function Buttons:update(dt)
  for _,b in pairs(self) do
    b:update(dt)
  end
end

function Buttons:draw()
  for _,b in pairs(self) do
    b:draw()
  end
end

function Buttons:setActive(button)
  assert(button, "Undefined button to be set as active")
  self.active.active = false
  self.active = button
  button.active = true
end

local function inside(x, y, button)
  return button.x < x and button.x + width > x
  and button.y < y and button.y + height > y
end

function Buttons:hovered(x, y)
  for _,b in pairs(self) do
    if inside(x, y, b) then
        b.hovered = true
        return b
      else b.hovered = false
    end
  end
end

function Buttons:selectNext()
  if self.active == self.start then
    if self.continue.inactive then
      self:setActive(self.exit)
    else
      self:setActive(self.continue)
    end
  elseif self.active == self.continue then self:setActive(self.exit)
  elseif self.active == self.options then self:setActive(self.exit)
  elseif self.active == self.exit then self:setActive(self.start)
  end
end

function Buttons:selectPrevious()
  if self.active == self.start then self:setActive(self.exit)
  elseif self.active == self.continue then self:setActive(self.start)
  elseif self.active == self.options then
    if self.continue.inactive then
      self:setActive(self.start)
    else
      self:setActive(self.continue)
    end
  elseif self.active == self.exit then
    if self.continue.inactive then
      self:setActive(self.start)
    else
      self:setActive(self.continue)
    end
  end
end

return Buttons
