-- English localization file for enUS and enGB.
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "enUS", true)
if not L then return end

L["Death Knight"] = true
L["Druid"] = true
L["Hunter"] = true
L["Mage"] = true
L["Paladin"] = true
L["Priest"] = true
L["Rogue"] = true
L["Shaman"] = true
L["Warrior"] = true
L["Warlock"] = true

L["has come online"] = true
L["|Hplayer:(.-)|h.-|h has come online"] = true

L["has gone offline"] = true
L["(.-) has gone offline"] = true

L["<Guild> &rank &name:random [&level &class:class] has come:green online:green in &zone (Note: &note)"] = true
L["<Guild> &rank &name:random [&level &class:class] has logged:red off:red (Note: &note)"] = true
L["<Friend> &name:random [&level &class:class] has signed:green on:green in &zone (Note: &note)"] = true
L["<Friend> &name:random [&level &class:class] has logged:red off:red (Note: &note)"] = true

L["Tutorial"] =	"Strings can contain tags, colour flags and any other characters.\n"..
		"Acceptable tags are &name, &level, &class, &zone, &rank, and &note.\n"..
		"Acceptable colour flags are :random, :class, :green, :red, :blue, :pink, :cyan, :yellow, and :orange.\n"..
		":random follows the same rules as Prat-3.0's 'random' playername colouring setting.\n"..
		"For example, &name:class would become %s.\n"..
		"Anything else will be assumed to be part of the message."

L["Guild Log-on Message"] = true
L["Format string for when guild members sign on"] = true

L["Guild Log-off Message"] = true
L["Format string for when guild members log off"] = true

L["Friend Log-on Message"] = true
L["Format string for when friends sign on"] = true

L["Friend Log-off Message"] = true
L["Format string for when friends log off"] = true

