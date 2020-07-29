Effect = {}

function Effect:new(o, asset, width, height, row, time)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   o.x = -1
   o.y = -1
   o.asset = asset
   o.active = false

   local grid = Anim8.newGrid(TILE_SIZE, TILE_SIZE, TILE_SIZE*width, TILE_SIZE*height)
   o.anim = Anim8.newAnimation(grid('1-'..width, row), time)

   return o
end

E = {}
local effects = {}

function E.load()
  effects.hitWall = Effect:new({}, sprites.hitWall, 3, 1, 1, {0.2, 0.2, 1.6})
  Signal.register('hit wall',
    function(x, y)
      effects.hitWall.active = true
      effects.hitWall.x = x * TILE_SIZE
      effects.hitWall.y = y * TILE_SIZE
    end)

  effects.hitWater = Effect:new({}, sprites.hitWall, 3, 1, 1, {0.2, 0.2, 1.6})
  Signal.register('hit water',
    function(x, y)
      effects.hitWater.active = true
      effects.hitWater.x = x * TILE_SIZE
      effects.hitWater.y = y * TILE_SIZE
    end)

  effects.showR = Effect:new({}, sprites.controls, 2, 8, 2, {0.5, 0.5})
  Signal.register('show r',
    function()
      effects.showR.active = true
      effects.showR.x = 1238
      effects.showR.y = 10
    end)
end

function E.update(dt)
  for _,e in pairs(effects) do
    if e.active then
      e.anim:update(dt)
    end
  end
end

function E.draw()
  for _,e in pairs(effects) do
    if e.active then
      e.anim:draw(e.asset, e.x, e.y)
    end
  end
end

return E
