sounds = {}
sounds.scissors = love.audio.newSource("asset/scissors.wav", "static")
sounds.scissors:setVolume(0.5)
sounds.waterHit = love.audio.newSource("asset/water-hit.wav", "static")
sounds.wallHit = love.audio.newSource("asset/wall-hit.wav", "static")
sounds.birds = love.audio.newSource("asset/birds.wav", "static")
sounds.birds:setLooping(true)
