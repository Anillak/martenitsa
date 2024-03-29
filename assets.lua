-- SPRITES
sprites = {}
sprites.button = love.graphics.newImage('sprites/button.png')
sprites.buttonActive = love.graphics.newImage('sprites/button_active.png')
sprites.buttonInactive = love.graphics.newImage('sprites/button_inactive.png')

sprites.checkpoint = love.graphics.newImage('sprites/checkpoint.png')
sprites.checkpointDone = love.graphics.newImage('sprites/checkpoint_done.png')

sprites.coin = love.graphics.newImage('sprites/coin.png')
sprites.controls = love.graphics.newImage('sprites/controls.png')
sprites.hitWall = love.graphics.newImage('sprites/hit_wall.png')
sprites.hitWater = love.graphics.newImage('sprites/hit_water.png')

sprites.doorRed = love.graphics.newImage('sprites/door_red.png')
sprites.doorBlue = love.graphics.newImage('sprites/door_blue.png')
sprites.doorGreen = love.graphics.newImage('sprites/door_green.png')
sprites.doorYellow = love.graphics.newImage('sprites/door_yellow.png')
sprites.doorWhite = love.graphics.newImage('sprites/door_white.png')
sprites.keyPressedRed = love.graphics.newImage('sprites/key_pressed_red.png')
sprites.keyReleasedRed = love.graphics.newImage('sprites/key_released_red.png')
sprites.keyPressedBlue = love.graphics.newImage('sprites/key_pressed_blue.png')
sprites.keyReleasedBlue = love.graphics.newImage('sprites/key_released_blue.png')
sprites.keyPressedGreen = love.graphics.newImage('sprites/key_pressed_green.png')
sprites.keyReleasedGreen = love.graphics.newImage('sprites/key_released_green.png')
sprites.keyPressedYellow = love.graphics.newImage('sprites/key_pressed_yellow.png')
sprites.keyReleasedYellow = love.graphics.newImage('sprites/key_released_yellow.png')
sprites.keyPressedWhite = love.graphics.newImage('sprites/key_pressed_white.png')
sprites.keyReleasedWhite = love.graphics.newImage('sprites/key_released_white.png')

sprites.secret = love.graphics.newImage('sprites/secret.png')
sprites.knot = love.graphics.newImage('sprites/knot.png')
sprites.lock = love.graphics.newImage('sprites/lock.png')
sprites.logo = love.graphics.newImage('sprites/logo.png')
sprites.scissors = love.graphics.newImage('sprites/scissors.png')
sprites.scissorsBottom = love.graphics.newImage('sprites/scissors_bottom.png')

sprites.playerVictory = love.graphics.newImage('sprites/player_victory.png')
sprites.playerHead = love.graphics.newImage('sprites/player_head.png')
sprites.playerHeadCut = love.graphics.newImage('sprites/player_head_cut.png')
sprites.playerMid = love.graphics.newImage('sprites/player_mid.png')
sprites.playerMidCut = love.graphics.newImage('sprites/player_mid_cut.png')
sprites.playerTail = love.graphics.newImage('sprites/player_tail.png')
sprites.playerTailCut = love.graphics.newImage('sprites/player_tail_cut.png')
sprites.playerCurve = love.graphics.newImage('sprites/player_curve.png')
sprites.playerCurveCut = love.graphics.newImage('sprites/player_curve_cut.png')
sprites.playerCurveAlt = love.graphics.newImage('sprites/player_curve_2.png')
sprites.playerCurveAltCut = love.graphics.newImage('sprites/player_curve_2_cut.png')

sprites.arrow = love.graphics.newImage('asset/arrow.png')
sprites.arrowFlipped = love.graphics.newImage('asset/arrow-flip.png')

-- LOGO
sprites.martenitsaMenuEn = love.graphics.newImage('asset/name.png')
sprites.martenitsaCreditsEn = love.graphics.newImage('asset/martenitsa-logo.png')
sprites.martenitsaMenuBg = love.graphics.newImage('asset/name-bg.png')
sprites.martenitsaCreditsBg = love.graphics.newImage('asset/martenitsa-logo-bg.png')
sprites.martenitsaMenu = sprites.martenitsaMenuEn
sprites.martenitsaCredits = sprites.martenitsaCreditsEn

-- SOUNDS
sounds = {}
sounds.intro = love.audio.newSource("asset/intro.wav", "static")
sounds.victory = love.audio.newSource("asset/victory.wav", "static")
sounds.credits = love.audio.newSource("asset/credits.ogg", "static")
sounds.menuPress = love.audio.newSource("asset/menu-press.wav", "static")
sounds.menuMove = love.audio.newSource("asset/menu-move.wav", "static")
sounds.scissors = love.audio.newSource("asset/scissors.wav", "static")
sounds.waterHit = love.audio.newSource("asset/water-hit.wav", "static")
sounds.wallHit = love.audio.newSource("asset/wall-hit.wav", "static")
sounds.buttonPress = love.audio.newSource("asset/button-press.wav", "static")
sounds.buttonRelease = love.audio.newSource("asset/button-release.wav", "static")
sounds.doorOpen = love.audio.newSource("asset/rock-move.wav", "static")
sounds.doorClose = love.audio.newSource("asset/rock-init.wav", "static")
sounds.lock = love.audio.newSource("asset/lock.wav", "static")
sounds.unlock = love.audio.newSource("asset/unlock.wav", "static")
sounds.knotEat = love.audio.newSource("asset/knot-eat.wav", "static")
sounds.secretCollect = love.audio.newSource("asset/secret-eat.wav", "static")
sounds.coins = love.audio.newSource("asset/coins.wav", "static")
sounds.walking = love.audio.newSource("asset/walking.wav", "static")
sounds.walking:setLooping(true)
sounds.turning = love.audio.newSource("asset/turning.wav", "static")
sounds.dying = love.audio.newSource("asset/dying.wav", "static")
sounds.birds = love.audio.newSource("asset/birds.wav", "static")
sounds.birds:setLooping(true)

-- FONTS
local FONT = "asset/Play-Regular.ttf"
local FONT_SECOND = "asset/Roboto-Regular.ttf"
fonts = {}
fonts.button = love.graphics.newFont(FONT, 20)
fonts.controls = love.graphics.newFont(FONT, 16)
fonts.pause = love.graphics.newFont(FONT, 30)
fonts.pauseDesc = love.graphics.newFont(FONT, 16)
fonts.infoTitle = love.graphics.newFont(FONT, 28)
fonts.infoText = love.graphics.newFont(FONT_SECOND, 20)
fonts.infoText2 = love.graphics.newFont(FONT_SECOND, 18)
fonts.credits = love.graphics.newFont(FONT, 18)
fonts.creditsNames = love.graphics.newFont(FONT_SECOND, 16)
fonts.scoresTitle = love.graphics.newFont(FONT, 30)
fonts.scoresTable = love.graphics.newFont(FONT_SECOND, 24)
fonts.tutorial = love.graphics.newFont(FONT_SECOND, 16)
fonts.levelScore = love.graphics.newFont(FONT, 12)
fonts.console = love.graphics.newFont(FONT_SECOND, 10)
