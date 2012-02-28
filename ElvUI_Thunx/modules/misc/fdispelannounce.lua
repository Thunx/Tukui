local E, L, P, G = unpack(ElvUI); -- Import Functions/Constants, Config, Locales
local S = E:GetModule('Skins')

-----------------------------------------
-- fDispelAnnounce made by Foof
-- Edited and rewritten by Thunx

-----------------------------------------

local fDispelAnnounce = CreateFrame("Frame", fDispelAnnounce)
local band = bit.band
local COMBATLOG_OBJECT_AFFILIATION_MINE = COMBATLOG_OBJECT_AFFILIATION_MINE

-- Registered events
local events = {
	["SPELL_STOLEN"] = {
		["enabled"] = true,
		["msg"] = "Removed",
		["color"] = "69CCF0",
	},
	["SPELL_DISPEL"] = {
		["enabled"] = true,
		["msg"] = "Removed",
		["color"] = "3BFF33",
	},
	["SPELL_DISPEL_FAILED"] = {
		["enabled"] = true,
		["msg"] = "FAILED",
		["color"] = "C41F3B",
	},
	["SPELL_HEAL"] = {
		["enabled"] = false,
		["msg"] = "Healed",
		["color"] = "3BFF33",
	},
}
 
-- Frame function
function Thunx_DoWork_Fdispelannounce()
	if not E.db.skins.thunx.enablefd == true then return end
	local function CreateMessageFrame(name)
		local f = CreateFrame("ScrollingMessageFrame", name, UIParent)
		local db = E.db.skins.thunx 
		f:SetHeight(80)
		f:SetWidth(500)
		f:SetPoint("CENTER", 0, 150)
		f:SetFrameStrata("HIGH")
		f:SetTimeVisible(1.5)
		f:SetFadeDuration(3)
		f:SetMaxLines(3)
		f:FontTemplate(E["media"].fdFont, db.fdfontsize, db.fdfontflags)
		E.CreateMover(anchor, f, "fdispelMover", "fdispelMOVE")
		return f
	end

-- Create messageframe
	local dispelMessages = CreateMessageFrame("fDispelFrame")
 
 
 
	local function OnEvent(self, event, timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, ...)
		if(not events[eventType] or not events[eventType].enabled or band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) ~= COMBATLOG_OBJECT_AFFILIATION_MINE or sourceGUID ~= UnitGUID("player")) then
			return
		end
		-- Print to partychat
		local numraid = GetNumRaidMembers()
		if (numraid > 0 and numraid < 6) then
			SendChatMessage(events[eventType].msg .. ": " .. select(5, ...), "PARTY")
		end
		-- Add to messageframe
		dispelMessages:AddMessage("|cff" .. events[eventType].color .. events[eventType].msg .. ":|r " .. select(5, ...))
	end
	 
	-- finally
	fDispelAnnounce:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
	fDispelAnnounce:SetScript('OnEvent', OnEvent)
end 