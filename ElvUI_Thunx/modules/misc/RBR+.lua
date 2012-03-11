local E, L, P, G = unpack(ElvUI); --Engine
local S = E:GetModule('Skins')
local RBR = E:GetModule('RaidBuffReminder', 'AceEvent-3.0');
local M = E:GetModule('Maps');
E.RaidBuffReminder = RBR
local data = ElvData
local db = E.db.skins.thunx 
-- inital settings
if not data.specialbuff then
	 ElvData.specialbuff = 80398
end
RBR.Spell7Buffs = {
	ElvData.specialbuff, --"Dark Intent"
}

local specialbuff = E.db.specialbuff

function RBR:CreateButton(relativeTo, isFirst, isLast)

	local button = CreateFrame("Frame", name, RaidBuffReminder)
	button:SetTemplate('Default')
	button:Size(E.RBRWidth - 4)
	button:SetScript("OnMouseUp", microMenuGenerator)
	if isFirst then
		button:Point("TOP", relativeTo, "TOP", 0, -2)
	else
		button:Point("TOP", relativeTo, "BOTTOM", 0, -1)
	end
	
	if isLast then
		button:Point("BOTTOM", RaidBuffReminder, "BOTTOM", 0, 2)
	end
	
	button.t = button:CreateTexture(nil, "OVERLAY")
	button.t:SetTexCoord(unpack(E.TexCoords))
	button.t:Point("TOPLEFT", 2, -2)
	button.t:Point("BOTTOMRIGHT", -2, 2)
	button.t:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")


	local function SetupTooltip(self)
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", 0, 0)
		GameTooltip:SetSpellByID(ElvData.specialbuff)
		if name == "frame.spell7" then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Set the SpellID in the RBR+.lua file ", 1,1,1)
		end
		GameTooltip:Show()
	end
	button:SetScript("OnEnter", SetupTooltip)
	button:SetScript("OnLeave", GameTooltip_Hide)
	
	return button
end

function RBR:UpdateReminder(event, unit)
	RBR.Spell7Buffs = {
	ElvData.specialbuff, --"Dark Intent"
}
	if (event == "UNIT_AURA" and unit ~= "player") then return end
	local frame = self.frame
	
	if E.role == 'Caster' then
		self.Spell6Buffs = self.CasterSpell6Buffs
	else
		self.Spell6Buffs = self.MeleeSpell6Buffs
	end
	
	local hasFlask, flaskTex = self:CheckFilterForActiveBuff(self.Spell1Buffs)
	if hasFlask then
		frame.spell1.t:SetTexture(flaskTex)
		frame.spell1:SetAlpha(0.2)
	else
		local hasBattle, battleTex = self:CheckFilterForActiveBuff(self.BattleElixir)
		local hasGuardian, guardianTex = self:CheckFilterForActiveBuff(self.GuardianElixir)

		if (hasBattle and hasGuardian) or not hasGuardian and hasBattle then
			frame.spell1:SetAlpha(1)
			frame.spell1.t:SetTexture(battleTex)				
		elseif hasGuardian then
			frame.spell1:SetAlpha(1)
			frame.spell1.t:SetTexture(guardianTex)		
		else
			frame.spell1:SetAlpha(1)
			frame.spell1.t:SetTexture(flaskTex)
		end
	end
	
	for i = 2, 7 do
		local hasBuff, texture = self:CheckFilterForActiveBuff(self['Spell'..i..'Buffs'])
		frame['spell'..i].t:SetTexture(texture)
		if hasBuff then
			frame['spell'..i]:SetAlpha(0.2)
		else
			frame['spell'..i]:SetAlpha(1)
		end
	end
end

function RBR:Initialize()

	
	local frame = CreateFrame('Frame', 'RaidBuffReminder', Minimap)
	frame:SetTemplate('Default')
	frame:Width(E.RBRWidth)
	frame:Point('TOPLEFT', Minimap.backdrop, 'TOPRIGHT', 1, 0)
	frame:Point('BOTTOMLEFT', Minimap.backdrop, 'BOTTOMRIGHT', 1, 0)
	frame:SetClampedToScreen(true)
	frame:SetScript("OnMouseUp", microMenuGenerator)
	frame.spell1 = self:CreateButton(frame, true)
	frame.spell2 = self:CreateButton(frame.spell1)
	frame.spell3 = self:CreateButton(frame.spell2)
	frame.spell4 = self:CreateButton(frame.spell3)
	frame.spell5 = self:CreateButton(frame.spell4)
	frame.spell6 = self:CreateButton(frame.spell5)
	frame.spell7 = self:CreateButton(frame.spell6, nil, true)
	
	self.frame = frame
	
	if E.db.general.raidReminder then
		self:EnableRBR()
	else
		self:DisableRBR()
	end
end


function M:Minimap_UpdateSettings()
	E.MinimapSize = E.db.general.minimapSize
	
	if E.db.general.raidReminder then
		E.RBRWidth = ((E.MinimapSize - 6) / 7) + 4
	else
		E.RBRWidth = 0;
	end
	
	E.MinimapWidth = E.MinimapSize
	E.MinimapHeight = E.MinimapSize + 5
	Minimap:Size(E.MinimapSize, E.MinimapSize)
	
	if MMHolder then
		MMHolder:Width((Minimap:GetWidth() + 4) + E.RBRWidth)
		MMHolder:Height(Minimap:GetHeight() + 27)	
	end
	
	if Minimap.location then
		Minimap.location:Width(E.MinimapSize)
	end
	
	if MinimapMover then
		MinimapMover:Size(MMHolder:GetSize())
	end

	if AurasHolder then
		AurasHolder:Height(E.MinimapHeight)
		if AurasMover and not E:HasMoverBeenMoved('AurasMover') and not E:HasMoverBeenMoved('MinimapMover') then
			AurasMover:ClearAllPoints()
			AurasMover:Point("TOPRIGHT", E.UIParent, "TOPRIGHT", -((E.MinimapSize + 4) + E.RBRWidth + 7), -3)
			E:SaveMoverDefaultPosition('AurasMover')
		end
		
		if AurasMover then
			AurasMover:Height(E.MinimapHeight)
		end
	end
	
	if UpperRepExpBarHolder then
		E:GetModule('Misc'):UpdateExpRepBarAnchor()
	end
	
	if ElvConfigToggle then
		if E.db.general.raidReminder then
			ElvConfigToggle:Show()
			ElvConfigToggle:Width(E.RBRWidth)
		else
			ElvConfigToggle:Hide()
		end
	end
	
	if RaidBuffReminder then
		RaidBuffReminder:Width(E.RBRWidth)
		for i=1, 7 do
			RaidBuffReminder['spell'..i]:Size(E.RBRWidth - 4)
		end
		
		if E.db.general.raidReminder then
			E:GetModule('RaidBuffReminder'):EnableRBR()
		else
			E:GetModule('RaidBuffReminder'):DisableRBR()
		end
	end
end
local optionsFrame = CreateFrame("Frame", "RBR_MenuFrame", UIParent, "UIDropDownMenuTemplate")
function microMenuGenerator(self, button)
	if button == "RightButton" then
		local microMenu = {}
		local opt = { text = "Set Buff", func = function() SpecialBuffConfigFrame:Show() end}
		tinsert(microMenu, opt) 
		EasyMenu(microMenu, optionsFrame, "cursor", xoff, 0, "MENU", 2)
	end
end

local function UpdateSpecialBuff(id)
	if GetSpellInfo(id) then
		 ElvData.specialbuff = id 
	elseif id == "" then
		print("You did not enter anything")
	else
		print(id.." is not a valid SpellID")
	end
	RBR:UpdateReminder()
end


--edit box for the special buff
specialconfig = CreateFrame("Frame", "SpecialBuffConfigFrame", E.UIParent)
specialconfig:SetTemplate("Transparent")
specialconfig:Size(139, 30)
specialconfig:Point("TOPRIGHT", E.UIParent, "TOPRIGHT", -((E.MinimapSize + 4) + E.RBRWidth + 7), -180)

--label
specialconfig.text = specialconfig:CreateFontString(nil, "OVERLAY")	
specialconfig.text:SetPoint("LEFT", specialconfig, "LEFT", 4, 0)
specialconfig.text:FontTemplate(E["media"].fdFont, 12, E.db.fdfontflags)
specialconfig.text:SetText("SpellID")
--ok button
specialconfig.ok = CreateFrame("Button", nil, specialconfig)
specialconfig.ok:SetTemplate("Transparent")
specialconfig.ok:Size(20, 22)
specialconfig.ok:Point("RIGHT", specialconfig, "RIGHT", -3, 0)
specialconfig.t = specialconfig.ok:CreateFontString(nil, "OVERLAY")	
specialconfig.t:SetPoint("CENTER", specialconfig.ok, "CENTER", 0, 0)
specialconfig.t:FontTemplate(E["media"].fdFont, 12, E.db.fdfontflags)
specialconfig.t:SetText("OK")
-- edit box
specialconfig.edit = CreateFrame("EditBox", nil, specialconfig)
specialconfig.edit:SetTemplate("Transparent")
specialconfig.edit:Size(70, 22)
specialconfig.edit:Point("RIGHT", specialconfig.ok, "LEFT", -3, 0)
specialconfig.edit:FontTemplate(E["media"].fdFont, 12, E.db.fdfontflags)
specialconfig.edit:SetNumeric()
specialconfig.edit:EnableMouse(true)
specialconfig.edit:SetFontObject(ChatFontNormal)
--ok button click
specialconfig.ok:SetScript("OnClick", function(self, button, down) UpdateSpecialBuff(specialconfig.edit:GetText()) specialconfig:Hide()  end)
specialconfig:Hide()

