local E, C, L = unpack(ElvUI) --Importer funktioner och konstanter, inställningar och "Locales" från ElvUI

TC = {	
	fontsize = 12,								-- Font storlek
	font = "Interface\\AddOns\\ThunxToggleText\\PT_Sans_Narrow.ttf",	-- Font
	textcolor = "|cff1784d1",						-- Text Color  (white)
	--Omen
	Omen = true,
	OposX = 610,									-- Position i x-led
	OposY = -876,									-- Position i y-led (ökar värdet så går den längre ner på skärmen)
	
	--Recount
	Recount = true,
	RposX = 660,									-- Position i x-led
	RposY = -876,									-- Position i y-led (ökar värdet så går den längre ner på skärmen)
	
	--Atlasloot
	Atlasloot = true,
	AposX = 710,									-- Position i x-led
	AposY = -876,									-- Position i y-led (ökar värdet så går den längre ner på skärmen)
	
	
	
	} 
--------------------------------------------------------------------
-----Rör inget här under-----
--------------------------------------------------------------------
--------------------------------------------------------------------
-----Omen toggle knapp-----
--------------------------------------------------------------------
if IsAddOnLoaded("Omen") and TC.Omen == true then
	local OmenText=CreateFrame("Button","OmenShowHide",UIParent)

	OmenText:SetPoint("TOP", UIParent, "TOP", TC.OposX, TC.OposY)
	OmenText:SetWidth(50) OmenText:SetHeight(25)
	OmenText.text=OmenText:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
	OmenText.text:SetPoint("CENTER",0,0)
	OmenText.text:SetFont(TC.font, TC.fontsize, "THINOUTLINE")
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

--------------------------------------------------------------------
-----Recount toggle knapp-----
--------------------------------------------------------------------
if IsAddOnLoaded("Recount") and TC.Recount == true  then
	local RecountText=CreateFrame("Button","RecountShowHide",UIParent)

	RecountText:SetPoint("TOP", UIParent, "TOP", TC.RposX, TC.RposY)
	RecountText:SetWidth(50) RecountText:SetHeight(25)
	RecountText.text=RecountText:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
	RecountText.text:SetPoint("CENTER",0,0)
	RecountText.text:SetFont(TC.font, TC.fontsize, "THINOUTLINE")
	--RecountText.text:SetShadowColor(0, 0, 0, 0.4)
	--RecountText.text:SetShadowOffset(E.mult, -E.mult)
	RecountText.text:SetText(TC.textcolor.."Recount")

	RecountText:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" then Recount:ShowConfig()
		else
			if(Recount.MainWindow:IsShown())then Recount.MainWindow:Hide()
			else Recount.MainWindow:Show() Recount:RefreshMainWindow() 
			end 
		end
	end)
end

--------------------------------------------------------------------
-----Atlasloot toggle knapp-----
--------------------------------------------------------------------
if IsAddOnLoaded("Atlasloot") and TC.Atlasloot == true  then
	local AtlasText=CreateFrame("Button","AtlasShowHide",UIParent)

	AtlasText:SetPoint("TOP", UIParent, "TOP", TC.AposX, TC.AposY)
	AtlasText:SetWidth(50) AtlasText:SetHeight(25)
	AtlasText.text=AtlasText:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
	AtlasText.text:SetPoint("CENTER",0,0)
	AtlasText.text:SetFont(TC.font, TC.fontsize, "THINOUTLINE")
	AtlasText.text:SetText(TC.textcolor.."Atlas")
	
	if IsAddOnLoaded("ElvUI") then
		if E.myname == "Tanix" then
		AtlasText.text:SetText(E.ValColor.."Omen")
		end
	end
	
	AtlasText:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" then AtlasLoot:OptionsToggle()
		else 
			AtlasLoot:ShowFrame_MiniMap()
		end 
	end)
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
