Button = {}
local width = 197
local height = 53

function Button:new(o, key, x, y, label, inactive, state, args)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  o.x = x
  o.y = y
  o.label = label
  o.state = state
  o.key = key
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
  love.graphics.setFont(love.graphics.newFont(FONT, 20))
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
  love.graphics.printf(self.label, self.x, self.y + 13, width, "center")
  love.graphics.setColor(1, 1, 1)
end

Buttons = {}

function Buttons:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.indices = {}

  return o
end

function Buttons:add(key, x, y, label, inactive, state, args)
  local button = Button:new({}, key, x, y, label, inactive, state, args)
  self[key] = button
  self.indices[#self.indices + 1] = key
end

function Buttons.getWidth()
  return width
end

function Buttons.getCenteredHorizontalPosition()
  return ORIGINAL_GAME_X/2 - width/2
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
  if not button.inactive then
    if self.active then self.active.active = false end
    self.active = button
    button.active = true
  end
end

function Buttons:getActive()
  return self.active.key
end

local function inside(x, y, button)
  return button.x < x and button.x + width > x
  and button.y < y and button.y + height > y
end

local function next(t, key)
  index = 0
  for i,v in ipairs(t) do
    if v == key then index = i+1 end
  end
  if index > #t then
    return 1
  else return index
  end
end

local function previous(t, key)
  index = 0
  for i,v in ipairs(t) do
    if v == key then index = i-1 end
  end
  if index < 1 then
    return #t
    else return index
  end
end

function Buttons:selectNext()
  if #self.indices > 1 then
    local nextIndex = next(self.indices, self:getActive())
    local nextButton = self[self.indices[nextIndex]]
    while nextButton.inactive do
      nextIndex = next(self.indices, self.indices[nextIndex])
      nextButton = self[self.indices[nextIndex]]
    end
    self:setActive(nextButton)
  end
end

function Buttons:selectPrevious()
  if #self.indices > 1 then
    local prevIndex = previous(self.indices, self:getActive())
    local prevButton = self[self.indices[prevIndex]]
    while prevButton.inactive do
      prevIndex = previous(self.indices, self.indices[prevIndex])
      prevButton = self[self.indices[prevIndex]]
    end
    self:setActive(prevButton)
  end
end

function Buttons:keyreleased(key, code)
  if key == 'up' or key == 'left' then
    self:selectPrevious()
  end
  if key == 'down' or key == 'right' then
    self:selectNext()
  end
  if key == 'return' then
    self.active:onClick()
  end
end

return Buttons
