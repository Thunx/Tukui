local f=CreateFrame("frame")
f:SetScript("OnEvent", 
function(self, event, ...) 
	if self[event] then
		return self[event](...)
	end
end)

f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PARTY_MEMBERS_CHANGED")
f:RegisterEvent("ADDON_LOADED")

local channel, delay, target, icon
local INTERVAL = 1.5
local lastupdate = 0
local firstdone
local timerframe=CreateFrame("frame")
local defaults = {
	["Start"]="Pulling $r$t in $c ..",
	["Count"]="$c ..",
	["End"]="GO!",
	["Abort"]="Pull ABORTED!",
}
local SV

local function getChannel()
	local ch
	if GetRealNumRaidMembers()>0 then
		if IsRaidLeader() or IsRaidOfficer() then
			ch = "RAID_WARNING"
		else
			ch = "RAID"
		end
	elseif GetRealNumPartyMembers() > 0 then
		ch = "PARTY"
	end
	return ch or "SAY"
end

local function reset()
	timerframe:SetScript("OnUpdate",nil)
	firstdone, delay, target, icon = nil, nil, nil, nil
	lastupdate = 0
end

local function createPullMacro()	
 	local MAX_CHARACTER_MACROS = MAX_CHARACTER_MACROS or 18
-- 	local MAX_ACCOUNT_MACROS = MAX_ACCOUNT_MACROS or 36
	local exists = GetMacroInfo("ThunxPull")
	if not exists then
		local _, numchmac = GetNumMacros()
		if numchmac < MAX_CHARACTER_MACROS then
			if not InCombatLockdown() then
				local macroID = CreateMacro("ThunxPull", 1, "/run ThunxPull.Pull()", 1, 1)
				if macroID then
					ClearCursor()
					PickupMacro(macroID)
				end
			end
		end
	end
end

local function pull(self, elapsed)
	if UnitExists("target") then
		target = (UnitName("target"))
		local id = GetRaidTargetIndex("target")
		if id then
			icon = "{rt"..id.."}"
		end
	end
	local messg
	if not firstdone then
		messg = string.gsub(SV["Start"],"$t",target or "")
		messg = string.gsub(messg,"$r",icon or "")
		messg = string.gsub(messg,"$c",delay)
		messg = string.gsub(messg,"  "," ")
		SendChatMessage(messg, channel)
		firstdone = true
		delay = delay - 1
	end
	lastupdate = lastupdate + elapsed
	if lastupdate >= INTERVAL then
		lastupdate = 0
		if delay > 0 then
			messg = string.gsub(SV["Count"],"$c",delay)
			SendChatMessage(messg, channel)
			delay = delay - 1
		else
			SendChatMessage(SV["End"], channel)
			reset()
		end
	end
end
local function createOptions()
	local optionFrame = CreateFrame( "Frame", "ThunxPullOptions", UIParent );
	local title = optionFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	title:SetPoint("TOPLEFT", 16, -16)
	local version = GetAddOnMetadata("ThunxPull","Version") or ""
	title:SetText("ThunxPull "..version)

	local help = optionFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	help:SetHeight(150)
	help:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
	help:SetPoint("RIGHT", optionFrame, -32, 0)
	help:SetNonSpaceWrap(true)
	help:SetJustifyH("LEFT")
	help:SetJustifyV("TOP")

	help:SetText("|cff33CC00Usage:|r \nPress Macro button to make a ThunxPull macro in character macros.\nAlternatively you can set a pull keybind from Game Options -> Keybinds\n\n|cFFFFCC00Options Help:|r \n$t = target name placeholder\n$r = raid mark placeholder\n$c = counter placeholder\nPress Enter to save any changes to the announce strings\nPress Reset to return to defaults")
	
	local macroButton = CreateFrame("Button",nil,optionFrame, "UIPanelButtonTemplate")
	macroButton:SetWidth(100)
	macroButton:SetHeight(22)
	macroButton:SetScript("OnClick", function()
		createPullMacro()
	end)
	macroButton:SetText("Pull Macro")
	macroButton:SetPoint("TOPLEFT",help,"BOTTOMLEFT",0,0)
	
	local startLabel = optionFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	startLabel:SetHeight(30)
	startLabel:SetWidth(70)
	startLabel:SetPoint("TOPLEFT", macroButton, "BOTTOMLEFT", 0, -10)
	startLabel:SetNonSpaceWrap(true)
	startLabel:SetJustifyH("LEFT")
	startLabel:SetJustifyV("TOP")
	startLabel:SetText("Start:")
	
	local startEdit = CreateFrame("EditBox", "ThunxPullStartText", optionFrame, "InputBoxTemplate")
	startEdit:SetPoint("TOPLEFT", startLabel, "TOPRIGHT", 0, 2)
	startEdit:SetHeight(20)
	startEdit:SetWidth(200)
	startEdit:SetAutoFocus(false)
	startEdit:SetScript("OnShow",
		function ()
			startEdit:SetText(SV["Start"])
			startEdit:SetCursorPosition(1)
		end)
	startEdit:SetScript("OnEscapePressed",
		function (self)
			self:ClearFocus()
		end)
	startEdit:SetScript("OnEnterPressed",
		function (self)
			local text = self:GetText()
			text = strtrim(text)
			if text == "" then
				self:SetText(SV["Start"])
			else
				SV["Start"] = text
			end
			self:ClearFocus()
		end)
		
	local countLabel = optionFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	countLabel:SetHeight(30)
	countLabel:SetWidth(70)
	countLabel:SetPoint("TOPLEFT", startLabel, "BOTTOMLEFT", 0, -5)
	countLabel:SetNonSpaceWrap(true)
	countLabel:SetJustifyH("LEFT")
	countLabel:SetJustifyV("TOP")
	countLabel:SetText("Count:")
	
	local countEdit = CreateFrame("EditBox", "ThunxPullCountText", optionFrame, "InputBoxTemplate")
	countEdit:SetPoint("TOPLEFT", countLabel, "TOPRIGHT", 0, 2)
	countEdit:SetHeight(20)
	countEdit:SetWidth(200);
	countEdit:SetAutoFocus(false);
	countEdit:SetScript("OnShow",
		function ()
			countEdit:SetText(SV["Count"])
			countEdit:SetCursorPosition(1);
		end);
	countEdit:SetScript("OnEscapePressed",
		function (self)
			self:ClearFocus();
		end);
	countEdit:SetScript("OnEnterPressed",
		function (self)
			local text = self:GetText()
			text = strtrim(text)
			if text == "" then
				self:SetText(SV["Count"])
			else
				SV["Count"] = text
			end
			self:ClearFocus()
		end)
	
	local endLabel = optionFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	endLabel:SetHeight(30)
	endLabel:SetWidth(70)
	endLabel:SetPoint("TOPLEFT", countLabel, "BOTTOMLEFT", 0, -5)
	endLabel:SetNonSpaceWrap(true)
	endLabel:SetJustifyH("LEFT")
	endLabel:SetJustifyV("TOP")
	endLabel:SetText("Finish:")
	
	local endEdit = CreateFrame("EditBox", "ThunxPullEndText", optionFrame, "InputBoxTemplate")
	endEdit:SetPoint("TOPLEFT", endLabel, "TOPRIGHT", 0, 2)
	endEdit:SetHeight(20)
	endEdit:SetWidth(200);
	endEdit:SetAutoFocus(false);
	endEdit:SetScript("OnShow",
		function ()
			endEdit:SetText(SV["End"])
			endEdit:SetCursorPosition(1);
		end);
	endEdit:SetScript("OnEscapePressed",
		function (self)
			self:ClearFocus();
		end);
	endEdit:SetScript("OnEnterPressed",
		function (self)
			local text = self:GetText()
			text = strtrim(text)
			if text == "" then
				self:SetText(SV["End"])
			else
				SV["End"] = text
			end
			self:ClearFocus()
		end)
	
	local abortLabel = optionFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	abortLabel:SetHeight(30)
	abortLabel:SetWidth(70)
	abortLabel:SetPoint("TOPLEFT", endLabel, "BOTTOMLEFT", 0, -5)
	abortLabel:SetNonSpaceWrap(true)
	abortLabel:SetJustifyH("LEFT")
	abortLabel:SetJustifyV("TOP")
	abortLabel:SetText("Abort:")
	
	local abortEdit = CreateFrame("EditBox", "ThunxPullAbortText", optionFrame, "InputBoxTemplate")
	abortEdit:SetPoint("TOPLEFT", abortLabel, "TOPRIGHT", 0, 2)
	abortEdit:SetHeight(20)
	abortEdit:SetWidth(200);
	abortEdit:SetAutoFocus(false);
	abortEdit:SetScript("OnShow",
		function ()
			abortEdit:SetText(SV["Abort"])
			abortEdit:SetCursorPosition(1);
		end);
	abortEdit:SetScript("OnEscapePressed",
		function (self)
			self:ClearFocus();
		end);
	abortEdit:SetScript("OnEnterPressed",
		function (self)
			local text = self:GetText()
			text = strtrim(text)
			if text == "" then
				self:SetText(SV["Abort"])
			else
				SV["Abort"] = text
			end
			self:ClearFocus()
		end)
	
	local resetButton = CreateFrame("Button",nil,optionFrame, "UIPanelButtonTemplate")
	resetButton:SetWidth(100)
	resetButton:SetHeight(22)
	resetButton:SetScript("OnClick", function()
		SV = CopyTable(defaults)
		startEdit:SetText(SV["Start"])
		countEdit:SetText(SV["Count"])
		endEdit:SetText(SV["End"])
		abortEdit:SetText(SV["Abort"])
	end)
	resetButton:SetText("Reset")
	resetButton:SetPoint("TOPLEFT",abortLabel,"BOTTOMLEFT",0,-5)
	
	optionFrame.name = "ThunxPull"; 
	InterfaceOptions_AddCategory(optionFrame);
end

function f.ADDON_LOADED(...)
	local addon = ...
	if addon == "ThunxPull" then
		ThunxPullPC = ThunxPullPC or CopyTable(defaults)
		SV = ThunxPullPC
		createOptions()
		f:UnregisterEvent("ADDON_LOADED")
	end
end
function f.PLAYER_ENTERING_WORLD()
	channel = getChannel()
end
function f.PARTY_MEMBERS_CHANGED()
	channel = getChannel()
end
function f.Pull(timer)
	if not channel then 
		DEFAULT_CHAT_FRAME:AddMessage("ThunxPull: no valid output.")
		return 
	end
	delay = timer or 3
	if (timerframe:GetScript("OnUpdate")) then
		reset()
		SendChatMessage(SV["Abort"], channel)
	else
		timerframe:SetScript("OnUpdate", pull)
	end
end

_G["ThunxPull"]=f
BINDING_HEADER_ThunxPull = "Thunx Pull"
