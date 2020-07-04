Button = {}
local width = 197
local height = 53

function Button:new(o, x, y, label, inactive, state, args)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  o.x = x
  o.y = y
  o.label = label
  o.state = state
  o.inactive = inactive
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
    Gamestate.switch(self.state, self.args)
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
  love.graphics.setColor(1, 1, 1)
end

Buttons = {}

function Buttons:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  return o
end

function Buttons:add(key, x, y, label, inactive, state, args)
  local button = Button:new({}, x, y, label, inactive, state, args)
  self[key] = button
end

function Buttons.getWidth()
  return width
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
  if self.active then self.active.active = false end
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

return Buttons
