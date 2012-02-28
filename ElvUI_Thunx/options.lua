local E, L, P, G = unpack(ElvUI); --Engine
local S = E:GetModule('Skins')
local CH = E:GetModule('Chat')
_db = _db or true

P.skins.thunx = {}
P.skins.thunx.enable = _db or true


E.Options.args.skins.args.thunx = {
	order = 1,
	type = 'group',
	name = 'ElvUI Thunx',
	get = function(info) return E.db.skins.thunx[ info[#info] ] end,
	set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; end,
	args = {
		intro = {
			order = 1,
			type = "description",
			name = L["ElvUI Thunx"],
		},	
		general = {
			order = 2,
			type = "group",
			name = L["General"],
			guiInline = true,
			args = {
					enable = {
						name = L['Enable'],
						type = 'toggle',
						order = 1,
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,					
					},
					upperpanel = {
						name = L['Show Toppanel Frame'],
						type = 'toggle',
						order = 2,
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,					
					},
					lowerpanel = {
						name = L['Show Bottompanel Frame'],
						type = 'toggle',
						order = 3,
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,					
					},
			},
		},
		datatexts = {
			order = 3,
			type = "group",
			name = L["Datatexts"],
			guiInline = true,
			args = {
					dtfont = {
						type = "select", dialogControl = 'LSM30_Font',
						order = 1,
						name = L["Font"],
						desc = L["The font that the datatexts will use."],
						values = AceGUIWidgetLSMlists.font,	
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					dtfontsize = {
						order = 2,
						name = L["Fontsize"],
						desc = L["Set the font size for the datatexts."],
						type = "range",
						min = 6, max = 22, step = 1,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					dtfontflags = {
						order = 3,
						name = L['Fontflags'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['MONOCHROME'] = L["MONOCHROME"],
							['OUTLINE'] = L["OUTLINE"],
							['THICKOUTLINE'] = L["THICKOUTLINE"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
			},
		},
		chat = {
			order = 4,
			type = "group",
			name = L["Chat"],
			guiInline = true,
			args = {
					chfont = {
						type = "select", dialogControl = 'LSM30_Font',
						order = 1,
						name = L["Font"],
						desc = L["The font that the chattabs will use."],
						values = AceGUIWidgetLSMlists.font,	
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					chfontsize = {
						order = 2,
						name = L["Fontsize"],
						desc = L["Set the font size for the chattabs."],
						type = "range",
						min = 6, max = 22, step = 1,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					chfontflags = {
						order = 3,
						name = L['Fontflags'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['MONOCHROME'] = L["MONOCHROME"],
							['OUTLINE'] = L["OUTLINE"],
							['THICKOUTLINE'] = L["THICKOUTLINE"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
			},
		},
		aura = {
			order = 5,
			type = "group",
			name = L["Aura"],
			guiInline = true,
			args = {			
					afont = {
						type = "select", dialogControl = 'LSM30_Font',
						order = 1,
						name = L["Font"],
						desc = L["The font that the buff/debuff frame will use."],
						values = AceGUIWidgetLSMlists.font,	
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},	
					afontsize = {
						order = 2,
						name = L["Fontsize"],
						desc = L["Set the font size for the buff/debuff frame."],
						type = "range",
						min = 6, max = 22, step = 1,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					afontflags = {
						order = 3,
						name = L['Fontflags'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['MONOCHROME'] = L["MONOCHROME"],
							['OUTLINE'] = L["OUTLINE"],
							['THICKOUTLINE'] = L["THICKOUTLINE"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
			},
		},
		actionbars = {
			order = 6,
			type = "group",
			name = L["Actionbars"],
			guiInline = true,
			args = {
					abfont = {
						type = "select", dialogControl = 'LSM30_Font',
						order = 1,
						name = L["Font"],
						desc = L["The font for actionbar hotkeys and stacks."],
						values = AceGUIWidgetLSMlists.font,	
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					abfontsize = {
						type = 'range',
						order = 2,
						name = L['Font Size'],
						desc = L['Set the font size of the action buttons. If set it will overwrite the ElvUI settings.'],
						min = 0, max = 22, step = 1,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},	
					abfontflags = {
						order = 3,
						name = L['Fontflags'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['MONOCHROME'] = L["MONOCHROME"],
							['OUTLINE'] = L["OUTLINE"],
							['THICKOUTLINE'] = L["THICKOUTLINE"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},					
			},
		},
		classtimers = {
			order = 7,
			type = "group",
			name = L["ClassTimers !! EXPERIMENTAL !!"],
			guiInline = true,
			args = {
					ctfont = {
						type = "select", dialogControl = 'LSM30_Font',
						order = 1,
						name = L["Font"],
						desc = L["The font for the classtimer bars."],
						values = AceGUIWidgetLSMlists.font,	
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); StaticPopup_Show("CONFIG_RL") end,
					},	
					ctfontsize = {
						order = 2,
						name = L["Fontsize"],
						desc = L["Set the font size for the classtimer bars."],
						type = "range",
						min = 6, max = 22, step = 1,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); StaticPopup_Show("CONFIG_RL") end,
					},
					ctfontflags = {
						order = 3,
						name = L['Fontflags'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['MONOCHROME'] = L["MONOCHROME"],
							['OUTLINE'] = L["OUTLINE"],
							['THICKOUTLINE'] = L["THICKOUTLINE"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); StaticPopup_Show("CONFIG_RL") end,
					},
					cttex = {
						type = "select", dialogControl = 'LSM30_Statusbar',
						order = 4,
						name = L["Bar Texture"],
						desc = L["Changes the texture of the classtimer statusbar."],
						values = AceGUIWidgetLSMlists.statusbar,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); StaticPopup_Show("CONFIG_RL") end,						
					},	
			},
		},
		tooltip = {
			order = 8,
			type = "group",
			name = L["Tooltip"],
			guiInline = true,
			args = {
					ttfont = {
						type = "select", dialogControl = 'LSM30_Font',
						order = 1,
						name = L["Font"],
						desc = L["The font for the tooltip healthbar."],
						values = AceGUIWidgetLSMlists.font,	
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					ttfontsize = {
						order = 2,
						name = L["Fontsize"],
						desc = L["Set the font size for the tooltip healthbar text."],
						type = "range",
						min = 6, max = 22, step = 1,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					ttfontflags = {
						order = 3,
						name = L['Fontflags'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['MONOCHROME'] = L["MONOCHROME"],
							['OUTLINE'] = L["OUTLINE"],
							['THICKOUTLINE'] = L["THICKOUTLINE"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					tthealth = {
						order = 4,
						name = L["Healthbar Heigth"],
						desc = L["Set the heigth of the tooltips health statusbar."],
						type = "range",
						min = 5, max = 20, step = 1,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},						
					tttex = {
						type = "select", dialogControl = 'LSM30_Statusbar',
						order = 5,
						name = L["Healthbar Texture"],
						desc = L["Changes the texture of the tooltips healthbar."],
						values = AceGUIWidgetLSMlists.statusbar,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,						
					},	
			},
		},
		minimap = {
			order = 9,
			type = "group",
			name = L["Minimap"],
			guiInline = true,
			args = {
					mfont = {
						type = "select", dialogControl = 'LSM30_Font',
						order = 1,
						name = L["Font"],
						desc = L["The font that the minimap infotext will use."],
						values = AceGUIWidgetLSMlists.font,	
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					mfontsize = {
						order = 2,
						name = L["Fontsize"],
						desc = L["Set the font size for the minimap infotext."],
						type = "range",
						min = 6, max = 22, step = 1,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					mfontflags = {
						order = 3,
						name = L['Fontflags'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['MONOCHROME'] = L["MONOCHROME"],
							['OUTLINE'] = L["OUTLINE"],
							['THICKOUTLINE'] = L["THICKOUTLINE"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},					
					mcoords = {
						name = L['Show Minimap Coords'],
						type = 'toggle',
						order = 4,
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,					
					},	
					mfade = {
						name = L['Fade Minimap Info'],
						desc = L["Hides the minimap location and coords until mouseover."],
						type = 'toggle',
						order = 5,
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,					
					},
			},
		},
		questtracker = {
			order = 10,
			type = "group",
			name = L["Quest Tracker"],
			guiInline = true,
			args = {
					qtfont = {
						type = "select", dialogControl = 'LSM30_Font',
						order = 1,
						name = L["Font"],
						desc = L["The font that the minimap infotext will use."],
						values = AceGUIWidgetLSMlists.font,	
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					qtfontsize = {
						order = 2,
						name = L["Fontsize"],
						desc = L["Set the font size for the minimap infotext."],
						type = "range",
						min = 6, max = 22, step = 1,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetuThunxMedia(); E:Initializethunx(); end,
					},
					qtfontflags = {
						order = 3,
						name = L['Fontflags'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['MONOCHROME'] = L["MONOCHROME"],
							['OUTLINE'] = L["OUTLINE"],
							['THICKOUTLINE'] = L["THICKOUTLINE"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					qtbackdrop = {
						name = L['Quest Tracker Backdrop'],
						desc = L["Attaches a backdrop frame behind the quest tracker."],
						type = 'toggle',
						order = 4,
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,					
					},					
			},
		},
		misc = {
			order = 11,
			type = "group",
			name = L["Misc Settings"],
			guiInline = true,
			args = {
					singleside = {
						name = L['Single-Side Heal Layout'],
						desc = L["Anchores spaced powerbar of both, player and target, on bottomleft."],
						type = 'toggle',
						order = 1,
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,					
					},
					reloadui = {
						order = 2,
						type = "execute",
						name = L["Reload UI"],
						func = function() StaticPopup_Show("CONFIG_RL") end,
					},
					autorepchange = {
						order = 3,
						type = "toggle",
						name = L["Autorepchange"],
						desc = L["Enable/Disable Autorepchange"],
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,
					},
					spincam = {
						order = 4,
						type = "toggle",
						name = L["Spincam"],
						desc = L["Enable/Disable, Spin camera while afk"],
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,
					},
					snaptoab = {
						order = 12,
						type = "toggle",
						name = L["Snap To Actionbars"],
						desc = L['Position the castbar above Actionbar 1, 2, 3, 4 or 5. Size is set automatically.'],
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,
					},
					snaptowab = {
					type = 'select',
					order = 13,
					name = L['Snap To Actionbars'],
					desc = L['Position the castbar above Actionbar 1, 2, 3, 4 or 5. Size is set automatically.'],
					disabled = function() return not E.db.skins.thunx.snaptoab end,
					values = {
							['ElvUI_Bar1'] = L["Actionbar 1"],
							['ElvUI_Bar2'] = L["Actionbar 2"],
							['ElvUI_Bar3'] = L["Actionbar 3"],
							['ElvUI_Bar4'] = L["Actionbar 4"],
							['ElvUI_Bar5'] = L["Actionbar 5"],
						},
					set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
				},
			},
		},
		fdispelannounce = {
			order = 12,
			type = "group",
			name = L["fDispelAnnounce"],
			guiInline = true,
			args = {
					enablefd = {
						name = L['Enable fDispelAonnunce'],
						desc = L["Enable/Disable Dispel Announce"],
						type = 'toggle',
						order = 1,
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,					
					},
					fdfont = {
						type = "select", dialogControl = 'LSM30_Font',
						order = 2,
						name = L["Font"],
						desc = L["The font for the Dispel Announce text."],
						values = AceGUIWidgetLSMlists.font,	
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					fdfontsize = {
						order = 3,
						name = L["Fontsize"],
						desc = L["Set the font size for the Dispel Announce text."],
						type = "range",
						min = 6, max = 22, step = 1,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					fdfontflags = {
						order = 4,
						name = L['Fontflags'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['MONOCHROME'] = L["MONOCHROME"],
							['OUTLINE'] = L["OUTLINE"],
							['THICKOUTLINE'] = L["THICKOUTLINE"],
							['OUTLINEMONOCHROME'] = L["OUTLINEMONOCHROME"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},	
			},
		},
		combatallert = {
			order = 13,
			type = "group",
			name = L["Combat Allert"],
			guiInline = true,
			args = {
					enableca = {
						name = L['Enable Combatallert'],
						desc = L["Enable/Disable Combatallert"],
						type = 'toggle',
						order = 1,
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,					
					},
					cafont = {
						type = "select", dialogControl = 'LSM30_Font',
						order = 2,
						name = L["Font"],
						desc = L["The font for the Dispel Announce text."],
						values = AceGUIWidgetLSMlists.font,	
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					cafontsize = {
						order = 3,
						name = L["Fontsize"],
						desc = L["Set the font size for the Dispel Announce text."],
						type = "range",
						min = 6, max = 50, step = 1,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					cafontflags = {
						order = 4,
						name = L['Fontflags'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['MONOCHROME'] = L["MONOCHROME"],
							['OUTLINE'] = L["OUTLINE"],
							['THICKOUTLINE'] = L["THICKOUTLINE"],
							['OUTLINEMONOCHROME'] = L["OUTLINEMONOCHROME"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; E:SetupThunxMedia(); E:Initializethunx(); end,
					},	
			},
		},
		tabtext = {
			order = 14,
			type = "group",
			name = L["Tabtext"],
			guiInline = true,
			args = {
					enabletab = {
						name = L['Enable Tabtext'],
						desc = L["Enable/Disable Tabtext"],
						type = 'toggle',
						order = 1,
						get = function(info) return E.db.skins.thunx[ info[#info] ] end,
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL"); E:SetupThunxMedia(); E:Initializethunx(); end,					
					},
					tableft = {
						order = 2,
						name = L['Left'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['Encounterjournal'] = L["EncounterJournal"],
							['Omen'] = L["Omen"],
							['Recount'] = L["Recount"],
							['Skada'] = L["Skada"],
							['Atlasloot'] = L["Atlasloot"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL"); E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					tableftmiddle = {
						order = 3,
						name = L['LeftMiddle'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['Encounterjournal'] = L["EncounterJournal"],
							['Omen'] = L["Omen"],
							['Recount'] = L["Recount"],
							['Skada'] = L["Skada"],
							['Atlasloot'] = L["Atlasloot"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL"); E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					tabrightmiddle = {
						order = 5,
						name = L['RightMiddle'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['Encounterjournal'] = L["EncounterJournal"],
							['Omen'] = L["Omen"],
							['Recount'] = L["Recount"],
							['Skada'] = L["Skada"],
							['Atlasloot'] = L["Atlasloot"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL"); E:SetupThunxMedia(); E:Initializethunx(); end,
					},
					tabright = {
						order = 6,
						name = L['Right'],
						type = 'select',
						values = {
							['NONE'] = NONE,
							['Encounterjournal'] = L["EncounterJournal"],
							['Omen'] = L["Omen"],
							['Recount'] = L["Recount"],
							['Skada'] = L["Skada"],
							['Atlasloot'] = L["Atlasloot"],
						},
						set = function(info, value) E.db.skins.thunx[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL"); E:SetupThunxMedia(); E:Initializethunx(); end,
					},					
			},
		},		
	},
}

