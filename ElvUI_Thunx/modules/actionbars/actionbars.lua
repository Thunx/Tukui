--[[

ActionBars by Rushty@EU-Alexstrasza
All rights reserved.

What it does:
- change the font of hotkey-, makrotext and item counts

]]--

local E, L, DF = unpack(ElvUI); --Engine
local AB = E:GetModule('ActionBars')

function Thunx_DoWork_Actionbars()
local db = E.db.skins.thunx

	for button, _ in pairs(AB["handledbuttons"]) do
		if button then
			local hotkey = _G[button:GetName()..'HotKey'];
			local count = _G[button:GetName()..'Count'];
			
			if count then
				count:FontTemplate(E["media"].abFont, 13, db.abfontflags);
			end
			
			if E.db.actionbar.hotkeytext and hotkey then
				if db.abfontsize == 0 then
					hotkey:FontTemplate(E["media"].abFont, E.db.actionbar.fontsize, db.abfontflags);
				else
					hotkey:FontTemplate(E["media"].abFont, db.abfontsize, db.abfontflags);
				end
			end
		end
	end
end