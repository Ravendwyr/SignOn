-- French localization file for frFR
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "frFR")
if not L then return end

L["Format string for when friends log off."] = "Format de la chaine de déconnexion d'un ami."
L["Format string for when friends sign on."] = "Format de la chaine de connexion d'un ami."
L["Format string for when guild members log off."] = "Format de la chaine de déconnexion d'un membre de la guilde."
L["Format string for when guild members sign on."] = "Format de la chaine de connexion d'un membre de la guilde."
L["Friend Log-off Message"] = "Message de déconnection d'un ami"
L["Friend Log-on Message"] = "Message de connection d'un ami"
L["<Friend> &name &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Friend> &name &alts:bracket [&level &class:class] vient de se:red déconnecter:red &note:bracket"
L["<Friend> &name &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = "<Friend> &name &alts:bracket [&level &class:class] vient de se:green connecter:green in &zone &note:bracket"
L["Guild Log-off Message"] = "Message de déconnection d'un membre de la guilde"
L["Guild Log-on Message"] = "Message de connection d'un membre de la guilde"
L["<Guild> &rank &name &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = "<Guild> &rank &name &alts:bracket [&level &class:class] vient de se:green connecter:green in &zone &note:bracket"
L["<Guild> &rank &name &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<Guild> &rank &name &alts:bracket [&level &class:class] vient de se:red déconnecter:red &note:bracket"
L["Chat Frame"] = "Chat Frame" -- needs review
L["Select the Chat Frame the message should appear in."] = "Select the Chat Frame the message should appear in." -- needs review
L["has come online"] = "vient de se connecter"
L["(.-) has gone offline"] = "(.-) vient de se déconnecter"
L["has gone offline"] = "vient de se déconnecter"
L["|Hplayer:(.-)|h.-|h has come online"] = "|Hplayer:(.-)|h.-|h vient de se connecter"
L["Tutorial"] = "Strings can contain tags, flags and any other characters.\
Acceptable tags are &name, &level, &class, &alts, &zone, &rank, and &note.\
Acceptable colour flags are :random, :custom, :class, :green, :red, :blue, :pink, :cyan, :yellow, :white, and :orange.\
Acceptable bracket flags are :bracket, :square, and :angle.\
:random produces a trully random colour every time.\
:custom is a colour you choose using the swatch below the messages.\
For example, &name:class:square would become %s.\
Anything else will be assumed to be part of the message." -- needs review
