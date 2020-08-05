local Key = {}

function Key:new(o, x, y, door)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y
   o.sprite = sprites.keyReleased
   o.pressed = false
   o.door = door

   return o
end

function Key:update(dt)
  if self.pressed ~= true then
    self.door.open = false
  end
end
function Key:draw()
  love.graphics.draw(self.sprite,
    self.x * TILE_SIZE,
    self.y * TILE_SIZE)
end
function Key:print() return " " .. self.x .. " " .. self.y end
function Key:press()
  if self.pressed ~= true then
    self.pressed = true
    self.sprite = sprites.keyPressed
    sounds.buttonPress:play()
  end
end
function Key:release()
  if self.door.open == false then
    if self.pressed ~= false then
      self.pressed = false
      self.sprite = sprites.keyReleased
      sounds.buttonRelease:play()
    end
  end
end

local Door = {}

function Door:new(o, x, y)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y
   o.open = false
   o.grid = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*4, TILE_SIZE)
   o.animation = Anim8.newAnimation(o.grid('1-4', 1), 0.2, "pauseAtEnd")
   o.animation:pauseAtStart()

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
      sounds.doorOpen:play()
    end
  end
end

function Door:draw()
  for _,key in ipairs(self) do
    key:draw()
  end

  self.animation:draw(
    sprites.door,
    self.x * TILE_SIZE,
    self.y * TILE_SIZE)
end

function Door:checkIfOpenBy(p)
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

D = {}

function D.load(map)
  assert(map, "Doors needs a map to load.")
  assert(map.layers["doors"].objects, "No doors defined in the map")
  assert(map.layers["keys"].objects, "No keys defined in the map")
  D.doors = {}

  for _,o in ipairs(map.layers["doors"].objects) do
    local door = Door:new({}, o.x/TILE_SIZE, o.y/TILE_SIZE)
    local n = o.properties["Number"]
    assert(n, "Door doesn't have a number")
    Signal.emit('create door', door.x, door.y)
    for _,k in ipairs(map.layers["keys"].objects) do
      local d = k.properties["Door"]
      assert(d, "Key is not assigned to a door")
      if n == d then
        door:addKey(k.x/TILE_SIZE, k.y/TILE_SIZE)
      end
    end
    table.insert(D.doors, door)
  end
end

function D.update(dt)
  for _,d in ipairs(D.doors) do
    d:update(dt)
  end
end

function D.draw()
  for _,d in ipairs(D.doors) do
    d:draw()
  end
end

function D.get()
  return D.doors
end

return D
