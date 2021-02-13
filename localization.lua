-- MENU
localization = {}
localization.menu = {}
localization.menu.start = {}
localization.menu.start.en = "New Game"
localization.menu.start.bg = "Нова Игра"
localization.menu.continue = {}
localization.menu.continue.en = "Continue"
localization.menu.continue.bg = "Продължи"
localization.menu.survival = {}
localization.menu.survival.en = "Survival Mode"
localization.menu.survival.bg = "Безкрайна Игра"
localization.menu.scores = {}
localization.menu.scores.en = "Scores"
localization.menu.scores.bg = "Резултати"
localization.menu.controls = {}
localization.menu.controls.en = "Controls"
localization.menu.controls.bg = "Управление"
localization.menu.exit = {}
localization.menu.exit.en = "Exit"
localization.menu.exit.bg = "Изход"
localization.menu.menu = {}
localization.menu.menu.en = "Go to Menu"
localization.menu.menu.bg = "Меню"
localization.menu.level = {}
localization.menu.level.en = "Continue"
localization.menu.level.bg = "Продължи"
for i=1,LEVELS_AMOUNT do
  localization.menu[i] = {}
  localization.menu[i].en = i
  localization.menu[i].bg = i
end
localization.menu.switchLanguages = {}
localization.menu.switchLanguages.en = "Press           to change langauges"
localization.menu.switchLanguages.bg = "Натисни           за да смениш езика"
localization.menu.switchLanguagesPosition = {}
localization.menu.switchLanguagesPosition.en = 247
localization.menu.switchLanguagesPosition.bg = 268

-- CONTROLS
localization.controls = {}
localization.controls.move = {}
localization.controls.move.en = "Move the martenitsa with the arrows"
localization.controls.move.bg = "Движи мартеничката със стрелките"
localization.controls.gather = {}
localization.controls.gather.en = "Gather knots to get long enough to wrap it around the checkpoints"
localization.controls.gather.bg = "Събирай възелчетата за да станеш дълга и да се увеш около точките"
localization.controls.menu = {}
localization.controls.menu.en = "You can press M to go back to the menu"
localization.controls.menu.bg = "Натисни М, за да се върнеш в менюто"
localization.controls.reset = {}
localization.controls.reset.en = "Press R to reset the level when you are stuck"
localization.controls.reset.bg = "Натисни R за да започнеш нивото отначало"
localization.controls.pause = {}
localization.controls.pause.en = "To pause the level at any time press ESC"
localization.controls.pause.bg = "За да спреш нивото на пауза натисни ESC"

-- PAUSE
localization.pause = {}
localization.pause.title = {}
localization.pause.title.en = "PAUSE"
localization.pause.title.bg = "ПАУЗА"
localization.pause.continue = {}
localization.pause.continue.en = "Press                 again to continue"
localization.pause.continue.bg = "Натисни                 отново, за да продължиш"
localization.pause.continuePosition = {}
localization.pause.continuePosition.en = 583
localization.pause.continuePosition.bg = 562
localization.pause.menu = {}
localization.pause.menu.en = "If you want to go back to the menu press"
localization.pause.menu.bg = "Ако искаш да се върнеш на менюто, натисни"
localization.pause.menuPosition = {}
localization.pause.menuPosition.en = 800
localization.pause.menuPosition.bg = 820

-- TUTORIAL
localization.tutorial = {}
localization.tutorial.eat = {}
localization.tutorial.eat.en = "Eat the knots to grow longer."
localization.tutorial.eat.bg = "Хапвай възелчетата, за да растеш."
localization.tutorial.wrap = {}
localization.tutorial.wrap.en = "Wrap yourself around the checkoints to finish the level."
localization.tutorial.wrap.bg = "Увий се около точките, за да завършиш нивото."

-- SCORES
localization.scores = {}
localization.scores.level = {}
localization.scores.level.en = "Level"
localization.scores.level.bg = "Ниво"
localization.scores.high = {}
localization.scores.high.en = "High Scores"
localization.scores.high.bg = "Най-високи точки"
localization.scores.death = {}
localization.scores.death.en = "Death Count"
localization.scores.death.bg = "Брой неуспехи"
localization.scores.survival = {}
localization.scores.survival.en = "Survival"
localization.scores.survival.bg = "Безкрай"
