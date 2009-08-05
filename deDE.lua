-- German localization file for deDE
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "deDE")
if not L then return end

L["DEATHKNIGHT"] = "TODESRITTER" -- Needs review
L["DRUID"] = "Druide"
L["Format string for when friends log off"] = "Formatstring wenn Freunde ausloggen"
L["Format string for when friends sign on"] = "Formatstring wenn Freunde einloggen"
L["Format string for when guild members log off"] = "Formatstring wenn Gildenmitglieder ausloggen"
L["Format string for when guild members sign on"] = "Formatstring wenn Gildenmitglieder einloggen"
L["Friend Log-off Message"] = "Auslog-Nachricht für Freunde"
L["Friend Log-on Message"] = "Einlog-Nachricht für Freunde"
L["<Friend> &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Freund> &name:random &alts:bracket [&level &class:class] ist jetzt:red offline:red &note:bracket"
L["<Friend> &name:random &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = "<Freund> &name:random &alts:bracket [&level &class:class] ist jetzt:green offline:green in &zone &note:bracket"
L["Guild Log-off Message"] = "Auslog-Nachricht für die Gilde"
L["Guild Log-on Message"] = "Einlog-Nachricht für Freunde"
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = "<Gilde> &rank &name:random &alts:bracket [&level &class:class] ist jetzt:green online:green in &zone &note:bracket"
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Guild> &rank &name:random &alts:bracket [&level &class:class] ist jetzt:red offline:red &note:bracket"
L["has come online"] = "ist jetzt online"
L["(.-) has gone offline"] = "(.-) ist jetzt offline"
L["has gone offline"] = "ist jetzt offline"
L["|Hplayer:(.-)|h.-|h has come online"] = "|Hplayer:(.-)|h.-|h ist jetzt online"
L["HUNTER"] = "Jäger"
L["MAGE"] = "Magier"
L["PALADIN"] = "Paladin"
L["PRIEST"] = "Priester"
L["ROGUE"] = "Schurke"
L["SHAMAN"] = "Schamane"
L["Tutorial"] = [=[Strings können Tags, Marker und beliebige andere Zeichen enthalten.
Akzeptierte Tags sind &name, &level, &class, &alts, &zone, &rank und &note.
Akzeptierte Farbmarker sind :random, :custom, :class, :green, :red, :blue, :pink, :cyan, :yellow, :white und :orange.
Akzeptierte Klammermarker sind :bracket, :square und :angle.
:random folgt den selben Regeln wie in Prat-3.0s 'random' Spielernamen-Farbeinstellungen.
:custom ist eine Farbe die unten im Feld ausgewählt werden kann.
Zum Beispiel: &name:class:square würde zu %s.
Alles andere wird als Teil der Benachrichtigung angesehen.]=]
L["WARLOCK"] = "Hexenmeister"
L["WARRIOR"] = "Krieger"
