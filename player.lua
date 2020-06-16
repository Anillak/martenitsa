player = {}
player.segments = {}

function loadPlayer()
  player.bound = false
  player.direction = {"right"}

  player.segments = {
    {x = 3, y = 1, sprite = "horizontal-head"},
    {x = 2, y = 1, sprite = "horizontal-mid"},
    {x = 1, y = 1, sprite = "horizontal-tail"}
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

  table.insert(player.segments, 1, {x = newX, y = newY, sprite = "horizontal-head"})
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
    sprite = sprites.player_head
    if segment.sprite == "horizontal_head" then
      sprite = sprites.player_head
    elseif segment.sprite == "horizontal_mid" then
      sprite = sprites.player_mid
    elseif segment.sprite == "horizontal_tail" then
      sprite = sprites.player_tail
    end

    love.graphics.draw(
      sprite,
      (segment.x-1) * cellSize,
      (segment.y-1) * cellSize
    )
  end
end

function love.keypressed(key)
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
