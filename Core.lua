
local SignOn = LibStub("AceAddon-3.0"):NewAddon("SignOn")
local db

-- colouring functions 
local classColours = {
	["Death Knight"] = "c41e3a",
	["Druid"] = "ff7c0a",
	["Hunter"] = "aad372",
	["Mage"] = "68ccef",
	["Paladin"] = "f48cba",
	["Priest"] = "ffffff",
	["Rogue"] = "9382c9",
	["Shaman"] = "2359ff",
	["Warrior"] = "c69b6d",
	["Warlock"] = "9382c9",
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
	local u

	-- Search guild
	if IsInGuild() then
		for i=1, GetNumGuildMembers(true) do
			u = { type = "GUILD" }
			u.name, u.rank, _, u.level, u.class, u.zone, u.note, _, _, _ = GetGuildRosterInfo(i)

			if playerName == u.name then return u end
		end
	end

	-- Then search friends
	for i=1, GetNumFriends() do
		u = { type = "FRIEND" }
		u.name, u.level, u.class, u.zone, _, _, u.note = GetFriendInfo(i)

		if playerName == u.name then return u end
	end
end

local function signOn(message, player) -- player is supplied by Prat, not by the filter call
	local name, online

	if message:find("online") then -- user came online
		name, online = message:match("|Hplayer:(%w+)|h.-|h has come online"), true

	elseif message:find("offline") then -- user went offline
		name, online = message:match("(%w+) has gone offline"), false

	else return end

	if not name then if player then name = player
	else return end end

	name = name:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "") -- strip out colour codes

	-- have captured player name, and broken out of the function if this isnt the event we want.
	local data = getUserData(name)
	if not data then return end -- couldn't get information, don't alter the text.

	local msg

	if data.type == "GUILD" then
		if online then
			msg = db.guildOn
		else
			msg = db.guildOff
		end
	else
		if online then
			msg = db.friendOn
		else
			msg = db.friendOff
		end
	end

	-- choo choo! here comes the gsub train!
	msg = msg:gsub("&name", name):gsub("&level", tostring(data.level)):gsub("&class", data.class):gsub("&zone", data.zone or ""):gsub("&rank", data.rank or ""):gsub("&note", data.note or "")

	-- add in colours
	msg = msg:gsub("(%w+):class", class("%1", data.class)) -- %1 is the text minus the colour flag
	msg = msg:gsub("(%w+):random", random)
	msg = msg:gsub("(%w+):green", "|cff00ff00%1|r")
	msg = msg:gsub("(%w+):red", "|cffff0000%1|r")
	msg = msg:gsub("(%w+):blue", "|cff0000ff%1|r")
	msg = msg:gsub("(%w+):pink", "|cffff00ff%1|r")
	msg = msg:gsub("(%w+):cyan", "|cff00ffff%1|r")
	msg = msg:gsub("(%w+):yellow", "|cffffff00%1|r")
	msg = msg:gsub("(%w+):orange", "|cffff7f00%1|r")

	-- add in player links
	msg = msg:gsub(name, "|Hplayer:"..name.."|h%1|h")

	return false, msg
end


function SignOn:OnEnable()
	self.db = LibStub("AceDB-3.0"):New("SignOnDB", { profile = {
		guildOn = "<Guild> &rank &name:random [&level &class:class] has come:green online:green in &zone (Note: &note)",
		guildOff = "<Guild> &rank &name:random [&level &class:class] has logged:red off:red (Note: &note)",
		friendOn = "<Friend> &name:random [&level &class:class] has signed:green on:green in &zone (Note: &note)",
		friendOff = "<Friend> &name:random [&level &class:class] has logged:red off:red (Note: &note)",
	}}, "Default")

	db = self.db.profile

	if IsAddOnLoaded("Prat-3.0") then
		Prat.RegisterChatEvent(self, "Prat_PreAddMessage")
	else
		ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", signOn)
	end

	LibStub("AceConfig-3.0"):RegisterOptionsTable("SignOn", {
		name = "Sign On",
		desc = "Allows you to customise guild and friend signon/signoff messages.",
		type = "group",
		get = function(key) return db[key.arg] end,
		set = function(key, value) db[key.arg] = value end,
		args = {
			guildOn = {
				name = "Guild Signon String",
				desc = "Format string for when guild members sign on",
				type = "input", order = 1, arg = "guildOn",
				usage = "String can contain any characters. Acceptable tags are: &name, &level, &class, &zone, &rank, &note.",
			},
			guildOff = {
				name = "Guild Signoff String",
				desc = "Format string for when guild members log off",
				type = "input", order = 2, arg = "guildOff",
				usage = "String can contain any characters. Acceptable tags are: &name, &level, &class, &zone, &rank, &note.",
			},
			friendOn = {
				name = "Friend Signon String",
				desc = "Format string for when friends sign on",
				type = "input", order = 3, arg = "friendOn",
				usage = "String can contain any characters. Acceptable tags are: &name, &level, &class, &zone, &rank, &note.",
			},
			friendOff = {
				name = "Friend Signoff String",
				desc = "Format string for when friends log off",
				type = "input", order = 4, arg = "friendOff",
				usage = "String can contain any characters. Acceptable tags are: &name, &level, &class, &zone, &rank, &note.",
			},
		},
	})

	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("SignOn", "Sign On")
end

function SignOn:Prat_PreAddMessage(_, message, frame, event, t, r, g, b)
	if event ~= "CHAT_MSG_SYSTEM" then return end

	_, message.MESSAGE = signOn(message.MESSAGE, message.PLAYER)

	-- nil out all message data except actual content.
	-- we have to do this otherwise the players name will appear twice in the message.
	-- it doesn't happen for signoff messages; what would be the point of a hyperlink to someone who just left? :)
	message.PLAYER = ""
	message.PLAYERLINK = ""
	message.PLAYERLINKDATA = ""
	message.lL = ""
	message.LL = ""
	message.Ll = ""
	message.pP = ""
	message.Pp = ""
end

