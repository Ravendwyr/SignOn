-- English localization file for enUS and enGB
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "enUS", true)
if not L then return end

L["(.-) has gone offline"] = true -- pattern
L["<Friend> &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = true
L["<Friend> &name:random &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = true
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = true
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = true
L["|Hplayer:(.-)|h.-|h has come online"] = true -- pattern
L["Death Knight"] = true -- class male
L["DEATH KNIGHT"] = true -- class female
L["Druid"] = true -- class male  
L["DRUID"] = true -- class female
L["Format string for when friends log off"] = true -- tooltip
L["Format string for when friends sign on"] = true -- tooltip
L["Format string for when guild members log off"] = true -- tooltip
L["Format string for when guild members sign on"] = true -- tooltip
L["Friend Log-off Message"] = true -- options item
L["Friend Log-on Message"] = true -- options item
L["Guild Log-off Message"] = true -- options item
L["Guild Log-on Message"] = true -- options item
L["has come online"] = true -- pattern
L["has gone offline"] = true -- pattern
L["Hunter"] = true -- class male  
L["HUNTER"] = true -- class female
L["Mage"] = true -- class male  
L["MAGE"] = true -- class female
L["Paladin"] = true -- class male  
L["PALADIN"] = true -- class female
L["Priest"] = true -- class male  
L["PRIEST"] = true -- class female
L["Rogue"] = true -- class male  
L["ROGUE"] = true -- class female
L["Shaman"] = true -- class male  
L["SHAMAN"] = true -- class female
L["Tutorial"] = "Strings can contain tags, colour flags and any other characters.\
Acceptable tags are &name, &level, &class, &zone, &rank, and &note.\
Acceptable colour flags are :random, :class, :green, :red, :blue, :pink, :cyan, :yellow, and :orange.\
:random follows the same rules as Prat-3.0's 'random' playername colouring setting.\
For example, &name:class would become %s.\
Anything else will be assumed to be part of the message."
L["Warlock"] = true -- class male  
L["WARLOCK"] = true -- class female
L["Warrior"] = true -- class male  
L["WARRIOR"] = true -- class female

