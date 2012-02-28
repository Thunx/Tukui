--[[

Unitframes by Rushty@EU-Alexstrasza
All rights reserved.

What it does:
- Player spaced powerbar anchored to the bottom left

]]--

local E, L, P, G = unpack(ElvUI); --Engine
local UF = E:GetModule('UnitFrames');
local S = E:GetModule('Skins')


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


function Player_CASTBAR_Mods(frame, db)
	local BORDER = E:Scale(2)
	local SPACING = E:Scale(1)
	local buttonsize = E.db.actionbar.buttonsize
	local buttonspacing = E.db.actionbar.buttonspacing
	local bar1buttons = E.db.actionbar.bar1.buttons
	local CASTBAR_SNAP = E.db.skins.thunx.snaptoab
	
	local CASTBAR_WIDTH = ElvUI_Bar1:GetWidth()
	local CASTBAR_HEIGHT =(db.castbar.height)
	
	local castbar = frame.Castbar
	--Position
	if CASTBAR_SNAP == true then
			castbar:Width(CASTBAR_WIDTH - E:Scale(4))
		else
			castbar:Width(db.castbar.width - E:Scale(4))
		end
		castbar:Height(db.castbar.height)


		--Icon
		if db.castbar.icon then
			castbar.Icon = castbar.ButtonIcon
			castbar.Icon.bg:Width(db.castbar.height + E:Scale(4))
			castbar.Icon.bg:Height(db.castbar.height + E:Scale(4))

			if CASTBAR_SNAP == true then
				castbar:Width(CASTBAR_WIDTH - castbar.Icon.bg:GetWidth() - E:Scale(5))
			else
				castbar:Width(db.castbar.width - castbar.Icon.bg:GetWidth() - E:Scale(5))
			end
			castbar.Icon.bg:Show()
		else
			castbar.ButtonIcon.bg:Hide()
			castbar.Icon = nil
		end

		if CASTBAR_SNAP == true then
			castbar:ClearAllPoints()
			castbar:Point("BOTTOMRIGHT", E.db.skins.thunx.snaptowab, "TOPRIGHT", -(BORDER + db.castbar.xOffset), ((BORDER*2+BORDER) + db.castbar.yOffset))
		else
			castbar:ClearAllPoints()
			castbar:Point("TOPRIGHT", frame, "BOTTOMRIGHT", -(BORDER + db.castbar.xOffset), -((BORDER*2+BORDER) + db.castbar.yOffset))
		end

end

