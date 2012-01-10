--[[

Core Phenox by Rushty@EU-Alexstrasza
All rights reserved.

]]--

local E, L, DF = unpack(ElvUI); --Engine
local LSM = LibStub("LibSharedMedia-3.0")

local myskin = CreateFrame("frame")

function E:RegisterThunxMedia()
	--Fonts
	self["media"].thunFont = LSM:Fetch("font", "ThuNx Visitor")

	--Textures
	self["media"].thunTex = LSM:Fetch("statusbar", "ThuNx Minimalistic")
end

function E:Initializethunx()
local db = E.db.skins.thunx

-- Layout Init
	if db.upperpanel then
		if UpperPanel == nil then 
			CreateUpperPanel() end
	end
	
	if db.lowerpanel then
		if LowerPanel == nil then 
			CreateLowerPanel() end
	end

	if db.singleside then
		Thunx_DoWork_Unitframes('player')
		Thunx_DoWork_Unitframes('target')
	end

-- Module Init
	Thunx_DoWork_Actionbars()
	Thunx_DoWork_Auras()
	Thunx_DoWork_Chat()
	--Thunx_DoWork_Classtimers()
	Thunx_DoWork_Datatexts()
	Thunx_DoWork_Fdispelannounce()
	Thunx_DoWork_Maps()
	Thunx_DoWork_Spincam()
	Thunx_DoWork_Tooltip()
	--Thunx_DoWork_Tabtext()
	Thunx_DoWork_Questtracker()
end

function E:SetupThunxMedia()
local db = E.db.skins.thunx

	--Fonts
	self["media"].abFont = LSM:Fetch("font", db.abfont)
	self["media"].aFont = LSM:Fetch("font", db.afont)
	self["media"].chFont = LSM:Fetch("font", db.chfont)
	self["media"].ctFont = LSM:Fetch("font", db.ctfont)
	self["media"].dtFont = LSM:Fetch("font", db.dtfont)
	self["media"].mFont = LSM:Fetch("font", db.mfont)
	self["media"].ttFont = LSM:Fetch("font", db.ttfont)
	self["media"].qtFont = LSM:Fetch("font", db.qtfont)
	self["media"].fdFont = LSM:Fetch("font", db.fdfont)

	--Textures
	self["media"].ctTex = LSM:Fetch("statusbar", db.cttex)
	self["media"].ttTex = LSM:Fetch("statusbar", db.tttex)
end

myskin:RegisterEvent("PLAYER_ENTERING_WORLD")
myskin:SetScript("OnEvent",function(self, event, addon)
    if event == "PLAYER_ENTERING_WORLD" then
		if E.initialized then
			local db = E.db.skins.thunx
				if db.enable then
					E:RegisterThunxMedia()
					E:SetupThunxMedia()
					E:Initializethunx()

					print('Welcome ' .. E.ValColor .. E.myname ..'|r, your mods for ' .. E.ValColor .. 'ElvUI|r version ' .. E.ValColor .. E.version .. '|r are successfully loaded, type /ec and select the Skins tab to access the in-game config.')
				end
			myskin:UnregisterEvent("PLAYER_ENTERING_WORLD")
		end
	end
end)