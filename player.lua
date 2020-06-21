function loadPlayer()
  player = {}
  player.segments = {}
  player.bound = false
  player.dead = false
  player.direction = {"right"}

  player.segments = {
    createSegment(6, 1),
    createSegment(5, 1),
    createSegment(4, 1),
    createSegment(3, 1),
    createSegment(2, 1),
    createSegment(1, 1),
  }
end

function updatePlayer(dt)
  if #player.direction > 1 then
    table.remove(player.direction, 1)
  end

  local newX = player.segments[1].x
  local newY = player.segments[1].y

  if player.direction[1] == "right" then
    newX = newX + 1
  elseif player.direction[1] == "left" then
    newX = newX - 1
  elseif player.direction[1] == "down" then
    newY = newY + 1
  elseif player.direction[1] == "up" then
    newY = newY - 1
  end


  player.bound = isBound(newX, newY)

  table.insert(player.segments, 1, createSegment(newX, newY))
end

function updatePlayerAnimation(dt)
  for i,segment in ipairs(player.segments) do
    segment.animation:update(dt)
  end
end

function createSegment(x, y)
  segment = {}
  segment.x = x
  segment.y = y
  segment.grid = anim8.newGrid(30, 30, 90, 30)
  segment.animation = anim8.newAnimation(segment.grid('1-3', 1), 0.1)
  return segment
end

function isBound(x, y)
  for i, segment in ipairs(player.segments) do
    if i ~= #player.segments
      and x == segment.x
      and y == segment.y then
        return true
    end
  end
end

function drawPlayer()
  for i,segment in ipairs(player.segments) do
    local neighbours = findNeighbours(i, segment)
    local image = getSpriteAccordingToNeighbors(i, neighbours)

    segment.animation:draw(
      image.sprite,
      (segment.x-1) * cellSize + cellSize/2,
      (segment.y-1) * cellSize + cellSize/2,
      math.rad(image.rotation),
      1,
      1,
      cellSize/2,
      cellSize/2
    )
  end
end

function findNeighbours(i, segment)
  local neighbours = {}
  if i == 1 then
    neighbours[checkNeighbour(segment, player.segments[i+1])] = true
  elseif i == #player.segments then
    neighbours[checkNeighbour(segment, player.segments[i-1])] = true
  else
    neighbours[checkNeighbour(segment, player.segments[i-1])] = true
    neighbours[checkNeighbour(segment, player.segments[i+1])] = true
  end
  return neighbours
end

function checkNeighbour(segment, neighbour)
  if neighbour.y == segment.y and neighbour.x == segment.x-1 then
    return "left"
  end
  if neighbour.y == segment.y and neighbour.x == segment.x+1 then
    return "right"
  end
  if neighbour.x == segment.x and neighbour.y == segment.y-1 then
    return "up"
  end
  if neighbour.x == segment.x and neighbour.y == segment.y+1 then
    return "down"
  end
end

function getSpriteAccordingToNeighbors(i, neighbours)
  local image = {}

  if i == 1 then
    image.sprite = sprites.playerHead
    if neighbours["left"] then
      image.rotation = 0
    elseif neighbours["right"] then
      image.rotation = 180
    elseif neighbours["up"] then
      image.rotation = 90
    elseif neighbours["down"] then
      image.rotation = 270
    end
  elseif i == #player.segments then
    image.sprite = sprites.playerTail
    if neighbours["right"] then
      image.rotation = 0
    elseif neighbours["left"] then
      image.rotation = 180
    elseif neighbours["down"] then
      image.rotation = 90
    elseif neighbours["up"] then
      image.rotation = 270
    end
  elseif neighbours["left"] and neighbours["right"] then
    image.sprite = sprites.playerMid
    image.rotation = 0
  elseif neighbours["up"] and neighbours["down"] then
    image.sprite = sprites.playerMid
    image.rotation = 90
  elseif neighbours["left"] and neighbours["down"] then
    image.sprite = sprites.playerCurve
    image.rotation = 0
  elseif neighbours["left"] and neighbours["up"] then
    image.sprite = sprites.playerCurve
    image.rotation = 90
  elseif neighbours["right"] and neighbours["up"] then
    image.sprite = sprites.playerCurve
    image.rotation = 180
  elseif neighbours["right"] and neighbours["down"] then
    image.sprite = sprites.playerCurve
    image.rotation = 270
  end

  return image
end

function keyPressPlayer(key)
  if key == "right"
    and player.direction[#player.direction] ~= "right"
    and player.direction[#player.direction] ~= "left" then
      table.insert(player.direction, "right")
  elseif key == "left"
    and player.direction[#player.direction] ~= "left"
    and player.direction[#player.direction] ~= "right" then
      table.insert(player.direction, "left")
  elseif key == "down"
    and player.direction[#player.direction] ~= "down"
    and player.direction[#player.direction] ~= "up" then
      table.insert(player.direction, "down")
  elseif key == "up"
    and player.direction[#player.direction] ~= "up"
    and player.direction[#player.direction] ~= "down" then
      table.insert(player.direction, "up")
  end
end
