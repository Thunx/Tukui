local E, L, DF = unpack(ElvUI); -- Import Functions/Constants, Config, Locales


--------------------------------------------------------------------
-----Recount toggle knapp-----
--------------------------------------------------------------------
	local RecountText = CreateFrame('Button', 'RText', RightChatPanel) 
	RecountText:Point("TOPLEFT",  RightChatPanel, "TOPRIGHT", -100, -4)
	RecountText:Size( 50, 22)
	RecountText:SetFrameLevel(10)
	
	RecountText.text = RecountText:CreateFontString(nil, 'OVERLAY')
	RecountText.text:FontTemplate()
	RecountText.text:SetPoint('CENTER')
	RecountText.text:SetJustifyH('CENTER')
	RecountText.text:SetText(E.ValColor..'Recount')
	
	E.CreateMover(anchor, RecountText, "RecountTextMover", "rMOVE")
	
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
			RightChatPanel:HookScript("OnShow", function() Recount.MainWindow:Hide() RecountText:Show(); end)
			RightChatPanel:HookScript("OnHide", function() Recount.MainWindow:Show() Recount:RefreshMainWindow() RecountText:Hide(); end)
			self:UnregisterAllEvents()
		end)
	end
--------------------------------------------------------------------
-----Omen toggle knapp-----
--------------------------------------------------------------------
	local OmenText = CreateFrame('Button', 'OText', RightChatPanel) 
	OmenText:Point("TOPLEFT",  RightChatPanel, "TOPRIGHT", -150, -4)
	OmenText:Size( 50, 22)
	OmenText:SetFrameLevel(10)
	--OmenText:SetTemplate('Default', true)
	
	OmenText.text = OmenText:CreateFontString(nil, 'OVERLAY')
	OmenText.text:FontTemplate()
	OmenText.text:SetPoint('CENTER')
	OmenText.text:SetJustifyH('CENTER')
	OmenText.text:SetText(E.ValColor..'Omen')
	
	E.CreateMover(anchor, OmenText, "OmenTextMover", "oMOVE")
	
	OmenText:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" 
			then 
				Omen:ShowConfig() 
			else 
				Omen:Toggle()
		end
	end)
	
	if IsAddOnLoaded("ElvUI") then
		local x = CreateFrame("Frame")
		x:RegisterEvent("PLAYER_ENTERING_WORLD")
		x:SetScript("OnEvent", function(self, event)
		if not Recount then return end
			RightChatPanel:HookScript("OnShow", function() Omen:Toggle(false) OmenText:Show(); end)
			RightChatPanel:HookScript("OnHide", function() Omen:Toggle(true) OmenText:Hide(); end)
			self:UnregisterAllEvents()
		end)
	end
--------------------------------------------------------------------
-----AtlasLoot toggle knapp-----
--------------------------------------------------------------------
	local AtlasText = CreateFrame('Button', 'AText', RightChatPanel) 
	AtlasText:Point("TOPLEFT",  RightChatPanel, "TOPRIGHT", -200, -4)
	AtlasText:Size( 50, 22)
	AtlasText:SetFrameLevel(10)
	--OmenText:SetTemplate('Default', true)
	
	AtlasText.text = AtlasText:CreateFontString(nil, 'OVERLAY')
	AtlasText.text:FontTemplate()
	AtlasText.text:SetPoint('CENTER')
	AtlasText.text:SetJustifyH('CENTER')
	AtlasText.text:SetText(E.ValColor..'Atlas')
	
	E.CreateMover(anchor, AtlasText, "AtlasTextMover", "aMOVE")
	
	AtlasText:SetScript("OnMouseDown", function(self, btn)
		if btn == "RightButton" 
			then 
				AtlasLoot:OptionsToggle()
			else
				AtlasLoot:ShowFrame_MiniMap()
		end
	end)
	
	if IsAddOnLoaded("ElvUI") then
		local x = CreateFrame("Frame")
		x:RegisterEvent("PLAYER_ENTERING_WORLD")
		x:SetScript("OnEvent", function(self, event)
		if not Recount then return end
			RightChatPanel:HookScript("OnShow", function() AtlasText:Show(); end)
			RightChatPanel:HookScript("OnHide", function()  AtlasText:Hide(); end)
			self:UnregisterAllEvents()
		end)
	end
	