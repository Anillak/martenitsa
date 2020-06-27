Menu = {}

function Menu:draw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Press Enter to continue", 10, 10)
end

function Menu:keyreleased(key, code)
    if key == 'return' then
        Gamestate.switch(Game)
    end
end
