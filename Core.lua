
local SignOn = LibStub("AceAddon-3.0"):NewAddon("SignOn")

local L = LibStub("AceLocale-3.0"):GetLocale("SignOn", false)
local AltDB = LibStub("LibAlts-1.0")
local db


-- colouring functions 
local classColours = {
	[L["Death Knight"]] = "c41e3a",
	[L["DEATH KNIGHT"]] = "c41e3a",
	[L["Druid"]] = "ff7c0a",
	[L["DRUID"]] = "ff7c0a",
	[L["Hunter"]] = "aad372",
	[L["HUNTER"]] = "aad372",
	[L["Mage"]] = "68ccef",
	[L["MAGE"]] = "68ccef",
	[L["Paladin"]] = "f48cba",
	[L["PALADIN"]] = "f48cba",
	[L["Priest"]] = "ffffff",
	[L["PRIEST"]] = "ffffff",
	[L["Rogue"]] = "fff468",
	[L["ROGUE"]] = "fff468",
	[L["Shaman"]] = "2359ff",
	[L["SHAMAN"]] = "2359ff",
	[L["Warrior"]] = "c69b6d",
	[L["WARRIOR"]] = "c69b6d",
	[L["Warlock"]] = "9382c9",
	[L["WARLOCK"]] = "9382c9",
}

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

local function signOn(message, player) -- 'player' is supplied by Prat, not by the filter
	local name, online

	if message:find(L["has come online"]) then -- user came online
		name, online = message:match(L["|Hplayer:(.-)|h.-|h has come online"]), true

	elseif message:find(L["has gone offline"]) then -- user went offline
		name, online = message:match(L["(.-) has gone offline"]), false

	else return end

	if not name then if player then name = player
	else return end end

	name = name:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "") -- strip out colour codes

	-- have captured player name, and broken out of the function if this isnt the event we want
	local data = getUserData(name)
	if not data then return end -- couldn't get information, don't alter the text

	local msg

	if data.type == "GUILD" then
		if online then msg = db.guildOn
		else msg = db.guildOff end
	else
		if online then msg = db.friendOn
		else msg = db.friendOff end
	end

	-- add in data
	msg = msg:gsub("&name", name):gsub("&alts", data.alts):gsub("&level", tostring(data.level)):gsub("&class", data.class):gsub("&zone", data.zone or ""):gsub("&rank", data.rank or ""):gsub("&note", data.note or "")

	-- add in colours
	msg = msg:gsub("([^:%s]+):class", class("%1", data.class)) -- %1 is the text minus the colour flag
	msg = msg:gsub("([^:%s]+):random", random)
	msg = msg:gsub("([^:%s]+):green", "|cff00ff00%1|r")
	msg = msg:gsub("([^:%s]+):red", "|cffff0000%1|r")
	msg = msg:gsub("([^:%s]+):blue", "|cff0000ff%1|r")
	msg = msg:gsub("([^:%s]+):pink", "|cffff00ff%1|r")
	msg = msg:gsub("([^:%s]+):cyan", "|cff00ffff%1|r")
	msg = msg:gsub("([^:%s]+):yellow", "|cffffff00%1|r")
	msg = msg:gsub("([^:%s]+):orange", "|cffff7f00%1|r")

	-- add in brackets
	msg = msg:gsub("([^:%s]+):bracket", "(%1)")
	msg = msg:gsub("([^:%s]+):square", "[%1]")
	msg = msg:gsub("([^:%s]+):angle", "<%1>")

	-- add in player links
	if online then msg = msg:gsub(name, "|Hplayer:"..name.."|h%1|h") end

	-- remove empty floating flags
	msg = msg:gsub(":(%w+)", "")

	return false, msg
end


function SignOn:OnEnable()
	self.db = LibStub("AceDB-3.0"):New("SignOnDB", { profile = {
		guildOn = L["<Guild> &rank &name:random [&level &class:class] has come:green online:green in &zone (Note: &note)"],
		guildOff = L["<Guild> &rank &name:random [&level &class:class] has logged:red off:red (Note: &note)"],
		friendOn = L["<Friend> &name:random [&level &class:class] has signed:green on:green in &zone (Note: &note)"],
		friendOff = L["<Friend> &name:random [&level &class:class] has logged:red off:red (Note: &note)"],
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
				name = L["Tutorial"]:format(class(UnitName("player"), UnitClass("player"))),
			},
			guildOn = {
				name = L["Guild Log-on Message"],
				desc = L["Format string for when guild members sign on"],
				type = "input", order = 2, arg = "guildOn", width = "full",
			},
			guildOff = {
				name = L["Guild Log-off Message"],
				desc = L["Format string for when guild members log off"],
				type = "input", order = 3, arg = "guildOff", width = "full",
			},
			friendOn = {
				name = L["Friend Log-on Message"],
				desc = L["Format string for when friends sign on"],
				type = "input", order = 4, arg = "friendOn", width = "full",
			},
			friendOff = {
				name = L["Friend Log-off Message"],
				desc = L["Format string for when friends log off"],
				type = "input", order = 5, arg = "friendOff", width = "full",
			},
		},
	})

	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("SignOn", "Sign On")

	_G.SlashCmdList["SIGNON"] = function() InterfaceOptionsFrame_OpenToCategory("Sign On") end
	_G["SLASH_SIGNON1"] = "/signon"
	_G["SLASH_SIGNON2"] = "/so"
end

function SignOn:Prat_PreAddMessage(_, message, frame, event, t, r, g, b)
	if event ~= "CHAT_MSG_SYSTEM" then return end

	local _, msg = signOn(message.MESSAGE, message.PLAYER)
	if not msg then return end

	-- nil out all message data except actual content
	-- we have to do this otherwise the players name will appear twice in the message
	-- it doesn't happen for signoff messages; what would be the point of a hyperlink to someone who just left? :)
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

