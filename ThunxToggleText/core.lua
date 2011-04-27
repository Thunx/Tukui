local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales
local E, C, L, DB = unpack(ElvUI)

TC = {	
	fontsize = 12,								-- Font storlek
	font = "Interface\\AddOns\\ThunxToggleText\\PT_Sans_Narrow.ttf",	-- Font
	textcolor = "|cff1784d1",						-- Text Color
	--Omen
	Omen = true,
	OposX = E.Scale(-200),								-- Position i x-led
	OposY = E.Scale(3),									-- Position i y-led (ökar värdet så går den längre ner på skärmen)
	
	--Recount
	Recount = true,
	RposX = E.Scale(-150),								-- Position i x-led
	RposY = E.Scale(3),									-- Position i y-led (ökar värdet så går den längre ner på skärmen)
	
	--Atlasloot
	Atlasloot = true,
	AposX = E.Scale(-100),								-- Position i x-led
	AposY = E.Scale(3),									-- Position i y-led (ökar värdet så går den längre ner på skärmen)
	
	
	
	} 
--------------------------------------------------------------------
-----Rör inget här under-----
--------------------------------------------------------------------

--------------------------------------------------------------------
-----Omen toggle knapp-----
--------------------------------------------------------------------
if IsAddOnLoaded("Omen") and TC.Omen == true then
	local OmenText=CreateFrame("Button","rOmenShowHide",UIParent)

	OmenText:SetPoint("BOTTOMRIGHT", ChatRBackground, "TOPRIGHT", TC.OposX, TC.OposY)
	OmenText:SetWidth(50) OmenText:SetHeight(25)
	OmenText.text= OmenText:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
	
	OmenText.text:SetPoint("CENTER")
	OmenText.text:SetFont(TC.font, TC.fontsize, "THINOUTLINE")
	OmenText.text:SetText(TC.textcolor.."Omen")
	
	
	OmenText:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" then Omen:ShowConfig() else Omen:Toggle()		
		end 
	end)
	
	if IsAddOnLoaded("ElvUI") then
		local x = CreateFrame("Frame")
		x:RegisterEvent("PLAYER_ENTERING_WORLD")
		x:SetScript("OnEvent", function(self, event)
		 if not Omen then return end
		 ChatRBackground:HookScript("OnShow", function() Omen:Toggle(false) OmenText:Show(); end)
		 ChatRBackground:HookScript("OnHide", function() Omen:Toggle(true) OmenText:Hide(); end)
		 self:UnregisterAllEvents()
		end)
	end
end

--------------------------------------------------------------------
-----Recount toggle knapp-----
--------------------------------------------------------------------
if IsAddOnLoaded("Recount") and TC.Recount == true  then
	local RecountText=CreateFrame("Button","RecountShowHide",UIParent)
	
	--RecountText:SetTemplate("Default", false)
	RecountText:SetPoint("BOTTOMRIGHT", ChatRBackground, "TOPRIGHT", TC.RposX, TC.RposY)
	RecountText:SetWidth(50) RecountText:SetHeight(25)
	
	RecountText.text = RecountText:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
	--RecountText:FontString(nil, C["media"].font, C["general"].fontscale, "THINOUTLINE")
	RecountText.text:SetPoint("CENTER")
	RecountText.text:SetFont(TC.font, TC.fontsize, "THINOUTLINE")
	RecountText.text:SetText(TC.textcolor.."Recount")

	RecountText:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" then Recount:ShowConfig()
		else
			if(Recount.MainWindow:IsShown())then Recount.MainWindow:Hide()
			else Recount.MainWindow:Show() Recount:RefreshMainWindow() 
			end 
		end
	end)
	
	if IsAddOnLoaded("ElvUI") then
		local x = CreateFrame("Frame")
		x:RegisterEvent("PLAYER_ENTERING_WORLD")
		x:SetScript("OnEvent", function(self, event)
		 if not Recount then return end
		 ChatRBackground:HookScript("OnShow", function() Recount.MainWindow:Hide() RecountText:Show(); end)
		 ChatRBackground:HookScript("OnHide", function() Recount.MainWindow:Show() Recount:RefreshMainWindow()  RecountText:Hide(); end)
		 self:UnregisterAllEvents()
		end)
	end
end

--------------------------------------------------------------------
-----Atlasloot toggle knapp-----
--------------------------------------------------------------------
if IsAddOnLoaded("AtlasLoot_Loader") and TC.Atlasloot == true  then
	
	local AtlasText=CreateFrame("Button","AtlasShowHide",UIParent)
	AtlasText:SetPoint("BOTTOMRIGHT", ChatRBackground, "TOPRIGHT", TC.AposX, TC.AposY)
	AtlasText:SetWidth(50) AtlasText:SetHeight(25)
	
	AtlasText.text=AtlasText:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
	AtlasText.text:SetPoint("CENTER")
	AtlasText.text:SetFont(TC.font, TC.fontsize, "THINOUTLINE")
	AtlasText.text:SetText(TC.textcolor.."Atlas")
	
	AtlasText:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" then AtlasLoot:OptionsToggle()
		else 
			AtlasLoot:ShowFrame_MiniMap()
		end 
	end)
	
	if IsAddOnLoaded("ElvUI") then
		local x = CreateFrame("Frame")
		x:RegisterEvent("PLAYER_ENTERING_WORLD")
		x:SetScript("OnEvent", function(self, event)
		 if not Recount then return end
		 ChatRBackground:HookScript("OnShow", function() AtlasText:Show(); end)
		 ChatRBackground:HookScript("OnHide", function() AtlasText:Hide(); end)
		 self:UnregisterAllEvents()
		end)
	end	
end

--------------------------------------------------------------------
-----Test toggle knapp-----
--------------------------------------------------------------------
--[[ 
if IsAddOnLoaded("Omen") then
	local OmenText=CreateFrame("Button","OmenShowHide",UIParent)

	OmenText:SetPoint("TOP", UIParent, "TOP", TC.OposX, TC.OposY)

	OmenText:SetWidth(50) OmenText:SetHeight(25)
	OmenText:SetBackdrop({bgFile="Interface\AddOns\ElvUI\media\textures\blank",
					insets = {left = 5, right = 5, top = 5, bottom = 5}} )

	OmenText.text=OmenText:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
	OmenText.text:SetPoint("CENTER",0,0)
	OmenText.text:SetFont(TC.font, TC.fontheight)
	OmenText.text:SetText(TC.textcolor.."Omen")
	
	if IsAddOnLoaded("ElvUI") then
		if E.myname == "Tanix" then
		OmenText.text:SetText(E.ValColor.."Omen")
		end
	end
	
	OmenText:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" then Omen:ShowConfig() else Omen:Toggle()		
		end 
	end)
end 
]]

