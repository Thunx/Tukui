local E, L, P, G = unpack(ElvUI); --Engine
local S = E:GetModule('Skins')
local RBR = E:GetModule('RaidBuffReminder', 'AceEvent-3.0');
local M = E:GetModule('Minimap');
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


function M:UpdateSettings()
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

--Create the anchor
local posn = {"TOP", UIParent, "TOP", 0, -3}
local posn = {"TOP", UIParent, "TOP", 0, -3}
local fsize = 164
local bsize = ((fsize - 13) / 7)


-- Adding in ALL RAID BUFFS
local AllBuffs = {
	["melee10"] = {
		8512,						-- Windfury
		55610,						-- Imp Icy Talons
		53290,						-- Hunting Party
	},

	["crit5"] = {
		17007,						-- Leader of the Pack
		51470,						-- Ele Oath
		51701,						-- Honor Amoung Thieves
		29801,						-- Rampage
		24604,						-- Hunter Pet
	},

	["ap10"] = {
		30808,						-- Unleashed Rage
		19506,						-- Trueshot Aura
		53138,						-- Abomination's Might
		19740,						-- Blessing of Might
	},

	["spellhaste"] = {
		24907,						-- Moonkin Form
		49868,						-- Shadow Form
		3738,						-- Wrath of Air
	},

	["sp10"] = {
		47236,						-- Demonic Pact
		77746,						-- Totemic Wrath
	},

	["sp6"] = {
		8227,						-- Flametongue
		1459,						-- AI
		61316,						-- Dal Brill
	},

	["dmg3"] = {
		82930,						-- Arcane Tactics
		34460,						-- Ferocious Insperation
		31876,						-- Communion
	},

	["base5"] = {
		1126,						-- Mark
		20217,						-- Kings
	},

	["str_agi"] = {
		8076,						-- Strength of earth
		57330,						-- Horn of Winter
		6673,						-- Battle Shout
	},

	["stam"] = {
		21562,						-- Fort
		6307,						-- Imp
		469,						-- Commanding
	},

	["mana"] = {
		1459,						-- AI
		61316,						-- Dal Brill
		54424,						-- Fel
	},

	["armor"] = {
		8072,						-- stoneskin
		465,						-- devotion aura
	},

	-- make this a check list
	-- local resist = {
		-- Ele Resist Totem	--fire, frost nature
		-- Aspect of the wild	--nature
		-- Resistance Aura		--fire, frost, shadow
		-- Kings				-- All
		-- Shadow Protection	-- Shadow, Stacks with kings
		-- Mark				-- All
	-- }

	["pushback"] = {
		19746,						-- Conc aura
		87717,						-- Totem of Tranq
	},

	["mp5"] = {
		54424,						-- Fel
		5677,						-- Mana Spring
		19740,						-- Blessing of Might
	},

	--replenishment
	-- local manaregen = {
		-- Vampiric Touch
		-- Enduring Winter
		-- soul leach
		-- Revitalize
		-- Communion
	-- }
}

local function LabelType(bufftype)
	if bufftype == "melee10" then
		return "10% Melee Attack Speed"
	elseif bufftype == "crit5" then
		return "5% Crit"
	elseif bufftype == "ap10" then
		return "20% Attack Power"
	elseif bufftype == "spellhaste" then
		return "5% Spell Haste"
	elseif bufftype == "sp10" then
		return "10% Spell Power"
	elseif bufftype == "sp6" then
		return "6% Spell Power"
	elseif bufftype == "dmg3" then
		return "3% Damage"
	elseif bufftype == "base5" then
		return "5% All Base Stats"
	elseif bufftype == "str_agi" then
		return "Strength and Agility"
	elseif bufftype == "stam" then
		return "Stamina"
	elseif bufftype == "mana" then
		return "Maximum Mana"
	elseif bufftype == "armor" then
		return "Armor"
	elseif bufftype == "pushback" then
		return "Spell Pushback"
	elseif bufftype == "mp5" then
		return "Mana Per 5s"
	else
		return "ERROR"
	end
end
-------------------------
-- Buff Check Functions
-------------------------
local function AnotherOnAuraChange(self, event, arg1, unit)
	for key, value in pairs(AllBuffs) do
		for i, v in ipairs(value) do
			local spellname = select(1, GetSpellInfo(v))
			_G[key.."mini"..i].spell = v
			if UnitAura("player", spellname) then
				_G[key.."mini"..i]:SetAlpha(1)
			else
				_G[key.."mini"..i]:SetAlpha(0.2)
			end
		end
		
		for i, v in ipairs(value) do
			local spellname = select(1, GetSpellInfo(v))
			_G[key.."Frame"].spell = v
			if UnitAura("player", spellname) then
				_G[key.."Frame"]:SetAlpha(1)
				_G[key.."Frame"].t:SetTexture(select(3, GetSpellInfo(v)))
				break
			else
				_G[key.."Frame"]:SetAlpha(0.2)
				_G[key.."Frame"].t:SetTexture(select(3, GetSpellInfo(v)))
			end
		end
	end
	
	--fucking pallys
	local percentmod = select(7, UnitDamage("player"))
	if ceil(percentmod*100) >= 103 then
		if _G["dmg3Frame"]:GetAlpha() == 0.2 then
			_G["dmg3Frame"]:SetAlpha(1)
			_G["dmg3Frame"].t:SetTexture(select(3, GetSpellInfo(31876)))
		end
	end
end

local raidbuffsummury = CreateFrame("Frame", "RaidBuffSummery", UIParent)
raidbuffsummury:SetFrameStrata("HIGH")
raidbuffsummury:SetTemplate("Transparent")
raidbuffsummury:Size(435, 425)
raidbuffsummury:Point(unpack(posn))
raidbuffsummury:SetClampedToScreen(true)
raidbuffsummury:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
raidbuffsummury:RegisterEvent("UNIT_INVENTORY_CHANGED")
raidbuffsummury:RegisterEvent("UNIT_AURA")
raidbuffsummury:RegisterEvent("UNIT_DAMAGE")
raidbuffsummury:RegisterEvent("PLAYER_REGEN_ENABLED")
raidbuffsummury:RegisterEvent("PLAYER_REGEN_DISABLED")
raidbuffsummury:RegisterEvent("PLAYER_ENTERING_WORLD")
raidbuffsummury:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
raidbuffsummury:RegisterEvent("CHARACTER_POINTS_CHANGED")
raidbuffsummury:RegisterEvent("ZONE_CHANGED_NEW_AREA")
raidbuffsummury:SetScript("OnEvent", AnotherOnAuraChange)

--DERP BLIZZ, cant make good spell id's
local str = "spell:%s"
local BadTotems = {
	[8076] = 8075,
	[8972] = 8071,
	[5677] = 5675,
}
local SetupTooltip = function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", 0, 0)
	
	if BadTotems[self.spell] then
		GameTooltip:SetHyperlink(format(str, BadTotems[self.spell]))
	else
		GameTooltip:SetHyperlink(format(str, self.spell))
	end
	
	GameTooltip:Show()
end

local function CreateBuffArea(bufftype, relativeTo, column)
	local bigButton = CreateFrame("Frame", bufftype.."Frame", raidbuffsummury)
	bigButton:SetTemplate("Transparent")
	bigButton:Size(40, 40)
	if column == 1 then
		bigButton:Point("TOPLEFT", raidbuffsummury, "TOPLEFT", 14, -14)
	elseif column == 2 then
		bigButton:Point("TOPLEFT", raidbuffsummury, "TOPLEFT", 250, -14)
	else
		bigButton:Point("TOPLEFT", relativeTo, "BOTTOMLEFT", 0, -16)
	end
	bigButton.t = bigButton:CreateTexture(bufftype..".t", "OVERLAY")
	bigButton.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	bigButton.t:Point("TOPLEFT", 2, -2)
	bigButton.t:Point("BOTTOMRIGHT", -2, 2)
	
	local littlebutton = {}
	for i, v in pairs(AllBuffs[bufftype]) do
		littlebutton[i] = CreateFrame("Frame", bufftype.."mini"..i, raidbuffsummury)		
		littlebutton[i]:SetTemplate()
		littlebutton[i]:Size(20, 20)
		if i == 1 then
			littlebutton[i]:Point("BOTTOMLEFT", bigButton, "BOTTOMRIGHT", 3, 0)
		else
			littlebutton[i]:Point("LEFT", littlebutton[i-1], "RIGHT", 3, 0)
		end
		littlebutton[i].t = littlebutton[i]:CreateTexture(nil, "OVERLAY")
		littlebutton[i].t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		littlebutton[i].t:Point("TOPLEFT", 2, -2)
		littlebutton[i].t:Point("BOTTOMRIGHT", -2, 2)
		littlebutton[i].t:SetTexture(select(3, GetSpellInfo(v)))
		
		littlebutton[i]:EnableMouse(true)
		littlebutton[i]:SetScript("OnEnter", SetupTooltip)
		littlebutton[i]:SetScript("OnLeave", GameTooltip_Hide)
	end
	
	bigButton.text = bigButton:CreateFontString(nil, "OVERLAY")
	bigButton.text:SetPoint("TOPLEFT", bigButton, "TOPRIGHT", 3, -1)
	bigButton.text:FontTemplate()
	bigButton.text:SetText(LabelType(bufftype))
	
	bigButton:EnableMouse(true)
	bigButton:SetScript("OnEnter", SetupTooltip)
	bigButton:SetScript("OnLeave", GameTooltip_Hide)
end

--ORDER MATTERS!
CreateBuffArea("melee10", nil, 1)
CreateBuffArea("crit5", "melee10Frame", nil)
CreateBuffArea("ap10", "crit5Frame", nil)
CreateBuffArea("spellhaste", "ap10Frame", nil)
CreateBuffArea("sp10", "spellhasteFrame", nil)
CreateBuffArea("sp6", "sp10Frame", nil)
CreateBuffArea("dmg3", "sp6Frame", nil)
CreateBuffArea("base5", "dmg3Frame", 2)
CreateBuffArea("str_agi", "base5Frame", nil)
CreateBuffArea("stam", "str_agiFrame", nil)
CreateBuffArea("mana", "stamFrame", nil)
CreateBuffArea("armor", "manaFrame", nil)
CreateBuffArea("pushback", "armorFrame", nil)
CreateBuffArea("mp5", "pushbackFrame", nil)

raidbuffsummury:Hide()

local raidbuff_toggle = CreateFrame("Frame", "RaidBuffToggle", raidbuff_reminder)
raidbuff_toggle:SetTemplate("Transparent")
raidbuff_toggle:Size(200, 18)
raidbuff_toggle:Point(unpack(posn))
raidbuff_toggle:SetFrameStrata("HIGH")

raidbuff_toggle.text = raidbuff_toggle:CreateFontString(nil, "OVERLAY")
raidbuff_toggle.text:SetPoint("CENTER")
raidbuff_toggle.text:FontTemplate()
raidbuff_toggle.text:SetText("View All Raid Buffs")
raidbuff_toggle:SetAlpha(0)


local function ToggleRaidBuffs()
	if raidbuffsummury:IsShown() then
		raidbuffsummury:Hide()
		raidbuff_toggle:ClearAllPoints()
		raidbuff_toggle:Point(unpack(posn))
		raidbuff_toggle.text:SetText("View All Raid Buffs")
		raidbuff_toggle:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
		raidbuff_toggle:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
	else
		raidbuffsummury:Show()
		raidbuff_toggle:ClearAllPoints()
		raidbuff_toggle:Point("BOTTOM", raidbuffsummury, "BOTTOM", 0, -17)
		raidbuff_toggle.text:SetText("Minimize All Raid Buffs")
		raidbuff_toggle:SetScript("OnEnter", nil)
		raidbuff_toggle:SetScript("OnLeave", nil)
	end
end

raidbuff_toggle:RegisterEvent("PLAYER_REGEN_DISABLED")
raidbuff_toggle:RegisterEvent("PLAYER_REGEN_ENABLED")
raidbuff_toggle:HookScript("OnEnter", function(self) self:SetAlpha(1) end)
raidbuff_toggle:HookScript("OnLeave", function(self) self:SetAlpha(0) end)
raidbuff_toggle:SetScript("OnMouseDown", ToggleRaidBuffs)


