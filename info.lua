local Info = {}
local Buttons

function Info:init()
  self.level = 0
  self.bgReal = love.graphics.newImage('asset/bg-real2.png')
  self.pp = love.graphics.newImage('asset/info1.png')
  self.corn = love.graphics.newImage('asset/info2.png')
  self.stroke = love.graphics.newImage('asset/info3.png')
  self.logo = love.graphics.newImage('asset/logo.png')
  self.ravnecLogo = love.graphics.newImage('asset/ravnec-logo.png')
end

function Info:enter(previous, level)
  self.level = level
  Buttons = B:new()
  if level ~= LEVELS_AMOUNT then
    Buttons:add("menu", 400, 600, "Go to Menu", false, Menu)
    Buttons:add("level", 685, 600, "Continue", false, Game, level+1)
    Buttons:setActive(Buttons.level)
  elseif level == LEVELS_AMOUNT then
    sounds.credits:play()
    Buttons:add("menu", Buttons.getCenteredHorizontalPosition(), 600, "Go to Menu", false, Menu)
    Buttons:setActive(Buttons.menu)
  else
    Buttons:add("menu", Buttons.getCenteredHorizontalPosition(), 600, "Go to Menu", false, Menu)
    Buttons:setActive(Buttons.menu)
  end
end

function Info:leave()
  sounds.credits:pause()
  Buttons:clear()
end

function Info:draw()
  resetToDraw()
  love.graphics.draw(self.bgReal, 0, 0)

  if self.level == 1 then
    love.graphics.draw(self.corn, getCenteredHorizontalPosition(227), 380)
  elseif self.level == 2 then
    love.graphics.draw(self.stroke, getCenteredHorizontalPosition(300), 320)
  elseif self.level == 3 then
    love.graphics.draw(self.pp, getCenteredHorizontalPosition(300), 320)
  elseif self.level == 8 then
    love.graphics.draw(self.logo, getCenteredHorizontalPosition(64), 160)
    love.graphics.draw(self.ravnecLogo, getCenteredHorizontalPosition(126), 280)
  end

  local width = 680
  love.graphics.setColor(0, 0, 0)

  if self.level == 1 then
    love.graphics.setFont(fonts.infoTitle)
    local titleText = "Introduction"
    love.graphics.printf(titleText, getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText)
    local levelText = "A martenitsa is a red and white bracelet made of yarn that people in Bulgaria give to each other on March 1st as a wish for health and a long life. This is all part of the pagan tradition of Baba Marta, or Granny March, who represents the advent of spring.\n\nThe colors of the martenitsa symbolise many things. It is believed that the white wool represents the melting snow and the red twine represents the setting sun.\n\nAnother meaning behind the martenitsa's colors is that the white symbolises man and the red - woman, or that they represent purity and life or health and strength."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 2 then
    love.graphics.setFont(fonts.infoTitle)
    local titleText = "Baba Marta"
    love.graphics.printf(titleText, getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText)
    local levelText = "'Mart' is the bulgarian word for March and 'baba' - the word for grandma.\n\nIn old folklore 'Baba Marta' is portrayed as a volatile and moody woman. It is believed that when she is happy, skies are blue and the sun will shine, but when Baba Marta is disgruntled, she will bring rain and wind.\n\nAccording to the legends, Baba Marta only visits clean and tidy homes, so at the end of February people would clean their abode in preparation."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 3 then
    love.graphics.setFont(fonts.infoTitle)
    local titleText = "Traditions"
    love.graphics.printf(titleText, getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText)
    local levelText = "On March 1st, Bulgarians give martenitsi to their family, friends and neighbours. They may be in the form of a simple bracelet of entwined red and white wool or a brooch of red and white wool tassels.\n\nFront doors get decorated with enormous red and white pompoms or with woollen dolls called 'Pizho and Penda'. Pizho is the male doll and is usually crafted from white wool. Penda is the female, red doll and is distinguished by her skirt."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 4 then
    love.graphics.setFont(fonts.infoTitle)
    local titleText = "Traditions"
    love.graphics.printf(titleText, getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText)
    local levelText = "Martenitsi are worn until Baba Marta shows a sign that spring is truly here. This may be the first stork returning from the South, or the green buds on a fruit tree.\n\nOnce spring has revealed itself, the martenitsa is hung from the branches of a budding tree and people make a wish. This act is said to make the tree strong and healthy.\n\nSome people put their martenitsa under a stone and the creature that is closest to the stone on the next day would determine the person's health for the rest of the year. If the creature is a larva or a worm, the forthcoming year will be healthy and successful. The same luck is associated with an ant; however, the person will have to work hard to achieve success. If the creature near the stone is a spider, then the person is in trouble and will be lacking in luck, health, or personal success for the next twelve months."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 5 then
    love.graphics.setFont(fonts.infoTitle)
    local titleText = "Bulgarian legends"
    love.graphics.printf(titleText, getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText2)
    local levelText = "Among the legends about the colors of the martenitsa is the story of Khan Kubrat, the founder of Bulgaria, who was nearing the end of his life. He knew this and asked his sons to vow to keep the various Bulgar tribes together to defend the country. However, soon after Khan Kubrat's death, their land was invaded by the Khazars. They took over the capital and kidnapped Khan Kubrat's daughter, Houba.\n\nOf the five sons, one, Bayan, joined with the Khazars in an attempt to stay with his sister. The other brothers: Kotrag, Asparukh, Kuber and Alcek looked north and south for a land away from their enemies. They had agreed that if they found such a place they would send Bayan and Houba a bird with a piece of thread tied to its leg.\n\nEventually, the imprisoned siblings received the awaited message and tried to set off secretly, but the Khazars soon found out and followed them. Bayan and Houba didn't know the soldiers were so close and were about to set the bird on its return course, when Bayan was wounded by an arrow, fired by the Khazars. Dripping blood onto the white thread, Bayan still managed to release the bird, and he and his sister continued their journey to find their brothers. When the siblings finally met, Bayan was nearly dead. Asparukh welcomed the dying man, tore pieces of bloodstained white cloth into small strips and gave them to his soldiers in honour of the brave Bayan."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 6 then
    love.graphics.setFont(fonts.infoTitle)
    local titleText = "Bulgarian legends"
    love.graphics.printf(titleText, getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText)
    local levelText = "According to another legend about Khan Asparukh, founder of the First Bulgarian Kingdom, the Bulgarians reached a land beyond the Danube and decided to settle there. Khan Asparukh was happy with his find and wanted the pagan god Tangra to bless the new kingdom, so he decided to offer him a gift. By tradition, a sacrificial fire had to be lit with a sprig of dry dill, but there was no dill around.\n\nWhile Asparukh was pondering how to please Tangra, a falcon perched on his shoulder. The bird had a sprig of dill tied to its leg with a white woollen thread, half tinged with red. The dill had been sent by Asparukh's sister Houba, who had dreamt of her brother's dilemma. During the long flight, the falcon's wing got sore and part of the thread was soaked in blood. Asparukh lit the sacrificial fire and attached the thread onto his clothing, so it would bring him good health."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 7 then
    love.graphics.setFont(fonts.infoTitle)
    local titleText = "Around the world"
    love.graphics.printf(titleText, getCenteredHorizontalPosition(width), 70, width, "left")
    love.graphics.setFont(fonts.infoText)
    local levelText = "Bulgaria is not the only country in the world celebrating the advent of March and the coming of spring. Some countries even have traditions that include giving and wearing of martenitsas.\n\nRomania also commemorates the first day of March with a celebration known as martisor. Men offer women a jewel or some other adornment tied to a red and white string. It is traditionally worn for 12 days and it gives the wearer strength and good health for the coming year.\n\nMoldova's celebration is very similar to that of Romania, except that people give each other a gold or silver brooch on a red and white string, which they pin to their lapel.\n\nIn Greece, people braid bracelets called martis, made from red and white strings, and give them out to children on March 1st. Martis are worn until the midnight mass of the Greek Orthodox Easter. On this day, bonfires are lit and the bracelets are removed and thrown into the fires."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 140, width, "left")
  elseif self.level == 8 then
    love.graphics.setFont(fonts.credits)
    love.graphics.printf("Thank you for playing Martenitsa!", getCenteredHorizontalPosition(width), 70, width, "center")
    love.graphics.printf("Developed by Margarita Ganeva", getCenteredHorizontalPosition(width), 130, width, "center")
    love.graphics.printf("Music by Ravnec Folklore Band", getCenteredHorizontalPosition(width), 250, width, "center")
  end

  love.graphics.setColor(1, 1, 1)
  Buttons:draw()
  drawBorders()
end

function Info:keyreleased(key, code)
  Buttons:keyreleased(key, code)
end

function Info:keypressed(key, code)
  Buttons:keypressed(key, code)
end

return Info
