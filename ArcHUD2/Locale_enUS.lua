------------------------------
----- Translation for enEN
local L = AceLibrary("AceLocale-2.2"):new("ArcHUD_Core")

L:RegisterTranslations("enUS", function() return {
	-- Core stuff
		CMD_OPTS_FRAME		= "Open options window",
		CMD_OPTS_DEBUG		= "Set debugging level",
		CMD_RESET			= "Reset settings for this character to the defaults",
		CMD_RESET_HELP		= "This option will allow you to do two things, firstly you can reset your settings to their defaults.  To do this type 'CONFIRM' after the option so that the AddOn will know you've read this information",
		CMD_RESET_CONFIRM	= "This option will reset all of your options to the default values they had when the AddOn was installed",
		TEXT_RESET			= "Please type CONFIRM after this command to confirm you really do wish to reset your settings",
		TEXT_RESET_CONFIRM	= "All settings have been reset to their defaults",

		FONT				= "FRIZQT__.TTF",

		["Version: "]		= true,
		["Author: "]		= true,

	--	Options
		TEXT = {
			TITLE		= "ArcHUD Options",

			DISPLAY		= "Display options",
			TARGETFRAME	= "Target frame",
			PLAYERMODEL	= "3D model for players",
			MOBMODEL	= "3D model for mobs",
			SHOWGUILD	= "Show player guild",
			SHOWCLASS	= "Show target class",
			SHOWBUFFS 	= "Show buffs/debuffs",
			SHOWCOMBO	= "Show combopoint text",
			SHOWPVP		= "Show player PVP status flag",
			ATTACHTOP	= "Attach target frame to top",
			TOT			= "Enable target's target",
			TOTOT		= "Enable target's target's target",
			BLIZZPLAYER = "Blizzard player frame visible",
			BLIZZTARGET = "Blizzard target frame visible",

			NAMEPLATES	= "Nameplate options",
			NPPLAYER	= "Player",
			NPPET		= "Pet",
			NPTARGET	= "Target",
			NPTOT		= "Target's target",
			NPTOTOT		= "Target's target's target",
			NPCOMBAT	= "Enable nameplates in combat",
			PETNPFADE	= "Adjust pet nameplate alpha",
			HOVERMSG	= "Nameplate hover message",
			HOVERDELAY	= "Nameplate hover delay",

			MOVEFRAMES	= "Movable Frames",
			MFTHUD		= "Unlock target frame",
			MFTT		= "Unlock target's target frame",
			MFTTT		= "Unlock target's target's target frame",
			RESETTHUD	= "Reset target frame",
			RESETTT		= "Reset target's target frame",
			RESETTTT	= "Reset target's target's target frame",

			FADE		= "Fade options",
			FADE_FULL	= "When full",
			FADE_OOC	= "Out of combat",
			FADE_IC		= "In combat",

			MISC		= "Miscellanous options",
			WIDTH		= "HUD width",
			YLOC		= "Vertical alignment",
			XLOC		= "Horizontal alignment",
			SCALE		= "Scale",

			RINGVIS		= "Fade behaviour",
			RINGVIS_1	= "FadeFull: Fade when full",
			RINGVIS_2	= "FadeOOC: Fade when out of combat",
			RINGVIS_3	= "FadeBoth: Fade when full or out of combat",

			RINGS		= "Ring options",
			RING		= "Ring",
		},
		TOOLTIP = {
			TARGETFRAME = "Toggle display of entire target frame",
			PLAYERMODEL = "Toggle display of 3D target model of players",
			MOBMODEL	= "Toggle display of 3D target model of mobs",
			SHOWGUILD	= "Show player guild information next to their name",
			SHOWCLASS	= "Show target class or creature type",
			SHOWBUFFS	= "Toggle display of buffs and debuffs",
			SHOWCOMBO	= "Toggle display of combopoints in the center of the HUD",
			SHOWPVP		= "Toggle display of PVP status flag on the player nameplate",
			TOT			= "Enable displaying of target's target",
			TOTOT		= "Enable displaying of target's target's target",
			ATTACHTOP	= "Attach target frame to the top of the rings instead of the bottom",
			BLIZZPLAYER = "Toggles visibility of the Blizzard player frame",
			BLIZZTARGET = "Toggles visibility of the Blizzard target frame",

			NPPLAYER	= "Toggle display of player's nameplate",
			NPPET		= "Toggle display of pet's nameplate",
			NPTARGET	= "Toggle display of target's nameplate",
			NPTOT		= "Toggle display of target's target nameplate",
			NPTOTOT		= "Toggle display of target's target's target nameplate",
			NPCOMBAT	= "Toggle always enabling nameplates when entering combat",
			PETNPFADE	= "Automatically adjust the pet nameplate alpha based on pet happiness",
			HOVERMSG	= "Toggle displaying of nameplate mouse input enabled in chat",
			HOVERDELAY	= "Amount of seconds needed to hover above the nameplate to activate it",

			MFTHUD		= "Unlock the target frame to allow moving it",
			MFTT		= "Unlock the target's target frame to allow moving it",
			MFTTT		= "Unlock the target's target's target frame to allow moving it",
			RESETTHUD	= "Reset target frame to default position",
			RESETTT		= "Reset target's target frame to default position",
			RESETTTT	= "Reset target's target's target frame to default position",

			FADE_FULL	= "Alpha to fade to when out of combat and ring at 100%",
			FADE_OOC	= "Alpha to fade to when out of combat or ring not at 100%",
			FADE_IC		= "Alpha to fade to when in combat (only used if behaviour is set to FadeBoth or FadeOOC)",

			WIDTH		= "Sets how much the rings should be separated from the center",
			YLOC		= "Positions ArcHUD along the Y-axis. Positive values brings it up, negative values brings it down",
			XLOC		= "Positions ArcHUD along the X-axis. Positive values brings it right, negative values brings it left",
			SCALE		= "Set the Scale Factor",

			RINGVIS		= "Sets when the rings fade out",
			RINGVIS_1	= "Fade out when rings are full, regardless of combat status",
			RINGVIS_2	= "Always fade out when out of combat, regardless of ring status",
			RINGVIS_3	= "Fade out when out of combat or rings are full",
		},
} end)

local LM = AceLibrary("AceLocale-2.2"):new("ArcHUD_Module")

LM:EnableDynamicLocales()

LM:RegisterTranslations("enUS", function() return {
		FONT			= "FRIZQT__.TTF",

		["Version: "]	= true,
		["Author: "]	= true,

		["Health"]			= "Player Health",
		["Mana"]			= "Player Mana",
		["PetHealth"]		= "Pet Health",
		["PetMana"]			= "Pet Mana",
		["TargetCasting"]	= "Target Casting",
		["TargetHealth"]	= "Target Health",
		["TargetMana"]		= "Target Mana",
		["FocusHealth"]		= "Focus Health",
		["FocusMana"]		= "Focus Mana",
		["Casting"]			= true,
		["DruidMana"]		= "Druid Mana",
		["MirrorTimer"]		= "Mirror Timer",
		["ComboPoints"]		= "Combo Points",
		["EnergyTick"]		= "Energy Tick",

		TEXT = {
			ENABLED		= "Enabled",
			OUTLINE		= "Ring outline",
			SHOWTEXT	= "Show text",
			SHOWPERC	= "Show percentage",
			FLASH		= "Flash at max combo points",
			SHOWSPELL	= "Show spell being cast",
			SHOWTIME	= "Show spell timer",
			HIDEBLIZZ	= "Hide default Blizzard frame",
			ENABLEMENU	= "Enable right-click menu",
			DEFICIT		= "Deficit",
			SHOWINCOMBAT= "Show in combat",
			SHOWINSTEALTH="Show in stealth",
			ATTACH		= "Attachment",
			SIDE		= "Side",
			LEVEL		= "Level",
			COLOR		= "Ring color",
			COLORFADE	= "Color fading",
			COLORDEF	= "Default color",
			COLORCUST	= "Custom color",
			COLORSET	= "Ring color",
			COLORFRIEND = "Friendly ring color",
			COLORFOE	= "Foe ring color",
			COLORMANA 	= "Mana ring color",
			COLORRAGE	= "Rage ring color",
			COLORFOCUS 	= "Focus ring color",
			COLORENERGY	= "Energy ring color",
			ATTACHRING	= "Detach ring",
		},
		TOOLTIP = {
			ENABLED		= "Toggle the ring on and off",
			OUTLINE		= "Toggle the outline around the ring",
			SHOWTEXT	= "Toggle text display (health, mana, etc.)",
			SHOWPERC	= "Toggle showing percentage",
			SHOWSPELL	= "Toggle displaying of current spell being casted",
			SHOWTIME	= "Toggle showing spell timer",
			FLASH		= "Toggle flashing when at 5 combo points",
			HIDEBLIZZ	= "Toggle showing of default Blizzard frame",
			ENABLEMENU	= "Toggle right-click menu on and off",
			DEFICIT		= "Toggle health deficit (Max health - current health)",
			SHOWINCOMBAT= "Toggle showing ticking while in combat",
			SHOWINSTEALTH="Toggle showing ticking while stealthed",
			SIDE		= "Set which side to attach to",
			LEVEL		= "Set at which level it should be attached relative to the anchor (<-1: towards center, 0: at anchor, >1: away from center)",
			COLOR		= "Options for ring color",
			COLORFADE	= "Set the ring color to fade (green to red for health)",
			COLORDEF	= "Set the ring color to the default",
			COLORCUST	= "Set the ring color to custom defined colors",
			COLORSET	= "Set custom ring color (only effective when colormode set to custom)",
			COLORFRIEND	= "Set custom friendly ring color (only effective when colormode set to custom)",
			COLORFOE	= "Set custom foe ring color (only effective when colormode set to custom)",
			COLORMANA	= "Set custom mana ring color (only effective when colormode set to custom)",
			COLORRAGE	= "Set custom rage ring color (only effective when colormode set to custom)",
			COLORFOCUS	= "Set custom focus ring color (only effective when colormode set to custom)",
			COLORENERGY	= "Set custom energy ring color (only effective when colormode set to custom)",
			ATTACHRING	= "Toggle attachment of the ring to the normal frame anchors (will behave like a normal ring when active)",
		},
		SIDE = {
			LEFT		= "Left anchor",
			RIGHT		= "Right anchor",
		},

		["You gain Prowl."] = true,
		["Prowl fades from you."] = true,
		["You gain Stealth."] = true,
		["Stealth fades from you."] = true,
} end)
