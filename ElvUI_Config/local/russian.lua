﻿local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvuiConfig", "ruRU")
if not L then return end

--Copy the entire english file here and set values = to something
--[[
	Where it says:
	L["Auto Scale"] = true
	
	That just means thats default, you can still set it to say something else like this
	L["Auto Scale"] = "Blah blah, speaking another language, blah blah"
	
	You can post the file here for it to be added to default ElvUI files: http://www.tukui.org/forums/forum.php?id=88
	
	Credit: Ametko
]]

--General
L["General Settings"] = "Основные настройки"
	L["ELVUI_DESC"] = "Аддон, заменяющий пользовательский интерфейс в World of Warcraft."
	L["Auto Scale"] = "Автомасштабирование"
		L["Automatically scale the User Interface based on your screen resolution"] = "Автоматическое масштабирование интерфейса, основанное на Вашем разрешении экрана"
	L["Scale"] = "Масштабирование"
		L["Controls the scaling of the entire User Interface"] = "Ручное масштабирование интерфейса, контролируемое пользователем"
	L["Multisample Protection"] = "Защита сглаживания"
		L["Force the Blizzard Multisample Option to be set to 1x. WARNING: Turning this off will lead to blurry borders"] = "Устанавливает опцию <Сглаживание> на 1x. ВНИМАНИЕ: Выключение этой функции сделает окантовку фреймов расплывчатой"
	L["Class Color Theme"] = "Тема: цвет класса"
		L["Style all frame borders to be your class color, color unitframes to class color"] = "Окрашивает все фреймовые окантовки в цвет вашего класса."
	L["Font Scale"] = "Размер шрифта"
		L["Set the font scale for everything in UI. Note: This doesn't effect somethings that have their own seperate options (UnitFrame Font, Datatext Font, ect..)"] = "Устанавливает размер основного шрифта в интерфейсе. Примечание: эта опция не действует на шрифты, имеющие собственные настройки (Рамки юнитов, Дата-текст и прочее)"
	L["Resolution Override"] = "Замена разрешения"
		L["Set a resolution version to use. By default any screensize > 1440 is considered a High resolution. This effects actionbar/unitframe layouts. If set to None, then it will be automatically determined by your screen size"] = "Устанавливает используемую версию разрешения. По умолчанию любое разрешение выше 1440 является Высоким. Эта опция действует на рамки юнитов/панели действий. Чтобы использовать автоматическую настройку разрешения поставьте в этой опции <Нет>"
		L["Low"] = "Низкое"
		L["High"] = "Высокое"
		L["None"] = "Нет"
	L["Layout Override"] = "Тип раскладки"
		L["Force a specific layout to show."] = "Включает специальную раскладку"
		L["DPS"] = "ДПС/Танк"
		L["Heal"] = "Лекарь"
	L["Sharp Borders"] = "Острые края"
		L["Enhance the borders on all frames by making a dark outline around the edges. You will probably need to disable this if you do not play in your monitors max resolution."] = "Улучшает окантовки всех фреймов, добавляя им темную линию по краям. Рекомендуется отключить эту опцию, если вы не играете на максимальном разрешении вашего монитора."
	L["Upper Frame"] = "Верхняя панель"
		L["Enable a bar accross the top of the screen, doing this will move the location and coords texts to that bar, and also allow for spaces nine and ten of the datatexts to be used."] = "Активирует панель сверху экрана, куда перемещается отображение текущей локации и координаты и добавляет новые места для размещения дата-текстов."
	L["Lower Frame"] = "Нижняя панель"
		L["Enable a bar accross the bottom of the screen, mostly for decoration."] = "Активирует панель снизу экрана. Больше используется в декоративных целях."

--Media
L["Media"] = "Оформление"
	L["MEDIA_DESC"] = "Настраивает текстуры, цвета и звуки для ElvUI"
	L["Fonts"] = "Шрифты"
		L["Font"] = "Шрифт"
			L["The font that the core of the UI will use"] = "Основной шрифт ElvUI"
		L["UnitFrame Font"] = "Шрифт рамок юнитов"
			L["The font that unitframes will use"] = "Шрифт, используемый в рамках юнитов"
		L["Combat Text Font"] = "Шрифт текста боя"
			L["The font that combat text will use. WARNING: This requires a game restart after changing this option."] = "Шрифт, используемый для отображения текста боя. ВНИМАНИЕ: Требуется перезагрузка игры после изменения этой опции"
	L["Textures"] = "Текстуры"
		L["StatusBar Texture"] = "Текстура статус-панелей"
			L["Texture that gets used on all StatusBars"] = "Текстура, используемая во всех статус-панелях"
		L["Gloss Texture"] = "Глянцевая текстура"
			L["This gets used by some objects, unless gloss mode is on."] = "Текстура, используемая в некоторых объектах, если включен глянцевый режим текстур."
		L["Glow Border"] = "Светящиеся окантовки"
			L["Shadow Effect"] = "Эффект тени"
		L["Backdrop Texture"] = "Текстура фона"
			L["Used on almost all frames"] = "Используется во всех фреймах"
		L["Glossy Texture Mode"] = "Глянцевый режим текстур"
			L["Glossy texture gets used in all aspects of the UI instead of just on various portions."] = "Глянцевые текстуры используются во всех аспектах интерфейса"
	L["Colors"] = "Цвета"
		L["Border Color"] = "Цвет окантовки"
			L["Main Frame's Border Color"] = "Цвет окантовки основных фреймов"
		L["Backdrop Color"] = "Цвет фона"
			L["Main Frame's Backdrop Color"] = "Цвет фона основных фреймов"
		L["Backdrop Fade Color"] = "Обесцвеченный фон"
			L["Faded backdrop color of some frames"] = "Цвет обесцвеченного фона некоторых фреймов"
		L["Value Color"] = "Цвет данных"
			L["Value color of various text/frame objects"] = "Цвет данных многих текстов/фреймов"
	L["Sounds"] = "Звуки"
		L["Whisper Sound"] = "Звук шепота"
			L["Sound that is played when recieving a whisper"] = "Звук, оповещающий о пришедшем личном сообщении"
		L["Warning Sound"] = "Звук тревоги"
			L["Sound that is played when you don't have a buff active"] = "Звук, оповещающий о том, что вы не имеете на себе своего бафа"

--Nameplates
L["Nameplates"] = "Индикаторы здоровья"
	L["NAMEPLATE_DESC"] = "Настроить индикаторы здоровья ElvUI"
	L["Nameplate Options"] = "Опции индикаторов здоровья"
		L["Enable/Disable Nameplates"] = "Включить/выключить индикаторы здоровья"
	L["Show Health"] = "Отображать здоровье"
		L["Display health values on nameplates, this will also increase the size of the nameplate"] = "Отображать значения здоровья на индикаторах, эта опция также увеличит размер индикаторов здоровья"
	L["Health Threat Coloring"] = "Окраска по уровню угрозы"
		L["Color the nameplate's healthbar by your current threat, Example: good threat color is used if your a tank when you have threat, opposite for DPS."] = "Окрашивает полосу здоровья индикаторов в цвет вашей угрозы. Например: цвет хорошей угрозы отображается, если вы танк и имеете много угрозы на данной цели, наоборот для ДПС"
	L["Toggle Combat"] = "Только в бою"
		L["Toggles the nameplates off when not in combat."] = "Отключать индикаторы здоровья, когда вы не находитесь в бою"
	L["Track Auras"] = "Отображать дебаффы"
		L["Tracks your debuffs on nameplates."] = "Отображать ваши дебаффы на индикаторах здоровья."
	L["Track CC Debuffs"] = "Отображать CC дебаффы"
		L["Tracks CC debuffs on nameplates from you or a friendly player"] = "Отображать CC дебаффы на вашем индикаторе здоровья или на индикаторах союзников"
	L["Good Color"] = "Хороший цвет угрозы"
		L["This is displayed when you have threat as a tank, if you don't have threat it is displayed as a DPS/Healer"] = "Если вы имеете угрозу будучи танком, то показывает этот цвет, или если вы не имеете угрозы в качестве ДПС/Лекаря"
	L["Bad Color"] = "Плохой цвет угрозы"
		L["This is displayed when you don't have threat as a tank, if you do have threat it is displayed as a DPS/Healer"] = "Если вы не имеете угрозу будучи танком, то показывает этот цвет, или если вы имеете угрозу в качестве ДПС/Лекаря"
	L["Transition Color"] = "Переходный цвет"
		L["This color is displayed when gaining/losing threat"] = "Такой цвет используется, когда вы набираете/теряете угрозу"
	L["Allow Overlap"] = "Разрешать наложение индикаторов друг на друга"

--Unitframes
L["Unit Frames"] = "Рамки юнитов"
	L["UF_DESC"] = "Позволяет настроить рамки юнитов"
	L["Enable Unitframes"] = "Активировать рамки юнитов"
		L["Controls the size of the unitframe font"] = "Установить размер шрифта для рамок юнитов"
	L["Low Mana Threshold"] = "Низкий порог маны"
		L["Point to warn about low mana"] = "Количество маны, при котором вас оповестят о ее низком количестве"
	L["Target Power on Player Only"] = "Энергия цели только для игроков"
		L["Only display power values on player units"] = "Показывает значение энергии цели только, если целью управляет игрок"
	L["Focus's Target"] = "Цель фокуса"
		L["Display the focus unit's target"] = "Отображать цель фокуса"
	L["Pet's Target"] = "Цель питомца"
		L["Display the pet unit's target"] = "Отображать цель питомца"
	L["Total HP/MP"] = "Максимальное значение здоровья/маны"
		L["Display the total HP/MP on all available units"] = "Отображать максимальное значение здоровья/маны для всех доступных юнитов"
	L["Smooth Bars"] = "Плавные панели"
		L["Smoothly transition statusbars when values change"] = "Плавное изменение длины статус-панелей при изменении значений"
	L["Character Portrait"] = "Портрет персонажа"
		L["Display character portrait on available frames"] = "Отображать портрет персонажа на всех доступных фреймах"
	L["Character Portrait on Health"] = "Портреты персонажа на полосе здоровья"
		L["Overlay character portrait on the healthbar available frames"] = "Отображать прозрачный портрет персонажа на полосе здоровья рамки юнита"
	L["Class Color"] = "Цвета класса"
		L["Color unitframes by class"] = "Окрашивать рамки юнитов по классу"
	L["Health Color"] = "Цвет здоровья"
		L["Color of the healthbar"] = "Окрашивать рамки юнитов по количеству здоровья"
	L["Color Health by Value"] = "Окрашивать здоровье по значению"
		L["Color the health frame by current ammount of hp remaining"] = "Окрашивать полосу здоровья по текущему здоровью"
	L["Custom Backdrop Color"] = "Нестандартный цвет фона"
		L["Enable using the custom backdrop color, otherwise 20% of the current health color gets used"] = "Использует нестандартный цвет фона, после того как здоровья остается меньше 20%"
	L["Health Backdrop Color"] = "Цвет фона полосы здоровья"
		L["Color of the healthbar's backdrop"] = "Цвет фона полосы здоровья"
	L["Combat Feedback"] = "Текст боя на рамках"
		L["Enable displaying incoming damage/healing on player/target frame"] = "Отображать входящий урон/лечение на рамках игрока/цели"
	L["Debuff Highlighting"] = "Подсветка дебаффов"
		L["Enable highlighting unitframes when there is a debuff you can dispel"] = "Активирует подсвечивание рамок юнитов, когда вы можете сдиспеллить дебафф"
	L["ClassBar"] = "Панель энергии класса"
		L["Display class specific bar (runebar/totembar/holypowerbar/soulshardbar/eclipsebar)"] = "Отображать особую панель энергии класса (руны/тотемы/сила света/осколки души/затмение)"
	L["Combat Fade"] = "Прятать вне боя"
		L["Fade main unitframes out when not in combat, unless you cast or mouseover the frame"] = "Скрывать рамки юнитов вне боя, за исключением произнесения заклинаний и наведения мышкой на фреймы"
	L["Powerbar Offset"] = "Отступ панели энергии"
		L["Detach and offset the power bar on the main unitframes"] = "Открепить полосу энергии от рамок юнитов и поместить их с отступом от самой рамки"
	L["Mini-Powerbar Theme"] = "Тема мини-панели энергии"
		L["Style the unitframes with a smaller powerbar"] = "Стилизует рамки юнитов, делая панель энергии меньше"
	L["Arena Frames"] = "Фреймы арены"
	L["Boss Frames"] = "Фреймы боссов"
	L["Swing Bar"] = "Панель мили-ГКД"
		L["Bar that displays time between melee attacks"] = "Панель, показывающая время между мили-атаками"
	L["Display Aggro"] = "Отображать угрозу"
		L["Enable red glow around the player frame when you have aggro"] = "Отображать красное свечение вокруг фрейма игрока, если на вас находится вся угроза цели"
		L["Change the frame's border to red when a unit has aggro"] = "Менять цвет окантовки фрейма на красный, если юнит имеет угрозу"

L["Frame Sizes"] = "Размеры фреймов"
	L["Controls the size of the frame"] = "Настроить размеры фреймов"
	L["Player/Target Width"] = "Ширина фрейма игрока/цели"
	L["Player/Target Height"] = "Высота фрейма игрока/цели"
	L["TargetTarget, Focus, FocusTarget, Pet Width"] = "Ширина фреймов: цель цели, фокус, цель фокуса, питомец"
	L["TargetTarget, Focus, FocusTarget, Pet Height"] = "Высота фреймов: цель цели, фокус, цель фокуса, питомец"
	L["Arena/Boss Height"] = "Высота фреймов арены и боссов"
	L["Arena/Boss Width"] = "Ширина фреймов арены и боссов"
	L["Assist/Tank Width"] = "Ширина фреймов танка и помощника"
	L["Assist/Tank Height"] = "Высота фреймов танка и помощника"

L["Auras"] = "Ауры"
	L["Player Auras"] = "Ауры игрока"
		L["Display auras on frame"] = "Отображать ауры на фрейме"
	L["Hide Player's Buffs"] = "Прятать баффы игрока"
		L["Don't display player's buffs"] = "Не Отображать баффы игрока"
	L["Target Auras"] = "Ауры цели"
	L["Player's Debuffs Only"] = "Только дебаффы игрока"
		L["Only display debuffs on the targetframe that are from yourself"] = "Отображать на фрейме цели только дебаффы, наложенные вами"
	L["Aura Timer"] = "Таймеры аур"
		L["Display aura timer"] = "Отображать таймеры аур"
	L["Aura Text Scale"] = "Размер шрифта аур"
		L["Controls the size of the aura font"] = "Установить размер шрифта аур"
	L["Arena Debuff Filter"] = "Фильтр дебаффов арены"
		L["Enable filter for arena debuffs"] = "Включить фильтр дебаффов арены"
	L["TargetTarget Debuffs"] = "Дебаффы цели цели"
	L["Focus Debuffs"] = "Дебаффы фокуса"
	L["Player/Target Auras in Row"] = "Ауры игрока/цели в ряду"
		L["The ammount of auras displayed in a single row"] = "Количество аур, размещающихся в одном ряду"
	L["Small Frames Auras in Row"] = "Уменьшенные фреймы в ряду"
	L["Raid Buff Display Size"] = "Размер рейдовых баффов"

L["Castbar"] = "Полоса каста"
	L["Enable/Disable Castbars"] = "Включить/Выключить полосы каста"
	L["Castbar Latency"] = "Задержка полосы каста"
		L["Show latency on player castbar"] = "Отображать задержку на полосе каста игрока"
	L["Castbar Icons"] = "Иконки способностей"
		L["Show icons on castbars"] = "Отображать иконки на полосе каста"
	L["Width Player Castbar"] = "Ширина полосы каста игрока"
	L["Width Target Castbar"] = "Ширина полосы каста цели"
	L["Width Focus Castbar"] = "Ширина полосы каста фокуса"
		L["The size of the castbar"] = "Размер полосы каста"
	L["Castbar Color"] = "Цвет полосы каста"
	L["Color of the castbar"] = "Цвет полосы каста"
	L["Interrupt Color"] = "Цвет прерывания"
	L["Color of the castbar when you can't interrupt the cast"] = "Цвет полосы каста, когда вы прерываете его произнесение"

L["Power Colors"] = "Цвета энергий"
	L["Mana"] = "Мана"
	L["Rage"] = "Ярость"
	L["Focus"] = "Концентрация"
	L["Energy"] = "Энергия"
	L["Runic Power"] = "Сила рун"

--Raidframe
L["Raid Frames"] = "Рейд фреймы"
	L["Enable Raidframes"] = "Включить рейд фреймы"
	L["RF_DESC"] = "Позволяет настроить рейд фреймы"
	L["Size of the buff icon on raidframes"] = "Размер иконки баффа на рейд фреймах"
	L["Raid Buff Display"] = "Отображение баффов"
		L["Display special buffs on raidframes"] = "Отображать особые бафы на рейд фреймах"
	L["Fade with Range"] = "Затенять при отдалении"
		L["Fade the unit out when they become out of range"] = "Затеняет юнит в рейд фрейме, когда тот уходит из поля досягаемости"
	L["Incoming Heals"] = "Входящее исцеление"
		L["Show predicted incoming heals"] = "Показывает входящее исцеление"
	L["Out of Range Alpha"] = "Прозрачность при отдалении"
	L["Incoming Heals"] = "Входящее исцеление"
		L["Show predicted incoming heals"] = "Показывает входящее исцеление"
	L["Vertical Healthbar"] = "Вертикальные полосы здоровья"
		L["Healthbar grows vertically instead of horizontally"] = "Полосы здоровья устанавливаются вертикально, а не горизонтально, как обычно"
	L["Player In Party"] = "Игрок в группе"
		L["Show the player frame in the party layout"] = "Показывает игрока в группе/рейде"
	L["Maintank"] = "Главный танк"
	L["Mainassist"] = "Главный помощник"
		L["Display unit"] = "Показать юнит"
	L["Party Pets"] = "Питомцы группы"
	L["Disable Blizzard Frames"] = "Отключить оригинальные фреймы Blizzard"
	L["Health Deficit"] = "Дефицит здоровья"
		L["Display health deficit on the frame"] = "Отображать сколько здоровья не хватает до 100% на фрейме"
	L["DPS GridMode"] = "Включить режим Grid для ДПС"
		L["Show the DPS layout in gridmode instead of vertical"] = "Показывает в ДПС раскладке режим Grid, а не вертикальный, как обычно"
	L["Role"] = "Роль"
		L["Show the unit's role (DPS/Tank/healer) Note: Party frames always show this"] = "Показывает роль игрока (ДПС/Танк/Лекарь). Примечание: Фреймы группы всегда показывают это"
	L["Party Target's"] = "Цели участников группы"
	L["Mouse Glow"] = "Свечение при наведении"
		L["Glow the unitframe to the unit's Reaction/Class when mouseover'd"] = "Подсвечивает фреймы, основываясь на отношении/классе игрока при наведении мыши"
	L["25 Man Layout Party"] = "Раскладка группы: 25 человек"
		L["Use the 25 man layout inside a party group"] = "Использовать раскладку рейда в 25 человек для группы"

--Classtimer
L["Class Timers"] = "Таймеры класса"
	L["CLASSTIMER_DESC"] = "Позволяет настроить таймеры класса"
	L["Enable Class Timers"] = "Включить таймеры класса"
	L["Bar Height"] = "Высота панели"
		L["Controls the height of the bar"] = "Настроить высоту панели"
	L["Bar Spacing"] = "Расстояние между панелями"
		L["Controls the spacing in between bars"] = "Настроить расстояние между панелями."
	L["Icon Position"] = "Позиция иконки"
		L["0 = Left\n1 = Right\n2 = Outside Left\n3 = Outside Right"] = "0 = Слева\n1 = Справа\n2 = Снаружи слева\n3 = Снаружи справа"
	L["Layout"]	 = "Расположение"
		L["LAYOUT_DESC"] = "1 - И цели, и игрока в одном фрейме справа от фрейма игрока\n2 - Фреймы игрока и цели разделены на два фрейма\n3 - Фреймы игрока, цели и аксессуаров разделены на три фрейма\n4 - Фреймы игрока и аксессуаров в одном фрейме над фреймом игрока, а фрейм цели над фреймом цели\n5 - Все над фреймом игрока, без дебаффов цели."
	L["Spark"] = "Вспышка"
		L["Display spark"] = "Отображать вспышку"
	L["Cast Seperator"] = "Разделитель каста"
	L["Buff"] = "Бафф"
	L["Debuff"] = "Дебафф"
	L["Proc"] = "Прок"

--Actionbar
L["Action Bars"] = "Панели действий"
	L["AB_DESC"] = "Позволяет настроить панели действий и текст перезарядки на них"
	L["Hotkey Text"] = "Горячие клавиши"
		L["Display hotkey text on action buttons"] = "Отображать текст горячих клавиш на кнопках действий"
	L["Right Bar on Mouseover"] = "Правая панель при наведении мыши"
		L["Hide the right action bar unless mouseovered"] = "Прятать панель справа экрана, если на нее не наведена мышь"
	L["Shape Shift Bar"] = "Панель стоек"
		L["Hide the shape shift action bar"] = "Спрятать панель стоек"
	L["Shape Shift on Mouseover"] = "Панель стоек при наведении мыши"
		L["Hide the shape shift action bar unless mouseovered"] = "Прятать панель стоек, если на нее не наведена мышь"
	L["Vertical Shape Shift"] = "Вертикальная панель стоек"
		L["Make the shape shift bar grow vertically instead of horizontally"] = "Делает панель стоек вертакальной, а не горизонтальной, как обычно"
	L["Display Grid"] = "Сетка"
		L["Display grid backdrop behind empty buttons"] = "Всегда отображать сетку на фоне пустых кнопок"
	L["Pet Bar below main actionbar"] = "Панель питомца над главной панелью"
		L["Positions the pet bar below the main actionbar instead of to the right side of the screen"] = "Позиционирует панель питомца над главной панелью действий, а не справа экрана, как обычно"
	L["Button Size"] = "Размер кнопок"
	L["Button Spacing"] = "Расстояние между кнопками"
	L["Pet Button Size"] = "Размер кнопок питомца"
	L["Main actionbar on top"] = "Главная панель выше"
		L["Positions the main actionbar above all other actionbars"] = "Позиционирует главную панель действий выше остальных панелей"
	L["Macro Text"] = "Текст макросов на кнопкаъ"
	L["Micro Bar"] = "Микро-панель"
		L["Display blizzards default microbar, this will disable the right click menu on minimap"] = "Отображать стандартную микро-панель, эта опция отключит меню по клику на мини-карту"
	L["Micro Bar on Mouseover"] = "Микро-панель при наведении мыши"
		L["Display blizzards default microbar when mouseovered"] = "Отображать стандартную микро-панель только при наведении мыши"
	L["Cooldown Text"] = "Текст перезарядки"
	L["Threshold"] = "Отсчет"
		L["Threshold before turning text red and displaying decimal places"] = "Остаток времени перезарядки умения, при котором начинают отображаться доли секунд"
	L["Expiring"] = "Финальный отсчет"
		L["This gets displayed when your below the threshold"] = "Финальный отсчет времени перезарядки с показом долей секунд"
	L["Seconds"] = "Секунды"
	L["Minutes"] = "Минуты"
	L["Hours"] = "Часы"
	L["Days"] = "Дни"

--Datatext
L["Data Texts"] = "Дата-текст"
	L["DATATEXT_DESC"] = "Редактирование дата-текста на панелях"
	L["DATATEXT_POS"] = "\n\n0 - Выключено\n1 - Левая панель, слева\n2 - Левая панель, центр\n3 - Левая панель, справа\n4 - Правая панель, слева\n5 - Правая панель, центр\n6 - Правая панель, справа\n7 - Панель под мини-картой, слева\n8 - Панель под мини-картой, справа"
	L["DATATEXT_POS2"] = "\n\n0 - Выключено\n1 - Левая панель, слева\n2 - Левая панель, центр\n3 - Левая панель, справа\n4 - Правая панель, слева\n5 - Правая панель, центр\n6 - Правая панель, справа\n7 - Панель под мини-картой, слева\n8 - Панель под мини-картой, справа\n9 - Верхняя панель, слева\n10 - Верхняя панель, справа"
	L["Text Positions"] = "Позиции текста"
	L["Mastery Spell"] = "Специализация искусности"
		L["Display the mastery spell on the mastery datatext"] = "Отображать специализацию искусности на ее дата-тексте"
	L["BG Text"] = "Текст поля боя"
		L["Display special datatexts when inside a battleground"] = "Отображать особый дата-текст, когда вы находитесь на поле боя"
		L["Font size for datatexts"] = "Размер шрифта для дата-текста"
	L["24-Hour Time"] = "24-часовой режим времени"
		L["Display time datatext on a 24 hour time scale"] = "Отображать время в 24-часовом формате"
	L["Local Time"] = "Местное время"
		L["Display local time instead of server time"] = "Отображать местное время, вместо серверного"
		L["Color the datatext values based on your class"] = "Окрашивать дата-текст в цвет вашего класса"
	L["Stat #1"] = "Главная характеристика"
		L["Display stat based on your role (Avoidance-Tank, AP-Melee, SP/HP-Caster)"] = "Отображать вашу главную характеристику, базируясь на вашей роли (Для танка: Авойданс, Для мили-дпс: Сила атаки, Для кастеров и лекарей: Сила заклинаний)"
	L["Durability"] = "Прочность"
		L["Display your current durability"] = "Отображать текущую прочность ваших вещей"
	L["Stat #2"] = "Второстепенная характеристика"
		L["Display stat based on your role (Armor-Tank, Crit-Melee, Crit-Caster)"] = "Отображает вашу второстепенную характеристику, базируясь на вашей роли (Для танка: Броня, Для мили-дпс: Шанс крит. удара, Для кастеров: Шанс крит. удара)"
	L["System"] = "Системное"
		L["Display FPS and Latency"] = "Отображать FPS (кадры в секунду) и задержку"
	L["Time"] = "Время"
		L["Display current time"] = "Отображать текущее время"
	L["Gold"] = "Золото"
		L["Display current gold"] = "Отображать текущее количество золота"
	L["Guild"] = "Гильдия"
		L["Display current online people in guild"] = "Отображать текущий онлайн в гильдии"
	L["Friends"] = "Друзья"
		L["Display current online friends"] = "Отображать текущих друзей онлайн"
	L["Bags"] = "Сумки"
		L["Display ammount of bag space"] = "Отображать доступное место в сумках"
	L["DPS"] = "УВС"
		L["Display ammount of DPS"] = "Отображать текущий урон в секунду"
	L["HPS"] = "ИВС"
		L["Display ammount of HPS"] = "Отображать текущее исцеление в секунду"
	L["Currency"] = "Валюта"
		L["Display current watched items in backpack"] = "При нажатии на дата-текст открывает окно с вашей валютой (очки чести, справедливости и т.п.)"
	L["Talent Spec"] = "Специализация"
		L["Display current spec"] = "Отображать текущую специализацию"
	L["Mastery"] = "Искусность"
		L["Display Mastery Rating"] = "Отображать рейтинг искусности"
	L["Hit Rating"] = "Меткость"
		L["Display Hit Rating"] = "Отображать рейтинг меткости"
	L["Haste Rating"] = "Скорость"
		L["Display Haste Rating"] = "Отображать рейтинг скорости"
	L["Crit Rating"] = "Критический удар"
		L["Display Critical Strike Rating"] = "Отображать рейтинг критического удара"
	L["Mana Regen"] = "Восполнение маны"
		L["Display Mana Regen Rate"] = "Отображать количество восполняемой маны в секунду"

--chat
L["Chat"] = "Чат"
	L["CHAT_DESC"] = "Позволяет настроить чат"
		L["Play a sound when receiving a whisper, this can be set in media section"] = "Проигрывать звук при получении личного сообщения. Звук может быть настроен в разделе Оформление"
	L["Chat Backdrop"] = "Фон чата"
		L["Display backdrop panels behind chat window"] = "Отображать фоновую панель в окне чата"
	L["Chat Width"] = "Ширина чата"
		L["Width of chatframe"] = "Ширина окна чата"
	L["Chat Height"] = "Высота чата"
		L["Height of chatframe"] = "Высота окна чата"
	L["Fade Windows"] = "Затенять окна"
		L["Fade chat windows after a long period of no activity"] = "Затенять текст в окнах чата после долгого периода неактивности"
	L["Sticky Editbox"] = "Запомнить канал"
		L["When pressing enter to open the chat editbox, display the last known channel"] = "Когда вы нажимаете Enter для введения текста в окно чата, открывается последний запомненный канал"
	L["Toggle Chat In Combat"] = "Убирать чат в бою"
		L["When you enter combat, the selected window will toggle out of view"] = "Когда вы входите в режим боя, выбранное окно чата скрывается с экрана"
	L["Chat Bubbles"] = "Облачка сообщений"
		L["Skin Blizzard's Chat Bubbles"] = "Стилизует облочка сообщений в стиль ElvUI"
	L["Left"] = "Левое"
	L["Right"] = "Правое"
	L["Both"] = "Оба"

--tooltip
L["Tooltip"] = "Подсказка"
	L["TT_DESC"] = "Позволяет настроить подсказу"
	L["Hide Combat"] = "Прятать в бою"
		L["Hide tooltip when entering combat"] = "Прятать подсказку, когда вы входите в режим боя"
	L["Hide Combat in Raid"] = "Прятать в бою только в рейде"
		L["Hide tooltip when entering combat only inside a raid instance"] = "Прятать подсказку в бою, только если вы находитесь внутри рейдового подземелья"
	L["Hide Buttons"] = "Скрывать для кнопок"
		L["Hide tooltip when mousing over action buttons"] = "Не отображать подсказку, если вы навели мышь на кнопки действия"
	L["Hide Unit Frames"] = "Скрывать для рамок юнитов"
		L["Hide tooltip when mousing over unit frames"] = "Не отображать подсказку, если вы навели мышь на рамки юнитов"
	L["Cursor"] = "Подсказка под курсором мыши"
		L["Tooltip anchored to cursor"] = "Отображать подсказку под курсором мыши"
	L["Color Reaction"] = "Цвет реакции"
		L["Always color border of tooltip by unit reaction"] = "Всегда окрашивать окантовку подсказки, основываясь на отношении юнита к вам"
	L["ItemID"] = "ID предметов"
		L["Display itemid on item tooltips"] = "Отображать ID предметов в подсказке"
	L["Who's Targetting?"] = "Кто выбран?"
		L["Display if anyone in your party/raid is targetting the tooltip unit"] = "Отображать, кто выбран участниками вашей группы/рейда в подсказке"

--External Addons
L["Addon Skins"] = "Скины аддонов"
	L["ADDON_DESC"] = "Позволяет настроить скины отдельных аддонов"
	L["Enable this skin"] = "Включить данный скин"
	L["Embed Right"] = "Прикрепить вправо"
	L["EMBED_DESC"] = "Выбирает аддон, который будет прикреплен к правому окну чата. Подсказка никогда его не закроет, а переместится сама. Если у вас стоят настройки по автоматическому скрыванию правого окна чата, аддон останется на месте."
	L["Hook KLE Bars"] = "Прикрепить панели KLE"
	L["Attach KLE's Bars to the right window"] = "Прикрепить панели KLE к правому окну чата"
	L["Hook BigWigs Bars"] = "Прикрепить панели BigWings"
	L["Attach BigWigs's Bars to the right window"] = "Прикрепить панели BigWings к правому окну чата"

--Misc
L["Misc"] = "Прочее"
	L["MISC_DESC"] = "Настройка всех прочих опций"
	L["General"] = "Основное"
	L["PVP Autorelease"] = "Авто-выпускание духа в ПВП"
		L["Automatically release body when dead inside a bg"] = "Автоматически выпускает духа из тела, если вы умираете на Полях Боя"
	L["Hide Error Text"] = "Скрывать текст ошибок"
		L["Hide annoying red error text on center of screen"] = "Прятать любые красные тексты ошибок в центре экрана"
	L["Auto Accept Invite"] = "Автоприем приглашения в группу"
		L["Automatically accept invite when invited by a friend/guildie"] = "Автоматически принимает приглашение в группу от друзей/согильдийцев"
	L["Loot"] = "Добыча"
	L["Loot Frame"] = "Окно добычи"
		L["Skin loot window"] = "Стилизует окно добычи"
	L["Loot Roll Frame"] = "Окно раздела добычи"
		L["Skin loot roll window"] = "Стилизует окно раздела добычи"
	L["Auto Greed/DE"] = "Автоматические Не откажусь и Распылить"
		L["Automatically roll greed or Disenchant on green quality items"] = "Автоматически нажимать <Не откажусь> или <Распылить> на предметах необычного качества"
	L["Sell Grays"] = "Продавать серые предметы"
		L["Automatically sell gray items when visiting a vendor"] = "Автоматически продавать серые предметы из вашего рюкзака, когда вы разговариваете с торговцем"
	L["Auto Repair"] = "Авто-починка"
		L["Automatically repair when visiting a vendor"] = "Автоматически чинит все ваши предметы, когда вы разговариваете с торговцем"
	L["Combat"] = "Бой"
	L["Buff Reminder"] = "Напоминалка баффов"
		L["Icon at center of screen when you are missing a buff, or you have a buff you shouldn't have"] = "Иконка в центре экрана, когда вы забыли повесить бафф на себя"
	L["Buff Reminder Sound"] = "Звук напоминалки баффов"
		L["Play sound when icon is displayed"] = "Воспроизводить звук, когда иконка появляется в центре экрана"
	L["Raid Buffs Reminder"] = "Напоминалка о рейдовых баффах"
		L["Icons below minimap, displayed inside instances"] = "Иконки под мини-картой, отображающиеся внутри подземелья"
	L["Interrupt Announce"] = "Оповещать о прерывании"
		L["Announce when you interrupt a spell"] = "Оповещает группу, когда вы прерываете каст противника"
	L["Threat Display"] = "Отображение угрозы"
		L["Display threat in the bottomright panel"] = "Отображать вашу угрозу на цели на нижей правой панели во время боя"
	L["Minimap Auras"] = "Баффы/дебаффы у мини-карты"
		L["Display blizzard skinned auras by the minimap"] = "Отображать стилизованные баффы/дебаффы у мини-карты"
	L["All-In-One Bag"] = "Сумка Все-в-Одной"
		L["Enable/Disable the All-In-One Bag, you must disable this if you wish to run another bag addon"] = "Включение/выключение сумки Все-в-Одной, вы должны отключить эту опцию, если пользуетесь другим аддоном на сумки"
	L["Map Skin"] = "Скин карты"
		L["Enable/Disable the map skin"] = "Включает/выключает скин карты мира"
		
L["Filters"] = "Фильтры"
L["SPELL_FILTER_DESC"] = "Фильтр баффов/дебаффов на индикаторах здоровья."
	L["Aura Names"] = "Ауры"
	L["Nameplate Names"] = "Индикаторы здоровья"
	L["Choose Filter"] = "Выбрать фильтр"
		L["Choose the filter you want to modify."] = "Выбрать фильтр, который вы хотели бы изменить."
		L["Raid Debuffs"] = "Рейдовые дебаффы"
		L["Debuff Blacklist"] = "Черный список дебаффов"
		L["Debuff Whitelist"] = "Белый список дебаффов"
		L["Arena Buffs"] = "Баффы арены"
		L["Target Debuffs (PvP Only)"] = "Дебаффы цели (PvP)"
		L["Nameplate Blacklist"] = "Черный список индикаторов имен"
		
	L["Filter whether or not a nameplate is shown by the name of the nameplate"] = "Отметить, индикаторы здоровья каких противников не следует отображать"
	L["Filter the buffs that get displayed on arena units."] = "Фильтр баффов, которые будут отображены на фреймах арены"
	L["Set buffs that will never get displayed."] = "Установить, какие дебаффы никогда не будут отображены."
	L["These debuffs will always get displayed on the Target Frame, Arena Frames, and Nameplates."] = "Эти дебаффы будут отображаться всегда на фрейме цели, арены и индикаторах здоровья."
	L["These debuffs only get displayed on the target unit when the unit happens to be an enemy player."] = "Эти дебаффы будут отображаться только на цели-противнике."
	L["These debuffs will be displayed on your raid frames in addition to any debuff that is dispellable."] = "Эти дебаффы будут отображаться на ваших рейд фреймах в дополнение к любым дебаффам, которые можно сдиспеллить."
	
	L["New name"] = "Новое имя"
		L["Add a new name to the list."] = "Добавить новое имя в список"
	L["Remove name"] = "Удалить имя"
		L["Remove a name from the list."] = "Удалить имя из списка"
	L["You may only delete spells that you have added. Default spells can be disabled by unchecking the option"] = "Вы можете удалить только способности, которые добавили сами. Стандартные способности могут быть отключены."
	L["Spell not found in list"] = "Способность не найдена в списке"

--Profiles
L["Profiles"] = "Профили"
L["CFG_RELOAD"] = "Настройки, подверженные изменениям, требуют перезагрузки интефейса для применения эффекта, когда вы закончите настраивать интерфейс нажмите <Принять>."