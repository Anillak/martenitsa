local Knot = {}

function Knot:new(o, x, y)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = x
   o.y = y

   o.grid = Anim8.newGrid(CELL_SIZE, CELL_SIZE, CELL_SIZE*3, CELL_SIZE*3)
   o.animation = Anim8.newAnimation(o.grid('1-3',1, '1-3',2, '1-2',3), 0.05)

   return o
end

function Knot:update(dt) self.animation:update(dt) end
function Knot:draw()
  self.animation:draw(
    sprites.knot,
    self.x * CELL_SIZE,
    self.y * CELL_SIZE)
end
function Knot:print() return " " .. self.x .. " " .. self.y end

K = {}

local function create(x, y)
  local k = Knot:new({}, x, y)
  table.insert(K.knots, k)
end

function K.load(map)
  assert(map, "Knots needs a map to load.")
  assert(map.layers["knots"].objects, "No knots defined in the map")
  K.knots = {}

  for i,o in ipairs(map.layers["knots"].objects) do
    create(o.x/CELL_SIZE, o.y/CELL_SIZE)
  end
end

function K.update(dt)
  for _,k in ipairs(K.knots) do
    k:update(dt)
  end
end

function K.draw()
  for _,k in ipairs(K.knots) do
    k:draw()
  end
end

function K.get()
  return K.knots
end

return K