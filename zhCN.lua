-- Chinese localization by fryy
local L = LibStub("AceLocale-3.0"):NewLocale("SignOn", "zhCN")
if not L then return end

L["(.-) has gone offline"] = "(.-)下线了" -- pattern
L["<Friend> &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<好友> [&level]&name:class &alts:bracket已经 离线:red了 &note:bracket"
L["<Friend> &name:random &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"] = "<好友> [&level]&name:class &alts:bracket已经在&zone 上线:green了 &note:bracket"
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"] = "<公会> [&level]&name:class &alts:bracket已经在&zone 上线:green了(&rank)"
L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"] = "<公会> [&level]&name:class &alts:bracket已经 离线:red了(&rank)"
L["|Hplayer:(.-)|h.-|h has come online"] = "|Hplayer:(.-)|h.-|h上线了" -- pattern
L["Death Knight"] = "死亡骑士" -- class male
L["DEATH KNIGHT"] = "死亡骑士" -- class female
L["Druid"] = "德鲁伊" -- class male  
L["DRUID"] = "德鲁伊" -- class female
L["Format string for when friends log off"] = "当好友离线时候的字符串格式" -- tooltip
L["Format string for when friends sign on"] = "当好友上线时候的字符串格式" -- tooltip
L["Format string for when guild members log off"] = "公会成员离线时候的字符串格式" -- tooltip
L["Format string for when guild members sign on"] = "公会成员上线时候的字符串格式" -- tooltip
L["Friend Log-off Message"] = "好友离线消息" -- options item
L["Friend Log-on Message"] = "好友上线消息" -- options item
L["Guild Log-off Message"] = "公会成员离线消息" -- options item
L["Guild Log-on Message"] = "公会成员上线消息" -- options item
L["has come online"] = "上线了" -- pattern
L["has gone offline"] = "下线了" -- pattern
L["Hunter"] = "猎人" -- class male  
L["HUNTER"] = "猎人" -- class female
L["Mage"] = "法师" -- class male  
L["MAGE"] = "法师" -- class female
L["Paladin"] = "圣骑士" -- class male  
L["PALADIN"] = "圣骑士" -- class female
L["Priest"] = "牧师" -- class male  
L["PRIEST"] = "牧师" -- class female
L["Rogue"] = "潜行者" -- class male  
L["ROGUE"] = "潜行者" -- class female
L["Shaman"] = "萨满祭司" -- class male  
L["SHAMAN"] = "萨满祭司" -- class female
L["Tutorial"] = "字符串可以包含标签,颜色标记和其他任何字符.\
可以使用的标签有 &name, &level, &class, &zone, &rank, &note.\
可以使用的颜色标记有 :random, :class, :green, :red, :blue, :pink, :cyan, :yellow, :orange.\
:random 颜色标记使用 Prat-3.0 中 'random' 定义的玩家染色.\
例如： &name:class 会显示成 %s.\
其他的会被当作消息的一部分显示出来"
L["Warlock"] = "术士" -- class male  
L["WARLOCK"] = "术士" -- class female
L["Warrior"] = "战士" -- class male  
L["WARRIOR"] = "战士" -- class female

