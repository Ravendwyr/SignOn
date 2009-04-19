-- English localization file for enUS and enGB
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "enUS", true)
if not L then return end

L["(.-) has gone offline"] = true
L["<Friend> &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = true
L["<Friend> &name:random &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = true
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = true
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = true
L["|Hplayer:(.-)|h.-|h has come online"] = true
L["DEATHKNIGHT"] = "DEATH KNIGHT"
L["DRUID"] = true
L["Format string for when friends log off"] = true
L["Format string for when friends sign on"] = true
L["Format string for when guild members log off"] = true
L["Format string for when guild members sign on"] = true
L["Friend Log-off Message"] = true
L["Friend Log-on Message"] = true
L["Guild Log-off Message"] = true
L["Guild Log-on Message"] = true
L["has come online"] = true
L["has gone offline"] = true
L["HUNTER"] = true
L["MAGE"] = true
L["PALADIN"] = true
L["PRIEST"] = true
L["ROGUE"] = true
L["SHAMAN"] = true
L["Tutorial"] = "Strings can contain tags, flags and any other characters.\
Acceptable tags are &name, &level, &class, &alts, &zone, &rank, and &note.\
Acceptable colour flags are :random, :custom, :class, :green, :red, :blue, :pink, :cyan, :yellow, :white, and :orange.\
Acceptable bracket flags are :bracket, :square, and :angle.\
:random follows the same rules as Prat-3.0's 'random' playername colouring setting.\
:custom is a colour you choose using the swatch below the messages.\
For example, &name:class:square would become %s.\
Anything else will be assumed to be part of the message."
L["WARLOCK"] = true
L["WARRIOR"] = true
