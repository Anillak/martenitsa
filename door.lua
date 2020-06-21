function loadDoor(x, y)
  door = {}

  door.x = x
  door.y = y
  door.open = false
  door.grid = Anim8.newGrid(30, 30, 120, 30)
  door.animation = Anim8.newAnimation(door.grid('1-3', 1), 0.1)
  door.animation:pause()

  door.keys = {}
  spawnKeys(15, 11)
  spawnKeys(15, 14)

end

function updateDoor(dt)
  door.animation:update(dt)
  door.open = true
  for i,key in ipairs(door.keys) do
    key.animation:update(dt)
    if key.pressed ~= true then
      door.open = false
    end
  end
  if door.open then
    door.animation:resume()
  end

end

function drawDoor()
  for i,key in ipairs(door.keys) do
    key.animation:draw(
      sprites.key,
      (key.x - 1) * cellSize,
      (key.y - 1) * cellSize)
  end

  door.animation:draw(
    sprites.door,
    (door.x - 1) * cellSize,
    (door.y - 1) * cellSize)
end

function spawnKeys(x, y)
  key = {}
  key.x = x
  key.y = y
  key.pressed = false

  key.grid = Anim8.newGrid(30, 30, 120, 30)
  key.animation = Anim8.newAnimation(key.grid('1-3',1), 0.1)
  key.animation:pause()

  table.insert(door.keys, key)
end

function pressKey(key)
  key.animation:resume()
  key.pressed = true
end
