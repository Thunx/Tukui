local E, L, DF = unpack(ElvUI); --Engine
local S = E:GetModule('Skins')

local aList = CreateFrame('Frame', 'AddonManager', UIParent)
aList:SetTemplate()
aList:Size(350, 500)
aList:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
aList:SetFrameStrata("MEDIUM")
aList:SetFrameLevel(10)
aList:EnableMouse(true)
aList:SetMovable(true)
aList:SetUserPlaced(true)
aList:SetClampedToScreen(true)
aList:SetScript("OnMouseDown", function(self) self:StartMoving() end)
aList:SetScript("OnMouseUp", function(self) self:StopMovingOrSizing() end)
aList:Hide()
aList.header = CreateFrame("Frame", "AddonManager_Header", aList)
aList.header:Point("TOPLEFT", 4, -4)
aList.header:Point("TOPRIGHT", -4, -24)
aList.header:Height(20)
aList.header:SetTemplate()
aList.header.text = aList.header:CreateFontString(nil, 'OVERLAY')
aList.header.text:FontTemplate()
aList.header.text:SetText(ADDONS..": ".. E.ValColor .. E.myname)
aList.header.text:SetPoint("CENTER")
tinsert(UISpecialFrames,aList:GetName());

aList.closeButton = CreateFrame("Frame", "AddonManager_CloseButton", aList)
aList.closeButton:Point("RIGHT", aList.header, "RIGHT", 0, 0)
aList.closeButton:Height(20)
aList.closeButton:Width(20)
aList.closeButton:EnableMouse(true)
aList.closeButton.text = aList.closeButton:CreateFontString(nil, 'OVERLAY')
aList.closeButton.text:FontTemplate()
aList.closeButton.text:SetPoint("CENTER")
aList.closeButton.text:SetText("X")
aList.closeButton:SetScript("OnMouseDown", function() aList:Hide() end)

aList.scrollFrame = CreateFrame("ScrollFrame", "AddonManager_ScrollFrame", aList, "UIPanelScrollFrameTemplate")
aList.scrollFrame:Point("TOPLEFT", aList.header, "TOPLEFT", 10, -40)
aList.scrollFrame:Point("BOTTOMRIGHT", aList, "BOTTOMRIGHT", -35, 25)
S:HandleScrollBar(AddonManager_ScrollFrameScrollBar)

aList.scrollAnchor = CreateFrame("Frame", "AddonManager_ScrollAnchor", scrollFrame)
aList.scrollAnchor:SetPoint("TOPLEFT")
aList.scrollAnchor:SetWidth(aList.scrollFrame:GetWidth())
aList.scrollAnchor:SetHeight(aList.scrollFrame:GetHeight())
aList.scrollFrame:SetScrollChild(aList.scrollAnchor)

aList.BottomPanel = CreateFrame("Frame", "AddonManager_BottomPanel", aList)
aList.BottomPanel:Point("BOTTOMLEFT", 0, -29)
aList.BottomPanel:Size(aList:GetWidth(), 26)
aList.BottomPanel:SetTemplate()
aList.BottomPanel:SetFrameLevel(aList:GetFrameLevel())
aList.BottomPanel:SetFrameStrata("MEDIUM")

aList.reloadButton = CreateFrame("Button", "AddonManager_ReloadButton", aList)
aList.reloadButton:SetTemplate()
aList.reloadButton:Size(84, 20)
aList.reloadButton:Point("LEFT", aList.BottomPanel, "LEFT", 3, 0)
aList.reloadButton:EnableMouse(true)
aList.reloadButton.text = aList.reloadButton:CreateFontString(nil, 'OVERLAY')
aList.reloadButton.text:FontTemplate()
aList.reloadButton.text:SetPoint("CENTER")
aList.reloadButton.text:SetText(SAVE)
aList.reloadButton:SetScript("OnClick", function() ReloadUI() end)
aList.reloadButton:HookScript("OnEnter", E.SetModifiedBackdrop)
aList.reloadButton:HookScript("OnLeave", E.SetOriginalBackdrop)

aList.reloadButton:SetFrameLevel(aList:GetFrameLevel()+1)
aList.reloadButton:SetFrameStrata(aList:GetFrameStrata())

aList.raid_addons = CreateFrame("Button", "AddonManager_RaidButton", aList)
aList.raid_addons:SetTemplate()
aList.raid_addons:Size(60, 20)
aList.raid_addons:Point( "RIGHT", aList.BottomPanel, "RIGHT", -3, 0)
aList.raid_addons:EnableMouse(true)
aList.raid_addons.text = aList.raid_addons:CreateFontString(nil, 'OVERLAY')
aList.raid_addons.text:FontTemplate()
aList.raid_addons.text:SetPoint("CENTER")
aList.raid_addons.text:SetText(RAID)
aList.raid_addons:SetFrameStrata(aList:GetFrameStrata())
aList.raid_addons:SetFrameLevel(aList:GetFrameLevel() + 1)
aList.raid_addons:RegisterForClicks("AnyUp") aList.raid_addons:SetScript("OnClick", function()
	EnableAddOn("BigWigs")
	EnableAddOn("alDamageMeter")
	ReloadUI()
end)
aList.raid_addons:HookScript("OnEnter", E.SetModifiedBackdrop)
aList.raid_addons:HookScript("OnLeave", E.SetOriginalBackdrop)

aList.solo_addons = CreateFrame("Button", "AddonManager_SoloButton", aList)
aList.solo_addons:SetTemplate()
aList.solo_addons:Size(70, 20)
aList.solo_addons:Point("RIGHT", aList.raid_addons, "LEFT", -2, 0)
aList.solo_addons:EnableMouse(true)
aList.solo_addons.text = aList.solo_addons:CreateFontString(nil, 'OVERLAY')
aList.solo_addons.text:FontTemplate()
aList.solo_addons.text:SetPoint("CENTER")
aList.solo_addons.text:SetText(SOLO)
aList.solo_addons:SetFrameStrata(aList:GetFrameStrata())
aList.solo_addons:SetFrameLevel(aList:GetFrameLevel() + 1)
aList.solo_addons:RegisterForClicks("AnyUp") aList.solo_addons:SetScript("OnClick", function()
	DisableAddOn("BigWigs")
	DisableAddOn("alDamageMeter")
	ReloadUI()
end)
aList.solo_addons:HookScript("OnEnter", E.SetModifiedBackdrop)
aList.solo_addons:HookScript("OnLeave", E.SetOriginalBackdrop)

local function UpdateAddons()
	local addons = {}
	for i=1, GetNumAddOns() do
		addons[i] = select(1, GetAddOnInfo(i))
	end
	table.sort(addons)
	local oldb
	for i,v in pairs(addons) do
		local name, title, notes, enabled, loadable, reason, security = GetAddOnInfo(v)
		local button = CreateFrame("Button", v.."_Button", aList.scrollAnchor, "SecureActionButtonTemplate")
		button:SetFrameLevel(aList.scrollFrame:GetFrameLevel() + 1)
		button:Size(34, 14)
		button:SetTemplate()

		-- to make sure the border is colored the right color on reload 
		if enabled then
			button:SetBackdropBorderColor(0,1,0)
		else
			button:SetBackdropBorderColor(.180, .180, .180)
		end

		if i==1 then
			button:Point("TOPLEFT", aList.scrollAnchor, "TOPLEFT", 0, 0)
		else
			button:Point("TOP", oldb, "BOTTOM", 0, -4)
		end
		button.text = button:CreateFontString(nil, 'OVERLAY')
		button.text:FontTemplate()
		button.text:Point("LEFT", button, "RIGHT", 8, 0)
		button.text:Point("RIGHT", aList.scrollAnchor, "RIGHT", 0, 0)
		button.text:SetText(title)
	
		button:SetScript("OnMouseDown", function()
			if enabled then
				button:SetBackdropBorderColor(.180, .180, .180)
				DisableAddOn(name)
				enabled = false
			else
				button:SetBackdropBorderColor(0,1,0)
				EnableAddOn(name)
				enabled = true
			end
		end)
	
		oldb = button
	end
end

UpdateAddons()

SLASH_ALOAD1 = "/am"
SlashCmdList.ALOAD = function (msg)
	if AddonManager:IsShown() then
		AddonManager:Hide()
	else
		AddonManager:Show()
	end
end