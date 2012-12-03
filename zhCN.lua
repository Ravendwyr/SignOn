-- Simplified Chinese localization file for zhCN, by fryy
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "zhCN")
if not L then return end

L["Format string for when friends log off."] = "当好友离线时候的字符串格式"
L["Format string for when friends sign on."] = "当好友上线时候的字符串格式"
L["Format string for when guild members log off."] = "公会成员离线时候的字符串格式"
L["Format string for when guild members sign on."] = "公会成员上线时候的字符串格式"
L["Friend Log-off Message"] = "好友离线消息"
L["Friend Log-on Message"] = "好友上线消息"
L["<Friend> &name &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<好友> [&level]&name:class &alts:bracket已经 离线:red了 &note:bracket"
L["<Friend> &name &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = "<好友> [&level]&name:class &alts:bracket已经在&zone 上线:green了 &note:bracket"
L["Guild Log-off Message"] = "公会成员离线消息"
L["Guild Log-on Message"] = "公会成员上线消息"
L["<Guild> &rank &name &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = "<公会> [&level]&name:class &alts:bracket已经在&zone 上线:green了(&rank)"
L["<Guild> &rank &name &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<公会> [&level]&name:class &alts:bracket已经 离线:red了(&rank)"
L["Chat Frame"] = "Chat Frame" -- needs review
L["Select the Chat Frame the message should appear in."] = "Select the Chat Frame the message should appear in." -- needs review
L["has come online"] = "上线了"
L["(.-) has gone offline"] = "(.-)下线了"
L["has gone offline"] = "下线了"
L["|Hplayer:(.-)|h.-|h has come online"] = "|Hplayer:(.-)|h.-|h上线了"
L["Tutorial"] = "Strings can contain tags, flags and any other characters.\
Acceptable tags are &name, &level, &class, &alts, &zone, &rank, and &note.\
Acceptable colour flags are :random, :custom, :class, :green, :red, :blue, :pink, :cyan, :yellow, :white, and :orange.\
Acceptable bracket flags are :bracket, :square, and :angle.\
:random produces a trully random colour every time.\
:custom is a colour you choose using the swatch below the messages.\
For example, &name:class:square would become %s.\
Anything else will be assumed to be part of the message." -- needs review
