Knot = {}

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
    (self.x - 1) * CELL_SIZE,
    (self.y - 1) * CELL_SIZE)
end
function Knot:print() return " " .. self.x .. " " .. self.y end

function loadKnots()
  knots = {}

  for i,o in ipairs(map.layers["knots"].objects) do
    createKnot(o.x/CELL_SIZE, o.y/CELL_SIZE)
  end
end

function createKnot(x, y)
  local k = Knot:new({}, x, y)
  table.insert(knots, k)
end

function updateKnots(dt)
  for _,k in ipairs(knots) do
    k:update(dt)
  end
end

function drawKnots()
  for _,k in ipairs(knots) do
    k:draw()
  end
end

function eatKnots()
  collected = -1
  for i,knot in ipairs(knots) do
    if hit(player.segments[1], knot) then
      collected = i
    end
  end
  if collected == -1 then
    table.remove(player.segments)
  else
    table.remove(knots, collected)
  end
end
