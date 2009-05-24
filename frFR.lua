-- French localization file for frFR
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "frFR")
if not L then return end

L["DEATHKNIGHT"] = "CHEVALIER DE LA MORT"
L["DRUID"] = "DRUID"
L["Format string for when friends log off"] = "Format de la chaine de déconnexion d'un ami"
L["Format string for when friends sign on"] = "Format de la chaine de connexion d'un ami"
L["Format string for when guild members log off"] = "Format de la chaine de déconnexion d'un membre de la guilde"
L["Format string for when guild members sign on"] = "Format de la chaine de connexion d'un membre de la guilde"
L["Friend Log-off Message"] = "Message de déconnection d'un ami"
L["Friend Log-on Message"] = "Message de connection d'un ami"
L["<Friend> &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Friend> &name:random &alts:bracket [&level &class:class] vient de se:red déconnecter:red &note:bracket"
L["<Friend> &name:random &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = "<Friend> &name:random &alts:bracket [&level &class:class] vient de se:green connecter:green in &zone &note:bracket"
L["Guild Log-off Message"] = "Message de déconnection d'un membre de la guilde"
L["Guild Log-on Message"] = "Message de connection d'un membre de la guilde"
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = "<Guild> &rank &name:random &alts:bracket [&level &class:class] vient de se:green connecter:green in &zone &note:bracket"
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Guild> &rank &name:random &alts:bracket [&level &class:class] vient de se:red déconnecter:red &note:bracket"
L["has come online"] = "vient de se connecter"
L["(.-) has gone offline"] = "(.-) vient de se déconnecter"
L["has gone offline"] = "vient de se déconnecter"
L["|Hplayer:(.-)|h.-|h has come online"] = "|Hplayer:(.-)|h.-|h vient de se connecter"
L["HUNTER"] = "CHASSEUR"
L["MAGE"] = "Mage"
L["PALADIN"] = "Paladin"
L["PRIEST"] = "Prêtre"
L["ROGUE"] = "VOLEUR"
L["SHAMAN"] = "CHAMAN"
L["Tutorial"] = [=[Les chaines peuvent contenir des tags, des balises ou d'autre joueurs.
Les tags correctes sont &name, &level, &class, &alts, &zone, &rank, et &note.
Les balises de couleur correctes sont :random, :custom, :class, :green, :red, :blue, :pink, :cyan, :yellow, :white, et :orange.
Les balises pour les prentheses sont :bracket, :square, et :angle.
:random suit les memes règles que l'option de colorisation des noms de joueurs de Prat-3.0.
:custom est une couleur que vous choisissez en utilisant la palette de couleur au-dessous des messages.
Par exemple, &name:class:square deviendrait %s.
Tous les autres caractères seront considéré comme des caractères a affiché.]=]
L["WARLOCK"] = "Démoniste"
L["WARRIOR"] = "Guerrier"
