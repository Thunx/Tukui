local E, L, DF = unpack(ElvUI); --Engine
local S = E:GetModule('Skins')
local CH = E:GetModule('Chat')
--Skins
DF['skins'] = {
	['thunx'] = {
	-- General
		['enable'] = true,
		['upperpanel'] = false,
		['lowerpanel'] = false,
	-- Datatexts
		['dtfont'] = E.db.core.font,
		['dtfontsize'] = E.db.core.fontsize,
		['dtfontflags'] = "OUTLINE",
	-- Chat
		['chfont'] = E.db.core.font,
		['chfontsize'] = E.db.core.fontsize,
		['chfontflags'] = "OUTLINE",
	-- Aura
		['afont'] = E.db.core.font,
		['afontsize'] = E.db.core.fontsize,
		['afontflags'] = "OUTLINE",
	-- Actionbars
		['abfont'] = E.db.core.font,
		['abfontsize'] = 0, -- if modified it overwrites elv config
		['abfontflags'] = "OUTLINE",
	-- ClassTimers
		['ctfont'] = E.db.core.font,
		['ctfontsize'] = E.db.core.fontsize,
		['ctfontflags'] = "OUTLINE",
		['cttex'] = E.db.core.normTex,
	-- Tooltip
		['ttfont'] = E.db.core.font,
		['ttfontsize'] = E.db.core.fontsize,
		['ttfontflags'] = "OUTLINE",		
		['tthealth'] = 5, -- Taken from tooltip.lua
		['tttex'] = E.db.core.normTex,
	-- Minimap
		['mfont'] = E.db.core.font,
		['mfontsize'] = E.db.core.fontsize,
		['mfontflags'] = "OUTLINE",
		['mcoords'] = true,
		['mfade'] = true,
	-- Questtracker
		['qtfont'] = E.db.core.font,
		['qtfontsize'] = E.db.core.fontsize,
		['qtfontflags'] = "OUTLINE",
		['qtbackdrop'] = false,
	-- Misc
		['singleside'] = false,
		['autorepchange'] = true,
		['spincam'] = true,
	--fDispelAnnounce
		['enablefd'] = true,
		['fdfont'] = "ElvUI Pixel",
		['fdfontsize'] = 18,
		['fdfontflags'] = "OUTLINEMONOCHROME",
	--Combatallert
		['enableca'] = true,
		['cafont'] = "ElvUI Pixel",
		['cafontsize'] = 20,
		['cafontflags'] = "OUTLINEMONOCHROME",
	--Tabtext
		['enabletab'] = true,
		['tableft'] = "Encounterjournal",
		['tableftmiddle'] = "Omen",
		['tabrightmiddle'] = "Recount",
		['tabright'] = "Atlasloot",
	
	},
}

