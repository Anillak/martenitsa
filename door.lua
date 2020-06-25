Key = {}

function Key:new(o, x, y, door)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y
   o.pressed = false
   o.door = door

   o.grid = Anim8.newGrid(CELL_SIZE, CELL_SIZE, CELL_SIZE*4, CELL_SIZE)
   o.animation = Anim8.newAnimation(o.grid('1-4',1), 0.3)
   o.animation:pause()

   return o
end

function Key:update(dt)
  self.animation:update(dt)
  if self.pressed ~= true then
    self.door.open = false
  end
end
function Key:draw()
  self.animation:draw(
    sprites.key,
    (self.x - 1) * CELL_SIZE,
    (self.y - 1) * CELL_SIZE)
end
function Key:print() return " " .. self.x .. " " .. self.y end
function Key:press()
  self.animation:resume()
  self.animation:pauseAtEnd()
  self.pressed = true
end
function Key:release()
  if self.door.open == false then
    -- animation for key release
    self.pressed = false
  end
end

Door = {}

function Door:new(o, x, y)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y
   o.open = false
   o.grid = Anim8.newGrid(CELL_SIZE, CELL_SIZE, CELL_SIZE*4, CELL_SIZE)
   o.animation = Anim8.newAnimation(o.grid('1-4', 1), 1)
   o.animation:pause()

   return o
end

function Door:update(dt)
  self.animation:update(dt)
  if self.open ~= true then
    self.open = true
    for _,key in ipairs(self) do
      key:update(dt)
    end
    if self.open then
      Signal.emit('open door', self.x, self.y)
      self.animation:resume()
      self.animation:pauseAtEnd()
    end
  end
end

function Door:draw()
  for _,key in ipairs(self) do
    key:draw()
  end

  self.animation:draw(
    sprites.door,
    (self.x - 1) * CELL_SIZE,
    (self.y - 1) * CELL_SIZE)
end

function Door:checkForOpen(p)
  for _,key in ipairs(self) do
    local pressed = false
    for _,segment in ipairs(p.segments) do
      if hit(segment, key) then
        pressed = true
      end
    end
    if pressed then key:press()
    else key:release() end
  end
end

function Door:addKey(x, y)
  k = Key:new({}, x, y, self)
  table.insert(self, k)
end

function loadDoors()
  door = Door:new({}, 10, 10)
  walls.indices[10][10] = true
  door:addKey(15, 11)
  door:addKey(15, 14)
end

function updateDoors(dt)
  door:update(dt)
end

function drawDoors()
  door:draw()
end

function openDoors()
  door:checkForOpen(player)
end
