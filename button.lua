Button = {}
local width = 200
local height = 30

function Button:new(o, x, y, label, link, args)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  o.x = x
  o.y = y
  o.label = label
  o.link = link
  o.hovered = false
  o.active = false
  o.args = args

  return o
end

function Button:onClick()
  Gamestate.switch(self.link, self.args)
end

function Button:update(dt)

end

function Button:draw()
  if self.active  then
    love.graphics.setColor(0.5, 0, 0)
  elseif self.hovered then
    love.graphics.setColor(1, 0.7, 0,8)
  else
    love.graphics.setColor(1, 0, 0)
  end

  love.graphics.rectangle("fill", self.x, self.y, width, height)
  love.graphics.setColor(1, 1, 1)
  love.graphics.printf(self.label, self.x, self.y + 7, width, "center")
end

Buttons = {}

function Buttons:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  local position = (960 - width) / 2
  o.start = Button:new({}, position, 100, "Start", Game, "maps/level1.lua")
  o.continue = Button:new({}, position, 140, "Continue")
  o.options = Button:new({}, position, 180, "Options")
  o.exit = Button:new({}, position, 220, "Exit")

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
  if self.active == self.start then self:setActive(self.continue)
  elseif self.active == self.continue then self:setActive(self.options)
  elseif self.active == self.options then self:setActive(self.exit)
  elseif self.active == self.exit then self:setActive(self.start)
  end
end

function Buttons:selectPrevious()
  if self.active == self.start then self:setActive(self.exit)
  elseif self.active == self.continue then self:setActive(self.start)
  elseif self.active == self.options then self:setActive(self.continue)
  elseif self.active == self.exit then self:setActive(self.options)
  end
end

return Buttons
