-- Russian localization file for ruRU by Yuris Auzinsh (Zuz666).
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "ruRU")
if not L then return end

L["(.-) has gone offline"] = "(.-) выходит из игрового мира." -- pattern
L["<Friend> &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Друг> &name:random &alts:bracket [&level &class:class] вышел:red &note:bracket"
L["<Friend> &name:random &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = "<Друг> &name:random &alts:bracket [&level &class:class] зашел:green в &zone &note:bracket"
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = "<Гильдия> &rank &name:random &alts:bracket [&level &class:class] зашел:green в &zone &note:bracket"
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Гильдия> &rank &name:random &alts:bracket [&level &class:class] вышел:red &note:bracket"
L["|Hplayer:(.-)|h.-|h has come online"] = "|Hplayer:(.-)|h.-|h входит в игру." -- pattern
L["Death Knight"] = "Рыцарь смерти" -- class male
L["DEATH KNIGHT"] = "Рыцарь смерти" -- class female
L["Druid"] = "Друид" -- class male  
L["DRUID"] = "Друид" -- class female
L["Format string for when friends log off"] = "Шаблон сообщения для случая, когда друг выходит из игрового мира" -- tooltip
L["Format string for when friends sign on"] = "Шаблон сообщения для случая, когда друг входит в игровой мир" -- tooltip
L["Format string for when guild members log off"] = "Шаблон сообщения для случая, когда согильдиец входит в игровой мир" -- tooltip
L["Format string for when guild members sign on"] = "Шаблон сообщения для случая, когда согильдиец выходит из игрового мира" -- tooltip
L["Friend Log-off Message"] = "Сообщение выхода из игры друга" -- options item
L["Friend Log-on Message"] = "Сообщение входа в игру друга"  -- options item
L["Guild Log-off Message"] = "Сообщение выхода из игры согильдийца" -- options item
L["Guild Log-on Message"] = "Сообщение выхода в игру согильдийца" -- options item
L["has come online"] = "входит в игру." -- pattern
L["has gone offline"] = "выходит из игрового мира." -- pattern
L["Hunter"] = "Охотник"  -- class male  
L["HUNTER"] = "Охотница" -- class female
L["Mage"] = "Маг" -- class male  
L["MAGE"] = "Маг" -- class female
L["Paladin"] = "Паладин" -- class male  
L["PALADIN"] = "Паладин" -- class female
L["Priest"] = "Жрец"  -- class male  
L["PRIEST"] = "Жрица" -- class female
L["Rogue"] = "Разбойник"  -- class male  
L["ROGUE"] = "Разбойница" -- class female
L["Shaman"] = "Шаман"   -- class male  
L["SHAMAN"] = "Шаманка" -- class female
L["Tutorial"] = "Строки могут сождержать контектсные тэги, цветовые флаги и прочие символы.\
Контектсные тэги: &name, &level, &class, &zone, &rank, и &note.\
Цветовые флаги - :random, :class, :green, :red, :blue, :pink, :cyan, :yellow, и :orange.\
Флаг :random ведёт себя аналогично правилам Prat-3.0 для 'random'.\
Например, &name:class быдут выглядеть как %s.\
Все прочее символы трактуются как часть сообщения." -- description
L["Warlock"] = "Чернокнижник"  -- class male  
L["WARLOCK"] = "Чернокнижница" -- class female
L["Warrior"] = "Воин" -- class male  
L["WARRIOR"] = "Воин" -- class female

