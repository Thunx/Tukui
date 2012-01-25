--[[

Unitframes by Rushty@EU-Alexstrasza
All rights reserved.

What it does:
- Player spaced powerbar anchored to the bottom left

]]--

local E, L, DF = unpack(ElvUI); --Engine
local UF = E:GetModule('UnitFrames');

function Player_PowerBar_Mods(frame, db)
	local BORDER = E:Scale(2)
	local SPACING = E:Scale(1)

	local POWERBAR_HEIGHT = db.power.height
	local POWERBAR_WIDTH = (db.width - (BORDER*2)) / 2
	
	--Position
	local power = frame.Power
			
		power:ClearAllPoints()
		power:Width(POWERBAR_WIDTH - BORDER*2)
		power:Height(POWERBAR_HEIGHT - BORDER*2)
		power:Point("LEFT", frame, "BOTTOMLEFT", (BORDER*2 + 4), BORDER + (POWERBAR_HEIGHT/2))
		power:SetFrameStrata("MEDIUM")
		power:SetFrameLevel(frame:GetFrameLevel() + 3)
end