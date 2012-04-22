--[[

Core Phenox by Rushty@EU-Alexstrasza
All rights reserved.

]]--

local E, L, P, G = unpack(ElvUI); --Engine
local LSM = LibStub("LibSharedMedia-3.0")

local myskin = CreateFrame("frame")

E.KillTableofFrames = function(t)
	for i, v in pairs(t) do
		v:Kill()
		v = nil
	end
end

--Add time before calling a function
--Usage E.Delaythunx(seconds, functionToCall, ...)
local waitTable = {}
local waitFrame
E.Delaythunx = function(delay, func, ...)
	if(type(delay)~="number" or type(func)~="function") then
		return false
	end
	if(waitFrame == nil) then
		waitFrame = CreateFrame("Frame","WaitFrame", UIParent)
		waitFrame:SetScript("onUpdate",function (self,elapse)
			local count = #waitTable
			local i = 1
			while(i<=count) do
				local waitRecord = tremove(waitTable,i)
				local d = tremove(waitRecord,1)
				local f = tremove(waitRecord,1)
				local p = tremove(waitRecord,1)
				if(d>elapse) then
				  tinsert(waitTable,i,{d-elapse,f,p})
				  i = i + 1
				else
				  count = count - 1
				  f(unpack(p))
				end
			end
		end)
	end
	tinsert(waitTable,{delay,func,{...}})
	return true
end

function E:RegisterThunxMedia()
	--Fonts
	self["media"].thunFont = LSM:Fetch("font", "ThuNx Visitor")

	--Textures
	self["media"].thunTex = LSM:Fetch("statusbar", "ThuNx Minimalistic")
end

function E:Initializethunx()
local db = E.db.skins.thunx
E["thunx"] = {};
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
	if db.snaptoab then
		Thunx_DoWork_UnitframesCastbar('player')
	end	
-- Module Init
	Thunx_DoWork_AddonManager()
	Thunx_DoWork_Actionbars()
	Thunx_DoWork_Auras()
	Thunx_DoWork_Chat()
	--Thunx_DoWork_Classtimers()
	Thunx_DoWork_Combatallert()
	Thunx_DoWork_Datatexts()
	Thunx_DoWork_Fdispelannounce()
	--Thunx_DoWork_Maps()
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
	self["media"].caFont = LSM:Fetch("font", db.cafont)
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
	
	--Colors
	buttoncolor = { 0, 0.7, 1 }
	E.StatColor = E:RGBToHex(unpack(buttoncolor))
	E.ValColor = '|cff1784d1' -- DEPRECIATED SOON, REMEMBER TO REMOVE THIS AND CODE AROUND IT	'|cff1784d1'
end

function E.SetModifiedBackdrop(self)
	local color = RAID_CLASS_COLORS[E.myclass]
	self:SetBackdropColor(color.r*.15, color.g*.15, color.b*.15)
	self:SetBackdropBorderColor(color.r, color.g, color.b)
end

function E.SetOriginalBackdrop(self)
	local color = RAID_CLASS_COLORS[E.myclass]
	
		self:SetTemplate("Transparent")
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
					if E.myname == "Kaldore" then
					SendChatMessage("keften pa deg", "GUILD" )
					SendChatMessage("/snusern", "Guild" )
					end
				end
			myskin:UnregisterEvent("PLAYER_ENTERING_WORLD")
		end
	end
end)
