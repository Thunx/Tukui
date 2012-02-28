--[[Spin camera while afk 

	Credits:
	Telroth (Darth Android) - Concept and code reference.
	
	Edited and rewritten by: Ecl?ps?, Elv and Thunx
	
]]
local E, L, P, G = unpack(ElvUI); -- Import Functions/Constants, Config, Locales
local S = E:GetModule('Skins')
function Thunx_DoWork_Spincam()
	local db = E.db.skins.thunx 
	if not E.db.skins.thunx.spincam == true then return end
	local SpinCam = CreateFrame("Frame")

	local OnEvent = function(self, event, unit)
		if (event == "PLAYER_FLAGS_CHANGED") then
			if unit == "player" then
				if UnitIsAFK(unit) then
					SpinStart()
				else
					SpinStop()
				end
			end
		elseif (event == "PLAYER_LEAVING_WORLD") then
			SpinStop()
		end
	end
	SpinCam:RegisterEvent("PLAYER_ENTERING_WORLD")
	SpinCam:RegisterEvent("PLAYER_LEAVING_WORLD")
	SpinCam:RegisterEvent("PLAYER_FLAGS_CHANGED")
	SpinCam:SetScript("OnEvent", OnEvent)

	function SpinStart()
		spinning = true
		MoveViewRightStart(0.01)
	end

	function SpinStop()
		if not spinning then return end
		spinning = nil
		MoveViewRightStop()
	end
end	