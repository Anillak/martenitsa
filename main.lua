love.mouse.setVisible(false)
ORIGINAL_GAME_X, ORIGINAL_GAME_Y = 1280, 704
--GAME_X, GAME_Y = 1680, 704
local _, _, flags = love.window.getMode()
GAME_X, GAME_Y = love.window.getDesktopDimensions(flags.display)
GRID_X, GRID_Y = 40, 22
CELL_SIZE = math.min(GAME_X / GRID_X, GAME_Y / GRID_Y)
BORDERS = (GAME_Y - GRID_Y*CELL_SIZE) / 2
SIDE_BORDERS = (GAME_X - GRID_X*CELL_SIZE) / 2
TILE_SIZE = 32
SCALE = CELL_SIZE/TILE_SIZE
LEVELS_AMOUNT = 8
LANGUAGE = "en"

local function createSaveData()
  local data = love.filesystem.load("martenitsaSaveData.lua")
  if data then
    data()
  end
  if not saveData then
    saveData = {}
  end
  if not saveData.scores then
    saveData.scores = {0,0,0,0,0,0,0,0}
  end
  if not saveData.scores.survival then
    saveData.scores.survival = 0
  end
  if not saveData.deaths then
    saveData.deaths = {0,0,0,0,0,0,0,0}
  end
  if not saveData.deaths.survival then
    saveData.deaths.survival = 0
  end
  if not saveData.level then
    saveData.level = 1
  end
  if not saveData.survival then
    saveData.survival = {true, false, false, false, false, false, false, false}
    saveData.survival.complete = 0
  end
end

function love.load()
  require 'save'
  createSaveData()
  Timer = require 'lib/hump-master/timer'
  Gamestate = require "lib/hump-master/gamestate"
  Anim8 = require 'lib/anim8-master/anim8'
  Signal = require 'lib/hump-master/signal'
  B = require "button"
  require 'assets'
  require 'localization'
  require 'utils'
  Menu = require 'menu'
  Game = require 'game'

  local Logo = require 'logo'
  Gamestate.registerEvents()
  Gamestate.switch(Logo)
  logSystem()
end
