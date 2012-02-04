local E, L, DF = unpack(ElvUI); --Engine
local WW = E:NewModule('WhisperWarning', 'AceEvent-3.0')
local LSM = LibStub("LibSharedMedia-3.0")

-- Options
DF['chat'] = {
	['whisperwarning'] = true,
	['whispersound'] = 'ElvUI Whisper',
}

-- Function to be called when new sound is chosen
function WW:UpdateWhisperWarning()
	E["media"].whisper = LSM:Fetch("sound", E.db["chat"].whispersound)
end

-- Function which monitors whispers and plays sound
function WW:MonitorWhispers(event)
	if event == "CHAT_MSG_WHISPER" or "CHAT_MSG_BN_WHISPER" then
		if E.db.chat.whisperwarning == true then
			PlaySoundFile(E["media"].whisper, "Master")
		end
	end
end

-- Stuff to do when addon is initialized
function WW:Initialize()
	self:UpdateWhisperWarning()
	
	self:RegisterEvent('CHAT_MSG_BN_WHISPER', 'MonitorWhispers')
	self:RegisterEvent('CHAT_MSG_WHISPER', 'MonitorWhispers')
end

-- Insert options into ElvUI
E.Options.args.chat.args.sounds = {
	order = 200,
	type = "group",
	name = L["Sounds"],
	desc = L["Sounds"],
	get = function(info) return E.db.chat[ info[#info] ] end,
	set = function(info, value) E.db.chat[ info[#info] ] = value end,
	guiInline = true,
	args = {
		whisperwarning = {
			order = 1,
			type = 'toggle',
			name = L['Whisper Warning'],
			desc = L['Plays a sound when you receive a whisper.'],
			set = function(info, value) E.db.chat.whisperwarning = value; end,
		},
		whispersound = {
			order = 2,
			type = 'select', dialogControl = 'LSM30_Sound',
			name = L['Warning Sound'],
			desc = L['Choose what sound to play.'],
			disabled = function() return not E.db.chat.whisperwarning end,
			values = AceGUIWidgetLSMlists.sound,
			set = function(info, value) E.db.chat.whispersound = value; WW:UpdateWhisperWarning(); end,
		},
	}
}

E:RegisterModule(WW:GetName())