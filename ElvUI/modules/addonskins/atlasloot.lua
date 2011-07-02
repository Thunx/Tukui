-- Credit to Camealion for writing this skin, I simply just integrated it into ElvUI

local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales

if not IsAddOnLoaded("AtlasLoot") or not C["skin"].atlasloot == true then return end

local function SetModifiedBackdrop(self)
	if C["general"].classcolortheme == true then
		self:SetBackdropBorderColor(unpack(C["media"].bordercolor))		
	else
		self:SetBackdropBorderColor(unpack(C["media"].valuecolor))	
	end
end

local function SetOriginalBackdrop(self)
    local color = RAID_CLASS_COLORS[E.myclass]
    if C["general"].classcolortheme == true then
        self:SetBackdropBorderColor(color.r, color.g, color.b)
    else
        self:SetTemplate("Default")
    end     
end

function E.SkinButton(f, strip)
	if f:GetName() then
		local l = _G[f:GetName().."Left"]
		local m = _G[f:GetName().."Middle"]
		local r = _G[f:GetName().."Right"]
		
		
		if l then l:SetAlpha(0) end
		if m then m:SetAlpha(0) end
		if r then r:SetAlpha(0) end
	end

	if f.SetNormalTexture then f:SetNormalTexture("") end
	
	if f.SetHighlightTexture then f:SetHighlightTexture("") end
	
	if f.SetPushedTexture then f:SetPushedTexture("") end
	
	if f.SetDisabledTexture then f:SetDisabledTexture("") end
	
	if strip then f:StripTextures() end
	
	f:SetTemplate("Default", true)
	f:HookScript("OnEnter", SetModifiedBackdrop)
	f:HookScript("OnLeave", SetOriginalBackdrop)
end

function E.SkinScrollBar(frame)
	if _G[frame:GetName().."BG"] then _G[frame:GetName().."BG"]:SetTexture(nil) end
	if _G[frame:GetName().."Track"] then _G[frame:GetName().."Track"]:SetTexture(nil) end
	
	if _G[frame:GetName().."Top"] then
		_G[frame:GetName().."Top"]:SetTexture(nil)
		_G[frame:GetName().."Bottom"]:SetTexture(nil)
		_G[frame:GetName().."Middle"]:SetTexture(nil)
	end
end

--Tab Regions
local tabs = {
	"LeftDisabled",
	"MiddleDisabled",
	"RightDisabled",
	"Left",
	"Middle",
	"Right",
}

function E.SkinTab(tab)
	if not tab then return end
	for _, object in pairs(tabs) do
		local tex = _G[tab:GetName()..object]
		if tex then
			tex:SetTexture(nil)
		end
	end
	
	if tab.GetHighlightTexture and tab:GetHighlightTexture() then
		tab:GetHighlightTexture():SetTexture(nil)
	else
		tab:StripTextures()
	end
	
	tab.backdrop = CreateFrame("Frame", nil, tab)
	tab.backdrop:SetTemplate("Default")
	tab.backdrop:SetFrameLevel(tab:GetFrameLevel() - 1)
	tab.backdrop:Point("TOPLEFT", 10, -3)
	tab.backdrop:Point("BOTTOMRIGHT", -10, 3)				
end

function E.SkinNextPrevButton(btn, horizonal)
	btn:SetTemplate("Default")
	btn:Size(btn:GetWidth() - 7, btn:GetHeight() - 7)	

	if horizonal then
		btn:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.72, 0.65, 0.29, 0.65, 0.72)
		btn:GetPushedTexture():SetTexCoord(0.3, 0.35, 0.3, 0.8, 0.65, 0.35, 0.65, 0.8)
		btn:GetDisabledTexture():SetTexCoord(0.3, 0.29, 0.3, 0.75, 0.65, 0.29, 0.65, 0.75)	
	else
		btn:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.81, 0.65, 0.29, 0.65, 0.81)
		
		if btn:GetPushedTexture() then
			btn:GetPushedTexture():SetTexCoord(0.3, 0.35, 0.3, 0.81, 0.65, 0.35, 0.65, 0.81)
		end
		if btn:GetDisabledTexture() then
			btn:GetDisabledTexture():SetTexCoord(0.3, 0.29, 0.3, 0.75, 0.65, 0.29, 0.65, 0.75)
		end
	end
	
	btn:GetNormalTexture():ClearAllPoints()
	btn:GetNormalTexture():Point("TOPLEFT", 2, -2)
	btn:GetNormalTexture():Point("BOTTOMRIGHT", -2, 2)
	if btn:GetDisabledTexture() then
		btn:GetDisabledTexture():SetAllPoints(btn:GetNormalTexture())
	end
	
	if btn:GetPushedTexture() then
		btn:GetPushedTexture():SetAllPoints(btn:GetNormalTexture())
	end
	
	btn:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
	btn:GetHighlightTexture():SetAllPoints(btn:GetNormalTexture())
end

function E.SkinRotateButton(btn)
	btn:SetTemplate("Default")
	btn:Size(btn:GetWidth() - 14, btn:GetHeight() - 14)	
	
	btn:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)
	btn:GetPushedTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)	
	
	btn:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
	
	btn:GetNormalTexture():ClearAllPoints()
	btn:GetNormalTexture():Point("TOPLEFT", 2, -2)
	btn:GetNormalTexture():Point("BOTTOMRIGHT", -2, 2)
	btn:GetPushedTexture():SetAllPoints(btn:GetNormalTexture())	
	btn:GetHighlightTexture():SetAllPoints(btn:GetNormalTexture())
end

function E.SkinEditBox(frame)
	if _G[frame:GetName().."Left"] then _G[frame:GetName().."Left"]:Kill() end
	if _G[frame:GetName().."Middle"] then _G[frame:GetName().."Middle"]:Kill() end
	if _G[frame:GetName().."Right"] then _G[frame:GetName().."Right"]:Kill() end
	if _G[frame:GetName().."Mid"] then _G[frame:GetName().."Mid"]:Kill() end
	frame:CreateBackdrop("Default")
	
	if frame:GetName() and frame:GetName():find("Silver") or frame:GetName():find("Copper") then
		frame.backdrop:Point("BOTTOMRIGHT", -12, -2)
	end
end

function E.SkinDropDownBox(frame, width)
	local button = _G[frame:GetName().."Button"]
	if not width then width = 155 end
	
	frame:StripTextures()
	frame:Width(width)
	
	_G[frame:GetName().."Text"]:ClearAllPoints()
	_G[frame:GetName().."Text"]:Point("RIGHT", button, "LEFT", -2, 0)

	
	button:ClearAllPoints()
	button:Point("RIGHT", frame, "RIGHT", -10, 3)
	button.SetPoint = E.dummy
	
	E.SkinNextPrevButton(button, true)
	
	frame:CreateBackdrop("Default")
	frame.backdrop:Point("TOPLEFT", 20, -2)
	frame.backdrop:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", 2, -2)
end

function E.SkinCheckBox(frame)
	frame:StripTextures()
	frame:CreateBackdrop("Default")
	frame.backdrop:Point("TOPLEFT", 4, -4)
	frame.backdrop:Point("BOTTOMRIGHT", -4, 4)
	
	if frame.SetCheckedTexture then
		frame:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
	end
	
	if frame.SetDisabledTexture then
		frame:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
	end
	
	frame.SetNormalTexture = E.dummy
	frame.SetPushedTexture = E.dummy
	frame.SetHighlightTexture = E.dummy
end

function E.SkinCloseButton(f, point)
	for i=1, f:GetNumRegions() do
		local region = select(i, f:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetDesaturated(1)
			
			if region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Corner" then
				region:Kill()
			end
		end
	end	
	
	if point then
		f:Point("TOPRIGHT", point, "TOPRIGHT", 2, 2)
	end
end

local function AL_OnShow(self, event, ...)

	-- Move Positions
	AtlasLootPanel:Point("TOP", AtlasLootDefaultFrame, "BOTTOM", 0, -1)
	AtlasLootQuickLooksButton:Point("BOTTOM", AtlasLootItemsFrame, "BOTTOM", 53, 33)
	AtlasLootPanelSearch_Box:ClearAllPoints()
	AtlasLootPanelSearch_Box:Point("TOP", AtlasLoot_PanelButton_7, "BOTTOM", 80, -10)
	AtlasLootPanelSearch_SearchButton:Point("LEFT", AtlasLootPanelSearch_Box, "RIGHT", 5, 0)
	AtlasLootPanelSearch_SelectModuel:Point("LEFT", AtlasLootPanelSearch_SearchButton, "RIGHT", 5, 0)
	AtlasLootPanelSearch_ClearButton:Point("LEFT", AtlasLootPanelSearch_SelectModuel, "RIGHT", 5, 0)
	AtlasLootPanelSearch_LastResultButton:Point("LEFT", AtlasLootPanelSearch_ClearButton, "RIGHT", 5, 0)
	AtlasLoot10Man25ManSwitch:Point("BOTTOM", AtlasLootItemsFrame, "BOTTOM", -130, 4)
	AtlasLootServerQueryButton:Point("BOTTOM", AtlasLootItemsFrame, "BOTTOM", 130, 4)
	AtlasLoot_PanelButton_2:Point("LEFT", AtlasLoot_PanelButton_1, "RIGHT", 1, 0)
	AtlasLoot_PanelButton_3:Point("LEFT", AtlasLoot_PanelButton_2, "RIGHT", 1, 0)
	AtlasLoot_PanelButton_4:Point("LEFT", AtlasLoot_PanelButton_3, "RIGHT", 1, 0)
	AtlasLoot_PanelButton_5:Point("LEFT", AtlasLoot_PanelButton_4, "RIGHT", 1, 0)
	AtlasLoot_PanelButton_6:Point("LEFT", AtlasLoot_PanelButton_5, "RIGHT", 1, 0)
	AtlasLoot_PanelButton_8:Point("LEFT", AtlasLoot_PanelButton_7, "RIGHT", 1, 0)
	AtlasLoot_PanelButton_9:Point("LEFT", AtlasLoot_PanelButton_8, "RIGHT", 1, 0)
	AtlasLoot_PanelButton_10:Point("LEFT", AtlasLoot_PanelButton_9, "RIGHT", 1, 0)
	AtlasLoot_PanelButton_11:Point("LEFT", AtlasLoot_PanelButton_10, "RIGHT", 1, 0)
	AtlasLoot_PanelButton_12:Point("LEFT", AtlasLoot_PanelButton_11, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_Rarity:Point("LEFT", AtlasLootCompareFrameSortButton_Name, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_1:Point("LEFT", AtlasLootCompareFrameSortButton_Rarity, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_2:Point("LEFT", AtlasLootCompareFrameSortButton_1, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_3:Point("LEFT", AtlasLootCompareFrameSortButton_2, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_4:Point("LEFT", AtlasLootCompareFrameSortButton_3, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_5:Point("LEFT", AtlasLootCompareFrameSortButton_4, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_6:Point("LEFT", AtlasLootCompareFrameSortButton_5, "RIGHT", 1, 0)
	AtlasLootCompareFrame_CloseButton2:Point("BOTTOMRIGHT", AtlasLootCompareFrame, "BOTTOMRIGHT", -7, 10)
	AtlasLootCompareFrame_WishlistButton:Point("RIGHT", AtlasLootCompareFrame_CloseButton2, "LEFT", -1, 0)
	AtlasLootCompareFrameSearch_SearchButton:Point("LEFT", AtlasLootCompareFrameSearch_Box, "RIGHT", 5, 0)
	AtlasLootCompareFrameSearch_SelectModuel:Point("LEFT", AtlasLootCompareFrameSearch_SearchButton, "RIGHT", 5, 0)
	-- Set Sizes
	local AL = ""
		if AL == "" then
			AtlasLootPanelSearch_Box:SetHeight(16)
			AtlasLootPanel:SetWidth(921)
		end
		E.SkinCloseButton(AtlasLootDefaultFrame_LockButton)
end

local function Nine_IsThere(Self, event, ...)
				
				for i = 1, 9 do 
						local f = _G["AtlasLootCompareFrameSortButton_"..i]
						f:SetWidth(44.44)
				end
				
		local StripAllTextures = {
				"AtlasLootCompareFrameSortButton_7",
				"AtlasLootCompareFrameSortButton_8",
				"AtlasLootCompareFrameSortButton_9",
				}

	local SetTemplateD = { -- Default Texture
				"AtlasLootCompareFrameSortButton_7",
				"AtlasLootCompareFrameSortButton_8",
				"AtlasLootCompareFrameSortButton_9",
				}

				for _, object in pairs(StripAllTextures) do
							_G[object]:StripTextures()
				end	

				for _, object in pairs(SetTemplateD) do
							_G[object]:SetTemplate("Default")
				end		

	AtlasLootCompareFrameSortButton_7:Point("LEFT", AtlasLootCompareFrameSortButton_6, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_8:Point("LEFT", AtlasLootCompareFrameSortButton_7, "RIGHT", 1, 0)
	AtlasLootCompareFrameSortButton_9:Point("LEFT", AtlasLootCompareFrameSortButton_8, "RIGHT", 1, 0)
				
end

local function Compare_OnShow(self, event, ...)

				for i = 1, 6 do 
						local f = _G["AtlasLootCompareFrameSortButton_"..i]
						f:SetWidth(67.17)
				end
	
				local Nine = AtlasLootCompareFrameSortButton_9
					if Nine ~= nil then
					Nine:SetScript("OnUpdate", Nine_IsThere)
					else
					end	
end

local SkinAL = CreateFrame("Frame")
	SkinAL:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinAL:SetScript("OnEvent", function(self, event, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") then return end
	if not IsAddOnLoaded("AtlasLoot") then return end
			
		local FrameShow = AtlasLootDefaultFrame
		FrameShow:SetScript("OnUpdate", AL_OnShow)
		
		local CompareFrameShow = AtlasLootCompareFrame
		CompareFrameShow:SetScript("OnUpdate", Compare_OnShow)
		

			--start		
	local StripAllTextures = {
                "AtlasLootDefaultFrame",
                "AtlasLootItemsFrame",
				"AtlasLootPanel",
				"AtlasLootCompareFrame",
				"AtlasLootCompareFrame_ScrollFrameMainFilterScrollChildFrame",
				"AtlasLootCompareFrame_ScrollFrameItemFrame",
				"AtlasLootCompareFrame_ScrollFrameMainFilter",
				"AtlasLootCompareFrameSortButton_Name",
				"AtlasLootCompareFrameSortButton_Rarity",
				"AtlasLootCompareFrameSortButton_1",
				"AtlasLootCompareFrameSortButton_2",
				"AtlasLootCompareFrameSortButton_3",
				"AtlasLootCompareFrameSortButton_4",
				"AtlasLootCompareFrameSortButton_5",
				"AtlasLootCompareFrameSortButton_6",
				}

	local SetTemplateD = { -- Default Texture
                "AtlasLootItemsFrame",
				"AtlasLootCompareFrameSortButton_Name",
				"AtlasLootCompareFrameSortButton_Rarity",
				"AtlasLootCompareFrameSortButton_1",
				"AtlasLootCompareFrameSortButton_2",
				"AtlasLootCompareFrameSortButton_3",
				"AtlasLootCompareFrameSortButton_4",
				"AtlasLootCompareFrameSortButton_5",
				"AtlasLootCompareFrameSortButton_6",
				}

	local SetTemplateT = {-- Transparent Texture
                "AtlasLootDefaultFrame",
                "AtlasLootPanel",
				"AtlasLootCompareFrame",
				}	
	
	local buttons = {
                "AtlasLoot_AtlasInfoFrame_ToggleALButton",
                "AtlasLootServerQueryButton",
                "AtlasLootPanelSearch_SearchButton",
                "AtlasLootDefaultFrame_CompareFrame",
				"AtlasLootPanelSearch_ClearButton",
				"AtlasLootPanelSearch_LastResultButton",
				"AtlasLoot10Man25ManSwitch",
				"AtlasLootItemsFrame_BACK",
				"AtlasLootCompareFrameSearch_ClearButton",
				"AtlasLootCompareFrameSearch_SearchButton",
				"AtlasLootCompareFrame_WishlistButton",
				"AtlasLootCompareFrame_CloseButton2",
				}
							
				for _, object in pairs(StripAllTextures) do
							_G[object]:StripTextures()
				end	

				for _, object in pairs(SetTemplateD) do
							_G[object]:SetTemplate("Default")
				end	

				for _, object in pairs(SetTemplateT) do
							_G[object]:SetTemplate("Transparent")
				end			
	
	-- Skin Buttons
				for _, button in pairs(buttons) do
								E.SkinButton(_G[button])
				end	
	
				for i = 1, 12 do
					local f = _G["AtlasLoot_PanelButton_"..i]
					E.SkinButton(f)
				end
				for i = 1, 15 do -- 15 that I could find
					local f = _G["AtlasLootCompareFrameMainFilterButton"..i]
					f:StripTextures()
				end
				
	-- Skin Close Buttons
		E.SkinCloseButton(AtlasLootDefaultFrame_CloseButton)
		E.SkinCloseButton(AtlasLootDefaultFrame_LockButton)
		E.SkinCloseButton(AtlasLootCompareFrame_CloseButton)
		E.SkinCloseButton( AtlasLootCompareFrame_CloseButton_Wishlist)
	
	-- Skin Next Previous Buttons	
		E.SkinNextPrevButton(AtlasLootQuickLooksButton)
		E.SkinNextPrevButton(AtlasLootItemsFrame_NEXT)
		E.SkinNextPrevButton(AtlasLootItemsFrame_PREV)
		E.SkinNextPrevButton(AtlasLootPanelSearch_SelectModuel)	
		E.SkinNextPrevButton(AtlasLootCompareFrameSearch_SelectModuel)		
	
	-- Skin Dropdown Boxes		
		E.SkinDropDownBox(AtlasLootDefaultFrame_ModuleSelect, 225)
		E.SkinDropDownBox(AtlasLootDefaultFrame_InstanceSelect, 225)
		E.SkinDropDownBox(AtlasLootCompareFrameSearch_StatsListDropDown,240)
		E.SkinDropDownBox(AtlasLootCompareFrame_WishlistDropDown,200)
		
	-- Skin Edit Boxes
		E.SkinEditBox(AtlasLootPanelSearch_Box)
		E.SkinEditBox(AtlasLootCompareFrameSearch_Box)
		
	-- Skin Check Boxes
		E.SkinCheckBox(AtlasLootFilterCheck)
		E.SkinCheckBox(AtlasLootItemsFrame_Heroic)
		E.SkinCheckBox(AtlasLootCompareFrameSearch_FilterCheck)
	--end
end)