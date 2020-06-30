local Scissors = {}

function Scissors:new(o, x, y)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y
   o.cutting = false
   o.deadSegments = {}

   local size = CELL_SIZE*2
   o.grid = Anim8.newGrid(size, size, size*4, size)
   o.animation = Anim8.newAnimation(o.grid('1-4',1), 0.25)
   o.animation:pause()

   Timer.every(5, function()
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
    Timer.after(1, function()
      for k,v in pairs(self.deadSegments) do
        table.remove(self.deadSegments)
      end
    end)
  end
end

function Scissors:draw()
  self.animation:draw(
    sprites.scissors,
    self.x * CELL_SIZE,
    self.y * CELL_SIZE)

    for _,segment in ipairs(self.deadSegments) do
      love.graphics.draw(
        segment.sprite,
        segment.x * CELL_SIZE + TILE_SIZE/2,
        segment.y * CELL_SIZE + TILE_SIZE/2,
        math.rad(segment.rotation),
        CELL_SIZE/TILE_SIZE,
        CELL_SIZE/TILE_SIZE,
        TILE_SIZE/2,
        TILE_SIZE/2
      )
    end
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
      table.insert(self.deadSegments, table.remove(p.segments))
    end
  end
end

function Scissors:print() return " " .. self.x .. " " .. self.y end

S = {}

local function create(x, y)
  local s = Scissors:new({}, x, y)
  table.insert(S.scissors, s)
end

function S.load(map)
  assert(map, "Scissors needs a map to load.")
  assert(map.layers["scissors"].objects, "No scissors defined in the map")
  S.scissors = {}

  for i,o in ipairs(map.layers["scissors"].objects) do
    create(o.x/TILE_SIZE, o.y/TILE_SIZE)
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

function S.get()
  return S.scissors
end

return S
