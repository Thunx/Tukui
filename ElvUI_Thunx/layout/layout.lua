local E, L, DF = unpack(ElvUI); --Engine
local LO = E:GetModule('Layout');

local PANEL_HEIGHT = 22;

function CreateLowerPanel()
    local lpanel = CreateFrame('Frame', 'LowerPanel', E.UIParent)
    lpanel:SetFrameStrata('BACKGROUND')
	lpanel:SetFrameLevel(0)
	lpanel:Width(E.UIParent:GetWidth() + (E.mult * 2))
    lpanel:Height(PANEL_HEIGHT)
    lpanel:Point("BOTTOMLEFT", E.UIParent, "BOTTOMLEFT", -E.mult, -E.mult)
    lpanel:Point("BOTTOMRIGHT", E.UIParent, "BOTTOMRIGHT", E.mult, -E.mult)
    lpanel:SetTemplate('Transparent')
end

function CreateUpperPanel()
    local upanel = CreateFrame('Frame', 'UpperPanel', E.UIParent)
    upanel:SetFrameStrata('BACKGROUND')
	upanel:SetFrameLevel(0)
    upanel:Width(E.UIParent:GetWidth() + (E.mult * 2))
    upanel:Height(PANEL_HEIGHT)
    upanel:Point("TOPLEFT", E.UIParent, "TOPLEFT", -E.mult, E.mult)
    upanel:Point("TOPRIGHT", E.UIParent, "TOPRIGHT", E.mult, E.mult)
    upanel:SetTemplate('Transparent')
end

function SetupQuestTrackerPanel(top, bottom)
	if QuestTrackerPanel == nil then 
		qtpanel = CreateFrame('Frame', 'QuestTrackerPanel', E.UIParent)
	else
		qtpanel = QuestTrackerPanel
	end
    qtpanel:SetFrameStrata('BACKGROUND')
	qtpanel:SetFrameLevel(0)
    qtpanel:Width(E.UIParent:GetWidth() + (E.mult * 2))
    qtpanel:Point("TOPLEFT", top, "TOPLEFT", -30, 10)
    qtpanel:Point("BOTTOMRIGHT", bottom, "BOTTOMRIGHT", 20, -10)
    qtpanel:SetTemplate('Transparent')
end