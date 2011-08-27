local E, C, L, DB, T

--detect elvui or regular tukui
if ElvUI then
	E, C, L, DB = unpack(ElvUI)
elseif Tukui then
	T, C, L = unpack(Tukui)	
end

local TukUI_TrinketBar = CreateFrame("Frame", "CustomTukuiTukUI_TrinketBar", UIParent, "SecureHandlerStateTemplate")

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

local X = 0 				-- location on screen
local Y = -150 				-- location on screen

-- { trinket1, trinket2, button 3, button 4, button 5, ...... button N }
-- format is "spell name",inventory item number
--
local spellz =  {"Shadowfiend",58091 ,"Archangel"}


-- button sizes
local width = 25
local height = 25

local offset_x = 2 -- gap around buttons to frame

TukUI_TrinketBar.tooltip = true  -- enable/disable tooltips

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

local offset_y = -2

-- panel size
local num_panels = table.getn(spellz) + 2
local panel_x =  (width+offset_x)*num_panels + offset_x
--1374
local panel_y = height + offset_x


local function GetSpellID(spell)
	local name
	for i = 1, 100000 do
		name = GetSpellInfo(i)
		if name == spell then
			return i
		end
	end
end


TukUI_TrinketBar:CreatePanel("Default", panel_x, panel_y, "CENTER", UIParent, "CENTER", X, Y)

local TukUI_TrinketButton = CreateFrame("Button", "TukUI_TrinketButton", TukUI_TrinketBar, "SecureActionButtonTemplate")
-- spell stuffz
for i = 1, (table.getn(spellz) + 2) do
	--button stuffz
	TukUI_TrinketButton[i] = CreateFrame("Button", "TukUI_TrinketButton"..i, TukUI_TrinketBar, "SecureActionButtonTemplate")
	TukUI_TrinketButton[i]:CreatePanel("Default", width, height, "TOPLEFT", TukUI_TrinketBar, "TOPLEFT", offset_x, offset_y )

	if i ~= 1 then
		TukUI_TrinketButton[i]:SetPoint("TOPLEFT", TukUI_TrinketButton[i-1], "TOPRIGHT", offset_x, 0)
	end

	-- texture settup
	TukUI_TrinketButton[i].texture = TukUI_TrinketButton[i]:CreateTexture(nil, "BORDER")
	TukUI_TrinketButton[i].texture:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	TukUI_TrinketButton[i].texture:SetPoint("TOPLEFT", TukUI_TrinketButton[i] ,"TOPLEFT", offset_x, offset_y)
	TukUI_TrinketButton[i].texture:SetPoint("BOTTOMRIGHT", TukUI_TrinketButton[i] ,"BOTTOMRIGHT", offset_y, offset_x)
	-- cooldown overlay
	TukUI_TrinketButton[i].cooldown = CreateFrame("Cooldown", "$parentCD", TukUI_TrinketButton[i], "CooldownFrameTemplate")
	TukUI_TrinketButton[i].cooldown:SetAllPoints(TukUI_TrinketButton[i].texture)				
	-- text settup
	TukUI_TrinketButton[i].value = TukUI_TrinketButton[i]:CreateFontString(nil, "ARTWORK")
	TukUI_TrinketButton[i].value:SetFont(C["media"].font, 15, "OUTLINE")
	TukUI_TrinketButton[i].value:SetTextColor(1, 0, 0)
	TukUI_TrinketButton[i].value:SetShadowColor(0, 0, 0, 0.5)
	TukUI_TrinketButton[i].value:SetShadowOffset(offset_x, offset_y)
	TukUI_TrinketButton[i].value:Point("CENTER", TukUI_TrinketButton[i], "CENTER")

	-- hoverover stuffz
	TukUI_TrinketButton[i]:StyleButton()
	TukUI_TrinketButton[i].ScanTip = CreateFrame("GameTooltip","TrinketTip",nil,"GameTooltipTemplate")
	
	--tooltip stuffz
	TukUI_TrinketButton[i]:SetScript("OnEnter", 
	function(self) 
		GameTooltip:SetOwner(self,"ANCHOR_BOTTOMRIGHT"); 
		GameTooltip:SetClampedToScreen(true);
		GameTooltip:ClearLines();
		if TukUI_TrinketBar.tooltip then
			local v = spellz[i-2]
			if i == 1 or i == 2 then
				GameTooltip:SetInventoryItem("player", i+12);
			elseif GetSpellInfo(v) == v then --spell name
				GameTooltip:SetSpellByID (GetSpellID(v))
			elseif type(v) == "number" then -- inventory Item number		
				GameTooltip:SetItemByID(v) 
			end
			GameTooltip:Show() 
		end
	end);
	TukUI_TrinketButton[i]:SetScript("OnLeave", function(self) GameTooltip_Hide() end);
	TukUI_TrinketButton[i]:EnableMouse(true)	
	
	-- cooldown stuffz
	TukUI_TrinketButton[i]:SetScript("OnUpdate", function()		
		if i == 1 then -- trinket #1, slot 13
			local trinket1id = GetInventoryItemID("player", 13)
			if trinket1id then 
				TukUI_TrinketButton[i].texture:SetTexture(select(10, GetItemInfo(trinket1id)))
				local start, duration, enabled = GetItemCooldown(trinket1id)
				if enabled ~= 0 then
					TukUI_TrinketButton[i].texture:SetVertexColor(1,1,1)
					TukUI_TrinketButton[i].cooldown:SetCooldown(start, duration)
				else
					TukUI_TrinketButton[i].texture:SetVertexColor(.35, .35, .35)
				end
			else
				TukUI_TrinketButton[i].texture:SetTexture(select(10, 0))
				TukUI_TrinketButton[i].cooldown:SetCooldown(0, 0)
			end
			if InCombatLockdown() == nil then 
				TukUI_TrinketButton[i]:SetAttribute("type", "item");
				TukUI_TrinketButton[i]:SetAttribute("item", 13)
			end
		elseif i == 2 then -- trinket #2 slot 14
			local trinket2id = GetInventoryItemID("player", 14)
			if trinket2id then 
				TukUI_TrinketButton[i].texture:SetTexture(select(10, GetItemInfo(trinket2id)))
				local start, duration, enabled = GetItemCooldown(trinket2id)
				if enabled ~= 0 then
					TukUI_TrinketButton[i].texture:SetVertexColor(1,1,1)
					TukUI_TrinketButton[i].cooldown:SetCooldown(start, duration)
				else
					TukUI_TrinketButton[i].texture:SetVertexColor(.35, .35, .35)
				end	
			else
				TukUI_TrinketButton[i].texture:SetTexture(select(10, 0))
				TukUI_TrinketButton[i].cooldown:SetCooldown(0, 0)
			end
			if InCombatLockdown() == nil then 
				TukUI_TrinketButton[i]:SetAttribute("type", "item");
				TukUI_TrinketButton[i]:SetAttribute("item", 14)
			end
		elseif i > 2 then
			local v = spellz[i-2]
			local name = GetItemInfo(v) 
			if GetSpellInfo(v) == v then --spell name
				TukUI_TrinketButton[i].texture:SetTexture(select(3, GetSpellInfo(v)))
				local start, duration, enabled = GetSpellCooldown(v)
				if  InCombatLockdown() == nil then 
					TukUI_TrinketButton[i]:SetAttribute("type", "spell");
					TukUI_TrinketButton[i]:SetAttribute("spell",v)
				end
				if enabled ~= 0 then 
					TukUI_TrinketButton[i].texture:SetVertexColor(1,1,1)
					TukUI_TrinketButton[i].cooldown:SetCooldown(start, duration)
				else
					TukUI_TrinketButton[i].texture:SetVertexColor(.35, .35, .35)
				end
			elseif type(v) == "number" then -- inventory Item number
				TukUI_TrinketButton[i].texture:SetTexture(select(10, GetItemInfo(v)))
				local start, duration, enabled = GetItemCooldown(v)
				if  InCombatLockdown() == nil then 
					TukUI_TrinketButton[i]:SetAttribute("type", "item");
					TukUI_TrinketButton[i]:SetAttribute("item", GetItemInfo(v))
				end
				if enabled ~= 0 then
				TukUI_TrinketButton[i].texture:SetVertexColor(1,1,1)
				TukUI_TrinketButton[i].cooldown:SetCooldown(start, duration)
				else
				TukUI_TrinketButton[i].texture:SetVertexColor(.35, .35, .35)
				end
			end
		end
	end)

end

if ElvUI then
	E.CreateMover(TukUI_TrinketBar, "TukUI_TrinketBar", "Trink Bar")
elseif TukUI then
--	T.CreateMover(TukUI_TrinketBar, "TukUI_TrinketBar", "Trink Bar")
end

--------------------------------------------------------
BINDING_HEADER_TukUI_TrinketBar = "TukUI_TrinketBar";
_G[ "BINDING_NAME_CLICK TukUI_TrinketButton1:LeftButton" ] = [=[Button 1]=];
_G[ "BINDING_NAME_CLICK TukUI_TrinketButton2:LeftButton" ] = [=[Button 2]=];
_G[ "BINDING_NAME_CLICK TukUI_TrinketButton3:LeftButton" ] = [=[Button 3]=];
_G[ "BINDING_NAME_CLICK TukUI_TrinketButton4:LeftButton" ] = [=[Button 4]=];
_G[ "BINDING_NAME_CLICK TukUI_TrinketButton5:LeftButton" ] = [=[Button 5]=];
