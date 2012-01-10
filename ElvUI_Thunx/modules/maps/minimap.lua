--[[

Minimap by Rushty@EU-Alexstrasza
All rights reserved.

What it does:
- change the font of location
- modifies framelevel if toppanel is used
- add coords to the minimap
- mouseover map location and coords

]]--

local E, L, DF = unpack(ElvUI); --Engine
local M = E:GetModule('Maps')

-- Overwriting zonetext update (FadeIn/Out fixes)
function M:Update_ZoneText()
local db = E.db.skins.thunx

	Minimap.location:SetText(strsub(GetMinimapZoneText(),1,25))
	Minimap.location:SetTextColor(M:GetLocTextColor())

	if db.mfade then Minimap.location:SetAlpha(0) end
end

local function Minimap_OnEnter()
local db = E.db.skins.thunx

UIFrameFadeIn(Minimap.location, .2, 0, 1)
if db.mcoords then UIFrameFadeIn(Minimap.coord, .2, 0, 1) end
end

local function Minimap_OnLeave()
local db = E.db.skins.thunx

UIFrameFadeOut(Minimap.location, .2, 1, 0)
if db.mcoords then UIFrameFadeOut(Minimap.coord, .2, 1, 0) end
end

function Thunx_DoWork_Maps()
local db = E.db.skins.thunx

	Minimap.location:FontTemplate(E["media"].mFont, db.mfontsize, db.mfontflags)
	
	if db.upperpanel then
		Minimap:SetFrameLevel(5)
	end

	if db.mcoords then
		Minimap.coord = Minimap:CreateFontString(nil, 'OVERLAY')
		Minimap.coord:FontTemplate(E["media"].mFont, db.mfontsize, db.mfontflags)
		Minimap.coord:Point('BOTTOMLEFT', Minimap, 5, 5)
		Minimap.coord:SetJustifyH("CENTER")
		Minimap.coord:SetJustifyV("MIDDLE")
	end
	
	if db.mfade then
		Minimap.location:Hide()
		if db.mcoords then Minimap.coord:Hide() end
					
		Minimap:SetScript("OnEnter", Minimap_OnEnter)
		Minimap:SetScript("OnLeave", Minimap_OnLeave)
	end
end

-- Minimap Coords
local ela = 0
local coord_Update = function(self,t)
	if E.db.skins.thunx.mcoords then
		ela = ela - t
		if ela > 0 then return end
		local x,y = GetPlayerMapPosition("player")
		local xt,yt
		x = math.floor(100 * x)
		y = math.floor(100 * y)
		if x == 0 and y == 0 then
			Minimap.coord:SetText("X _ X")
		else
			if x < 10 then
				xt = "0"..x
			else
				xt = x
			end
			if y < 10 then
				yt = "0"..y
			else
				yt = y
			end
			Minimap.coord:SetText(xt..","..yt)
		end
		ela = .2
	end
end
Minimap:SetScript("OnUpdate",coord_Update)