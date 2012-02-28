--[[

Auras by Rushty@EU-Alexstrasza
All rights reserved.

What it does:
- changes the font of aura (buff/debuff/weapon) durations and stacks

]]--

local E, L, P, G = unpack(ElvUI); --Engine
local A = E:GetModule('Auras')

local aurahook = CreateFrame("frame")

local function StyleBuffs_Mods(buttonName, index)	
local db = E.db.skins.thunx
	
	local duration = _G[buttonName..index.."Duration"]
	local count = _G[buttonName..index.."Count"]
	
	duration:FontTemplate(E["media"].aFont, db.afontsize, db.afontflags)
	count:FontTemplate(E["media"].aFont, db.afontsize, db.afontflags)
end

local function UpdateBuffs_Mods()
	local buttonName = "BuffButton"
		
		for i=1, BUFF_ACTUAL_DISPLAY do
			local buff = _G[buttonName..i]
			if buff:IsProtected() then return end -- uhh ohhh
			StyleBuffs_Mods(buttonName, i)
		end
end

local function UpdateDebuffs_Mods()
	local buttonName = "DebuffButton"

		for i=1, DEBUFF_ACTUAL_DISPLAY do
			local debuff = _G[buttonName..i];
			if debuff:IsProtected() then return end -- uhh ohhh
			StyleBuffs_Mods(buttonName, i)
		end
end

function Thunx_DoWork_Auras()
local db = E.db.skins.thunx

	for i = 1, 3 do
		_G["TempEnchant"..i.."Duration"]:FontTemplate(E["media"].aFont, db.afontsize, db.afontflags)
	end
	
	UpdateBuffs_Mods()
	UpdateDebuffs_Mods()
end

aurahook:SetScript("OnEvent",function(self, event, ...)
    if event == "UNIT_AURA" then
		local unit = select(1, ...)
		if unit == "player" then 
			UpdateBuffs_Mods()
			UpdateDebuffs_Mods()
		end
    end
end)

aurahook:RegisterEvent("UNIT_AURA")
