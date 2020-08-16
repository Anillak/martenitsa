function distanceBetween(x1, y1, x2, y2)
  return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end

function hit(item, other)
  return item.x == other.x and item.y == other.y
end

function getCenteredHorizontalPosition(width)
  return ORIGINAL_GAME_X/2 - width/2
end

function resetToDraw()
  love.graphics.scale(SCALE)
  love.graphics.setBackgroundColor(1, 1, 1)
  love.graphics.translate(0, BORDERS)
  love.graphics.setColor(1, 1, 1)
end

function drawBorders()
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, -BORDERS, ORIGINAL_GAME_X, BORDERS)
  love.graphics.rectangle("fill", 0, ORIGINAL_GAME_Y, ORIGINAL_GAME_X, BORDERS)
  love.graphics.setColor(1, 1, 1)
end

function log(message)
  love.filesystem.append("log.lua", os.date() .. ": ")
  love.filesystem.append("log.lua", message)
  love.filesystem.append("log.lua", "\r\n")
end

function errorWithLogging(message)
  log(message)
  error(message)
end

function assertWithLogging(assertion, message)
  if not assertion then log(message) end
  assert(assertion, message)
end

function logSystem()
  log("Resolution: " .. GAME_X .. "x" .. GAME_Y)
  log("Cell size: " .. CELL_SIZE)
  log("Scale ratio: " .. SCALE)
  log("Borders: " .. BORDERS)
end
