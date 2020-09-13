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
  love.graphics.translate(0, BORDERS)
  love.graphics.scale(SCALE)
  love.graphics.setBackgroundColor(1, 1, 1)
  love.graphics.setColor(1, 1, 1)
end

local function drawConsole()
  love.graphics.setFont(fonts.console)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, GRID_Y*TILE_SIZE-25, GRID_X*TILE_SIZE, 25)
  love.graphics.setColor(1, 1, 1)
  local pfs = "PFS: " .. love.timer.getFPS()
  local cs = "    Cell size: " .. TILE_SIZE
  local sr = "    Scale ratio: " .. SCALE
  local res = "    Resolution: " .. GAME_X .. "x" .. GAME_Y
  local b = "    Borders: " .. BORDERS
  local gc = "    Memory: " .. collectgarbage('count') .. "kb"
  if love.timer.getFPS() < 50 then
    log(pfs .. gc)
  end
  local text = pfs .. cs .. sr .. res ..b ..gc
  love.graphics.print(text, 10, GRID_Y*TILE_SIZE-20)
end

function drawBorders()
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, -BORDERS, ORIGINAL_GAME_X, BORDERS)
  love.graphics.rectangle("fill", 0, ORIGINAL_GAME_Y, ORIGINAL_GAME_X, BORDERS)
  drawConsole()
  love.graphics.setColor(1, 1, 1)
end

function drawScore(score)
  love.graphics.setColor(0.5, 0, 0)
  love.graphics.setFont(fonts.levelScore)
  love.graphics.print(math.ceil(score), 20, 7)
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
