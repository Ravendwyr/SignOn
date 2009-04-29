
local SignOn = LibStub("AceAddon-3.0"):NewAddon("SignOn")

local L = LibStub("AceLocale-3.0"):GetLocale("SignOn")
local AltDB = LibStub("LibAlts-1.0")
local db


-- colouring functions 
local classColours = {}

if CUSTOM_CLASS_COLORS then
	for k, v in pairs(CUSTOM_CLASS_COLORS) do
		classColours[L[k]] = ("%02x%02x%02x"):format(v.r*255, v.g*255, v.b*255)
	end

	CUSTOM_CLASS_COLORS:RegisterCallback(function()
		for k, v in pairs(CUSTOM_CLASS_COLORS) do
			classColours[L[k]] = ("%02x%02x%02x"):format(v.r*255, v.g*255, v.b*255)
		end
	end)
else
	for k, v in pairs(RAID_CLASS_COLORS) do
		classColours[L[k]] = ("%02x%02x%02x"):format(v.r*255, v.g*255, v.b*255)
	end
end


local function random(text) -- copied from Prat-3.0
	local hash = 17

	for i=1, text:len() do
		hash = hash * 37 * text:byte(i)
	end

	local r = math.floor(math.fmod(hash / 97, 255))
	local g = math.floor(math.fmod(hash / 17, 255))
	local b = math.floor(math.fmod(hash / 227, 255))

	if ((r * 299 + g * 587 + b * 114) / 1000) < 105 then
		r = math.abs(r - 255)
		g = math.abs(g - 255)
		b = math.abs(b - 255)
	end

	return ("|cff%02x%02x%02x%s|r"):format(r, g, b, text)
end

local function class(text, c)
	c = c:upper()

	local hex = classColours[c]
	return "|cff"..hex..text.."|r"
end


-- core functions
local function getUserData(playerName)
	local u = {}

	-- check if the player is an alt or a main
	local main = AltDB:GetMain(playerName)
	local alts = AltDB:GetAlts(playerName)

	u.alts = main or alts or ""

	-- Then search guild
	if IsInGuild() then
		for i=1, GetNumGuildMembers(true) do
			u.type, u.name, u.rank, _, u.level, u.class, u.zone, u.note, _, _, _ = "GUILD", GetGuildRosterInfo(i)

			if playerName == u.name then return u end
		end
	end

	-- Then search friends
	for i=1, GetNumFriends() do
		u.type, u.name, u.level, u.class, u.zone, _, _, u.note = "FRIEND", GetFriendInfo(i)

		if playerName == u.name then return u end
	end
end

local function signOn(_, _, message, arg4, ...) -- arg4 is the player name, supplied by Prat
	local name, online

	if message:find(L["has come online"]) then name, online = message:match(L["|Hplayer:(.-)|h.-|h has come online"]), true
	elseif message:find(L["has gone offline"]) then name, online = message:match(L["(.-) has gone offline"]), false
	else return end

	if not name then if arg4 then name = arg4
	else return end end -- couln't find a name, bail out

	name = name:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "") -- strip out colour codes

	local data = getUserData(name)
	if not data then return end -- couldn't get information, bail out

	local msg

	if data.type == "GUILD" then
		if online then msg = db.guildOn
		else msg = db.guildOff end
	else
		if online then msg = db.friendOn
		else msg = db.friendOff end
	end

	--@debug@--
	if db.debug then print(msg) end
	--@end-debug@--

	-- add in colours
	msg = msg:gsub("([^%s]+):class", class("%1", data.class)) -- %1 is the text minus the flags
	msg = msg:gsub("([^%s]+):custom", ("|cff%02x%02x%02x%s|r"):format(db.custom.r*255, db.custom.g*255, db.custom.b*255, "%1"))
	msg = msg:gsub("([^%s]+):random", random)
	msg = msg:gsub("([^%s]+):green", "|cff00ff00%1|r")
	msg = msg:gsub("([^%s]+):red", "|cffff0000%1|r")
	msg = msg:gsub("([^%s]+):blue", "|cff0000ff%1|r")
	msg = msg:gsub("([^%s]+):pink", "|cffff00ff%1|r")
	msg = msg:gsub("([^%s]+):cyan", "|cff00ffff%1|r")
	msg = msg:gsub("([^%s]+):yellow", "|cffffff00%1|r")
	msg = msg:gsub("([^%s]+):orange", "|cffff7f00%1|r")
	msg = msg:gsub("([^%s]+):white", "|cffffffff%1|r")

	-- add in brackets
	msg = msg:gsub("([^%s]+):bracket", "(%1)")
	msg = msg:gsub("([^%s]+):square", "[%1]")
	msg = msg:gsub("([^%s]+):angle", "<%1>")

	--@debug@--
	if db.debug then print(msg) end
	--@end-debug@--

	-- add in data
	msg = msg:gsub("&name", name):gsub("&alts", data.alts):gsub("&level", tostring(data.level)):gsub("&class", data.class):gsub("&zone", data.zone or ""):gsub("&rank", data.rank or ""):gsub("&note", data.note or "")

	-- remove empty brackets
	msg = msg:gsub("(%(%))", ""):gsub("(%[%])", ""):gsub("(<>)", "")

	-- add in player links
	if online then msg = msg:gsub(name, "|Hplayer:"..name.."|h%1|h") end

	--@debug@--
	if db.debug then print(msg) end
	--@end-debug@--

	return false, msg, arg4, ...
end


function SignOn:OnEnable()
	self.db = LibStub("AceDB-3.0"):New("SignOnDB", { profile = {
		guildOn = L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has come:green online:green in &zone &note:bracket"],
		guildOff = L["<Guild> &rank &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"],
		friendOn = L["<Friend> &name:random &alts:bracket [&level &class:class] has signed:green on:green in &zone &note:bracket"],
		friendOff = L["<Friend> &name:random &alts:bracket [&level &class:class] has logged:red off:red &note:bracket"],

		custom = { r = 0.6, g = 0.6, b = 0.6 }, debug = false,
	}}, "Default")

	db = self.db.profile

	if IsAddOnLoaded("Prat-3.0") then
		Prat.RegisterChatEvent(self, "Prat_PreAddMessage")
	else
		ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", signOn)
	end

	LibStub("AceConfig-3.0"):RegisterOptionsTable("SignOn", {
		name = "Sign On", type = "group",
		get = function(key) return db[key.arg] end,
		set = function(key, value) db[key.arg] = value end,
		args = {
			desc = {
				type = "description", order = 1,
				name = L["Tutorial"]:format(class("["..UnitName("player").."]", UnitClass("player"))),
			},
			--@debug@--
			debug = {
				name = "|cffc41e3aDebug|r", width = "full",
				type = "toggle", order = 2, arg = "debug",
			},
			--@end-debug@--
			guildOn = {
				name = L["Guild Log-on Message"],
				desc = L["Format string for when guild members sign on"],
				type = "input", order = 3, arg = "guildOn", width = "full",
			},
			guildOff = {
				name = L["Guild Log-off Message"],
				desc = L["Format string for when guild members log off"],
				type = "input", order = 4, arg = "guildOff", width = "full",
			},
			friendOn = {
				name = L["Friend Log-on Message"],
				desc = L["Format string for when friends sign on"],
				type = "input", order = 5, arg = "friendOn", width = "full",
			},
			friendOff = {
				name = L["Friend Log-off Message"],
				desc = L["Format string for when friends log off"],
				type = "input", order = 6, arg = "friendOff", width = "full",
			},
			custom = {
				name = "Custom Colour",
				desc = "Set the colour for the :custom colour flag.",
				type = "color", order = 7, arg = "custom", hasAlpha = false,
				get = function()
					return db.custom.r, db.custom.g, db.custom.b
				end,
				set = function(_, r, g, b)
					db.custom.r, db.custom.g, db.custom.b = r, g, b
				end,
			},
		},
	})

	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("SignOn", "Sign On")

	_G.SlashCmdList["SIGNON"] = function() InterfaceOptionsFrame_OpenToCategory("Sign On") end
	_G["SLASH_SIGNON1"] = "/signon"
	_G["SLASH_SIGNON2"] = "/so"

	--@debug@--
	_G.SlashCmdList["SIGNONTEST"] = function(msg) db.debug = true signOn(nil, nil, "|Hplayer:"..msg.."|h"..msg.."|h has come online.") end
	_G["SLASH_SIGNONTEST1"] = "/sotest"
	--@end-debug@--
end


function SignOn:Prat_PreAddMessage(_, message, frame, event, t, r, g, b)
	if event ~= "CHAT_MSG_SYSTEM" then return end

	local _, msg = signOn(nil, nil, message.MESSAGE, message.PLAYER)
	if not msg then return end

	-- nil out all message data except actual content
	-- we have to do this otherwise the players name will appear twice in the message
	message.MESSAGE = msg
	message.PLAYER = ""
	message.PLAYERLINK = ""
	message.PLAYERLINKDATA = ""
	message.PLAYERLEVEL = ""
	message.PREPLAYERDELIM = ""
	message.ALTNAMES = ""
	message.lL = ""
	message.LL = ""
	message.Ll = ""
	message.pP = ""
	message.Pp = ""
end
