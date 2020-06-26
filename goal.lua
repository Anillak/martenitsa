local Checkpoint = {}

function Checkpoint:new(o, x, y)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  o.x = x
  o.y = y
  o.covered = false

  o.grid = Anim8.newGrid(CELL_SIZE, CELL_SIZE, CELL_SIZE*3, CELL_SIZE*3)
  o.animation = Anim8.newAnimation(o.grid('1-3',1, '1-3',2, '1-3',3), {1, 0.1, 0.1, 0.2, 0.7, 0.2, 0.1, 0.1, 1})
  return o
end

function Checkpoint:update(dt) self.animation:update(dt) end
function Checkpoint:draw()
  self.animation:draw(
    sprites.checkpoint,
    (self.x - 1) * CELL_SIZE,
    (self.y - 1) * CELL_SIZE)
end
function Checkpoint:print() return " " .. self.x .. " " .. self.y end
function Checkpoint:check() self.covered = true end
function Checkpoint:uncheck() self.covered = false end

local Goal = {}

local function createCheckpoint(goal, x, y)
  c = Checkpoint:new({}, x, y)
  table.insert(goal, c)
end

function Goal:new(map)
  assert(map, "The goal needs a map.")
  assert(map.layers["checkpoints"].objects, "No checkpoints defined in the map")
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  o.complete = false

  for i,c in ipairs(map.layers["checkpoints"].objects) do
    createCheckpoint(o, c.x/CELL_SIZE, c.y/CELL_SIZE)
  end

  return o
end

function Goal:update(dt)
  for _,checkpoint in ipairs(self) do
    checkpoint:update(dt)
  end
  completed = 0
  for _,checkpoint in ipairs(self) do
    if checkpoint.covered then
      completed = completed + 1
    end
  end
  if completed == #self then
    self.complete = true
  else
    self.complete = false
  end
end

function Goal:draw()
  for _,checkpoint in ipairs(self) do
    checkpoint:draw()
  end
end

function Goal:isComplete()
  return self.complete
end

function Goal:check(player)
  assert(player, "No Player trying to win!")
  for _,checkpoint in ipairs(self) do
    local pressed = false
    for _,segment in ipairs(player.segments) do
      if hit(segment, checkpoint) then
        pressed = true
      end
    end
    if pressed then checkpoint:check()
    else checkpoint:uncheck() end
  end
end

return Goal
