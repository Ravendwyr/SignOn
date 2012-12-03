-- Russian localization file for ruRU, by Yuris Auzinsh (Zuz666).
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "ruRU")
if not L then return end

L["Format string for when friends log off."] = "Шаблон сообщения для случая, когда друг выходит из игрового мира."
L["Format string for when friends sign on."] = "Шаблон сообщения для случая, когда друг входит в игровой мир."
L["Format string for when guild members log off."] = "Шаблон сообщения для случая, когда согильдиец входит в игровой мир."
L["Format string for when guild members sign on."] = "Шаблон сообщения для случая, когда согильдиец выходит из игрового мира."
L["Friend Log-off Message"] = "Сообщение выхода из игры друга"
L["Friend Log-on Message"] = "Сообщение входа в игру друга"
L["<Friend> &name &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Друг> &name &alts:bracket [&level &class:class] вышел:red &note:bracket"
L["<Friend> &name &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = "<Друг> &name &alts:bracket [&level &class:class] зашел:green в &zone &note:bracket"
L["Guild Log-off Message"] = "Сообщение выхода из игры согильдийца"
L["Guild Log-on Message"] = "Сообщение выхода в игру согильдийца"
L["<Guild> &rank &name &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = "<Гильдия> &rank &name &alts:bracket [&level &class:class] зашел:green в &zone &note:bracket"
L["<Guild> &rank &name &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Гильдия> &rank &name &alts:bracket [&level &class:class] вышел:red &note:bracket"
L["Chat Frame"] = "Chat Frame" -- needs review
L["Select the Chat Frame the message should appear in."] = "Select the Chat Frame the message should appear in." -- needs review
L["has come online"] = "входит в игру."
L["(.-) has gone offline"] = "(.-) выходит из игрового мира."
L["has gone offline"] = "выходит из игрового мира."
L["|Hplayer:(.-)|h.-|h has come online"] = "|Hplayer:(.-)|h.-|h входит в игру."
L["Tutorial"] = "Strings can contain tags, flags and any other characters.\
Acceptable tags are &name, &level, &class, &alts, &zone, &rank, and &note.\
Acceptable colour flags are :random, :custom, :class, :green, :red, :blue, :pink, :cyan, :yellow, :white, and :orange.\
Acceptable bracket flags are :bracket, :square, and :angle.\
:random produces a trully random colour every time.\
:custom is a colour you choose using the swatch below the messages.\
For example, &name:class:square would become %s.\
Anything else will be assumed to be part of the message." -- needs review
