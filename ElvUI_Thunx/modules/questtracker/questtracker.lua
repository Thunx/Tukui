--[[

QuestTracker by Rushty@EU-Alexstrasza
All rights reserved.

What it does:
- change the font and fontsize
- adds a backdrop to the tracker

]]--

local E, L, DF = unpack(ElvUI); --Engine
local QT = E:NewModule('Questtracker', 'AceHook-3.0', 'AceEvent-3.0');

local function SetupQuestTrackerSkin()
	local db = E.db.skins.thunx

	local numQuestLines = #WATCHFRAME_QUESTLINES
	local numAchivementLines = #WATCHFRAME_ACHIEVEMENTLINES
	local numTimerLines = #WATCHFRAME_TIMERLINES
	local numVisibleLines = numQuestLines + numAchivementLines + numTimerLines

	WatchFrameTitle:FontTemplate(E["media"].qtFont, db.qtfontsize + 2, db.qtfontflags)
	
	for i = 1, numVisibleLines + 1 do
		_G["WatchFrameLine" .. i].text:FontTemplate(E["media"].qtFont, db.qtfontsize, db.qtfontflags) end
end

local function SetupQuestTrackerBackdrop()
	local numQuestLines = #WATCHFRAME_QUESTLINES
	local numAchivementLines = #WATCHFRAME_ACHIEVEMENTLINES
	local numTimerLines = #WATCHFRAME_TIMERLINES
	local numVisibleLines = numQuestLines + numAchivementLines + numTimerLines

	local top = WatchFrameHeader
	local bottom = _G["WatchFrameLine" .. numVisibleLines + 1]
	
	SetupQuestTrackerPanel(top, bottom)
end

function QT:QuestTracker_Update()
local db = E.db.skins.thunx

	SetupQuestTrackerSkin()

	if db.qtbackdrop then 
		SetupQuestTrackerBackdrop() end
end

function QT:QuestTracker_Collapse()
local db = E.db.skins.thunx

	if db.qtbackdrop then 
		QuestTrackerPanel:Hide() end
end

function QT:QuestTracker_Expand()
local db = E.db.skins.thunx

	if db.qtbackdrop then 
		QuestTrackerPanel:Show() end
end

function Thunx_DoWork_Questtracker()
local db = E.db.skins.thunx
	
	SetupQuestTrackerSkin()
	
	if db.qtbackdrop then
		SetupQuestTrackerBackdrop() end

	if not QT:IsHooked("WatchFrame_Update")	then	
		QT:SecureHook( "WatchFrame_Update", "QuestTracker_Update" ) end
		
	if not QT:IsHooked("WatchFrame_Collapse")	then	
		QT:SecureHook( "WatchFrame_Collapse", "QuestTracker_Collapse" ) end
	
	if not QT:IsHooked("WatchFrame_Expand")	then	
		QT:SecureHook( "WatchFrame_Expand", "QuestTracker_Expand" ) end
end

--[[
function WatchFrame_ClearDisplay ()
	for _, timerLine in pairs(WATCHFRAME_TIMERLINES) do
		timerLine:Reset();
	end
	for _, achievementLine in pairs(WATCHFRAME_ACHIEVEMENTLINES) do
		achievementLine:Reset();
	end
	for _, questLine in pairs(WATCHFRAME_QUESTLINES) do
		questLine:Reset();
	end
	for i = 1, WATCHFRAME_NUM_ITEMS do
		_G["WatchFrameItem" .. i]:Hide();
	end
	QuestPOI_HideAllButtons("WatchFrameLines");
end
]]--





