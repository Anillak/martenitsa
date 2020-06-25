Scissors = {}

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
    for i=#self.deadSegments,1 do
      self.deadSegments[i].animation:pause()
    end
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
    (self.x - 1) * CELL_SIZE,
    (self.y - 1) * CELL_SIZE)

    for _,segment in ipairs(self.deadSegments) do
      segment.animation:draw(
        segment.sprite,
        (segment.x-1) * CELL_SIZE + CELL_SIZE/2,
        (segment.y-1) * CELL_SIZE + CELL_SIZE/2,
        math.rad(segment.rotation),
        1,
        1,
        CELL_SIZE/2,
        CELL_SIZE/2
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
      -- console = console .. "cutting at " .. i
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

function loadScissors()
  scissors = {}
  createScissors(20, 10)
end

function updateScissors(dt)
  for _,s in ipairs(scissors) do
    s:update(dt)
  end
end

function drawScissors()
  for _,s in ipairs(scissors) do
    s:draw()
  end
end

function createScissors(x, y)
  local s = Scissors:new({}, x, y)
  table.insert(scissors, s)
end

function getCutByScissors()
  for i,s in ipairs(scissors) do
    s:cutPlayer(player)
  end
end
