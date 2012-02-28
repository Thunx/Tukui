--[[

DataTexts by Rushty@EU-Alexstrasza
All rights reserved.

What it does:
- change the font of all datatexts

]]--

local E, L, P, G = unpack(ElvUI); --Engine
local DT = E:GetModule('DataTexts')

function Thunx_DoWork_Datatexts()
local db = E.db.skins.thunx

	for panelName, panel in pairs(DT.RegisteredPanels) do
		for i=1, panel.numPoints do
			local pointIndex = DT.PointLocation[i]
			panel.dataPanels[pointIndex].text:FontTemplate(E["media"].dtFont, db.dtfontsize, db.dtfontflags)			
		end
	end
end