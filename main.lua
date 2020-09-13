love.mouse.setVisible(false)
ORIGINAL_GAME_X, ORIGINAL_GAME_Y = 1280, 704
--GAME_X, GAME_Y = 1280, 704
local _, _, flags = love.window.getMode()
GAME_X, GAME_Y = love.window.getDesktopDimensions(flags.display)
GRID_X, GRID_Y = 40, 22
CELL_SIZE = math.min(GAME_X / GRID_X, GAME_Y / GRID_Y)
BORDERS = (GAME_Y - GRID_Y*CELL_SIZE) / 2
TILE_SIZE = 32
SCALE = CELL_SIZE/TILE_SIZE
LEVELS_AMOUNT = 8

function love.keyreleased(key)
  -- remove later
  if key == "escape" then
   love.event.quit()
  end
end

local function createSaveData()
  if love.filesystem.getInfo("martenitsaSaveData.lua") then
    local data = love.filesystem.load("martenitsaSaveData.lua")
    data()
  end
  if not saveData then
    saveData = {}
  end
  if not saveData.scores then
    saveData.scores = {0,0,0,0,0,0,0,0}
  end
  if not saveData.deaths then
    saveData.deaths = {0,0,0,0,0,0,0,0}
  end
  if not saveData.level then
    saveData.level = 1
  end
end

function love.load()
  require 'save'
  createSaveData()

  Timer = require 'lib/hump-master/timer'
  Gamestate = require "lib/hump-master/gamestate"
  Anim8 = require 'lib/anim8-master/anim8'
  B = require "button"
  require 'assets'
  require 'utils'
  require 'logo'
  require 'intro'
  require 'menu'
  require 'game'
  require 'controls'
  require 'levels'
  require 'scores'
  require 'victory'
  require 'info'
  require 'pause'

  Gamestate.registerEvents()
  Gamestate.switch(Logo)
  logSystem()
end
