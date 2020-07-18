function distanceBetween(x1, y1, x2, y2)
  return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end

function hit(item, other)
  return item.x == other.x and item.y == other.y
end

function resetToDraw()
  love.graphics.scale(SCALE)
  love.graphics.setBackgroundColor(1, 1, 1)
  love.graphics.translate(0, BORDERS)
  love.graphics.setColor(1, 1, 1)
end
