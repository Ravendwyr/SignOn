-- Russian localization file for ruRU by Yuris Auzinsh (Zuz666).
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "ruRU")
if not L then return end

L["(.-) has gone offline"] = "(.-) выходит из игрового мира."
L["<Friend> &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Друг> &name:random &alts:bracket [&level &class:class] вышел:red &note:bracket"
L["<Friend> &name:random &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = "<Друг> &name:random &alts:bracket [&level &class:class] зашел:green в &zone &note:bracket"
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = "<Гильдия> &rank &name:random &alts:bracket [&level &class:class] зашел:green в &zone &note:bracket"
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Гильдия> &rank &name:random &alts:bracket [&level &class:class] вышел:red &note:bracket"
L["|Hplayer:(.-)|h.-|h has come online"] = "|Hplayer:(.-)|h.-|h входит в игру."
L["DEATHKNIGHT"] = "Рыцарь смерти"
L["DRUID"] = "Друид"
L["Format string for when friends log off"] = "Шаблон сообщения для случая, когда друг выходит из игрового мира"
L["Format string for when friends sign on"] = "Шаблон сообщения для случая, когда друг входит в игровой мир"
L["Format string for when guild members log off"] = "Шаблон сообщения для случая, когда согильдиец входит в игровой мир"
L["Format string for when guild members sign on"] = "Шаблон сообщения для случая, когда согильдиец выходит из игрового мира"
L["Friend Log-off Message"] = "Сообщение выхода из игры друга"
L["Friend Log-on Message"] = "Сообщение входа в игру друга"
L["Guild Log-off Message"] = "Сообщение выхода из игры согильдийца"
L["Guild Log-on Message"] = "Сообщение выхода в игру согильдийца"
L["has come online"] = "входит в игру."
L["has gone offline"] = "выходит из игрового мира."
L["HUNTER"] = "Охотница"
L["MAGE"] = "Маг"
L["PALADIN"] = "Паладин"
L["PRIEST"] = "Жрица"
L["ROGUE"] = "Разбойница"
L["SHAMAN"] = "Шаманка"
L["Tutorial"] = "Строки могут сождержать контектсные тэги, цветовые флаги и прочие символы.\
Контектсные тэги: &name, &level, &class, &alts, &zone, &rank, и &note.\
Цветовые флаги - :random, :class, :green, :red, :blue, :pink, :cyan, :yellow, и :orange.\
Флаг :random ведёт себя аналогично правилам Prat-3.0 для 'random'.\
Например, &name:class быдут выглядеть как %s.\
Все прочее символы трактуются как часть сообщения."
L["WARLOCK"] = "Чернокнижница"
L["WARRIOR"] = "Воин"
