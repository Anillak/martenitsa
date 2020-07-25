function checkNeighbour(segment, neighbour)
  assert(neighbour, "Player segment (" .. segment.x .. ", " .. segment.y .. ") doesn't have a neighbour")
  if neighbour.y == segment.y and neighbour.x == previousXPosition(segment.x) then
    return "left"
  end
  if neighbour.y == segment.y and neighbour.x == nextXPosition(segment.x) then
    return "right"
  end
  if neighbour.x == segment.x and neighbour.y == previousYPosition(segment.y) then
    return "up"
  end
  if neighbour.x == segment.x and neighbour.y == nextYPosition(segment.y) then
    return "down"
  end
  error("Player segment (" .. segment.x .. ", " .. segment.y .. ") has a neighbour (" .. neighbour.x .. ", " .. neighbour.y .. ") too far away from it)")
end

function getSpriteAccordingToNeighbors(i, neighbours, n)
  local image = {}

  if i == 1 then
    image.sprite = "playerHead"
    if neighbours[1] == "left" then
      image.rotation = 0
    elseif neighbours[1] == "right" then
      image.rotation = 180
    elseif neighbours[1] == "up" then
      image.rotation = 90
    elseif neighbours[1] == "down" then
      image.rotation = 270
    end
  elseif i == n then
    image.sprite = "playerTail"
    if neighbours[1] == "right" then
      image.rotation = 0
    elseif neighbours[1] == "left" then
      image.rotation = 180
    elseif neighbours[1] == "down" then
      image.rotation = 90
    elseif neighbours[1] == "up" then
      image.rotation = 270
    end
  elseif neighbours[1] == "right" and neighbours[2] == "left" then
    image.sprite = "playerMid"
    image.rotation = 0
  elseif neighbours[1] == "down" and neighbours[2] == "up" then
    image.sprite = "playerMid"
    image.rotation = 90
  elseif neighbours[1] == "left" and neighbours[2] == "right" then
    image.sprite = "playerMid"
    image.rotation = 180
  elseif neighbours[1] == "up" and neighbours[2] == "down" then
    image.sprite = "playerMid"
    image.rotation = 270
  elseif neighbours[1] == "left" and neighbours[2] == "down" then
    image.sprite = "playerCurveAlt"
    image.rotation = 0
  elseif neighbours[1] == "down" and neighbours[2] == "left" then
    image.sprite = "playerCurve"
    image.rotation = 0
  elseif neighbours[1] == "left" and neighbours[2] == "up" then
    image.sprite = "playerCurve"
    image.rotation = 90
  elseif neighbours[1] == "up" and neighbours[2] == "left" then
    image.sprite = "playerCurveAlt"
    image.rotation = 90
  elseif neighbours[1] == "right" and neighbours[2] == "up" then
    image.sprite = "playerCurveAlt"
    image.rotation = 180
  elseif neighbours[1] == "up" and neighbours[2] == "right" then
    image.sprite = "playerCurve"
    image.rotation = 180
  elseif neighbours[1] == "right" and neighbours[2] == "down" then
    image.sprite = "playerCurve"
    image.rotation = 270
  elseif neighbours[1] == "down" and neighbours[2] == "right" then
    image.sprite = "playerCurveAlt"
    image.rotation = 270
  end

  return image
end


local function nextPos(pos, gridSize)
  pos = pos + 1
  if pos > gridSize-1 then
    pos = 0
  end
  return pos
end

local function previousPos(pos, gridSize)
  pos = pos - 1
  if pos < 0 then
    pos = gridSize-1
  end
  return pos
end

function nextXPosition(x)
  return nextPos(x, GRID_X)
end

function previousXPosition(x)
  return previousPos(x, GRID_X)
end

function nextYPosition(y)
  return nextPos(y, GRID_Y)
end

function previousYPosition(y)
  return previousPos(y, GRID_Y)
end
