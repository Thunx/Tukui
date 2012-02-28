--[[

Unitframes by Rushty@EU-Alexstrasza
All rights reserved.

]]--

local E, L, P, G = unpack(ElvUI); --Engine
local UF = E:GetModule('UnitFrames');
local S = E:GetModule('Skins')
local db = E.db.skins.thunx 

function Thunx_DoWork_Unitframes(unit)
	if unit == 'player' then
		local db = E.db['unitframe']['layouts'][UF.ActiveLayout][unit]
		local POWERBAR_REQ_PASSED = db.power.enable and db.power.width ~= 'fill' and db.power.offset == 0
		
		if POWERBAR_REQ_PASSED then
			Player_PowerBar_Mods(UF[unit], db)
		end
    end
	
	if unit == 'target' then
		local db = E.db['unitframe']['layouts'][UF.ActiveLayout][unit]
		local POWERBAR_REQ_PASSED = db.power.enable and db.power.width ~= 'fill' and db.power.offset == 0
		
		if POWERBAR_REQ_PASSED then
			Target_PowerBar_Mods(UF[unit], db)
		end
    end
	
end
function Thunx_DoWork_UnitframesCastbar(unit)

end