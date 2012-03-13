local E, L, P, G = unpack(ElvUI); -- Import Functions/Constants, Config, Locales
local S = E:GetModule('Skins')


----------------------------------------------------------------------
-- 							By Cadayron'
--	Ediited by Thunx
-- Inspired by Tukz, Elv, Hydra codes and lduvall for icons
----------------------------------------------------------------------

 -- Config variables
font = P.general.font            			-- Font to be used for button text
fontsize = 12                       	-- Size of font for button text
tabwidth = 27    	-- Width of chatframe
tabspacing = P.actionbar.bar1.buttonspacing
chatheight = P.general.panelHeight    		-- Height of chatframe
tabheight = 23 -- Height of tab
firstposition = ((chatheight-((tabheight*4)+(tabspacing*5)))/2)+tabheight/4  --Set the positon for default chat height size
selectioncolor = {r = 23/255,g = 132/255,b = 209/255}
	

----------------------------------------------------------------------
-- Array for Toggle and Lock functions
----------------------------------------------------------------------
TabIn = {}
TabIn[1] = false
TabIn[2] = false
TabIn[3] = false
TabIn[4] = false
TLock = {}
TLock[1] = false
TLock[2] = false
TLock[3] = false
TLock[4] = false


----------------------------------------------------------------------
-- Functions (Toggle and Update lock)
----------------------------------------------------------------------

E.ToggleTab = function(square,indexIn, id)
	if indexIn == true then
		square:Show()
		TabIn[id] = false
		square:Show()
		square:SetAlpha(1)
	else
		square:SetAlpha(1);
		square:Show()
		TabIn[id] = true
	end
end

E.UpdateTabLock = function(skin,indexLock, id)
	 if indexLock == true then
		TLock[id] = false
		skin:SetVertexColor(35/255,164/255,255/255)
	 else
		TLock[id] = true;
		skin:SetVertexColor(35/255,164/255,255/255)
	 end
end




local tab
local LoadTab = function(self)
tab = CreateFrame("Frame", "tab", RightChatPanel) 	-- Tab creationif not E.db.skins.thunx.enabletab == true then return end

	if not E.db.skins.thunx.enabletab == true then return end
	
	for i = 1, 4 do
		tab[i] = CreateFrame("Button", "tab"..i, tab)
		tab[i]:SetFrameLevel(10)
		tab[i]:Size(tabwidth,tabheight)
		--tab[i]:SetTemplate("Default")
		
		
		if i == 1 then
			tab[i]:Point("TOPLEFT",  RightChatPanel, "TOPRIGHT", -50, -5)
		else
			tab[i]:Point("RIGHT", tab[i-1], "LEFT", -10, 0)
		end
		tab[i]:EnableMouse(true	)
		tab[i]:RegisterForClicks("AnyUp")
		--tab[i]:SetAlpha(0)
		tab[i].text = tab[i]:CreateFontString(nil, font, fontsize)
		tab[i].text:SetPoint("CENTER", 0, 0)

		--Atlasloot
		if E.db.skins.thunx.tableft == 'Atlasloot' then
			atX = 4
		elseif E.db.skins.thunx.tableftmiddle == 'Atlasloot' then
			atX = 3
		elseif E.db.skins.thunx.tabrightmiddle == 'Atlasloot' then
			atX = 2
		elseif E.db.skins.thunx.tabright == 'Atlasloot' then	
			atX = 1
		end
			--Omen
		if E.db.skins.thunx.tableft == 'Omen'then
			omX = 4
		elseif E.db.skins.thunx.tableftmiddle == 'Omen' then
			omX = 3
		elseif E.db.skins.thunx.tabrightmiddle == 'Omen' then
			omX = 2
		elseif E.db.skins.thunx.tabright == 'Omen 'then
			omX = 1
		end
		--Recount
		if E.db.skins.thunx.tableft == 'Recount' then
			reX = 4
		elseif E.db.skins.thunx.tableftmiddle == 'Recount'	then
			reX = 3
		elseif E.db.skins.thunx.tabrightmiddle == 'Recount' then
			reX = 2
		elseif E.db.skins.thunx.tabright == 'Recount' then
			reX = 1
		end
		--Encounterjournal
		if E.db.skins.thunx.tableft == 'Encounterjournal' then
			ejX = 4
		elseif E.db.skins.thunx.tableftmiddle == 'Encounterjournal' then
			ejX = 3
		elseif E.db.skins.thunx.tabrightmiddle == 'Encounterjournal' then
			ejX = 2
		elseif E.db.skins.thunx.tabright == 'Encounterjournal' then
			ejX = 1
		end
		--Skada
		if E.db.skins.thunx.tableft == 'Skada' then
			skX = 4
		elseif E.db.skins.thunx.tableftmiddle == 'Skada' then
			skX = 3
		elseif E.db.skins.thunx.tabrightmiddle == 'Skada' then
			skX = 2
		elseif E.db.skins.thunx.tabright == 'Skada' then
			skX = 1
		end

		if i == atX then 		-- Atlasloot
		
				-- Set Texture
				TTALoot = tab[i]:CreateTexture(nil, "ARTWORK")
				TTALoot:Point("TOPLEFT", tab[i], E:Scale(4), E:Scale(-4))
				TTALoot:Point("BOTTOMRIGHT",tab[i], E:Scale(-4), E:Scale(4))
				TTALoot:SetTexture("Interface\\AddOns\\ElvUI_Thunx\\media\\AL")
				TTALoot:SetVertexColor(unpack(E["media"].rgbvaluecolor))
				
				tab[i]:SetScript("OnEnter", function(self)
					GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, E:Scale(6));
					GameTooltip:ClearAllPoints()
					GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, E.mult)
					GameTooltip:ClearLines()
					if TLock[i] == true then
						GameTooltip:AddDoubleLine("AtlasLoot : ", HIDE,1,1,1,selectioncolor)
					else
						GameTooltip:AddDoubleLine("AtlasLoot : ", SHOW,1,1,1,selectioncolor)
					end
					GameTooltip:Show()
					if TLock[i] == true then return end;
					E.ToggleTab(self, TabIn[i], 1); 
				end) 
				
				tab[1]:SetScript("OnLeave", function(self)
					GameTooltip:Hide()
					if TLock[i] == true then return end;
					E.ToggleTab(self, TabIn[i], 1);
					
				end)
				
				tab[i]:SetScript("OnMouseDown", function()
					GameTooltip:ClearLines()
					if TLock[i] == true then
						GameTooltip:AddDoubleLine("AtlasLoot : ", SHOW,1,1,1,selectioncolor)
					else
						GameTooltip:AddDoubleLine("AtlasLoot : ", HIDE,1,1,1,selectioncolor)
					end
					if not IsAddOnLoaded("AtlasLoot") then AtlasLoot:LoadModule("AtlasLoot") end
					ToggleFrame(AtlasLootDefaultFrame)
					E.UpdateTabLock(TTALoot, TLock[i], 1); 
				end)
			
		
		elseif i == omX then 	-- Omen
			if IsAddOnLoaded("Omen") then
				-- Set Texture
				TTOmen = tab[i]:CreateTexture(nil, "ARTWORK")
				TTOmen:Point("TOPLEFT", tab[i], E:Scale(4), E:Scale(-4))
				TTOmen:Point("BOTTOMRIGHT",tab[i], E:Scale(-4), E:Scale(4))
				TTOmen:SetTexture("Interface\\AddOns\\ElvUI_Thunx\\media\\Omen")
				TTOmen:SetVertexColor(unpack(E["media"].rgbvaluecolor))
				
				tab[i]:SetScript("OnEnter", function(self)
					GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, E:Scale(6));
					GameTooltip:ClearAllPoints()
					GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, E.mult)
					GameTooltip:ClearLines()
					if TLock[i] == true then
						GameTooltip:AddDoubleLine("Omen : ", HIDE,1,1,1,selectioncolor)
					else
						GameTooltip:AddDoubleLine("Omen : ", SHOW,1,1,1,selectioncolor)
					end
					GameTooltip:Show()
					if TLock[i] == true then return end;
					E.ToggleTab(self, TabIn[i], 2);
				end) 
				
				tab[i]:SetScript("OnLeave", function(self)
					GameTooltip:Hide()
					if TLock[i] == true then return end;
					E.ToggleTab(self, TabIn[i], 2);
				end)
				
				tab[i]:SetScript("OnMouseDown", function()
					GameTooltip:ClearLines()
					if TLock[i] == true then
						GameTooltip:AddDoubleLine("Omen : ", SHOW,1,1,1,selectioncolor)
					else
						GameTooltip:AddDoubleLine("Omen : ", HIDE,1,1,1,selectioncolor)
					end
					ToggleFrame(Omen.Anchor);
					E.UpdateTabLock(TTOmen, TLock[i], 2);
				end)
			end
		
		elseif i == skX then 	-- Skada
			if IsAddOnLoaded("Skada") then
				-- Set Texture
				TTSkada = tab[i]:CreateTexture(nil, "ARTWORK")
				TTSkada:Point("TOPLEFT", tab[i], E:Scale(4), E:Scale(-4))
				TTSkada:Point("BOTTOMRIGHT",tab[i], E:Scale(-4), E:Scale(4))
				TTSkada:SetTexture("Interface\\AddOns\\ElvUI_Thunx\\media\\Recount")
				function E:UpdateMedia()
				TTSkada:SetVertexColor(unpack(E["media"].rgbvaluecolor))
				end
				
				tab[i]:SetScript("OnEnter", function(self)
					GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, E:Scale(6));
					GameTooltip:ClearAllPoints()
					GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, E.mult)
					GameTooltip:ClearLines()
					if TLock[i] == true then
						GameTooltip:AddDoubleLine("Skada : ", HIDE,1,1,1,selectioncolor)
					else
						GameTooltip:AddDoubleLine("Skada : ", SHOW,1,1,1,selectioncolor)
					end
					GameTooltip:Show() 
					if TLock[i] == true then return end; 
					E.ToggleTab(self, TabIn[i], 3); 
				end) 
				
				tab[i]:SetScript("OnLeave", function(self) 
					GameTooltip:Hide()
					if TLock[i] == true then return end;
					E.ToggleTab(self, TabIn[i], 3); 
				end)
				
				tab[i]:SetScript("OnMouseDown", function()
					GameTooltip:ClearLines()
					if TLock[i] == true then
						GameTooltip:AddDoubleLine("Skada : ", SHOW,1,1,1,selectioncolor)
					else
						GameTooltip:AddDoubleLine("Skada : ", HIDE,1,1,1,selectioncolor)
					end
					Skada:ToggleWindow()
					E.UpdateTabLock(TTSkada, TLock[i], 3); 
				end)
			end 
			
			
		elseif i == reX then 	-- Recount
			if IsAddOnLoaded("Recount") then
				-- Set Texture
				TTRecount = tab[i]:CreateTexture(nil, "ARTWORK")
				TTRecount:Point("TOPLEFT", tab[i], E:Scale(4), E:Scale(-4))
				TTRecount:Point("BOTTOMRIGHT",tab[i], E:Scale(-4), E:Scale(4))
				TTRecount:SetTexture("Interface\\AddOns\\ElvUI_Thunx\\media\\Recount")
				TTRecount:SetVertexColor(unpack(E["media"].rgbvaluecolor))
				
				tab[i]:SetScript("OnEnter", function()
					GameTooltip:SetOwner(tab[i], "ANCHOR_TOP", 0, E:Scale(6));
					GameTooltip:ClearAllPoints()
					GameTooltip:SetPoint("BOTTOM", tab[i], "TOP", 0, E.mult)
					GameTooltip:ClearLines()
					if TLock[i] == true then
						GameTooltip:AddDoubleLine("Recount : ", HIDE,1,1,1,selectioncolor)
					else
						GameTooltip:AddDoubleLine("Recount : ", SHOW,1,1,1,selectioncolor)
					end
					GameTooltip:Show() 
					if TLock[i] == true then return end; 
					E.ToggleTab(tab[i], TabIn[i], 3); 
				end) 
				
				tab[i]:SetScript("OnLeave", function() 
					GameTooltip:Hide()
					if TLock[i] == true then return end;
					E.ToggleTab(tab[i], TabIn[i], 3); 
				end)
				
				tab[i]:SetScript("OnMouseDown", function()
					GameTooltip:ClearLines()
					if TLock[i] == true then
						GameTooltip:AddDoubleLine("Recount : ", SHOW,1,1,1,selectioncolor)
					else
						GameTooltip:AddDoubleLine("Recount : ", HIDE,1,1,1,selectioncolor)
					end 
					ToggleFrame(Recount.MainWindow); 
					Recount.RefreshMainWindow(); 
					E.UpdateTabLock(TTRecount, TLock[i], 3); 
				end) 
			end
			
		elseif i == ejX then 		-- Encounter Journal
		
			-- Set Texture
			TTEncJourn = tab[i]:CreateTexture(nil, "ARTWORK")
			TTEncJourn:Point("TOPLEFT", tab[i], E:Scale(4), E:Scale(-4))
			TTEncJourn:Point("BOTTOMRIGHT",tab[i], E:Scale(-4), E:Scale(4))
			TTEncJourn:SetTexture("Interface\\AddOns\\ElvUI_Thunx\\media\\EJ")
			TTEncJourn:SetVertexColor(unpack(E["media"].rgbvaluecolor))
			
			tab[i]:SetScript("OnEnter", function(self)
				GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, E:Scale(6));
				GameTooltip:ClearAllPoints()
				GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, E.mult)
				GameTooltip:ClearLines()
				if TLock[i] == true then
					GameTooltip:AddDoubleLine("Encounter Journal : ", HIDE,1,1,1,selectioncolor)
				else
					GameTooltip:AddDoubleLine("Encounter Journal : ", SHOW,1,1,1,selectioncolor)
				end
				GameTooltip:Show()  
				if TLock[i] == true then return end; 
				E.ToggleTab(self, TabIn[i], 4); 
			end) 
			
			tab[i]:SetScript("OnLeave", function(self)
				GameTooltip:Hide()
				if TLock[i] == true then return end; 
				E.ToggleTab(self, TabIn[i], 4); 
			end)
			
			tab[i]:SetScript("OnMouseDown", function()
				GameTooltip:ClearLines()
				if TLock[i] == true then
					GameTooltip:AddDoubleLine("Encounter Journal : ", SHOW,1,1,1,selectioncolor)
				else
					GameTooltip:AddDoubleLine("Encounter Journal : ", HIDE,1,1,1,selectioncolor)
				end 
				if not IsAddOnLoaded('Blizzard_EncounterJournal') then LoadAddOn('Blizzard_EncounterJournal'); end
				ToggleFrame(EncounterJournal);
				E.UpdateTabLock(TTEncJourn, TLock[i], 4); 
			end)
			
		-- elseif i == 4 then 		-- Name
		
			--Set Texture
			-- TTName = tab[i]:CreateTexture(nil, "ARTWORK")
			-- TTName:SetPoint("TOPLEFT", tab[i], T.Scale(4), T.Scale(-4))
			-- TTName:SetPoint("BOTTOMRIGHT",tab[i], T.Scale(-4), T.Scale(4))
			-- TTName:SetTexture("Interface\\AddOns\\ElvUI_Thunx\\media\\ec") --Get icon in media folder
			-- TTName:SetVertexColor(unpack(E["media"].rgbvaluecolor))
			
			-- tab[i]:SetScript("OnEnter", function(self)
				-- GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, T.Scale(6));
				-- GameTooltip:ClearAllPoints()
				-- GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, T.mult)
				-- GameTooltip:ClearLines()
				-- if TLock[i] == true then
					-- GameTooltip:AddDoubleLine("Name : ", HIDE,1,1,1,selectioncolor)
				-- else
					-- GameTooltip:AddDoubleLine("Name : ", SHOW,1,1,1,selectioncolor)
				-- end
				-- GameTooltip:Show()  
				-- if TLock[i] == true then return end; 
				-- T.ToggleTab(self, TabIn[i], 4); 
			-- end) 
			
			-- tab[i]:SetScript("OnLeave", function(self)
				-- GameTooltip:Hide()
				-- if TLock[i] == true then return end; 
				-- T.ToggleTab(self, TabIn[i], 4); 
			-- end)
			
			-- tab[i]:SetScript("OnMouseDown", function(self)
				-- GameTooltip:ClearLines()
				-- if TLock[i] == true then
					-- GameTooltip:AddDoubleLine("ElvUi ConfigUi : ", SHOW,1,1,1,selectioncolor)
				-- else
					-- GameTooltip:AddDoubleLine("ElvUi ConfigUi : ", HIDE,1,1,1,selectioncolor)
				-- end 
				--<command to toggle the addon>
				-- T.UpdateTabLock(TTName, TLock[i], 4); 
			-- end)
		end 
	end 
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

local FrameLoad = CreateFrame("Frame")
FrameLoad:RegisterEvent("PLAYER_ENTERING_WORLD")
FrameLoad:SetScript("OnEvent", LoadTab)

