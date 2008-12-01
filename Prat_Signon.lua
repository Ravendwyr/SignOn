--[[
Name: Prat_Signon
Revision: $Revision: 79472 $
-- !!
Jarvis Badgley (wow@chipersoft.com)
Author(s):  (Chiper)
Website: http://files.wowace.com/Prat/
Documentation: To be written
Issues and feature requests: #wowace on Freenode IRC
Description: Adds extra player information to guild and friend signon & signoff messages.
Dependencies: Prat
]]

-- Get Utility Libraries
local util, DBG, CLR = GetPratUtils()

-- set prat module name
local PRAT_MODULE = Prat:RequestModuleName("Signon")

-- define localized strings
local L = PRAT_LIBRARY(PRATLIB.LOCALIZATION):new(PRAT_MODULE)

L:RegisterTranslations("enUS", function() return {
	["Signon"] = true,
	["Adds extra player information to guild and friend signon/signoff messages"] = true,

	["Guild Signon String"] = true,
	["Format string for when guild members sign on"] = true,
	["Guild Signoff String"] = true,
	["Format string for when guild members log off"] = true,
	["Friend Signon String"] = true,
	["Format string for when friends sign on"] = true,
	["Friend Signoff String"] = true,
	["Format string for when friends log off"] = true,
	["default_guild_signon"]  = "&name [&level &class] <Guild> &rank (Note: &note) has come online in &zone",
	["default_guild_signoff"] = "&name [&level &class] <Guild> &rank (Note: &note) has logged off",
	["default_friend_signon"] = "&name [&level &class] <Friend> has signed on in &zone",
	["default_friend_signoff"] = "&name [&level &class] <Friend> has signed off",
	["formatStringUsage"] = "String can contain any characters.  Acceptable tags are: &name, &level, &class, &zone, &rank, &note",
	} end)

--[[
	translations for various locales here - typically including
	deDE, frFR, esES, koKR, zhCN, zhTW; must include an entry for each
	text string listed for enUS, eg:
]]

-- create Prat module
Prat_Signon = Prat:NewModule(PRAT_MODULE)
Prat_Signon.revision = tonumber(string.sub("$Revision: 79472 $", 12, -3))

-- define key module values
Prat_Signon.moduleName	= L["Signon"] 	-- module name, eg "ExampleMod"
-- !!
Prat_Signon.moduleDesc	= L["Adds extra player information to guild and friend signon/signoff messages"] 	-- module description, eg "An example of a Prat 2 mod"

Prat_Signon.consoleName	= string.lower(Prat_Signon.moduleName)
Prat_Signon.guiName		= Prat_Signon.moduleName

-- init moduleOoptions (populated by the other various options tables below)
Prat_Signon.moduleOptions = {}

-- default values for any settings that need them
Prat_Signon.defaultDB = {
	on	= true, -- this value tracks if the module should be on or off,
	             -- an option 'toggle' is automatically created so you can
	             -- set this value
	guild_signon_format = L["default_guild_signon"],
	guild_signoff_format = L["default_guild_signoff"],
	friend_signon_format = L["default_friend_signon"],
	friend_signoff_format = L["default_friend_signoff"]
	}


-- any boolean options
Prat_Signon.toggleOptions = {}

function Prat_Signon:GetModuleOptions()
	self.moduleOptions = {
		name	= self.moduleName,
		desc	= self.moduleDesc,
		type	= "group",
		args = {
			--[[
				table of possible arguments to the slash command and for the FuBar menu;
				see here for more details on valid entries:

				- http://www.wowace.com/wiki/AceConsole-2.0
				- http://www.wowace.com/wiki/AceOptions_data_table
			]]

			{
				name = L["Guild Signon String"],
				desc = L["Format string for when guild members sign on"],
				type = "text",
				order = 1,
				usage = L["formatStringUsage"],
				get = function() return self.db.profile.guild_signon_format end,
				set = function(v) self.db.profile.guild_signon_format = v end,
			},
			{
				name = L["Guild Signoff String"],
				desc = L["Format string for when guild members log off"],
				type = "text",
				order = 2,
				usage = L["formatStringUsage"],
				get = function() return self.db.profile.guild_signoff_format end,
				set = function(v) self.db.profile.guild_signoff_format = v end,
			},
			{
				name = L["Friend Signon String"],
				desc = L["Format string for when friends sign on"],
				type = "text",
				order = 3,
				usage = L["formatStringUsage"],
				get = function() return self.db.profile.friend_signon_format end,
				set = function(v) self.db.profile.friend_signon_format = v end,
			},
			{
				name = L["Friend Signoff String"],
				desc = L["Format string for when friends log off"],
				type = "text",
				order = 4,
				usage = L["formatStringUsage"],
				get = function() return self.db.profile.friend_signoff_format end,
				set = function(v) self.db.profile.friend_signoff_format = v end,
			},
		}
	}

	return self.moduleOptions
end

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

-- things to do when the module is enabled
function Prat_Signon:OnModuleEnable()
	-- register events
	-- !!
	self:RegisterEvent("Prat_PreAddMessage")
end

-- things to do when the module is disabled
function Prat_Signon:OnModuleDisable()
	-- unregister events
	self:UnregisterAllEvents()
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

function Prat_Signon:GetUserData(playerName)
	-- Search guild
	for i=1, GetNumGuildMembers(true) do
		u = {type = "GUILD", name, rank, rankIndex, level, class, zone, note, officernote, online, status};
		u.name, u.rank, u.rankIndex, u.level, u.class, u.zone, u.note, u.officernote, u.online, u.status = GetGuildRosterInfo(i);
		if (string.find(playerName, u.name)) then
			out = "";
			u.name = "|Hplayer:"..u.name.."|h"..u.name.."|h";
			return u;
		end
	end
	-- Then search friends
	for i=1, GetNumFriends() do
		u = {type = "FRIEND", name, level, class, zone, online, status, note, rank};
		u.name, u.level, u.class, u.zone, u.online, u.status = GetFriendInfo(i);
		if (string.find(playerName, u.name)) then
			out = "";
			u.name = "|Hplayer:"..u.name.."|h"..u.name.."|h";
			return u;
		end
	end
end

function Prat_Signon:Prat_PreAddMessage(message, frame, event, t, r, g, b)
	local pName
	local pOnline
	if event == "CHAT_MSG_SYSTEM" then -- only process system messages
		if (string.find(message.MESSAGE, "online")) then -- user came online
			pName = message.PLAYER
			pOnline = true

			self:Debug("Signon event")
		elseif (string.find(message.MESSAGE, "offline")) then -- user went offline
			pName = message.MESSAGE:match("(%a+)")
			pOnline = false

			self:Debug("Signoff event")
		else
			return
		end

		self:Debug("Continuing with "..pName)

		-- have captured player name, and broken out of the function if this isnt the event we want.
		local uData = Prat_Signon:GetUserData(pName)
		if uData == nil then
			self:Debug(pName .. " not found, exiting handler")
			return  -- couldn't get information, don't alter the text.
		end

		self:Debug("Found data for ".. pName)
		-- safe values are: name, level, class, zone, note, and rank
		local parseString
		local parseCount
		if uData.type == "GUILD" then
			if pOnline then
				parseString = Prat_Signon.db.profile.guild_signon_format
			else
				parseString = Prat_Signon.db.profile.guild_signoff_format
			end
		else
			if pOnline then
				parseString = Prat_Signon.db.profile.friend_signon_format
			else
				parseString = Prat_Signon.db.profile.friend_signoff_format
			end
		end

		parseString, parseCount = string.gsub(parseString, "&name", uData.name)
		parseString, parseCount = string.gsub(parseString, "&level", tostring(uData.level))
		parseString, parseCount = string.gsub(parseString, "&class", uData.class)
		parseString, parseCount = string.gsub(parseString, "&zone", uData.zone)
		parseString, parseCount = string.gsub(parseString, "&rank", uData.rank)
		parseString, parseCount = string.gsub(parseString, "&note", uData.note)

		-- nil out all message data except actual content.  We have to do this because the signon name gets parsed.  Oddly, it doesn't happen for signoff.
		message.pP = ""
		message.lL = ""
		message.PLAYERLINK = ""
		message.PLAYERLINKDATA = ""
		message.LL = ""
		message.PLAYER = ""
		message.Ll = ""
		message.Pp = ""
		message.MESSAGE = parseString


	end
end
