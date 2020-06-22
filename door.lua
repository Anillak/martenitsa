function loadDoor(x, y)
  door = {}

  door.x = x
  door.y = y
  door.open = false
  door.grid = Anim8.newGrid(CELL_SIZE, CELL_SIZE, CELL_SIZE*4, CELL_SIZE)
  door.animation = Anim8.newAnimation(door.grid('1-4', 1), 1)
  door.animation:pause()

  door.keys = {}
  spawnKeys(15, 11)
  spawnKeys(15, 14)

end

function updateDoor(dt)
  door.animation:update(dt)
  door.open = true
  for _,key in ipairs(door.keys) do
    key.animation:update(dt)
    if key.pressed ~= true then
      door.open = false
    end
  end
  if door.open then
    door.animation:resume()
    door.animation:pauseAtEnd()
  end

end

function drawDoor()
  for _,key in ipairs(door.keys) do
    key.animation:draw(
      sprites.key,
      (key.x - 1) * CELL_SIZE,
      (key.y - 1) * CELL_SIZE)
  end

  door.animation:draw(
    sprites.door,
    (door.x - 1) * CELL_SIZE,
    (door.y - 1) * CELL_SIZE)
end

function spawnKeys(x, y)
  key = {}
  key.x = x
  key.y = y
  key.pressed = false

  key.grid = Anim8.newGrid(CELL_SIZE, CELL_SIZE, CELL_SIZE*4, CELL_SIZE)
  key.animation = Anim8.newAnimation(key.grid('1-4',1), 0.3)
  key.animation:pause()

  table.insert(door.keys, key)
end

function pressKey(key)
  key.animation:resume()
  key.animation:pauseAtEnd()
  key.pressed = true
end

function releaseKey(key)
  if door.open == false then
    -- animation for key release
    key.pressed = false
  end

end
