local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales
local E, C, L, DB = unpack(ElvUI)
--ttest
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
	
	--Skada
	Skada = true,
	SposX = E.Scale(-150),								-- Position i x-led
	SposY = E.Scale(3),									-- Position i y-led (ökar värdet så går den längre ner på skärmen)
	
	
	} 
--------------------------------------------------------------------
-----Rör inget här under-----
--------------------------------------------------------------------

--------------------------------------------------------------------
-----Omen toggle knapp-----
--------------------------------------------------------------------
if IsAddOnLoaded("Omen") and TC.Omen == true then
	--[[function E.PostOmenMove(frame)
		OmenMoveIndicator:ClearAllPoints()
		OmenMoveIndicator:SetPoint("BOTTOMRIGHT", ChatRPlaceHolder, "TOPRIGHT", -200, 20)
	end
	local once = false
	hooksecurefunc(OmenMoveIndicator, "SetPoint", function(_,_,parent)    ]]
	
	
	local OmenText = CreateFrame("Button","rOmenShowHide", ChatRBGTab, "SecureHandlerStateTemplate")
	
	OmenText:ClearAllPoints()
	OmenText:SetPoint("BOTTOMRIGHT", ChatRPlaceHolder, "TOPRIGHT", TC.OposX, TC.OposY)
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
		 ChatRBG:HookScript("OnShow", function() Omen:Toggle(false) OmenText:Show(); end)
		 ChatRBG:HookScript("OnHide", function() Omen:Toggle(true) OmenText:Hide(); end)
		 self:UnregisterAllEvents()
		end)
	end
	E.CreateMover(OmenText, "OmenTextMover", "oMOVE")
end

--------------------------------------------------------------------
-----Recount toggle knapp-----
--------------------------------------------------------------------
if IsAddOnLoaded("Recount") and TC.Recount == true then

	local RecountText=CreateFrame("Button", "RecountShowHide", ChatRBGTab, "SecureHandlerStateTemplate" )
	
	--RecountText:SetTemplate("Default", false)
	RecountText:ClearAllPoints()
	RecountText:SetPoint("BOTTOMRIGHT", ChatRPlaceHolder, "TOPRIGHT", TC.RposX, TC.RposY)
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
		 ChatRBG:HookScript("OnShow", function() Recount.MainWindow:Hide() RecountText:Show(); end)
		 ChatRBG:HookScript("OnHide", function() Recount.MainWindow:Show() Recount:RefreshMainWindow()  RecountText:Hide(); end)
		 self:UnregisterAllEvents()
		end)
	end
	E.CreateMover(RecountText, "RecountTextMover", "rMOVE")
end

--------------------------------------------------------------------
-----Atlasloot toggle knapp-----
--------------------------------------------------------------------
if IsAddOnLoaded("AtlasLoot_Loader") and TC.Atlasloot == true  then
	
	local AtlasText = CreateFrame("Button", "AtlasShowHide", ChatRBGTab, "SecureHandlerStateTemplate")
	
	AtlasText:ClearAllPoints()
	AtlasText:SetPoint("BOTTOMRIGHT", ChatRPlaceHolder, "TOPRIGHT", TC.AposX, TC.AposY)
	AtlasText:SetWidth(50) AtlasText:SetHeight(25)
	
	AtlasText.text = AtlasText:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
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
		 ChatRBG:HookScript("OnShow", function() AtlasText:Show(); end)
		 ChatRBG:HookScript("OnHide", function() AtlasText:Hide(); end)
		 self:UnregisterAllEvents()
		end)
	end
	E.CreateMover(AtlasText, "AtlasTextMover", "aMOVE")
end
--------------------------------------------------------------------
-----Skada toggle knapp-----
--------------------------------------------------------------------
if IsAddOnLoaded("Skada") and TC.Skada == true then
	
	local SkadaText = CreateFrame("Button", "SkadaShowHide", ChatRBGTab, "SecureHandlerStateTemplate")
	SkadaText:SetPoint("BOTTOMRIGHT", ChatRPlaceHolder, "TOPRIGHT", TC.SposX, TC.SposY)
	SkadaText:SetWidth(50) SkadaText:SetHeight(25)
	
	SkadaText.text=SkadaText:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
	SkadaText.text:SetPoint("CENTER")
	SkadaText.text:SetFont(TC.font, TC.fontsize, "THINOUTLINE")
	SkadaText.text:SetText(TC.textcolor.."Skada")
	
	SkadaText:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" then InterfaceOptionsFrame_OpenToCategory("Skada") else Skada:ToggleWindow()
			
		end 
	end)
	
	if IsAddOnLoaded("ElvUI") then 
		local x = CreateFrame("Frame")
		x:RegisterEvent("PLAYER_ENTERING_WORLD")
		x:SetScript("OnEvent", function(self, event)
		if not Skada then return end
		ChatRBG:HookScript("OnShow", function() SkadaText:Show(); Skada:SetActive(false) end)
		ChatRBG:HookScript("OnHide", function() SkadaText:Hide(); Skada:SetActive(true) end)
		self:UnregisterAllEvents()
		end)
	end
	E.CreateMover(SkadaText, "SkadaTextMover", "sMOVE")	
end

if ElvUI then
	
elseif TukUI then
--	T.CreateMover(TukUI_TrinketBar, "TukUI_TrinketBar", "Trink Bar")
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

