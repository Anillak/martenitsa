love.mouse.setVisible(false)
ORIGINAL_GAME_X, ORIGINAL_GAME_Y = 1280, 704
GAME_X, GAME_Y = 1280, 704
--GAME_X, GAME_Y = love.window.getDesktopDimensions()
GRID_X, GRID_Y = 40, 22
CELL_SIZE = math.min(GAME_X / GRID_X, GAME_Y / GRID_Y)
BORDERS = (GAME_Y - GRID_Y*CELL_SIZE) / 2
TILE_SIZE = 32
SCALE = CELL_SIZE/TILE_SIZE
FONT = "asset/Coda-Regular.ttf"
FONT_SECOND = "asset/Lato-Regular.ttf"
LEVELS_AMOUNT = 8

function love.keyreleased(key)
  if key == "escape" then
   love.event.quit()
  end
  if key == 'm' then
    return Gamestate.switch(Menu)
  end
end

function love.load()
  console = ""
  require 'save'
  saveData = {}
  saveData.level = 1
  if love.filesystem.getInfo("martenitsaSaveData.lua") then
    local data = love.filesystem.load("martenitsaSaveData.lua")
    data()
  end

  Timer = require 'lib/hump-master/timer'
  Gamestate = require "lib/hump-master/gamestate"
  Anim8 = require 'lib/anim8-master/anim8'
  require 'sprites'
  require 'sounds'
  require 'utils'
  require 'logo'
  require 'intro'
  require 'menu'
  require 'game'
  require 'controls'
  require 'levels'
  require 'victory'
  require 'info'
  require 'pause'

  Gamestate.registerEvents()
  Gamestate.switch(Logo)
  logSystem()
end
