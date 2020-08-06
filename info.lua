Info = {}
local B = require "button"
local Buttons

function Info:init()
  self.background = love.graphics.newImage('asset/bg.png')
  self.level = 0
end

function Info:enter(previous, level)
  sounds.birds:pause()
  self.level = level
  Buttons = B:new()
  if level ~= LEVELS_AMOUNT then
    Buttons:add("menu", 170, 600, "Go to Menu", false, Menu)
    Buttons:add("level", 915, 600, "Continue", false, Game, level+1)
    Buttons:setActive(Buttons.level)
  else
    Buttons:add("menu", Buttons.getCenteredHorizontalPosition(), 600, "Go to Menu", false, Menu)
    Buttons:setActive(Buttons.menu)
  end

end

function Info:update(dt)
  Buttons:update(dt)
end

local function getCenteredHorizontalPosition(width)
  return ORIGINAL_GAME_X/2 - width/2
end

function Info:draw()
  resetToDraw()
  love.graphics.draw(self.background, 0, 0)

  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(love.graphics.newFont(FONT_SECOND, 16))
  local width = 680

  if self.level == 1 then
    local levelText = "Martenitsa is a red and white bracelet made of yarn that people in Bulgaria give to eachother on 1st of March as a wish for health and long life. This is all part of the pagan tradition of Baba Marta, or Granny March, who represents the advent of spring. After a harsh winter she is welcomed with open arms in the beginning of March. \n\nThere are many interesting legends surrounding the origins of those celebrations and the wearing of those red and white bands called martenitsi. The red and white colors symbolise many things. It is sometimes believed they are the colors of Mother Nature. The white wool represents the melting snow and the red twine represents the setting sun, which becomes more and more intense as spring advances. Other associations of the martenitsa's colors are that the white symbolises man and the red - woman, or that they represent purity and life or health and strength. Many centuries ago, a martenitsa was regarded as an amulet to protect the receiver from evil and many people still quote the old saying that 'if you don't wear your martenitsa, Baba Marta will bring evil to you'."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 120, width, "left")
  elseif self.level == 2 then
    local levelText = "In Bulgaria, 'mart' is the word for March and 'baba' means grandma. In old folklore 'Baba Marta' was portrayed as a volatile and moody woman. It is believed that when she was happy, skies were blue and the sun would shine, but when Baba Marta was disgruntled, she would bring rain and wind. The legend is that Baba Marta only visits clean and tidy homes and spring-cleaning is another part of the Baba Marta celebration. At the end of February, people clean their homes completely. \n\nFolklore also states that Baba Marta liked to see young girls on 1st of March, so old people would stay indoors in order not to offend her."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 120, width, "left")
  elseif self.level == 3 then
    local levelText = "Little has changed in the celebration of Baba Marta since those days hundreds of years ago. On March 1, Bulgarians give martenitsi to their family, friends and neighbours. This may be in the form of a simple bracelet of entwined red and white wool or a brooch of red and white wool tassels. \n\nFront doors are decorated with enormous red and white pompoms or with woollen dolls called 'Pizho and Penda'. Pizho is the male doll and is usually crafted from white wool. Penda is the female, red doll and is distinguished by her skirt. Animals are also adorned with their own special martenitsa. Young people, in particular, can be seen with a wrist full of red and white bracelets."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 120, width, "left")
  elseif self.level == 4 then
    local levelText = "Martenitsi are worn until Baba Marta shows the first sign that spring is truly here. This may be in the form of the first stork or the green buds on a fruit tree. \n\nOnce spring has revealed itself, the martenitsa is hung from the branches of a budding tree and people make a wish. This act is said to make the tree strong and healthy. \n\nSome people put their martenitsa under a stone with the idea that whatever the nearest creature to it, the next day will determine the person's health for the rest of the year. If the creature is a larva or a worm, the forthcoming year will be healthy and successful. The same luck is associated with an ant; however, the person will have to work hard to achieve success. If the creature near the token is a spider, then the person is in trouble and will be lacking in luck, health, or personal success for the next year."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 120, width, "left")
  elseif self.level == 5 then
    local levelText = "One of the legends about the colors of the martenitsa is the story of Khan Koubrat, the founder of Bulgaria, who was nearing the end of his life. He knew this and asked his sons to vow to keep the various Bulgar tribes together to defend the country. However, soon after Khan Koubrat's death, their land was invaded by the Khazars. They took over the capital and kidnapped Khan Koubrat's daughter, Houba. \n\nOf the five sons, one, Bayan, joined with the Khazars in an attempt to stay with his sister. Another, Kotrag, moved northwards and the other three, Asparoukh, Kouber and Altsek, looked south for land away from their enemies. These three had arranged that if they found land then they would send a bird with thread tied to its leg to Bayan and Houba. \n\nEventually, the imprisoned pair received the bird and tried to set off secretly, but the Khazars soon found out and followed them. Bayan and Houba didn't know the soldiers were so close and were about to return the bird with the white thread attached when Bayan was wounded with an arrow, fired by the Khazars. Dripping blood onto the white thread, Bayan still managed to release the bird and they painfully continued their journey to find their brothers. When they finally met their siblings, Bayan was nearly dead. Asparoukh welcomed the dying man, tore pieces of bloodstained white cloth into small strips and gave them to his soldiers to honour brave Bayan."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 80, width, "left")
  elseif self.level == 6 then
    local levelText = "Other myths tell another story about Khan Asparoukh, founder of the First Bulgarian Kingdom. \n\nAccording to this legend, the Bulgarians reached land beyond the Danube and decided to settle there. Khan Asparoukh was happy at his find and wanted to offer the pagan God, Tangra, a gift to bless the new kingdom. By tradition, a sacrificial fire must be lit with a sprig of dry dill, but there was no dill around. While pondering how to please Tangra, a falcon perched on Asparoukh's shoulder. The bird had a sprig of dill tied to its leg with a white woollen thread, half tinged red. The dill had been sent by Asparoukh's sister Houba, who had dreamt of her brother's dilemma. During the long flight, the falcon's wing was rubbed sore and soaked part of the thread in blood. Asparoukh lit the sacrificial fire and attached the thread onto his clothing to bring him health."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 120, width, "left")
  elseif self.level == 7 then
    local levelText = "Bulgaria is not the only country in the world celebrating the advent of March and the coming of spring. Some countries even have traditions that include giving and wearing of a martenitsa. \n\nRomania also celebrates the first day of March with a celebration known as martisor. The custom is said to have its roots in Ancient Rome - the Romans celebrated the New Year on 1st of March by paying homage to Mars, god of war and agriculture. Romanian men offer Romanian women a jewel or decoration tied to a red and white string. Anyone who wears the red and white string will be powerful and healthy for the coming year. The martisor is worn for 12 days. \n\n Moldova's celebration is very similar to that of Romania, except that people give each other a gold or silver brooch on a red and white string, which they pin to their lapel. After 12 days, traditionally, they buy sweet cheese (in olden times they used the medal to purchase the cheese), in the belief that their faces would be beautiful and white for the year to come. \n\n In Greece, people braid bracelets called martis from red and white string and give them out to children on 1st of March. Folklore states that if children wear the martis the sun of early spring will not burn their faces. The bracelet is symbolic of rosy cheeks and a white complexion. Martis are worn until the midnight mass of the Greek Orthodox Easter. On this day, bonfires are lit and the bracelets are removed and thrown into the fires."
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 70, width, "left")
  elseif self.level == 8 then
    local levelText = "Thank you for playing Martenitsa!"
    love.graphics.printf(levelText, getCenteredHorizontalPosition(width), 70, width, "center")
  end

  love.graphics.setColor(1, 1, 1)
  Buttons:draw()
  drawBorders()
end

function Info:keyreleased(key, code)
  Buttons:keyreleased(key, code)
end
