-- German localization file for deDE
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "deDE")
if not L then return end

L["Format string for when friends log off."] = "Formatstring wenn Freunde ausloggen."
L["Format string for when friends sign on."] = "Formatstring wenn Freunde einloggen."
L["Format string for when guild members log off."] = "Formatstring wenn Gildenmitglieder ausloggen."
L["Format string for when guild members sign on."] = "Formatstring wenn Gildenmitglieder einloggen."
L["Friend Log-off Message"] = "Auslog-Nachricht für Freunde"
L["Friend Log-on Message"] = "Einlog-Nachricht für Freunde"
L["<Friend> &name &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Freund> &name &alts:bracket [&level &class:class] ist jetzt:red offline:red &note:bracket"
L["<Friend> &name &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = "<Freund> &name &alts:bracket [&level &class:class] ist jetzt:green offline:green in &zone &note:bracket"
L["Guild Log-off Message"] = "Auslog-Nachricht für die Gilde"
L["Guild Log-on Message"] = "Einlog-Nachricht für Freunde"
L["Chat Frame"] = "Chat Frame" -- needs review
L["Select the Chat Frame the message should appear in."] = "Select the Chat Frame the message should appear in." -- needs review
L["Custom Colour"] = "Custom Colour" -- needs review
L["Set the colour for the :custom colour flag."] = "Set the colour for the :custom colour flag." -- needs review
L["<Guild> &rank &name &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = "<Gilde> &rank &name &alts:bracket [&level &class:class] ist jetzt:green online:green in &zone &note:bracket"
L["<Guild> &rank &name &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Guild> &rank &name &alts:bracket [&level &class:class] ist jetzt:red offline:red &note:bracket"
L["has come online"] = "ist jetzt online"
L["has gone offline"] = "ist jetzt offline"
L["Tutorial"] = "Strings can contain tags, flags and any other characters.\
Acceptable tags are &name, &level, &class, &alts, &zone, &rank, and &note.\
Acceptable colour flags are :random, :custom, :class, :green, :red, :blue, :pink, :cyan, :yellow, :white, and :orange.\
Acceptable bracket flags are :bracket, :square, and :angle.\
:random produces a truly random colour every time.\
:custom is a colour you choose using the swatch below the messages.\
For example, &name:class:square would become %s.\
Anything else will be assumed to be part of the message." -- needs review
