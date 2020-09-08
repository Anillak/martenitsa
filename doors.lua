local Key = {}

function Key:new(o, x, y, door, c)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y

   if c then o.color = c else o.color = "Red" end
   o.pressed = false
   o.door = door
   o.active = false

   Signal.register('activate door',
     function(n)
       if n==o.door.n then
         o.active = true
         sounds.buttonRelease:play()
        end
     end)

   return o
end

function Key:update(dt)
  if self.pressed ~= true then
    self.door.open = false
  end
end
function Key:draw()
  local sprite
  if self.active and not self.pressed then
    sprite = sprites["keyReleased" .. self.color]
  else
    sprite = sprites["keyPressed" .. self.color]
  end
  love.graphics.draw(sprite,
    self.x * TILE_SIZE,
    self.y * TILE_SIZE)
end
function Key:press()
  if self.pressed ~= true then
    self.pressed = true
    sounds.buttonPress:play()
  end
end
function Key:release()
  if self.door.open == false then
    if self.pressed ~= false then
      self.pressed = false
      sounds.buttonRelease:play()
    end
  end
end

local Door = {}

function Door:new(o, x, y, n, c)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y
   o.n = n
   local color = c
   if not c then color = "Red" end
   o.sprite = sprites["door"..color]
   o.open = false
   local grid = Anim8.newGrid(TILE_SIZE, TILE_SIZE*3, TILE_SIZE*12, TILE_SIZE*3)
   local anim = Anim8.newAnimation(grid('1-12', 1), 0.1, "pauseAtEnd")
   anim:pauseAtStart()
   local initanim = Anim8.newAnimation(grid('12-1', 1), 0.1, "pauseAtEnd")
   initanim:pauseAtStart()
   o.animation = initanim

   local delay = (n-1)*1.5
   Timer.after(delay, function()
     sounds.doorClose:play()
     o.animation:resume()
     Timer.after(1.20, function()
       o.animation = anim
       Signal.emit('activate door', n)
     end)
   end)

   return o
end

function Door:draw()
  self.animation:draw(
    self.sprite,
    self.x * TILE_SIZE,
    self.y * TILE_SIZE - TILE_SIZE*2)
end

function Door:drawKeys()
  for _,key in ipairs(self) do
    key:draw()
  end
end

function Door:update(dt, player)
  self:checkIfKeysPressedBy(player)
  if self.open ~= true then
    self.open = true
    for _,key in ipairs(self) do
      key:update(dt)
    end
    if self.open then
      log("Player opened door number " .. self.n)
      Signal.emit('open door', self.x, self.y)
      self.animation:resume()
      sounds.doorOpen:play()
    end
  end
  self.animation:update(dt)
end

function Door:checkIfKeysPressedBy(p)
  for _,key in ipairs(self) do
    if key.active then
      local pressed = false
      for _,segment in ipairs(p.segments) do
        if hit(segment, key) then pressed = true end
      end
      if pressed then key:press()
      else key:release() end
    end
  end
end

function Door:addKey(x, y, c)
  k = Key:new({}, x, y, self, c)
  table.insert(self, k)
end

function Door:clear()
  for _,key in ipairs(self) do
    key = nil
  end
end

D = {}

function D.load(map)
  assertWithLogging(map, "Doors needs a map to load.")
  assertWithLogging(map.layers["doors"].objects, "No doors defined in the map")
  assertWithLogging(map.layers["keys"].objects, "No keys defined in the map")
  D.doors = {}

  for _,o in ipairs(map.layers["doors"].objects) do
    local n = o.properties["Number"]
    assertWithLogging(n, "Door doesn't have a number")
    local c = o.properties["Color"]
    local door = Door:new({}, o.x/TILE_SIZE, o.y/TILE_SIZE, n, c)
    Signal.emit('create door', door.x, door.y)
    for _,k in ipairs(map.layers["keys"].objects) do
      local d = k.properties["Door"]
      assertWithLogging(d, "Key is not assigned to a door")
      local c = o.properties["Color"]
      if n == d then
        door:addKey(k.x/TILE_SIZE, k.y/TILE_SIZE, c)
      end
    end
    table.insert(D.doors, door)
  end
end

function D.update(dt, player)
  for _,d in ipairs(D.doors) do
    d:update(dt, player)
  end
end

function D.draw()
  for _,d in ipairs(D.doors) do
    d:draw()
  end
end

function D.drawKeys()
  for _,d in ipairs(D.doors) do
    d:drawKeys()
  end
end

function D.clear()
  for _,d in ipairs(D.doors) do
    d:clear()
    d = nil
  end
end

function D.get()
  return D.doors
end

return D
