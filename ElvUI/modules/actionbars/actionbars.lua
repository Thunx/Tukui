local E, L, DF = unpack(select(2, ...)); --Engine
local AB = E:NewModule('ActionBars', 'AceHook-3.0', 'AceEvent-3.0');
--/run E, C, L = unpack(ElvUI); AB = E:GetModule('ActionBars'); AB:ToggleMovers()

local Sticky = LibStub("LibSimpleSticky-1.0");
local _LOCK

local gsub = string.gsub

--Make our own strings
local KEY_MOUSEBUTTON = KEY_BUTTON10;
KEY_MOUSEBUTTON = gsub(KEY_MOUSEBUTTON, '10', '');
local KEY_NUMPAD = KEY_NUMPAD0;
KEY_NUMPAD = gsub(KEY_NUMPAD, '0', '');

<<<<<<< HEAD
=======
E.ActionBars = AB

>>>>>>> upstream/master
AB["handledbuttons"] = {} --List of all buttons that have been modified.
AB["movers"] = {} --List of all created movers.
E['snapBars'] = { E.UIParent }

function AB:Initialize()
	self.db = E.db.actionbar
	if self.db.enable ~= true then return; end
	E.ActionBars = AB;
	
	self:DisableBlizzard()
	self:SecureHook('TalentFrame_LoadUI', 'FixKeybinds')
	self:SecureHook('ActionButton_Update', 'StyleButton')
	self:SecureHook('PetActionBar_Update', 'UpdatePet')
	self:SecureHook('ActionButton_UpdateHotkeys', 'FixKeybindText')
	self:SecureHook("ActionButton_UpdateFlyout", 'StyleFlyout')
<<<<<<< HEAD
	self:RawHook('ActionButton_HideGrid', E.noop, true)
	SetActionBarToggles(1, 1, 1, 1, 0)
	SetCVar("alwaysShowActionBars", 0)
	
=======

>>>>>>> upstream/master
	self:CreateActionBars()
	self:LoadKeyBinder()
	self:LoadButtonColoring()
	self:UpdateCooldownSettings()
	self:UnregisterEvent('PLAYER_ENTERING_WORLD')
end

function AB:CreateActionBars()
	self:SetupExtraButton()
	self:CreateBar1()
	self:CreateBar2()
	self:CreateBar3()
	self:CreateBar4()
	self:CreateBar5()
	self:CreateBarPet()
<<<<<<< HEAD
=======
	self:CreateVehicleLeave()
>>>>>>> upstream/master
	self:CreateBarShapeShift()
	if E.myclass == "SHAMAN" then
		self:CreateTotemBar()
	end	
	
	for button, _ in pairs(self["handledbuttons"]) do
		if button then
			self:StyleFlyout(button)
		else
			self["handledbuttons"][button] = nil
		end
	end	
end

function AB:PLAYER_REGEN_ENABLED()
	self:UpdateButtonSettings()
	self:UnregisterEvent('PLAYER_REGEN_ENABLED')
end

<<<<<<< HEAD
=======
function AB:CreateVehicleLeave()
	local vehicle = CreateFrame("Button", 'LeaveVehicleButton', E.UIParent, "SecureHandlerClickTemplate")
	vehicle:Size(26)
	vehicle:Point("BOTTOMLEFT", Minimap, "BOTTOMLEFT", 2, 2)
	vehicle:SetNormalTexture("Interface\\AddOns\\ElvUI\\media\\textures\\vehicleexit")
	vehicle:SetPushedTexture("Interface\\AddOns\\ElvUI\\media\\textures\\vehicleexit")
	vehicle:SetHighlightTexture("Interface\\AddOns\\ElvUI\\media\\textures\\vehicleexit")
	vehicle:SetTemplate("Default")
	vehicle:RegisterForClicks("AnyUp")
	vehicle:SetScript("OnClick", function() VehicleExit() end)
	RegisterStateDriver(vehicle, "visibility", "[vehicleui] show;[target=vehicle,exists] show;hide")
end

>>>>>>> upstream/master
function AB:UpdateButtonSettings()
	if InCombatLockdown() then self:RegisterEvent('PLAYER_REGEN_ENABLED'); return; end
	for button, _ in pairs(self["handledbuttons"]) do
		if button then
			self:StyleButton(button, button.noResize, button.noBackdrop)
			self:StyleFlyout(button)
		else
			self["handledbuttons"][button] = nil
		end
	end
	
	self:PositionAndSizeBar1()
	self:PositionAndSizeBar2()
	self:PositionAndSizeBar3()
	self:PositionAndSizeBar4()
	self:PositionAndSizeBar5()
	self:PositionAndSizeBarPet()
	self:PositionAndSizeBarShapeShift()
<<<<<<< HEAD
	
=======
>>>>>>> upstream/master
	--Movers snap update
	for _, mover in pairs(AB['movers']) do
		mover.bar:SetScript("OnDragStart", function(mover) 
			if InCombatLockdown() then E:Print(ERR_NOT_IN_COMBAT) return end
			
			if E.db.core.stickyFrames then
				local offset = self.db.buttonspacing/2
				if mover.padding then offset = mover.padding end
				Sticky:StartMoving(mover, E['snapBars'], offset, offset, offset, offset)
			else
				mover:StartMoving()
			end
		end)	
	end
end

function AB:GetPage(bar, defaultPage, condition)
	local page = self.db[bar]['paging'][E.myclass]
	if not condition then condition = '' end
	if not page then page = '' end
	if page then
		condition = condition.." "..page
	end
	condition = condition.." "..defaultPage
	return condition
end

function AB:StyleButton(button, noResize, noBackdrop)	
	local name = button:GetName();
	local icon = _G[name.."Icon"];
	local count = _G[name.."Count"];
	local flash	 = _G[name.."Flash"];
	local hotkey = _G[name.."HotKey"];
	local border  = _G[name.."Border"];
	local macroName = _G[name.."Name"];
	local normal  = _G[name.."NormalTexture"];
	local normal2 = button:GetNormalTexture()
	local shine = _G[name.."Shine"];
	local combat = InCombatLockdown()
<<<<<<< HEAD
	

	
=======

>>>>>>> upstream/master
	if flash then flash:SetTexture(nil); end
	if normal then normal:SetTexture(nil); normal:Hide(); normal:SetAlpha(0); end	
	if normal2 then normal2:SetTexture(nil); normal2:Hide(); normal2:SetAlpha(0); end	
	if border then border:Kill(); end
<<<<<<< HEAD
	
	if button:GetScale() > 0.5 then
		button:SetAlpha(1)
	end
		
=======
			
>>>>>>> upstream/master
	if not button.noResize then
		button.noResize = noResize;
	end
	
	if not button.noBackdrop then
		button.noBackdrop = noBackdrop;
	end
	
	if count then
		count:ClearAllPoints();
		count:SetPoint("BOTTOMRIGHT", 0, 2);
		count:FontTemplate(nil, 11, "OUTLINE");
	end
	
	if E:IsPTRVersion() and _G[name..'FloatingBG'] then
<<<<<<< HEAD
		_G[name..'FloatingBG']:Kill()
=======
		_G[name..'FloatingBG']:Hide()
		_G[name..'FloatingBG']:SetAlpha(0)
>>>>>>> upstream/master
	end	
	
	if macroName then
		if self.db.macrotext then
			macroName:Show()
			macroName:FontTemplate(nil, 11, 'OUTLINE')
			macroName:ClearAllPoints()
			macroName:Point('BOTTOM', 2, 2)
			macroName:SetJustifyH('CENTER')
		else
			macroName:Hide()
		end
	end
	
	if not button.noBackdrop and not button.backdrop then
		button:CreateBackdrop('Default', true)
		button.backdrop:SetAllPoints()
	end
	
	if not button.noResize and not combat then
		if button.sizeOverride then
			button:Size(button.sizeOverride)
		else
			button:Size(self.db.buttonsize)
		end
	end
	
	if icon then
		icon:SetTexCoord(unpack(E.TexCoords));
		icon:ClearAllPoints()
		icon:Point('TOPLEFT', 2, -2)
		icon:Point('BOTTOMRIGHT', -2, 2)
	end
	
	if shine then
		shine:SetAllPoints()
	end
	
	if self.db.hotkeytext then
		hotkey:ClearAllPoints();
		hotkey:Point("TOPRIGHT", 0, -3);
		hotkey:FontTemplate(nil, E.db.actionbar.fontsize, "OUTLINE");
	end
	
	--Extra Action Button
	if button.style then
		button.style:SetParent(button.backdrop)
		button.style:SetDrawLayer('BACKGROUND', -7)	
	end
	
	self:FixKeybindText(button);
	button:StyleButton();
	self["handledbuttons"][button] = true;
end

function AB:Bar_OnEnter(bar)
	UIFrameFadeIn(bar, 0.2, bar:GetAlpha(), 1)
end

function AB:Bar_OnLeave(bar)
	UIFrameFadeOut(bar, 0.2, bar:GetAlpha(), 0)
end

function AB:Button_OnEnter(button)
	local bar = button:GetParent()
	UIFrameFadeIn(bar, 0.2, bar:GetAlpha(), 1)
end

function AB:Button_OnLeave(button)
	local bar = button:GetParent()
	UIFrameFadeOut(bar, 0.2, bar:GetAlpha(), 0)
end

function AB:DisableBlizzard()
	MainMenuBar:SetScale(0.00001);
	MainMenuBar:EnableMouse(false);
	VehicleMenuBar:SetScale(0.00001);
	PetActionBarFrame:EnableMouse(false);
	ShapeshiftBarFrame:EnableMouse(false);
	
	local elements = {
		MainMenuBar, 
		MainMenuBarArtFrame, 
		BonusActionBarFrame, 
		VehicleMenuBar,
		PossessBarFrame, 
		PetActionBarFrame, 
		ShapeshiftBarFrame,
		ShapeshiftBarLeft, 
		ShapeshiftBarMiddle, 
		ShapeshiftBarRight,
	};
	for _, element in pairs(elements) do
		if element:GetObjectType() == "Frame" then
			element:UnregisterAllEvents();
			
			if element == MainMenuBarArtFrame then
				element:RegisterEvent("CURRENCY_DISPLAY_UPDATE");
			end
		end
		
		if element ~= MainMenuBar then
			element:Hide();
		end
		element:SetAlpha(0);
	end
	elements = nil;
	
	local uiManagedFrames = {
		"MultiBarLeft",
		"MultiBarRight",
		"MultiBarBottomLeft",
		"MultiBarBottomRight",
		"ShapeshiftBarFrame",
		"PossessBarFrame",
		"PETACTIONBAR_YPOS",
		"MultiCastActionBarFrame",
		"MULTICASTACTIONBAR_YPOS",
		--"ChatFrame1",
		--"ChatFrame2",
	};
	for _, frame in pairs(uiManagedFrames) do
		UIPARENT_MANAGED_FRAME_POSITIONS[frame] = nil;
	end
	uiManagedFrames = nil;

	if PlayerTalentFrame then
		PlayerTalentFrame:UnregisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	else
		hooksecurefunc("TalentFrame_LoadUI", function() PlayerTalentFrame:UnregisterEvent("ACTIVE_TALENT_GROUP_CHANGED") end)
	end	
end

function AB:FixKeybinds()
	PlayerTalentFrame:UnregisterEvent('ACTIVE_TALENT_GROUP_CHANGED');
end

function AB:FixKeybindText(button, type)
	local hotkey = _G[button:GetName()..'HotKey'];
	local text = hotkey:GetText();
	
	if text then
		text = gsub(text, L['KEY_LOCALE_SHIFT'], L['KEY_SHIFT']);
		text = gsub(text, L['KEY_LOCALE_ALT'], L['KEY_ALT']);
		text = gsub(text, L['KEY_LOCALE_CTRL'], L['KEY_CTRL']);
		text = gsub(text, KEY_MOUSEBUTTON, L['KEY_MOUSEBUTTON']);
		text = gsub(text, KEY_MOUSEWHEELUP, L['KEY_MOUSEWHEELUP']);
		text = gsub(text, KEY_MOUSEWHEELDOWN, L['KEY_MOUSEWHEELDOWN']);
		text = gsub(text, KEY_BUTTON3, L['KEY_BUTTON3']);
		text = gsub(text, KEY_NUMPAD, L['KEY_NUMPAD']);
		text = gsub(text, KEY_PAGEUP, L['KEY_PAGEUP']);
		text = gsub(text, KEY_PAGEDOWN, L['KEY_PAGEDOWN']);
		text = gsub(text, KEY_SPACE, L['KEY_SPACE']);
		text = gsub(text, KEY_INSERT, L['KEY_INSERT']);
		text = gsub(text, KEY_HOME, L['KEY_HOME']);
		text = gsub(text, KEY_DELETE, L['KEY_DELETE']);
		text = gsub(text, KEY_MOUSEWHEELUP, L['KEY_MOUSEWHEELUP']);
		text = gsub(text, KEY_MOUSEWHEELDOWN, L['KEY_MOUSEWHEELDOWN']);
<<<<<<< HEAD
		
		if hotkey:GetText() == RANGE_INDICATOR then
			hotkey:SetText('');
		else
=======

		if hotkey:GetText() == RANGE_INDICATOR then
			hotkey:SetAlpha(0)
		else
			hotkey:SetAlpha(1)
>>>>>>> upstream/master
			hotkey:SetText(text);
		end
	end
	
	if self.db.hotkeytext == true then
		hotkey:Show();
	else
		hotkey:Hide();
	end
	
	hotkey:ClearAllPoints();
	hotkey:Point("TOPRIGHT", 0, -3);	
end

function AB:ToggleMovers(move)
	if InCombatLockdown() then return end
	if move then
		for name, _ in pairs(self.movers) do
			local mover = self.movers[name].bar
			mover:Show()
		end
		_LOCK = true
	else
		for name, _ in pairs(self.movers) do
			local mover = self.movers[name].bar
			mover:Hide()
		end
		_LOCK = nil
	end
end

function AB:ResetMovers(bar)
	for name, _ in pairs(self.movers) do
<<<<<<< HEAD
		if bar == nil then
			local mover = self.movers[name].bar
=======
		local mover = self.movers[name].bar
		if bar == '' then
>>>>>>> upstream/master
			mover:ClearAllPoints()
			mover:Point(self.movers[name]["p"], self.movers[name]["p2"], self.movers[name]["p3"], self.movers[name]["p4"], self.movers[name]["p5"])
			
			if self.db[name] then
				self.db[name]['position'] = nil		
			end
<<<<<<< HEAD
		elseif name == bar then
			local mover = self.movers[name].bar
=======
		elseif name == mover.textString then
>>>>>>> upstream/master
			mover:ClearAllPoints()
			mover:Point(self.movers[name]["p"], self.movers[name]["p2"], self.movers[name]["p3"], self.movers[name]["p4"], self.movers[name]["p5"])
			
			if self.db[name] then
				self.db[name]['position'] = nil
			end
		end
	end
end

function AB:CreateMover(bar, text, name, padding)
	local p, p2, p3, p4, p5 = bar:GetPoint()

	local mover = CreateFrame('Button', nil, bar)
	mover:SetSize(bar:GetSize())
	mover:SetFrameStrata('HIGH')
	mover:SetTemplate('Default', true)	
	
	tinsert(E['snapBars'], mover)
	
	if self.movers[name] == nil then 
		self.movers[name] = {}
		self.movers[name]["bar"] = mover
		self.movers[name]["p"] = p
		self.movers[name]["p2"] = p2 or UIParent
		self.movers[name]["p3"] = p3
		self.movers[name]["p4"] = p4
		self.movers[name]["p5"] = p5
	end	

	if self.db and self.db[name] and self.db[name]["position"] then
		mover:SetPoint(self.db[name]["position"].p, UIParent, self.db[name]["position"].p2, self.db[name]["position"].p3, self.db[name]["position"].p4)
	else
		mover:SetPoint(p, p2, p3, p4, p5)
	end
	
	mover.padding = padding
	
	mover:RegisterForDrag("LeftButton", "RightButton")
	mover:SetScript("OnDragStart", function(self) 
		if InCombatLockdown() then E:Print(ERR_NOT_IN_COMBAT) return end
		if E.db.core.stickyFrames then
			local offset = AB.db.buttonspacing/2
			if padding then offset = padding end
			Sticky:StartMoving(self, E['snapBars'], offset, offset, offset, offset)
		else
			self:StartMoving()
		end
	end)
	
	mover:SetScript("OnDragStop", function(frame) 
		if InCombatLockdown() then E:Print(ERR_NOT_IN_COMBAT) return end
		if E.db.core.stickyFrames then
			Sticky:StopMoving(frame)
		else
			frame:StopMovingOrSizing()
		end
		
		if self.db[name] == nil then self.db[name] = {} end
		if self.db[name]['position'] == nil then self.db[name]['position'] = {} end
		
		self.db[name]['position'] = {}
		
		local p, _, p2, p3, p4 = frame:GetPoint()
		self.db[name]['position']["p"] = p
		self.db[name]['position']["p2"] = p2
		self.db[name]['position']["p3"] = p3
		self.db[name]['position']["p4"] = p4
		AB:UpdateButtonSettings()
		
		frame:SetUserPlaced(false)
	end)	
	
	bar:ClearAllPoints()
	bar:SetPoint(p3, mover, p3, 0, 0)

	local fs = mover:CreateFontString(nil, "OVERLAY")
	fs:FontTemplate()
	fs:SetJustifyH("CENTER")
	fs:SetPoint("CENTER")
	fs:SetText(text or name)
	fs:SetTextColor(unpack(E["media"].rgbvaluecolor))
	mover:SetFontString(fs)
	mover.text = fs
<<<<<<< HEAD
=======
	mover.textString = text
>>>>>>> upstream/master
	
	mover:SetScript("OnEnter", function(self) 
		self.text:SetTextColor(1, 1, 1)
		self:SetBackdropBorderColor(unpack(E["media"].rgbvaluecolor))
	end)
	mover:SetScript("OnLeave", function(self)
		self.text:SetTextColor(unpack(E["media"].rgbvaluecolor))
		self:SetTemplate("Default", true)
	end)
	
<<<<<<< HEAD
=======
	mover:RegisterEvent('PLAYER_REGEN_DISABLED')
	mover:SetScript('OnEvent', function(self)
		if self:IsShown() then
			self:Hide()
		end
	end)
	
>>>>>>> upstream/master
	mover:SetMovable(true)
	mover:Hide()	
	bar.mover = mover
end


local buttons = 0
local function SetupFlyoutButton()
	for i=1, buttons do
		--prevent error if you don't have max ammount of buttons
		if _G["SpellFlyoutButton"..i] then
			AB:StyleButton(_G["SpellFlyoutButton"..i], true)
			_G["SpellFlyoutButton"..i]:StyleButton()
			_G["SpellFlyoutButton"..i]:HookScript('OnEnter', function(self)
				local parent = self:GetParent()
				local parentAnchorButton = select(2, parent:GetPoint())
				if not AB["handledbuttons"][parentAnchorButton] then return end
				
				local parentAnchorBar = parentAnchorButton:GetParent()
<<<<<<< HEAD
				AB:Bar_OnEnter(parentAnchorBar)
=======
				if parentAnchorBar.mouseover then
					AB:Bar_OnEnter(parentAnchorBar)
				end
>>>>>>> upstream/master
			end)
			_G["SpellFlyoutButton"..i]:HookScript('OnLeave', function(self)
				local parent = self:GetParent()
				local parentAnchorButton = select(2, parent:GetPoint())
				if not AB["handledbuttons"][parentAnchorButton] then return end
				
				local parentAnchorBar = parentAnchorButton:GetParent()
				
<<<<<<< HEAD
				AB:Bar_OnLeave(parentAnchorBar)	
=======
				if parentAnchorBar.mouseover then
					AB:Bar_OnLeave(parentAnchorBar)	
				end
>>>>>>> upstream/master
			end)
		end
	end
	
	SpellFlyout:HookScript('OnEnter', function(self)
		local anchorButton = select(2, self:GetPoint())
		if not AB["handledbuttons"][anchorButton] then return end
		
		local parentAnchorBar = anchorButton:GetParent()
<<<<<<< HEAD
		AB:Bar_OnEnter(parentAnchorBar)
=======
		if parentAnchorBar.mouseover then
			AB:Bar_OnEnter(parentAnchorBar)
		end
>>>>>>> upstream/master
	end)
	
	SpellFlyout:HookScript('OnLeave', function(self)
		local anchorButton = select(2, self:GetPoint())
		if not AB["handledbuttons"][anchorButton] then return end
		
		local parentAnchorBar = anchorButton:GetParent()
<<<<<<< HEAD
		AB:Bar_OnLeave(parentAnchorBar)	
=======
		if parentAnchorBar.mouseover then
			AB:Bar_OnLeave(parentAnchorBar)	
		end
>>>>>>> upstream/master
	end)	
end
SpellFlyout:HookScript("OnShow", SetupFlyoutButton)


function AB:StyleFlyout(button)
	if not button.FlyoutBorder then return end
	local combat = InCombatLockdown()
	
	button.FlyoutBorder:SetAlpha(0)
	button.FlyoutBorderShadow:SetAlpha(0)
	
	SpellFlyoutHorizontalBackground:SetAlpha(0)
	SpellFlyoutVerticalBackground:SetAlpha(0)
	SpellFlyoutBackgroundEnd:SetAlpha(0)
	
	for i=1, GetNumFlyouts() do
		local x = GetFlyoutID(i)
		local _, _, numSlots, isKnown = GetFlyoutInfo(x)
		if isKnown then
			buttons = numSlots
			break
		end
	end
	
	--Change arrow direction depending on what bar the button is on
	local arrowDistance
	if ((SpellFlyout:IsShown() and SpellFlyout:GetParent() == button) or GetMouseFocus() == button) then
		arrowDistance = 5
	else
		arrowDistance = 2
	end

	if button:GetParent() and button:GetParent():GetParent() and button:GetParent():GetParent():GetName() and button:GetParent():GetParent():GetName() == "SpellBookSpellIconsFrame" then 
		return 
	end

	if button:GetParent() then
		local point = E:GetScreenQuadrant(button:GetParent())
		if point == "UNKNOWN" then return end
		
		if strfind(point, "TOP") then
			button.FlyoutArrow:ClearAllPoints()
			button.FlyoutArrow:SetPoint("BOTTOM", button, "BOTTOM", 0, -arrowDistance)
			SetClampedTextureRotation(button.FlyoutArrow, 180)
			if not combat then button:SetAttribute("flyoutDirection", "DOWN") end			
		elseif point == "RIGHT" then
			button.FlyoutArrow:ClearAllPoints()
			button.FlyoutArrow:SetPoint("LEFT", button, "LEFT", -arrowDistance, 0)
			SetClampedTextureRotation(button.FlyoutArrow, 270)
			if not combat then button:SetAttribute("flyoutDirection", "LEFT") end		
		elseif point == "LEFT" then
			button.FlyoutArrow:ClearAllPoints()
			button.FlyoutArrow:SetPoint("RIGHT", button, "RIGHT", arrowDistance, 0)
			SetClampedTextureRotation(button.FlyoutArrow, 90)
			if not combat then button:SetAttribute("flyoutDirection", "RIGHT") end				
		elseif point == "CENTER" or strfind(point, "BOTTOM") then
			button.FlyoutArrow:ClearAllPoints()
			button.FlyoutArrow:SetPoint("TOP", button, "TOP", 0, arrowDistance)
			SetClampedTextureRotation(button.FlyoutArrow, 0)
			if not combat then button:SetAttribute("flyoutDirection", "UP") end
		end
	end
end

E:RegisterModule(AB:GetName())