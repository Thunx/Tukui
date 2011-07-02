--[[Spin camera while afk 

	Credits:
	Telroth (Darth Android) - Concept and code reference.
	
	Edited and rewritten by: Ecl?ps?, and Elv
	
]]
local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales

if C["others"].spincam == true then
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

--Custom Lag Tolerance 
if C["others"].autocustomlagtolerance == true then
	InterfaceOptionsCombatPanelMaxSpellStartRecoveryOffset:Hide()

	local customlag = CreateFrame("Frame")
	local int = 5
	local LatencyUpdate = function(self, elapsed)
		int = int - elapsed
		if int < 0 then
			if GetCVar("reducedLagTolerance") ~= tostring(1) then SetCVar("reducedLagTolerance", tostring(1)) end
			if select(3, GetNetStats()) ~= 0 and select(3, GetNetStats()) <= 400 then
				SetCVar("maxSpellStartRecoveryOffset", tostring(select(3, GetNetStats())))
			end
			int = 5
		end
	end
	customlag:SetScript("OnUpdate", LatencyUpdate)
	LatencyUpdate(customlag, 10)
end