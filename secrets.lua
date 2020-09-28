local Secret = {}
local randomize = {{2, true}, {1, false}, {3, true}, {3, false}, {2, false}, {1, true}}

function Secret:new(o, x, y)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y

   o.grid = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*2, TILE_SIZE*3)
   math.randomseed(os.time())
   local random = math.random(1, 6)
   local row = randomize[random][1]
   local time = math.random(4, 6)
   o.animation = Anim8.newAnimation(o.grid('1-2',row), {time, 0.5})
   local flipped = randomize[random][2]
   if flipped == 1 then
     o.animation = o.animation:clone():flipH()
   end

   return o
end

function Secret:update(dt) self.animation:update(dt) end
function Secret:draw()
  self.animation:draw(
    sprites.secret,
    self.x * TILE_SIZE,
    self.y * TILE_SIZE)
end

local S = {}

function S.create(x, y)
  local s = Secret:new({}, x, y)
  table.insert(S.secrets, s)
end

function S.load(map)
  assertWithLogging(map, "Secrets needs a map to load.")
  S.secrets = {}
  if map.layers["secrets"] then
    for i,o in ipairs(map.layers["secrets"].objects) do
      S.create(o.x/TILE_SIZE, o.y/TILE_SIZE)
    end
  end
end

function S.update(dt)
  for _,s in ipairs(S.secrets) do
    s:update(dt)
  end
end

function S.draw()
  for _,s in ipairs(S.secrets) do
    s:draw()
  end
end

function S.get()
  return S.secrets
end

function S.available()
  return #S.secrets
end

function S.clear()
  for _,s in ipairs(S.secrets) do
    s = nil
  end
end

return S
