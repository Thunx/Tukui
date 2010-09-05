----------------------------------------------------------------
-- TUKUI VARS
----------------------------------------------------------------

TukuiCF = { }
TukuiDB = { }
tukuilocal = { }

TukuiDB.dummy = function() return end
TukuiDB.myname, _ = UnitName("player")
_, TukuiDB.myclass = UnitClass("player") 
TukuiDB.client = GetLocale() 
TukuiDB.resolution = GetCurrentResolution()
TukuiDB.getscreenresolution = select(TukuiDB.resolution, GetScreenResolutions())
TukuiDB.version = GetAddOnMetadata("Tukui", "Version")
TukuiDB.incombat = UnitAffectingCombat("player")
TukuiDB.patch = GetBuildInfo()
TukuiDB.level = UnitLevel("player")

----------------------------------------------------------------
-- BLIZZARD GLOBAL VARS
----------------------------------------------------------------

CHAT_FLAG_AFK = "|cffFF0000[AFK]|r "
CHAT_FLAG_DND = "|cffE7E716[DND]|r "
CHAT_FLAG_GM = "|cff4154F5[GM]|r "



