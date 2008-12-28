
local SignOn = LibStub("AceAddon-3.0"):NewAddon("SignOn")
local db, CLR

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

local function signOn(message, player)
	local name, online

	if message:find("online") then -- user came online
		name, online = message:match("|Hplayer:(%w+)|h.-|h has come online"), true

	elseif message:find("offline") then -- user went offline
		name, online = message:match("(%w+) has gone offline"), false

	else return end

	if not name then if player then name = player
	else return end end

	name = name:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "") -- strip out Prat-3.0 colour codes

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

	if db.colourNames and CLR then
		data.name = CLR:Player(data.name, data.name, data.class)
	end

	data.name = "|Hplayer:"..name.."|h"..data.name.."|h" -- name is uncoloured text, data.name is coloured text. coloured names kill the link if used between '|Hplayer' and the first '|h'

	-- choo choo! here comes the gsub train!
	msg = msg:gsub("&name", data.name):gsub("&level", tostring(data.level)):gsub("&class", data.class):gsub("&zone", data.zone or ""):gsub("&rank", data.rank or ""):gsub("&note", data.note or "")

	return false, msg
end


function SignOn:OnEnable()
	self.db = LibStub("AceDB-3.0"):New("SignOnDB", { profile = { colourNames = false,
		guildOn = "<Guild> &rank &name [&level &class] has come online in &zone (Note: &note)",
		guildOff = "<Guild> &rank &name [&level &class] has logged off (Note: &note)",
		friendOn = "<Friend> &name [&level &class] has signed on in &zone (Note: &note)",
		friendOff = "<Friend> &name [&level &class] has logged off (Note: &note)",
	}}, "Default")

	db = self.db.profile

	if IsAddOnLoaded("Prat-3.0") then
		Prat.RegisterChatEvent(self, "Prat_PreAddMessage")
		CLR = Prat.CLR
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
			colourNames = {
				name = "Colour Names",
				desc = "Change the colour of player names. Requires Prat-3.0 to be installed.",
				type = "toggle", order = 5, arg = "colourNames",
				disabled = function() return not CLR end,
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

