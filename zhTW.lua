-- Traditional Chinese localization file for zhTW
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "zhTW")
if not L then return end

L["Format string for when friends log off."] = "Format string for when friends log off" -- needs review
L["Format string for when friends sign on."] = "Format string for when friends sign on" -- needs review
L["Format string for when guild members log off."] = "Format string for when guild members log off" -- needs review
L["Format string for when guild members sign on."] = "Format string for when guild members sign on" -- needs review
L["Friend Log-off Message"] = "好友離線訊息"
L["Friend Log-on Message"] = "好友上線訊息"
L["<Friend> &name &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<好友> [&level]&name:class &alts:bracket已經 離線:red了 &note:bracket"
L["<Friend> &name &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = "<好友> [&level]&name:class &alts:bracket已經在&zone 上線:green了 &note:bracket"
L["Guild Log-off Message"] = "公會成員離線訊息"
L["Guild Log-on Message"] = "公會成員上線訊息"
L["<Guild> &rank &name &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = "<公會> [&level]&name:class &alts:bracket已經在&zone 上線:green了(&rank)"
L["<Guild> &rank &name &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<公會> [&level]&name:class &alts:bracket已經 離線:red了(&rank)"
L["Chat Frame"] = "Chat Frame" -- needs review
L["Select the Chat Frame the message should appear in."] = "Select the Chat Frame the message should appear in." -- needs review
L["has come online"] = "上線了"
L["(.-) has gone offline"] = "(.-)下線了"
L["has gone offline"] = "下線了"
L["|Hplayer:(.-)|h.-|h has come online"] = "|Hplayer:(.-)|h.-|h上線了"
L["Tutorial"] = "Strings can contain tags, flags and any other characters.\
Acceptable tags are &name, &level, &class, &alts, &zone, &rank, and &note.\
Acceptable colour flags are :random, :custom, :class, :green, :red, :blue, :pink, :cyan, :yellow, :white, and :orange.\
Acceptable bracket flags are :bracket, :square, and :angle.\
:random produces a trully random colour every time.\
:custom is a colour you choose using the swatch below the messages.\
For example, &name:class:square would become %s.\
Anything else will be assumed to be part of the message." -- needs review
