--[[

Tooltip by Rushty@EU-Alexstrasza
All rights reserved.

What it does:
- change the font of healthbar text

]]--

local E, L, DF = unpack(ElvUI); --Engine
local TT = E:GetModule('Tooltip')

function Thunx_DoWork_Tooltip()
local db = E.db.skins.thunx

	GameTooltipStatusBar:Height(db.tthealth)
	GameTooltipStatusBar:SetStatusBarTexture(E["media"].ttTex)

	GameTooltipStatusBar.text:Point("CENTER", GameTooltipStatusBar, 0, 1)
	GameTooltipStatusBar.text:FontTemplate(E["media"].ttFont, db.ttfontsize, db.ttfontflags)
end