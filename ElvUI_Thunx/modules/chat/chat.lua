--[[

Chat by Rushty@EU-Alexstrasza
All rights reserved.

What it does:
- change the font of chattabs
- modifies frame strata if botpanel is used

]]--


local E, L, P, G = unpack(ElvUI); --Engine
local CH = E:GetModule('Chat')



local function StyleChat_Mods(frame)
	local db = E.db.skins.thunx
	local name = frame:GetName()
	local tab = _G[name..'Tab']
	
	tab.text = _G[name.."TabText"]
	tab.text:FontTemplate(E["media"].chFont, db.chfontsize, db.chfontflag)
	
	--frame:FontTemplate(E["media"].chFont, db.chfontsize, db.chfontflag)
end

function Thunx_DoWork_Chat()
	local db = E.db.skins.thunx

	if db.lowerpanel then
		LeftChatPanel:SetFrameStrata('LOW')
		RightChatPanel:SetFrameStrata('LOW')
	end
	
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		StyleChat_Mods(frame)
	end
	
end