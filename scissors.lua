local Scissors = {}

function Scissors:new(o, x, y, interval)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y
   o.cutting = false
   o.deadSegments = {}

   local size = TILE_SIZE*2
   local grid = Anim8.newGrid(size, size, size*4, size)
   o.animation = Anim8.newAnimation(grid('1-4',1), 0.25)
   o.animation:pauseAtStart()

   local grid_dead = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*4, TILE_SIZE)
   o.animation_dead = Anim8.newAnimation(grid_dead('1-4',1), {0.8, 0.5, 0.5, 0.5}, "pauseAtEnd")
   o.animation_dead:pauseAtStart()

   if not interval then interval = 5 end

   Timer.every(interval, function()
     sounds.scissors:play()
     o.animation:resume()
     Timer.after(0.25, function()
       o.cutting = true
     end)
     Timer.after(0.75, function()
       o.cutting = false
     end)
     Timer.after(1, function()
       o.animation:pause()
     end)
   end)

   return o
end

function Scissors:update(dt)
  self.animation:update(dt)

  if #self.deadSegments > 0 then
    self.animation_dead:resume()
    self.animation_dead:update(dt)

    Timer.after(2, function()
      for k,v in pairs(self.deadSegments) do
        table.remove(self.deadSegments)
      end
    end)
  end
end

function Scissors:draw()
  self.animation:draw(
    sprites.scissors,
    self.x * TILE_SIZE,
    self.y * TILE_SIZE)

  for _,segment in ipairs(self.deadSegments) do
    self.animation_dead:draw(
      sprites[segment.sprite .. "Cut"],
      segment.x * TILE_SIZE + TILE_SIZE/2,
      segment.y * TILE_SIZE + TILE_SIZE/2,
      math.rad(segment.rotation),
      1,
      1,
      TILE_SIZE/2,
      TILE_SIZE/2
    )
  end
end

function Scissors:drawBottom()
  self.animation:draw(
    sprites.scissorsBottom,
    self.x * TILE_SIZE,
    self.y * TILE_SIZE)
end

function Scissors:cutPlayer(p)
  cutTail = -1
  for i,segment in ipairs(p.segments) do
    if segment.x == self.x + 1 and segment.y == self.y and self.cutting then
      if i == 1 or i == 2 or i == 3 then
        p.dead = true
      end
      self.cutting = false
      cutTail = #p.segments - i
      break
    end
  end
  if cutTail ~= -1 and p.dead == false then
    for i=1,cutTail do
      local s = table.remove(p.segments)
      if i == 1 then s.sprite = "playerTail" end
      table.insert(self.deadSegments, s)
    end
  end
end

function Scissors:print() return " " .. self.x .. " " .. self.y end

S = {}

local function create(x, y, i)
  local s = Scissors:new({}, x, y, i)
  table.insert(S.scissors, s)
end

function S.load(map)
  assertWithLogging(map, "Scissors needs a map to load.")
  assertWithLogging(map.layers["scissors"].objects, "No scissors defined in the map")
  S.scissors = {}

  for _,o in ipairs(map.layers["scissors"].objects) do
    create(o.x/TILE_SIZE, o.y/TILE_SIZE, o.properties["interval"])
  end
end

function S.update(dt)
  for _,s in ipairs(S.scissors) do
    s:update(dt)
  end
end

function S.draw()
  for _,s in ipairs(S.scissors) do
    s:draw()
  end
end

function S.drawSecond()
  for _,s in ipairs(S.scissors) do
    s:drawBottom()
  end
end

function S.stop()
  for _,s in ipairs(S.scissors) do
    s.animation:pause()
  end
end

function S.get()
  return S.scissors
end

return S
