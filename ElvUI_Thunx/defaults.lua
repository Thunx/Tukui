local E, L, P, G = unpack(ElvUI); --Engine
local S = E:GetModule('Skins')
local CH = E:GetModule('Chat')
--Skins
P['skins'] = {
	['thunx'] = {
	-- General
		['enable'] = true,
		['upperpanel'] = false,
		['lowerpanel'] = false,
	-- Datatexts
		['dtfont'] = E.db.general.font,
		['dtfontsize'] = E.db.general.fontsize,
		['dtfontflags'] = "OUTLINE",
	-- Chat
		['chfont'] = E.db.general.font,
		['chfontsize'] = E.db.general.fontsize,
		['chfontflags'] = "OUTLINE",
	-- Aura
		['afont'] = E.db.general.font,
		['afontsize'] = E.db.general.fontsize,
		['afontflags'] = "OUTLINE",
	-- Actionbars
		['abfont'] = E.db.general.font,
		['abfontsize'] = 0, -- if modified it overwrites elv config
		['abfontflags'] = "OUTLINE",
	-- ClassTimers
		['ctfont'] = E.db.general.font,
		['ctfontsize'] = E.db.general.fontsize,
		['ctfontflags'] = "OUTLINE",
		['cttex'] = E.db.general.normTex,
	-- Tooltip
		['ttfont'] = E.db.general.font,
		['ttfontsize'] = E.db.general.fontsize,
		['ttfontflags'] = "OUTLINE",		
		['tthealth'] = 5, -- Taken from tooltip.lua
		['tttex'] = E.db.general.normTex,
	-- Minimap
		['mfont'] = E.db.general.font,
		['mfontsize'] = E.db.general.fontsize,
		['mfontflags'] = "OUTLINE",
		['mcoords'] = true,
		['mfade'] = true,
	-- Questtracker
		['qtfont'] = E.db.general.font,
		['qtfontsize'] = E.db.general.fontsize,
		['qtfontflags'] = "OUTLINE",
		['qtbackdrop'] = false,
	-- Misc
		['singleside'] = false,
		['autorepchange'] = true,
		['spincam'] = true,
		['snaptoab'] = true,
		['autodez'] = true,
		['snaptowab'] = "ElvUI_Bar3",	-- Position the player castbar above actionbar 1 and size it automatically. This disables the 'width' option.
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
	--RBR+
		['specialbuff'] = 80398,
	
	},
}

