local E, L, P, G = unpack(ElvUI); --Engine

----------------------------------------------------------------------------------
--Raidwarning when people are afk
----------------------------------------------------------------------------------
local function SPELL_FILTER(self, event, arg1)
	if strfind(arg1,"is not ready") or strfind(arg1,"The following players are Away") then
		SendChatMessage(arg1, "RAID_WARNING", nil ,nil)
	end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", SPELL_FILTER)

----------------------------------------------------------------------------------
 --Mount replay
----------------------------------------------------------------------------------
local whispered = {}
local responses = {
	"kill monsters on the shore of Desolace until it drops",
	"sorry, i got this account off ebay",
	"random shit drop",
}

local function NOOB_FILTER(self, event, arg1, arg2)
	if strfind(arg1, " mount") then
		--for i, name in pairs(whispered) do if name == tostring(arg2) then return end end -- dont reply to the same person more than once
		E.Delaythunx(2, SendChatMessage, responses[math.random(1, #responses)], "WHISPER", nil, arg2) -- 2 second delay.. more realistic :)

		tinsert(whispered, tostring(arg2))
	end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", NOOB_FILTER)  
----------------------------------------------------------------------------------
 --Random
----------------------------------------------------------------------------------
function E:IsRandomDay()
	if string.find(date(), '04/25/') and not E.global.aprilFools and E.myname == "Fòl" then --Fòl
		SendChatMessage("keften pa deg", "GUILD" )
		SendChatMessage("/snusern", "Guild" )
		SendChatMessage("btw thanks for the gold", "Guild" )			
		return true;
	else
		return false;
	end
end