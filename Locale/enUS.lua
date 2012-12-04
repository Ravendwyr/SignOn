-- English localization file for enUS and enGB
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "enUS", true)
if not L then return end

L["<Friend> &name &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = true
L["<Friend> &name &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = true
L["<Guild> &rank &name &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = true
L["<Guild> &rank &name &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = true
L["Format string for when friends log off."] = true
L["Format string for when friends sign on."] = true
L["Format string for when guild members log off."] = true
L["Format string for when guild members sign on."] = true
L["Friend Log-off Message"] = true
L["Friend Log-on Message"] = true
L["Guild Log-off Message"] = true
L["Guild Log-on Message"] = true
L["Chat Frame"] = true
L["Select the Chat Frame the message should appear in."] = true
L["Custom Colour"] = true
L["Set the colour for the :custom colour flag."] = true
L["has come online"] = true
L["has gone offline"] = true
L["Tutorial"] = "Strings can contain tags, flags and any other characters.\
Acceptable tags are &name, &level, &class, &alts, &zone, &rank, and &note.\
Acceptable colour flags are :random, :custom, :class, :green, :red, :blue, :pink, :cyan, :yellow, :white, and :orange.\
Acceptable bracket flags are :bracket, :square, and :angle.\
:random produces a truly random colour every time.\
:custom is a colour you choose using the swatch below the messages.\
For example, &name:class:square would become %s.\
Anything else will be assumed to be part of the message."
