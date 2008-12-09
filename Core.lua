--[[
Name: Prat SignOn
Author: Ethan Centaurai (originally written by CipherSoft)
Description: Adds extra player information to guild and friend signon/signoff messages
Dependencies: Prat-3.0
]]--

local PRAT_MODULE = Prat:RequestModuleName("SignOn")
if PRAT_MODULE == nil then return end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
	["SignOn"] = true,
	["Adds extra player information to guild and friend signon/signoff messages"] = true,

	["Guild Signon String"] = true,
	["Format string for when guild members sign on"] = true,
	["Guild Signoff String"] = true,
	["Format string for when guild members log off"] = true,
	["Friend Signon String"] = true,
	["Format string for when friends sign on"] = true,
	["Friend Signoff String"] = true,
	["Format string for when friends log off"] = true,

	["Colour Names"] = true,
	["Recolour player names in the message useing the colouring settings in the PlayerName module."] = true,

	["String can contain any characters. Acceptable tags are: &name, &level, &class, &zone, &rank, &note"] = true,
})


local SignOn = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(SignOn.name, {
	profile = {
		on = true,

		guildOn = "<Guild> &rank &name [&level &class] has come online in &zone (Note: &note)",
		guildOff = "<Guild> &rank &name [&level &class] has logged off (Note: &note)",
		friendOn = "<Friend> &name [&level &class] has signed on in &zone (Note: &note)",
		friendOff = "<Friend> &name [&level &class] has logged off (Note: &note)",
	}
})

Prat:SetModuleOptions(SignOn, {
	name = L["SignOn"],
	desc = L["Adds extra player information to guild and friend signon/signoff messages"],
	type = "group",
	args = {
		guildOn = {
			name = L["Guild Signon String"],
			desc = L["Format string for when guild members sign on"],
			type = "input", order = 1,
			usage = L["String can contain any characters. Acceptable tags are: &name, &level, &class, &zone, &rank, &note"],
		},
		guildOff = {
			name = L["Guild Signoff String"],
			desc = L["Format string for when guild members log off"],
			type = "input", order = 2,
			usage = L["String can contain any characters. Acceptable tags are: &name, &level, &class, &zone, &rank, &note"],
		},
		friendOn = {
			name = L["Friend Signon String"],
			desc = L["Format string for when friends sign on"],
			type = "input", order = 3,
			usage = L["String can contain any characters. Acceptable tags are: &name, &level, &class, &zone, &rank, &note"],
		},
		friendOff = {
			name = L["Friend Signoff String"],
			desc = L["Format string for when friends log off"],
			type = "input", order = 4,
			usage = L["String can contain any characters. Acceptable tags are: &name, &level, &class, &zone, &rank, &note"],
		},
		colourNames = {
			name = L["Colour Names"],
			desc = L["Recolour player names in the message useing the colouring settings in the PlayerName module."],
			type = "toggle", order = 5,
		},
	},
})


function SignOn:OnModuleEnable()
	Prat.RegisterChatEvent(self, "Prat_PreAddMessage")
end

function SignOn:OnModuleDisable()
	Prat.UnregisterAllChatEvents(self)
end


function SignOn:GetUserData(playerName)
	local u

	-- Search guild
	if IsInGuild() then
		for i=1, GetNumGuildMembers(true) do
			u = { type = "GUILD" }
			u.name, u.rank, _, u.level, u.class, u.zone, u.note, _, _, _ = GetGuildRosterInfo(i)

			if playerName == u.name then
				return u
			end
		end
	end

	-- Then search friends
	for i=1, GetNumFriends() do
		u = { type = "FRIEND" }
		u.name, u.level, u.class, u.zone, _, _, u.note = GetFriendInfo(i)

		if playerName == u.name then
			return u
		end
	end
end


local CLR = Prat.CLR

function SignOn:Prat_PreAddMessage(_, message, frame, event, t, r, g, b)
	if event ~= "CHAT_MSG_SYSTEM" then return end -- only process system messages

	local name, online

	if message.MESSAGE:find("online") then -- user came online
		name, online = message.PLAYER, true

	elseif message.MESSAGE:find("offline") then -- user went offline
		name, online = message.MESSAGE:match("(%a+)"), false

	else return end

	name = name:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "") -- strip out colour codes, we'll add them back later

	-- have captured player name, and broken out of the function if this isnt the event we want.
	local data = self:GetUserData(name)
	if not data then return end -- couldn't get information, don't alter the text.

	local msg

	if data.type == "GUILD" then
		if online then
			msg = self.db.profile.guildOn
		else
			msg = self.db.profile.guildOff
		end
	else
		if online then
			msg = self.db.profile.friendOn
		else
			msg = self.db.profile.friendOff
		end
	end

	if self.db.profile.colourNames then
		data.name = CLR:Player(data.name, data.name, data.class)
	end

	data.name = "|Hplayer:"..name.."|h"..data.name.."|h" -- name is uncoloured, data.name is potentially coloured. coloured names kill the link if used between |Hplayer and the first |h

	-- choo choo! here comes the gsub train!
	msg = msg:gsub("&name", data.name):gsub("&level", tostring(data.level)):gsub("&class", data.class):gsub("&zone", data.zone or ""):gsub("&rank", data.rank or ""):gsub("&note", data.note or "")

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
	message.Ff = ""
	message.MESSAGE = msg
end

