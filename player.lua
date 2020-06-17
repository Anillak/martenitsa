player = {}
player.segments = {}

function loadPlayer()
  player.bound = false
  player.direction = {"right"}

  player.segments = {
    {x = 6, y = 1},
    {x = 5, y = 1},
    {x = 4, y = 1},
    {x = 3, y = 1},
    {x = 2, y = 1},
    {x = 1, y = 1}
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

  table.insert(player.segments, 1, {x = newX, y = newY})
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

    love.graphics.draw(
      image.sprite,
      (segment.x-1) * cellSize + 15,
      (segment.y-1) * cellSize + 15,
      math.rad(image.rotation),
      1,
      1,
      15,
      15
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
    image.sprite = sprites.horizontalHead
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
    image.sprite = sprites.horizontalTail
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
    image.sprite = sprites.horizontalMid
    image.rotation = 0
  elseif neighbours["up"] and neighbours["down"] then
    image.sprite = sprites.horizontalMid
    image.rotation = 90
  elseif neighbours["left"] and neighbours["down"] then
    image.sprite = sprites.curve
    image.rotation = 0
  elseif neighbours["left"] and neighbours["up"] then
    image.sprite = sprites.curve
    image.rotation = 90
  elseif neighbours["right"] and neighbours["up"] then
    image.sprite = sprites.curve
    image.rotation = 180
  elseif neighbours["right"] and neighbours["down"] then
    image.sprite = sprites.curve
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
