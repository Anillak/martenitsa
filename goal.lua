local Checkpoint = {}

function Checkpoint:new(o, x, y)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  o.x = x
  o.y = y
  o.covered = false

  o.grid = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*3, TILE_SIZE*3)
  o.animation = Anim8.newAnimation(o.grid('1-3',1, '1-3',2, '1-3',3), {1, 0.1, 0.1, 0.2, 0.7, 0.2, 0.1, 0.1, 1})
  return o
end

function Checkpoint:update(dt) self.animation:update(dt) end
function Checkpoint:draw(unlocked, possible)
  local sprite
  if unlocked and possible then
    sprite = sprites.checkpointDone
  else
    sprite = sprites.checkpoint
  end
  self.animation:draw(
    sprite,
    self.x * TILE_SIZE,
    self.y * TILE_SIZE)
end

local Goal = {}

local function createCheckpoint(goal, x, y)
  c = Checkpoint:new({}, x, y)
  table.insert(goal, c)
end

local function goalLock()
  sounds.lock:play()
end

local function goalUnlock()
  sounds.unlock:play()
end

function Goal:new(map)
  assertWithLogging(map, "The goal needs a map.")
  assertWithLogging(map.layers["checkpoints"].objects, "No checkpoints defined in the map")
  o = {}
  setmetatable(o, self)
  self.__index = self
  o.complete = false
  o.unlocked = false
  o.possible = true

  for i,c in ipairs(map.layers["checkpoints"].objects) do
    createCheckpoint(o, c.x/TILE_SIZE, c.y/TILE_SIZE)
  end

  return o
end

function Goal:update(dt, player, knotsAmount)
  if knotsAmount == 0 then
    if self.possible and not self.unlocked then goalUnlock() end
    self.unlocked = true
  end
  for _,checkpoint in ipairs(self) do
    checkpoint:update(dt)
  end
  completed = 0
  for _,checkpoint in ipairs(self) do
    local pressed = false
    for _,segment in ipairs(player.segments) do
      if hit(segment, checkpoint) then
        pressed = true
      end
    end
    if pressed then completed = completed + 1 end
  end
  if completed == #self then
    self.complete = true
  else
    self.complete = false
  end
end

function Goal:draw()
  for _,checkpoint in ipairs(self) do
    checkpoint:draw(self.unlocked, self.possible)
  end
end

function Goal:isComplete()
  return self.complete
end

function Goal:isPossible(knotsAmount, playerLenght, gameGoal)
  local possible = knotsAmount + playerLenght >= gameGoal
  if self.possible and not possible and self.unlocked then goalLock() end
  self.possible = possible
  return self.possible
end

return Goal
