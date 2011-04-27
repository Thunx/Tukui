local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales

----------------------------------------------------------------------------------------------------------------
-- saftExperienceBar by Safturento
--	DL link http://www.wowinterface.com/downloads/info17672-saftExperienceBar.html#info
--	have fun
----------------------------------------------------------------------------------------------------------------
if C["saftexperiencebar"].enable == true then

--Bar Height and Width
local barHeight, barWidth = 5, 412

--Where you want the fame to be anchored
--------AnchorPoint, AnchorTo, RelativePoint, xOffset, yOffset
--local Anchor = { "CENTER",UIParent,0,-160}
--local Anchor = { "TOP", Minimap, "BOTTOM", 0, -7 }
--local Anchor = { "BOTTOM", TukuiInfoRight, "BOTTOM", 0, -6}
local Anchor = {"BOTTOMRIGHT", ElvuiActionBarBackground, "TOPRIGHT", E.Scale(0), E.Scale(5)}

--Fonts
local showText = false -- Set to false to hide text
local mouseoverText = true -- Set to true to only show text on mouseover
local font = C.media.pixelfont -- HOOG0555.ttf 
local flags = "OUTLINEMONOCHROME" -- for pixelfont stick to this else OUTLINE or THINOUTLINE
local fontsize = 10 -- font size

--Texture used for bar
local barTex = C.media.flat
local flatTex = C.media.flat

-- Tables ----------------
--------------------------
st = {}

st.FactionInfo = {
	[1] = {{ 170/255, 70/255,  70/255 }, "Hated", "FFaa4646"},
	[2] = {{ 170/255, 70/255,  70/255 }, "Hostile", "FFaa4646"},
	[3] = {{ 170/255, 70/255,  70/255 }, "Unfriendly", "FFaa4646"},
	[4] = {{ 200/255, 180/255, 100/255 }, "Neutral", "FFc8b464"},
	[5] = {{ 75/255,  175/255, 75/255 }, "Friendly", "FF4baf4b"},
	[6] = {{ 75/255,  175/255, 75/255 }, "Honored", "FF4baf4b"},
	[7] = {{ 75/255,  175/255, 75/255 }, "Revered", "FF4baf4b"},
	[8] = {{ 155/255,  255/255, 155/255 }, "Exalted","FF9bff9b"},
}

-- Functions -------------
--------------------------
function st.ShortValue(value)
	if value >= 1e6 then
		return ("%.2fm"):format(value / 1e6):gsub("%.?0+([km])$", "%1")
	elseif value >= 1e3 or value <= -1e3 then
		return ("%.1fk"):format(value / 1e3):gsub("%.?+([km])$", "%1")
	else
		return value
	end
end

function st.CommaValue(amount)
	local formatted = amount
	while true do  
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if (k==0) then
			break
		end
	end
	return formatted
end

function st.Colorize(r)
	return st.FactionInfo[r][3]
end

function st.IsMaxLevel()
	if UnitLevel("player") == MAX_PLAYER_LEVEL then
		return true
	end
end

function st.GuildIsMaxLevel()
	if GetGuildLevel() == MAX_GUILD_LEVEL then
		return true
	end
end

-----------------------------------------------------------
-- Don't edit past here unless you know what your doing! --
-----------------------------------------------------------

--Prefix for naming frames
local aName = "stExperienceBar_"

--Create Background and Border
local Frame = CreateFrame("frame", aName.."Frame", UIParent)
Frame:SetHeight(barHeight)
Frame:SetWidth(barWidth)
Frame:SetPoint(unpack(Anchor))

local xpBorder = CreateFrame("frame", aName.."xpBorder", Frame)
xpBorder:SetHeight(barHeight)
xpBorder:SetWidth(barWidth)
xpBorder:SetPoint("TOP", Frame, "TOP", 0, 0)
xpBorder:SetBackdrop({
	bgFile = barTex, 
	edgeFile = barTex, 
	tile = false, tileSize = 0, edgeSize = 1, 
	insets = { left = -1, right = -1, top = -1, bottom = -1}
})
xpBorder:SetBackdropColor(0, 0, 0)
xpBorder:SetBackdropBorderColor(.2, .2, .2, 1)

local xpOverlay = xpBorder:CreateTexture(nil, "BORDER", xpBorder)
xpOverlay:ClearAllPoints()
xpOverlay:SetPoint("TOPLEFT", xpBorder, "TOPLEFT", 2, -2)
xpOverlay:SetPoint("BOTTOMRIGHT", xpBorder, "BOTTOMRIGHT", -2, 2)
xpOverlay:SetTexture(barTex)
xpOverlay:SetVertexColor(.1,.1,.1)

--Create xp status bar
local xpBar = CreateFrame("StatusBar",  aName.."xpBar", xpBorder, "TextStatusBar")
--xpBar:SetWidth(barWidth-4)
--xpBar:SetHeight(GetWatchedFactionInfo() and (barHeight-7) or barHeight-4)
xpBar:SetPoint("TOPRIGHT", xpBorder, "TOPRIGHT", -2, -2)
xpBar:SetPoint("BOTTOMLEFT", xpBorder, "BOTTOMLEFT", 2, 2)
xpBar:SetStatusBarTexture(barTex)
xpBar:SetStatusBarColor(.5, 0, .75)

--Create Rested XP Status Bar
local restedxpBar = CreateFrame("StatusBar", aName.."restedxpBar", xpBorder, "TextStatusBar")
--restedxpBar:SetWidth(barWidth-4)
--restedxpBar:SetHeight(GetWatchedFactionInfo() and (barHeight-7) or barHeight-4)
restedxpBar:SetPoint("TOPRIGHT", xpBorder, "TOPRIGHT", -2, -2)
restedxpBar:SetPoint("BOTTOMLEFT", xpBorder, "BOTTOMLEFT", 2, 2)
restedxpBar:SetStatusBarTexture(barTex)
restedxpBar:Hide()

--Create reputation status bar
local repBorder = CreateFrame("frame", aName.."repBorder", Frame)
repBorder:SetHeight(5)
repBorder:SetWidth(Frame:GetWidth())
repBorder:SetPoint("BOTTOM", Frame, "BOTTOM", 0, 0)
repBorder:SetBackdrop({
	bgFile = barTex, 
	edgeFile = barTex, 
	tile = false, tileSize = 0, edgeSize = 1, 
	insets = { left = -1, right = -1, top = -1, bottom = -1}
})
repBorder:SetBackdropColor(0, 0, 0)
repBorder:SetBackdropBorderColor(.2, .2, .2, 1)

local repOverlay = repBorder:CreateTexture(nil, "BORDER", Frame)
repOverlay:ClearAllPoints()
repOverlay:SetPoint("TOPLEFT", repBorder, "TOPLEFT", 2, -2)
repOverlay:SetPoint("BOTTOMRIGHT", repBorder, "BOTTOMRIGHT", -2, 2)
repOverlay:SetTexture(barTex)
repOverlay:SetVertexColor(.1,.1,.1)

local repBar = CreateFrame("StatusBar", aName.."repBar", repBorder, "TextStatusBar")
--repBar:SetWidth(barWidth-4)
--repBar:SetHeight(st.IsMaxLevel() and barHeight-4 or 2)
repBar:SetPoint("TOPRIGHT", repBorder, "TOPRIGHT", -2, -2)
repBar:SetPoint("BOTTOMLEFT", repBorder, "BOTTOMLEFT", 2, 2)
repBar:SetStatusBarTexture(barTex)

--Create frame used for mouseover, clicks, and text
local mouseFrame = CreateFrame("Frame", aName.."mouseFrame", Frame)
mouseFrame:SetAllPoints(Frame)
mouseFrame:EnableMouse(true)
	
--Create XP Text
local Text = mouseFrame:CreateFontString(aName.."Text", "OVERLAY")
Text:SetFont(font, fontsize, flags)
Text:SetPoint("CENTER", xpBorder, "CENTER", 0, 1)
if mouseoverText == true then
	Text:SetAlpha(0)
end

--Set all frame levels (easier to see if organized this way)
Frame:SetFrameLevel(0)
xpBorder:SetFrameLevel(0)
repBorder:SetFrameLevel(0)
restedxpBar:SetFrameLevel(1)
repBar:SetFrameLevel(2)
xpBar:SetFrameLevel(2)
mouseFrame:SetFrameLevel(3)

local function updateStatus()
	local XP, maxXP = UnitXP("player"), UnitXPMax("player")
	local restXP = GetXPExhaustion()
	local percXP = floor(XP/maxXP*100)
	
	if st.IsMaxLevel() then
		xpBorder:Hide()
		repBorder:SetHeight(barHeight)
		if not GetWatchedFactionInfo() then
			Frame:Hide()
		else
			Frame:Show()
		end
		
		local name, rank, minRep, maxRep, value = GetWatchedFactionInfo()
		Text:SetText(format("%d / %d (%d%%)", value-minRep, maxRep-minRep, (value-minRep)/(maxRep-minRep)*100))
	else		
		xpBar:SetMinMaxValues(min(0, XP), maxXP)
		xpBar:SetValue(XP)
			
		if restXP then
			Text:SetText(format("%s/%s (%s%%|cffb3e1ff+%d%%|r)", st.ShortValue(XP), st.ShortValue(maxXP), percXP, restXP/maxXP*100))
			restedxpBar:Show()
			restedxpBar:SetStatusBarColor(0, .4, .8)
			restedxpBar:SetMinMaxValues(min(0, XP), maxXP)
			restedxpBar:SetValue(XP+restXP)
		else
			restedxpBar:Hide()
			Text:SetText(format("%s/%s (%s%%)", st.ShortValue(XP), st.ShortValue(maxXP), percXP))
		end
		
		if GetWatchedFactionInfo() then
			xpBorder:SetHeight(barHeight-(repBorder:GetHeight()-1))
			repBorder:Show()
		else
			xpBorder:SetHeight(barHeight)
			repBorder:Hide()
		end
	end
	
	if GetWatchedFactionInfo() then
		local name, rank, minRep, maxRep, value = GetWatchedFactionInfo()
		repBar:SetMinMaxValues(minRep, maxRep)
		repBar:SetValue(value)
		repBar:SetStatusBarColor(unpack(st.FactionInfo[rank][1]))
	end
	
	--Setup Exp Tooltip
	mouseFrame:SetScript("OnEnter", function()
		if mouseoverText == true then
			Text:SetAlpha(1)
		end
		--[[GameTooltip:SetBackdrop({
			bgFile = flatTex, 
			edgeFile = flatTex, 
			tile = false, tileSize = 0, edgeSize = 1, 
			insets = { left = -1, right = -1, top = -1, bottom = -1}
		})
		GameTooltip:SetBackdropColor(0, 0, 0)
		GameTooltip:SetBackdropBorderColor(.2, .2, .2, 1)
		if not gtOverlay then
			local gtOverlay = GameTooltip:CreateTexture(nil, "BORDER", GameTooltip)
			gtOverlay:ClearAllPoints()
			gtOverlay:SetPoint("TOPLEFT", GameTooltip, "TOPLEFT", 2, -2)
			gtOverlay:SetPoint("BOTTOMRIGHT", GameTooltip, "BOTTOMRIGHT", -2, 2)
			gtOverlay:SetTexture(barTex)
			gtOverlay:SetVertexColor(.1,.1,.1)
		end]]
		GameTooltip:SetOwner(mouseFrame, "ANCHOR_BOTTOMLEFT", -3, barHeight)
		GameTooltip:ClearLines()
		if not st.IsMaxLevel() then
			GameTooltip:AddLine("Experience:")
			GameTooltip:AddLine(string.format('XP: %s/%s (%d%%)', st.ShortValue(XP), st.ShortValue(maxXP), (XP/maxXP)*100))
			GameTooltip:AddLine(string.format('Remaining: %s', st.ShortValue(maxXP-XP)))
			if restXP then
				GameTooltip:AddLine(string.format('Rested: %s (%d%%)', st.ShortValue(restXP), restXP/maxXP*100))
			end
		end
		if GetWatchedFactionInfo() then
			local name, rank, min, max, value = GetWatchedFactionInfo()
			if not st.IsMaxLevel() then GameTooltip:AddLine(" ") end
			GameTooltip:AddLine(string.format('Reputation: %s', name))
			GameTooltip:AddLine(string.format('Standing: |c'..st.Colorize(rank)..'%s|r', st.FactionInfo[rank][2]))
			GameTooltip:AddLine(string.format('Rep: %s/%s (%d%%)', st.CommaValue(value-min), st.CommaValue(max-min), (value-min)/(max-min)*100))
			GameTooltip:AddLine(string.format('Remaining: %s', st.CommaValue(max-value)))
		end
		GameTooltip:Show()
	end)
	mouseFrame:SetScript("OnLeave", function()
		GameTooltip:Hide()
		if mouseoverText == true then
			Text:SetAlpha(0)
		end
	end)
	
	-- Right click menu
	local function sendReport(dest, rep)--Destination, if Reputation rep = true
		if rep == true then 
			local name, rank, min, max, value = GetWatchedFactionInfo()
			SendChatMessage("I'm currently "..st.FactionInfo[rank][2].." with "..name.." "..(value-min).."/"..(max-min).." ("..floor((((value-min)/(max-min))*100)).."%).",dest)
		else
			local XP, maxXP = UnitXP("player"), UnitXPMax("player")
			SendChatMessage("I'm currently at "..st.CommaValue(XP).."/"..st.CommaValue(maxXP).." ("..floor((XP/maxXP)*100).."%) experience.",dest)
		end
	end
			
	local reportFrame = CreateFrame("Frame", "stExperienceReportMenu", UIParent)
	if UnitLevel("player") ~= MAX_PLAYER_LEVEL then
		local reportList = {
			{text = "Sent Experience to:",
				isTitle = true, notCheckable = true, notClickable = true,
				func = function()  end},
			{text = "Party",
				func = function() 
					if GetNumPartyMembers() > 0 then
						sendReport("PARTY")
					else
						print("[stExp] Must be in a group to report to party.")
					end
				end},
			{text = "Guild",
				func = function()
					if IsInGuild() then
						sendReport("GUILD")
					else
						print("[stExp] Must be in a guild to report to guild.")
					end
				end},
			{text = "Raid",
				func = function() 
					if GetNumRaidMembers() > 0 then
						sendReport("RAID")
					elseif GetNumPartyMembers() > 0 then
						sendReport("PARTY")
					else
						print("[stExp] Must be in a group to report to party/raid.")
					end
				end},
			{text = "Target",
				func = function()
					if UnitName("target") then 
						local XP, maxXP = UnitXP("player"), UnitXPMax("player")
						SendChatMessage("I'm currently at "..st.CommaValue(XP).."/"..st.CommaValue(maxXP).." ("..floor((XP/maxXP)*100).."%) experience.","WHISPER",nil,UnitName("target"))
					end
				end},
			{text = "Sent Reputation to:",
				isTitle = true, notCheckable = true, notClickable = true,
				func = function()  end},
			{text = "Party",
				func = function() 
					if GetNumPartyMembers() > 0 then
						sendReport("PARTY", true)
					else
						print("[stExp] Must be in a group to report to party.")
					end
				end},
			{text = "Guild",
				func = function()
					if IsInGuild() then
						sendReport("GUILD", true)
					else
						print("[stExp] Must be in a guild to report to guild.")
					end
				end},
			{text = "Raid",
				func = function() 
					if GetNumRaidMembers() > 0 then
						sendReport("RAID", true)
					elseif GetNumPartyMembers() > 0 then
						sendReport("PARTY", true)
					else
						print("[stExp] Must be in a group to report to party/raid.")
					end
				end},
			{text = "Target",
				func = function() 
					if UnitName("target") then 
						local name, rank, min, max, value = GetWatchedFactionInfo()
						SendChatMessage("I'm currently "..st.FactionInfo[rank][2].." with "..name.." "..(value-min).."/"..(max-min).." ("..floor((((value-min)/(max-min))*100)).."%).","WHISPER",nil,UnitName("target"))
					end
				end},
			}
			mouseFrame:SetScript("OnMouseUp", function(self, btn)
			if btn == "RightButton" then
				EasyMenu(reportList, reportFrame, self, 0, 0, "menu", 2)
			end
		end)
	else
		local reportList = {
			{text = "Sent Reputation to:",
				isTitle = true, notCheckable = true, notClickable = true,
				func = function()  end},
			{text = "Party",
				func = function() 
					if GetNumPartyMembers() > 0 then
						sendReport("PARTY", true)
					else
						print("[stExp] Must be in a group to report to party.")
					end
				end},
			{text = "Guild",
				func = function()
					if IsInGuild() then
						sendReport("GUILD", true)
					else
						print("[stExp] Must be in a guild to report to guild.")
					end
				end},
			{text = "Raid",
				func = function() 
					if GetNumRaidMembers() > 0 then
						sendReport("RAID", true)
					elseif GetNumPartyMembers() > 0 then
						sendReport("PARTY", true)
					else
						print("[stExp] Must be in a group to report to party/raid.")
					end
				end},
			{text = "Target",
				func = function() 
					if UnitName("target") then 
						local name, rank, min, max, value = GetWatchedFactionInfo()
						SendChatMessage("I'm currently "..st.FactionInfo[rank][2].." with "..name.." "..(value-min).."/"..(max-min).." ("..floor((((value-min)/(max-min))*100)).."%).","WHISPER",nil,UnitName("target"))
					end
				end},
			}
			mouseFrame:SetScript("OnMouseUp", function(self, btn)
			if btn == "RightButton" then
				EasyMenu(reportList, reportFrame, self, 0, 0, "menu", 2)
			end
		end)
	end
end

-- Event Stuff -----------
--------------------------
local frame = CreateFrame("Frame",nil,UIParent)
--Event handling
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("PLAYER_XP_UPDATE")
frame:RegisterEvent("UPDATE_EXHAUSTION")
frame:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE")
frame:RegisterEvent("UPDATE_FACTION")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", updateStatus)
end