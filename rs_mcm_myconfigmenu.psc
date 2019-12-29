ScriptName RS_MCM_MyConfigMenu extends SKI_ConfigBase
{MCM Menu for SkyScape - Needs to be redone cleaner}

;< Disclaimer
; To read this script cleanly, you need to download the custom papyrus language definition I made to use with my mods. It is a work in progress and can be downloaded from the link below:
; http://www.mediafire.com/download/f70f669c16gd443/ssPapyrus_1.0
; This can only be used in Notepad++, and I recommend monokai as the theme to use. I apologize for any inconveniences this may cause.
;
; FRAMEWORK SCRIPTS:
; rsFrameworkMenu = Framework Functions
; rsFrameworkData = Properties required by the functions (Menus, GlobalVariables, etc.)
; rsFrameworkTest = Events For Testing
;
;>

;< Properties
;< Armor Properties
Armor Property RS_Item_Armor_StartClothes Auto
Armor Property RS_Item_Armor_StartShoes Auto
;>

;< Cell Properties
Cell Property rscc Auto
;>

;< Faction Properties
Faction Property RS_aFaction_AgroStop7 Auto
Faction Property RS_aFaction_AgroStop9 Auto
Faction Property RS_aFaction_AgroStop11 Auto
Faction Property RS_aFaction_AgroStop13 Auto
Faction Property RS_aFaction_AgroStop15 Auto
Faction Property RS_aFaction_AgroStop17 Auto
Faction Property RS_aFaction_AgroStop19 Auto
Faction Property RS_aFaction_AgroStop21 Auto
Faction Property RS_aFaction_AgroStop23 Auto
Faction Property RS_aFaction_AgroStop25 Auto
Faction Property RS_aFaction_AgroStop27 Auto
Faction Property RS_aFaction_AgroStop29 Auto
Faction Property RS_aFaction_AgroStop31 Auto
Faction Property RS_aFaction_AgroStop33 Auto
Faction Property RS_aFaction_AgroStop35 Auto
Faction Property RS_aFaction_AgroStop37 Auto
Faction Property RS_aFaction_AgroStop39 Auto
Faction Property RS_aFaction_AgroStop41 Auto
Faction Property RS_aFaction_AgroStop43 Auto
Faction Property RS_aFaction_AgroStop45 Auto
Faction Property RS_aFaction_AgroStop47 Auto
Faction Property RS_aFaction_AgroStop49 Auto
Faction Property RS_aFaction_AgroStop51 Auto
Faction Property RS_aFaction_AgroStop53 Auto
Faction Property RS_aFaction_AgroStop55 Auto
Faction Property RS_aFaction_AgroStop57 Auto
Faction Property RS_aFaction_AgroStop59 Auto
Faction Property RS_aFaction_AgroStop61 Auto
Faction Property RS_aFaction_AgroStop63 Auto
Faction Property RS_aFaction_AgroStop65 Auto
Faction Property RS_aFaction_AgroStop67 Auto
Faction Property RS_aFaction_AgroStop69 Auto
Faction Property RS_aFaction_AgroStop71 Auto
Faction Property RS_aFaction_AgroStop73 Auto
Faction Property RS_aFaction_AgroStop75 Auto
Faction Property RS_aFaction_AgroStop77 Auto
Faction Property RS_aFaction_AgroStop79 Auto
Faction Property RS_aFaction_AgroStop81 Auto
Faction Property RS_aFaction_AgroStop83 Auto
Faction Property RS_aFaction_AgroStop85 Auto
Faction Property RS_aFaction_AgroStop87 Auto
Faction Property RS_aFaction_AgroStop89 Auto
Faction Property RS_aFaction_AgroStop91 Auto
Faction Property RS_aFaction_AgroStop93 Auto
Faction Property RS_aFaction_AgroStop95 Auto
Faction Property RS_aFaction_AgroStop97 Auto
Faction Property RS_aFaction_AgroStop99 Auto
Faction Property RS_aFaction_AgroStop101 Auto
Faction Property RS_aFaction_AgroStop103 Auto
Faction Property RS_aFaction_AgroStop105 Auto
Faction Property RS_aFaction_AgroStop107 Auto
Faction Property RS_aFaction_AgroStop109 Auto
Faction Property RS_aFaction_AgroStop111 Auto
Faction Property RS_aFaction_AgroStop113 Auto
Faction Property RS_aFaction_AgroStop115 Auto
Faction Property RS_aFaction_AgroStop117 Auto
Faction Property RS_aFaction_AgroStop119 Auto
Faction Property RS_aFaction_AgroStop121 Auto
Faction Property RS_aFaction_AgroStop123 Auto
Faction Property RS_aFaction_AgroStop125 Auto
Faction Property RS_aFaction_AgroStop127 Auto
Faction Property RS_aFaction_AgroStop129 Auto
Faction Property RS_aFaction_AgroStop131 Auto
Faction Property RS_aFaction_AgroStop133 Auto
Faction Property RS_aFaction_AgroStop135 Auto
Faction Property RS_aFaction_AgroStop137 Auto
Faction Property RS_aFaction_AgroStop139 Auto
Faction Property RS_aFaction_AgroStop141 Auto
Faction Property RS_aFaction_AgroStop143 Auto
Faction Property RS_aFaction_AgroStop145 Auto
Faction Property RS_aFaction_AgroStop147 Auto
Faction Property RS_aFaction_AgroStop149 Auto
Faction Property RS_aFaction_AgroStop151 Auto
Faction Property RS_aFaction_AgroStop153 Auto
Faction Property RS_aFaction_AgroStop155 Auto
Faction Property RS_aFaction_AgroStop157 Auto
Faction Property RS_aFaction_AgroStop159 Auto
Faction Property RS_aFaction_AgroStop161 Auto
Faction Property RS_aFaction_AgroStop163 Auto
Faction Property RS_aFaction_AgroStop165 Auto
Faction Property RS_aFaction_AgroStop167 Auto
Faction Property RS_aFaction_AgroStop169 Auto
Faction Property RS_aFaction_AgroStop171 Auto
Faction Property RS_aFaction_AgroStop173 Auto
Faction Property RS_aFaction_AgroStop175 Auto
Faction Property RS_aFaction_AgroStop177 Auto
Faction Property RS_aFaction_AgroStop179 Auto
Faction Property RS_aFaction_AgroStop181 Auto
Faction Property RS_aFaction_AgroStop183 Auto
Faction Property RS_aFaction_AgroStop185 Auto
Faction Property RS_aFaction_AgroStop187 Auto
Faction Property RS_aFaction_AgroStop189 Auto
Faction Property RS_aFaction_AgroStop191 Auto
Faction Property RS_aFaction_AgroStop193 Auto
Faction Property RS_aFaction_AgroStop195 Auto
Faction Property RS_aFaction_AgroStop197 Auto
Faction Property RS_aFaction_AgroStop199 Auto
Faction Property RS_aFaction_AgroStop201 Auto
Faction Property RS_aFaction_AgroStop203 Auto
Faction Property RS_aFaction_AgroStop205 Auto
Faction Property RS_aFaction_AgroStop207 Auto
Faction Property RS_aFaction_AgroStop209 Auto
Faction Property RS_aFaction_AgroStop211 Auto
Faction Property RS_aFaction_AgroStop213 Auto
Faction Property RS_aFaction_AgroStop215 Auto
Faction Property RS_aFaction_AgroStop217 Auto
Faction Property RS_aFaction_AgroStop219 Auto
Faction Property RS_aFaction_AgroStop221 Auto
Faction Property RS_aFaction_AgroStop223 Auto
Faction Property RS_aFaction_AgroStop225 Auto
Faction Property RS_aFaction_AgroStop227 Auto
Faction Property RS_aFaction_AgroStop229 Auto
Faction Property RS_aFaction_AgroStop231 Auto
Faction Property RS_aFaction_AgroStop233 Auto
Faction Property RS_aFaction_AgroStop235 Auto
Faction Property RS_aFaction_AgroStop237 Auto
Faction Property RS_aFaction_AgroStop239 Auto
Faction Property RS_aFaction_AgroStop241 Auto
Faction Property RS_aFaction_AgroStop243 Auto
Faction Property RS_aFaction_AgroStop245 Auto
Faction Property RS_aFaction_AgroStop247 Auto
Faction Property RS_aFaction_AgroStop249 Auto
Faction Property RS_aFaction_AgroStop251 Auto
Faction Property RS_aFaction_AgroStop253 Auto
;>

;< GV Properties
GlobalVariable Property RS_GV_XPMultiplier Auto
GlobalVariable Property RS_Inventory_Current Auto

GlobalVariable Property RS_Config_DnD_DailyInterval Auto
GlobalVariable Property RS_Config_DnD_WeeklyInterval Auto
GlobalVariable Property RS_Config_DnD_MonthlyInterval Auto

GlobalVariable Property RS_Check_ModStatus Auto
GlobalVariable Property RS_GV_SkyrimHealth Auto
GlobalVariable Property RS_GV_SkyrimMagicka Auto
GlobalVariable Property RS_GV_SkyrimMagickaRate Auto
GlobalVariable Property RS_GV_SkyrimStamina Auto
GlobalVariable Property RS_GV_SkyrimStaminaRate Auto
GlobalVariable Property RS_GV_SkyrimSpeechcraft Auto
GlobalVariable Property RS_GV_SkyrimUnarmedDamage Auto
GlobalVariable Property RS_GV_SkyrimCarryWeight Auto
GlobalVariable Property RS_GV_RuneSkyHealth Auto
GlobalVariable Property RS_GV_RuneSkyMagicka Auto
GlobalVariable Property RS_GV_RuneSkyMagickaRate Auto
GlobalVariable Property RS_GV_RuneSkyStamina Auto
GlobalVariable Property RS_GV_RuneSkyStaminaRate Auto
GlobalVariable Property RS_GV_RuneSkySpeechcraft Auto
GlobalVariable Property RS_GV_RuneSkyUnarmedDamage Auto
GlobalVariable Property RS_GV_RuneSkyCarryWeight Auto

GlobalVariable Property RS_GV_AttackLVL Auto
GlobalVariable Property RS_GV_AttackXP Auto
GlobalVariable Property RS_GV_StrengthLVL Auto
GlobalVariable Property RS_GV_StrengthXP Auto
GlobalVariable Property RS_GV_DefenseLVL Auto
GlobalVariable Property RS_GV_DefenseXP Auto
GlobalVariable Property RS_GV_RangedLVL Auto
GlobalVariable Property RS_GV_RangedXP Auto
GlobalVariable Property RS_GV_PrayerLVL Auto
GlobalVariable Property RS_GV_PrayerXP Auto
GlobalVariable Property RS_GV_MagicLVL Auto
GlobalVariable Property RS_GV_MagicXP Auto
GlobalVariable Property RS_GV_RunecraftingLVL Auto
GlobalVariable Property RS_GV_RunecraftingXP Auto
GlobalVariable Property RS_GV_ConstructionLVL Auto
GlobalVariable Property RS_GV_ConstructionXP Auto
GlobalVariable Property RS_GV_HitpointLVL Auto
GlobalVariable Property RS_GV_HitpointXP Auto
GlobalVariable Property RS_GV_AgilityLVL Auto
GlobalVariable Property RS_GV_AgilityXP Auto
GlobalVariable Property RS_GV_HerbloreLVL Auto
GlobalVariable Property RS_GV_HerbloreXP Auto
GlobalVariable Property RS_GV_ThievingLVL Auto
GlobalVariable Property RS_GV_ThievingXP Auto
GlobalVariable Property RS_GV_CraftingLVL Auto
GlobalVariable Property RS_GV_CraftingXP Auto
GlobalVariable Property RS_GV_FletchingLVL Auto
GlobalVariable Property RS_GV_FletchingXP Auto
GlobalVariable Property RS_GV_SlayerLVL Auto
GlobalVariable Property RS_GV_SlayerXP Auto
GlobalVariable Property RS_GV_HunterLVL Auto
GlobalVariable Property RS_GV_HunterXP Auto
GlobalVariable Property RS_GV_MiningLVL Auto
GlobalVariable Property RS_GV_MiningXP Auto
GlobalVariable Property RS_GV_SmithingLVL Auto
GlobalVariable Property RS_GV_SmithingXP Auto
GlobalVariable Property RS_GV_FishingLVL Auto
GlobalVariable Property RS_GV_FishingXP Auto
GlobalVariable Property RS_GV_CookingLVL Auto
GlobalVariable Property RS_GV_CookingXP Auto
GlobalVariable Property RS_GV_FiremakingLVL Auto
GlobalVariable Property RS_GV_FiremakingXP Auto
GlobalVariable Property RS_GV_WoodcuttingLVL Auto
GlobalVariable Property RS_GV_WoodcuttingXP Auto
GlobalVariable Property RS_GV_FarmingLVL Auto
GlobalVariable Property RS_GV_FarmingXP Auto
GlobalVariable Property RS_GV_SummoningLVL Auto
GlobalVariable Property RS_GV_SummoningXP Auto
GlobalVariable Property RS_GV_DungeoneeringLVL Auto
GlobalVariable Property RS_GV_DungeoneeringXP Auto

GlobalVariable Property RS_GV_AttackStyle Auto
GlobalVariable Property RS_GV_FightStyleAttackBoost Auto
GlobalVariable Property RS_GV_FightStyleStrengthBoost Auto
GlobalVariable Property RS_GV_FightStyleDefenceBoost Auto

GlobalVariable Property RS_GV_pStat_AttBonus_Crush Auto
GlobalVariable Property RS_GV_pStat_AttBonus_Magic Auto
GlobalVariable Property RS_GV_pStat_AttBonus_Range Auto
GlobalVariable Property RS_GV_pStat_AttBonus_Slash Auto
GlobalVariable Property RS_GV_pStat_AttBonus_Stab Auto
GlobalVariable Property RS_GV_pStat_DefBonus_Crush Auto
GlobalVariable Property RS_GV_pStat_DefBonus_Magic Auto
GlobalVariable Property RS_GV_pStat_DefBonus_Range Auto
GlobalVariable Property RS_GV_pStat_DefBonus_Slash Auto
GlobalVariable Property RS_GV_pStat_DefBonus_Stab Auto

GlobalVariable Property RS_GV_pStat_Bonus_Prayer Auto
GlobalVariable Property RS_GV_pStat_Bonus_Strength Auto

GlobalVariable Property RS_GV_QuestPoints Auto

GlobalVariable Property RS_TimeStamp_Agoroth Auto
GlobalVariable Property RS_TimeStamp_BigChinchompa Auto
GlobalVariable Property RS_TimeStamp_Bork Auto
GlobalVariable Property RS_TimeStamp_Circus Auto
GlobalVariable Property RS_TimeStamp_DemonFlashmobs Auto
GlobalVariable Property RS_TimeStamp_EvilTree Auto
GlobalVariable Property RS_TimeStamp_Familiarisation Auto
GlobalVariable Property RS_TimeStamp_FishFlingers Auto
GlobalVariable Property RS_TimeStamp_GiantOyster Auto
GlobalVariable Property RS_TimeStamp_GoblinRaids Auto
GlobalVariable Property RS_TimeStamp_GodStatues Auto
GlobalVariable Property RS_TimeStamp_GuthixianCaches Auto
GlobalVariable Property RS_TimeStamp_MemoryOfNomad Auto
GlobalVariable Property RS_TimeStamp_PenguinHideAndSeek Auto
GlobalVariable Property RS_TimeStamp_PhoenixLair Auto
GlobalVariable Property RS_TimeStamp_RuneGoldbergMachine Auto
GlobalVariable Property RS_TimeStamp_RushOfBlood Auto
GlobalVariable Property RS_TimeStamp_ShootingStar Auto
GlobalVariable Property RS_TimeStamp_Sinkholes Auto
GlobalVariable Property RS_TimeStamp_SkeletalHorror Auto
GlobalVariable Property RS_TimeStamp_TearsOfGuthix Auto
GlobalVariable Property RS_TimeStamp_ThePit Auto
GlobalVariable Property RS_TimeStamp_TrollInvasion Auto
GlobalVariable Property RS_TimeStamp_WildernessWarbands Auto

;>

;< ObjectReference Properties
ObjectReference Property RuneSkyStartLocation Auto
ObjectReference Property RuneSkyLocation Auto
ObjectReference Property SkyrimLocation Auto
ObjectReference Property SkyrimPlayerStorage Auto
ObjectReference Property RuneSkyPlayerStorage Auto

ObjectReference Property RS_DnD_GodStatue_Rock_Lumbridge Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Lumbridge_Saradomin Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Lumbridge_Bandos Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Lumbridge_Zamorak Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Lumbridge_Seren Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Lumbridge_Guthix Auto
ObjectReference Property RS_DnD_GodStatue_Rock_Taverly Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Taverly_Saradomin Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Taverly_Bandos Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Taverly_Zamorak Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Taverly_Seren Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Taverly_Guthix Auto
ObjectReference Property RS_DnD_GodStatue_Rock_Yanille Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Yanille_Saradomin Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Yanille_Bandos Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Yanille_Zamorak Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Yanille_Seren Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Yanille_Guthix Auto
ObjectReference Property RS_DnD_GodStatue_Rock_Canifis Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Canifis_Saradomin Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Canifis_Bandos Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Canifis_Zamorak Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Canifis_Seren Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Canifis_Guthix Auto
ObjectReference Property RS_DnD_GodStatue_Rock_Prifddinas Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Prifddinas_Saradomin Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Prifddinas_Bandos Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Prifddinas_Zamorak Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Prifddinase_Seren Auto
ObjectReference Property RS_DnD_GodStatue_Statue_Prifddinas_Guthix Auto

;>

;< Message Properties
Message Property RS_Message_Combat_SelectAttackStyle Auto
;>

;< Spell Properties
Spell Property RS_Skill_Pickpocketing Auto
;>
;>

;< Variables

String attackStyleString
String stringTimeRemain_Agoroth
String stringTimeRemain_BigChinchompa
String stringTimeRemain_Bork
String stringTimeRemain_Circus
String stringTimeRemain_DemonFlashmobs
String stringTimeRemain_EvilTree
String stringTimeRemain_Familiarisation
String stringTimeRemain_FishFlingers
String stringTimeRemain_GiantOyster
String stringTimeRemain_GoblinRaids
String stringTimeRemain_GodStatues
String stringTimeRemain_GuthixianCaches
String stringTimeRemain_MemoryOfNomad
String stringTimeRemain_PenguinHideAndSeek
String stringTimeRemain_PhoenixLair
String stringTimeRemain_RuneGoldbergMachine
String stringTimeRemain_RushOfBlood
String stringTimeRemain_ShootingStar
String stringTimeRemain_Sinkholes
String stringTimeRemain_SkeletalHorror
String stringTimeRemain_TearsOfGuthix
String stringTimeRemain_ThePit
String stringTimeRemain_TrollInvasion
String stringTimeRemain_WildernessWarbands

Int CombatLVL
Float BaseLVL

Int XPM
Int Inventory
Int InvCur
Int InvMax

Int AttackLVL
Int cAttackXP
Int tAttackXP
Int StrengthLVL
Int cStrengthXP
Int tStrengthXP
Int DefenseLVL
Int cDefenseXP
Int tDefenseXP
Int RangedLVL
Int cRangedXP
Int tRangedXP
Int PrayerLVL
Int cPrayerXP
Int tPrayerXP
Int MagicLVL
Int cMagicXP
Int tMagicXP
Int RunecraftingLVL
Int cRunecraftingXP
Int tRunecraftingXP
Int ConstructionLVL
Int cConstructionXP
Int tConstructionXP
Int HitpointLVL
Int cHitpointXP
Int tHitpointXP
Int AgilityLVL
Int cAgilityXP
Int tAgilityXP
Int HerbloreLVL
Int cHerbloreXP
Int tHerbloreXP
Int ThievingLVL
Int cThievingXP
Int tThievingXP
Int CraftingLVL
Int cCraftingXP
Int tCraftingXP
Int FletchingLVL
Int cFletchingXP
Int tFletchingXP
Int SlayerLVL
Int cSlayerXP
Int tSlayerXP
Int HunterLVL
Int cHunterXP
Int tHunterXP
Int MiningLVL
Int cMiningXP
Int tMiningXP
Int SmithingLVL
Int cSmithingXP
Int tSmithingXP
Int FishingLVL
Int cFishingXP
Int tFishingXP
Int CookingLVL
Int cCookingXP
Int tCookingXP
Int FiremakingLVL
Int cFiremakingXP
Int tFiremakingXP
Int WoodcuttingLVL
Int cWoodcuttingXP
Int tWoodcuttingXP
Int FarmingLVL
Int cFarmingXP
Int tFarmingXP
Int SummoningLVL
Int cSummoningXP
Int tSummoningXP
Int DungeoneeringLVL
Int cDungeoneeringXP
Int tDungeoneeringXP

; OID
Int Attack_T
Int AttackXP_T
Int Strength_T
Int StrengthXP_T
Int Defense_T
Int DefenseXP_T
Int Ranged_T
Int RangedXP_T
Int Prayer_T
Int PrayerXP_T
Int Magic_T
Int MagicXP_T
Int Runecrafting_T
Int RunecraftingXP_T
Int Construction_T
Int ConstructionXP_T
Int Hitpoint_T
Int HitpointXP_T
Int Agility_T
Int AgilityXP_T
Int Herblore_T
Int HerbloreXP_T
Int Thieving_T
Int ThievingXP_T
Int Crafting_T
Int CraftingXP_T
Int Fletching_T
Int FletchingXP_T
Int Slayer_T
Int SlayerXP_T
Int Hunter_T
Int HunterXP_T
Int Mining_T
Int MiningXP_T
Int Smithing_T
Int SmithingXP_T
Int Fishing_T
Int FishingXP_T
Int Cooking_T
Int CookingXP_T
Int Firemaking_T
Int FiremakingXP_T
Int Woodcutting_T
Int WoodcuttingXP_T
Int Farming_T
Int FarmingXP_T
Int Summoning_T
Int SummoningXP_T
Int Dungeoneering_T
Int DungeoneeringXP_T

Int dndAgoroth_oid
Int dndBigChinchompa_oid
Int dndBork_oid
Int dndCircus_oid
Int dndDemonFlashmobs_oid
Int dndEvilTree_oid
Int dndFamiliarisation_oid
Int dndFishFlingers_oid
Int dndGiantOyster_oid
Int dndGoblinRaids_oid
Int dndGodStatues_oid
Int dndGuthixianCaches_oid
Int dndMemoryOfNomad_oid
Int dndPenguinHideAndSeek_oid
Int dndPhoenixLair_oid
Int dndRuneGoldbergMachine_oid
Int dndRushOfBlood_oid
Int dndShootingStar_oid
Int dndSinkholes_oid
Int dndSkeletalHorror_oid
Int dndTearsOfGuthix_oid
Int dndThePit_oid
Int dndTrollInvasion_oid
Int dndWildernessWarbands_oid

Int timeAgoroth_oid
Int timeBigChinchompa_oid
Int timeBork_oid
Int timeCircus_oid
Int timeDemonFlashmobs_oid
Int timeEvilTree_oid
Int timeFamiliarisation_oid
Int timeFishFlingers_oid
Int timeGiantOyster_oid
Int timeGoblinRaids_oid
Int timeGodStatues_oid
Int timeGuthixianCaches_oid
Int timeMemoryOfNomad_oid
Int timePenguinHideAndSeek_oid
Int timePhoenixLair_oid
Int timeRuneGoldbergMachine_oid
Int timeRushOfBlood_oid
Int timeShootingStar_oid
Int timeSinkholes_oid
Int timeSkeletalHorror_oid
Int timeTearsOfGuthix_oid
Int timeThePit_oid
Int timeTrollInvasion_oid
Int timeWildernessWarbands_oid

String aVal
String bVal
String cVal
String dVal
String eVal
String fVal
String gVal
String hVal
String iVal
String jVal
String kVal
String lVal
String mVal
String nVal
String oVal
String pVal
String qVal
String rVal
String sVal
String tVal
String uVal
String vVal
String wVal
String xVal
String yVal
String zVal
;>

;< EVENT - OnPageReset()
event OnPageReset(string a_page)
	If (a_page == "")
		Int pLVL = ((RS_GV_PrayerLVL.GetValue())/2) as Int
		Int sLVL = ((RS_GV_SummoningLVL.GetValue())/2) as Int
		Int dLVL = RS_GV_DefenseLVL.GetValue() as Int
		Int cLVL = RS_GV_HitpointLVL.GetValue() as Int
		Int strLVL = RS_GV_StrengthLVL.GetValue() as Int
		Int attLVL = RS_GV_AttackLVL.GetValue() as Int
		Int rLVL = RS_GV_RangedLVL.GetValue() as Int
		Int mLVL = RS_GV_MagicLVL.GetValue() as Int
		Int questPoints = RS_GV_QuestPoints.GetValue() as Int
		BaseLVL = 0.25 * (dLVL + cLVL + pLVL + sLVL)
		
		Float WarriorLVL = 0.325 * (attLVL + strLVL);\
		Float RangerLVL = 0.325 * (1.5 * rLVL);   }Highest of three to be added to BaseLevel
		Float MageLVL = 0.325 * (1.5 * mLVL);    /
		
		If WarriorLVL > RangerLVL && WarriorLVL > MageLVL
			CombatLVL = (BaseLVL + WarriorLVL) as Int
		ElseIf RangerLVL > WarriorLVL && RangerLVL > MageLVL
			CombatLVL = (BaseLVL + RangerLVL) as Int
		ElseIf MageLVL > WarriorLVL && MageLVL > RangerLVL
			CombatLVL = (BaseLVL + MageLVL) as Int
		ElseIf WarriorLVL == RangerLVL || WarriorLVL == MageLVL
			CombatLVL = (BaseLVL + WarriorLVL) as Int
		ElseIf RangerLVL == MageLVL
			CombatLVL = (BaseLVL + RangerLVL) as Int		
		EndIf
		AddSkillSpells()
		UpdateAgressions()
		UpdateDnDtimers()
		RegisterForKey(59)
		
		SetCursorFillMode(LEFT_TO_RIGHT)
		SetCursorPosition(0);left
		AddHeaderOption("General Statistics")
		
		SetCursorPosition(1);right
		AddHeaderOption("Equipment Stats")
		
		SetCursorPosition(2);left
		AddTextOption("Your Combat level is " + CombatLVL + ".", aVal)
		
		SetCursorPosition(3);right
		AddHeaderOption("Attack Bonus")
		
		SetCursorPosition(4);left
		AddTextOption("You have " + questPoints + " Quest Points.", aVal)
		
		SetCursorPosition(5);right
		If (RS_GV_pStat_AttBonus_Stab.GetValue()) < 0
			AddTextOption("Stab: " + (RS_GV_pStat_AttBonus_Stab.GetValue() as int), aVal)
		Else
			AddTextOption("Stab: +" + (RS_GV_pStat_AttBonus_Stab.GetValue() as int), aVal)
		EndIf
		
		SetCursorPosition(7);right
		If (RS_GV_pStat_AttBonus_Slash.GetValue()) < 0
			AddTextOption("Slash: " + (RS_GV_pStat_AttBonus_Slash.GetValue() as int), aVal)
		Else
			AddTextOption("Slash: +" + (RS_GV_pStat_AttBonus_Slash.GetValue() as int), aVal)
		EndIf
		
		SetCursorPosition(9);right
		If (RS_GV_pStat_AttBonus_Crush.GetValue()) < 0
			AddTextOption("Crush: " + (RS_GV_pStat_AttBonus_Crush.GetValue() as int), aVal)
		Else
			AddTextOption("Crush: +" + (RS_GV_pStat_AttBonus_Crush.GetValue() as int), aVal)
		EndIf
		
		SetCursorPosition(11);right
		If (RS_GV_pStat_AttBonus_Magic.GetValue()) < 0
			AddTextOption("Magic: " + (RS_GV_pStat_AttBonus_Magic.GetValue() as int), aVal)
		Else
			AddTextOption("Magic: +" + (RS_GV_pStat_AttBonus_Magic.GetValue() as int), aVal)
		EndIf
		
		SetCursorPosition(13);right
		If (RS_GV_pStat_AttBonus_Range.GetValue()) < 0
			AddTextOption("Range: " + (RS_GV_pStat_AttBonus_Range.GetValue() as int), aVal)
		Else
			AddTextOption("Range: +" + (RS_GV_pStat_AttBonus_Range.GetValue() as int), aVal)
		EndIf
		
		SetCursorPosition(17);right
		AddHeaderOption("Defence Bonus")
		
		SetCursorPosition(19);right
		If (RS_GV_pStat_DefBonus_Stab.GetValue()) < 0
			AddTextOption("Stab: " + (RS_GV_pStat_DefBonus_Stab.GetValue() as int), aVal)
		Else
			AddTextOption("Stab: +" + (RS_GV_pStat_DefBonus_Stab.GetValue() as int), aVal)
		EndIf
		
		SetCursorPosition(21);right
		If (RS_GV_pStat_DefBonus_Slash.GetValue()) < 0
			AddTextOption("Slash: " + (RS_GV_pStat_DefBonus_Slash.GetValue() as int), aVal)
		Else
			AddTextOption("Slash: +" + (RS_GV_pStat_DefBonus_Slash.GetValue() as int), aVal)
		EndIf
		
		SetCursorPosition(23);right
		If (RS_GV_pStat_DefBonus_Crush.GetValue()) < 0
			AddTextOption("Crush: " + (RS_GV_pStat_DefBonus_Crush.GetValue() as int), aVal)
		Else
			AddTextOption("Crush: +" + (RS_GV_pStat_DefBonus_Crush.GetValue() as int), aVal)
		EndIf
		
		SetCursorPosition(25);right
		If (RS_GV_pStat_DefBonus_Magic.GetValue()) < 0
			AddTextOption("Magic: " + (RS_GV_pStat_DefBonus_Magic.GetValue() as int), aVal)
		Else
			AddTextOption("Magic: +" + (RS_GV_pStat_DefBonus_Magic.GetValue() as int), aVal)
		EndIf
		
		SetCursorPosition(27);right
		If (RS_GV_pStat_DefBonus_Range.GetValue()) < 0
			AddTextOption("Range: " + (RS_GV_pStat_DefBonus_Range.GetValue() as int), aVal)
		Else
			AddTextOption("Range: +" + (RS_GV_pStat_DefBonus_Range.GetValue() as int), aVal)
		EndIf
		
		SetCursorPosition(31);right
		AddHeaderOption("Other Bonuses")
		
		SetCursorPosition(33);right
		If (RS_GV_pStat_Bonus_Strength.GetValue()) < 0
			AddTextOption("Strength: " + (RS_GV_pStat_Bonus_Strength.GetValue() as int), aVal)
		Else
			AddTextOption("Strength: +" + (RS_GV_pStat_Bonus_Strength.GetValue() as int), aVal)
		EndIf
		
		SetCursorPosition(35);right
		If (RS_GV_pStat_Bonus_Prayer.GetValue()) < 0
			AddTextOption("Prayer: " + (RS_GV_pStat_Bonus_Prayer.GetValue() as int), aVal)
		Else
			AddTextOption("Prayer: +" + (RS_GV_pStat_Bonus_Prayer.GetValue() as int), aVal)
		EndIf
		
	ElseIf (a_page == "Skills")
		SetCursorFillMode(LEFT_TO_RIGHT)
		
		AgilityInit()
		AttackInit()
		ConstructionInit()
		CookingInit()
		CraftingInit()
		DefenseInit()
		DungeoneeringInit()
		FarmingInit()
		FiremakingInit()
		FishingInit()
		FletchingInit()
		HerbloreInit()
		HitpointInit()
		HunterInit()
		MagicInit()
		MiningInit()
		PrayerInit()
		RangedInit()
		RunecraftingInit()
		SlayerInit()
		SmithingInit()
		StrengthInit()
		SummoningInit()
		ThievingInit()
		WoodcuttingInit()
		;=================================================================================================================================================================================================
		SetCursorPosition(0)
		AddHeaderOption("Skills")
		
		SetCursorPosition(1)
		AddHeaderOption("Experience Points")
		;=================================================================================================================================================================================================
		SetCursorPosition(2)
		Agility_T = AddTextOption("Agility: Level " + AgilityLVL, aVal)
		
		SetCursorPosition(3)
		AgilityXP_T = AddTextOption("Current XP: " + cAgilityXP + " Target XP: " + tAgilityXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(4)
		Attack_T = AddTextOption("Attack: Level " + AttackLVL, aVal)
		
		SetCursorPosition(5)
		AttackXP_T = AddTextOption("Current XP: " + cAttackXP + " Target XP: " + tAttackXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(6)
		Construction_T = AddTextOption("Construction: Level " + ConstructionLVL, aVal)
		
		SetCursorPosition(7)
		ConstructionXP_T = AddTextOption("Current XP: " + cConstructionXP + " Target XP: " + tConstructionXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(8)
		Cooking_T = AddTextOption("Cooking: Level " + CookingLVL, aVal)
		
		SetCursorPosition(9)
		CookingXP_T = AddTextOption("Current XP: " + cCookingXP + " Target XP: " + tCookingXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(10)
		Crafting_T = AddTextOption("Crafting: Level " + CraftingLVL, aVal)
		
		SetCursorPosition(11)
		CraftingXP_T = AddTextOption("Current XP: " + cCraftingXP + " Target XP: " + tCraftingXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(12)
		Defense_T = AddTextOption("Defense: Level " + DefenseLVL, aVal)
		
		SetCursorPosition(13)
		DefenseXP_T = AddTextOption("Current XP: " + cDefenseXP + " Target XP: " + tDefenseXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(14)
		Dungeoneering_T = AddTextOption("Dungeoneering: Level " + DungeoneeringLVL, aVal)
		
		SetCursorPosition(15)
		DungeoneeringXP_T = AddTextOption("Current XP: " + cDungeoneeringXP + " Target XP: " + tDungeoneeringXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(16)
		Farming_T = AddTextOption("Farming: Level " + FarmingLVL, aVal)
		
		SetCursorPosition(17)
		FarmingXP_T = AddTextOption("Current XP: " + cFarmingXP + " Target XP: " + tFarmingXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(18)
		Firemaking_T = AddTextOption("Firemaking: Level " + FiremakingLVL, aVal)
		
		SetCursorPosition(19)
		FiremakingXP_T = AddTextOption("Current XP: " + cFiremakingXP + " Target XP: " + tFiremakingXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(20)
		Fishing_T = AddTextOption("Fishing: Level " + FishingLVL, aVal)
		
		SetCursorPosition(21)
		FishingXP_T = AddTextOption("Current XP: " + cFishingXP + " Target XP: " + tFishingXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(22)
		Fletching_T = AddTextOption("Fletching: Level " + FletchingLVL, aVal)
		
		SetCursorPosition(23)
		FletchingXP_T = AddTextOption("Current XP: " + cFletchingXP + " Target XP: " + tFletchingXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(24)
		Herblore_T = AddTextOption("Herblore: Level " + HerbloreLVL, aVal)
		
		SetCursorPosition(25)
		HerbloreXP_T = AddTextOption("Current XP: " + cHerbloreXP + " Target XP: " + tHerbloreXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(26)
		Hitpoint_T = AddTextOption("Hitpoint: Level " + HitpointLVL, aVal)
		
		SetCursorPosition(27)
		HitpointXP_T = AddTextOption("Current XP: " + cHitpointXP + " Target XP: " + tHitpointXP, aVal)
		;=================================================================================================================================================================================================		
		SetCursorPosition(28)
		Hunter_T = AddTextOption("Hunter: Level " + HunterLVL, aVal)
		
		SetCursorPosition(29)
		HunterXP_T = AddTextOption("Current XP: " + cHunterXP + " Target XP: " + tHunterXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(30)
		Magic_T = AddTextOption("Magic: Level " + MagicLVL, aVal)
		
		SetCursorPosition(31)
		MagicXP_T = AddTextOption("Current XP: " + cMagicXP + " Target XP: " + tMagicXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(32)
		Mining_T = AddTextOption("Mining: Level " + MiningLVL, aVal)
		
		SetCursorPosition(33)
		MiningXP_T = AddTextOption("Current XP: " + cMiningXP + " Target XP: " + tMiningXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(34)
		Prayer_T = AddTextOption("Prayer: Level " + PrayerLVL, aVal)
		
		SetCursorPosition(35)
		PrayerXP_T = AddTextOption("Current XP: " + cPrayerXP + " Target XP: " + tPrayerXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(36)
		Ranged_T = AddTextOption("Ranged: Level " + RangedLVL, aVal)
		
		SetCursorPosition(37)
		RangedXP_T = AddTextOption("Current XP: " + cRangedXP + " Target XP: " + tRangedXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(38)
		Runecrafting_T = AddTextOption("Runecrafting: Level " + RunecraftingLVL, aVal)
		
		SetCursorPosition(39)
		RunecraftingXP_T = AddTextOption("Current XP: " + cRunecraftingXP + " Target XP: " + tRunecraftingXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(40)
		Slayer_T = AddTextOption("Slayer: Level " + SlayerLVL, aVal)
		
		SetCursorPosition(41)
		SlayerXP_T = AddTextOption("Current XP: " + cSlayerXP + " Target XP: " + tSlayerXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(42)
		Smithing_T = AddTextOption("Smithing: Level " + SmithingLVL, aVal)
		
		SetCursorPosition(43)
		SmithingXP_T = AddTextOption("Current XP: " + cSmithingXP + " Target XP: " + tSmithingXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(44)
		Strength_T = AddTextOption("Strength: Level " + StrengthLVL, aVal)
		
		SetCursorPosition(45)
		StrengthXP_T = AddTextOption("Current XP: " + cStrengthXP + " Target XP: " + tStrengthXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(46)
		Summoning_T = AddTextOption("Summoning: Level " + SummoningLVL, aVal)
		
		SetCursorPosition(47)
		SummoningXP_T = AddTextOption("Current XP: " + cSummoningXP + " Target XP: " + tSummoningXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(48)
		Thieving_T = AddTextOption("Thieving: Level " + ThievingLVL, aVal)
		
		SetCursorPosition(49)
		ThievingXP_T = AddTextOption("Current XP: " + cThievingXP + " Target XP: " + tThievingXP, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(50)
		Woodcutting_T = AddTextOption("Woodcutting: Level " + WoodcuttingLVL, aVal)
		
		SetCursorPosition(51)
		WoodcuttingXP_T = AddTextOption("Current XP: " + cWoodcuttingXP + " Target XP: " + tWoodcuttingXP, aVal)
		;=================================================================================================================================================================================================
	
	ElseIf (a_page == "Distractions and Diversions")
		SetCursorFillMode(LEFT_TO_RIGHT)
		
		;=================================================================================================================================================================================================
		SetCursorPosition(0)
		AddHeaderOption("2-Hour Distractions and Diversions")
		
		SetCursorPosition(1)
		AddHeaderOption("Time Remaining:")
		;=================================================================================================================================================================================================
		SetCursorPosition(2)
		dndBigChinchompa_oid = AddTextOption("Big Chinchompa", aVal)
		
		SetCursorPosition(3)
		timeBigChinchompa_oid = AddTextOption(stringTimeRemain_BigChinchompa, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(4)
		dndBork_oid = AddTextOption("Bork", aVal)
		
		SetCursorPosition(5)
		timeBork_oid = AddTextOption(stringTimeRemain_Bork, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(6)
		dndDemonFlashmobs_oid = AddTextOption("Demon Flashmobs", aVal)
		
		SetCursorPosition(7)
		timeDemonFlashmobs_oid = AddTextOption(stringTimeRemain_DemonFlashmobs, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(8)
		dndEvilTree_oid = AddTextOption("Evil Tree", aVal)
		
		SetCursorPosition(9)
		timeEvilTree_oid = AddTextOption(stringTimeRemain_EvilTree, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(10)
		dndFishFlingers_oid = AddTextOption("Fish Flingers", aVal)
		
		SetCursorPosition(11)
		timeFishFlingers_oid = AddTextOption(stringTimeRemain_FishFlingers, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(12)
		dndGoblinRaids_oid = AddTextOption("Goblin Raids", aVal)
		
		SetCursorPosition(13)
		timeGoblinRaids_oid = AddTextOption(stringTimeRemain_GoblinRaids, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(14)
		dndGuthixianCaches_oid = AddTextOption("Guthixian Caches", aVal)
		
		SetCursorPosition(15)
		timeGuthixianCaches_oid = AddTextOption(stringTimeRemain_GuthixianCaches, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(16)
		dndPhoenixLair_oid = AddTextOption("Phoenix Lair", aVal)
		
		SetCursorPosition(17)
		timePhoenixLair_oid = AddTextOption(stringTimeRemain_PhoenixLair, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(18)
		dndRuneGoldbergMachine_oid = AddTextOption("Rune Goldberg Machine", aVal)
		
		SetCursorPosition(19)
		timeRuneGoldbergMachine_oid = AddTextOption(stringTimeRemain_RuneGoldbergMachine, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(20)
		dndShootingStar_oid = AddTextOption("Shooting Star", aVal)
		
		SetCursorPosition(21)
		timeShootingStar_oid = AddTextOption(stringTimeRemain_ShootingStar, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(22)
		dndSinkholes_oid = AddTextOption("Sinkholes", aVal)
		
		SetCursorPosition(23)
		timeSinkholes_oid = AddTextOption(stringTimeRemain_Sinkholes, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(24)
		dndThePit_oid = AddTextOption("The Pit", aVal)
		
		SetCursorPosition(25)
		timeThePit_oid = AddTextOption(stringTimeRemain_ThePit, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(26)
		dndWildernessWarbands_oid = AddTextOption("Wilderness Warbands", aVal)
		
		SetCursorPosition(27)
		timeWildernessWarbands_oid = AddTextOption(stringTimeRemain_WildernessWarbands, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(30)
		AddHeaderOption("4-Hour Distractions and Diversions")
		
		SetCursorPosition(31)
		AddHeaderOption("Time Remaining:")
		;=================================================================================================================================================================================================
		SetCursorPosition(32)
		dndAgoroth_oid = AddTextOption("Agoroth", aVal)
		
		SetCursorPosition(33)
		timeAgoroth_oid = AddTextOption(stringTimeRemain_WildernessWarbands, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(34)
		dndCircus_oid = AddTextOption("Balthazar Beauregard's Big Top Bonanza", aVal)
		
		SetCursorPosition(35)
		timeCircus_oid = AddTextOption(stringTimeRemain_Circus, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(36)
		dndFamiliarisation_oid = AddTextOption("Familiarisation", aVal)
		
		SetCursorPosition(37)
		timeFamiliarisation_oid = AddTextOption(stringTimeRemain_Familiarisation, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(38)
		dndMemoryOfNomad_oid = AddTextOption("Memory Of Nomad", aVal)
		
		SetCursorPosition(39)
		timeMemoryOfNomad_oid = AddTextOption(stringTimeRemain_MemoryOfNomad, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(40)
		dndPenguinHideAndSeek_oid = AddTextOption("Penguin Hide-n-Seek", aVal)
		
		SetCursorPosition(41)
		timePenguinHideAndSeek_oid = AddTextOption(stringTimeRemain_PenguinHideAndSeek, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(42)
		dndRushOfBlood_oid = AddTextOption("Rush Of Blood", aVal)
		
		SetCursorPosition(43)
		timeRushOfBlood_oid = AddTextOption(stringTimeRemain_RushOfBlood, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(44)
		dndSkeletalHorror_oid = AddTextOption("Skeletal Horror", aVal)
		
		SetCursorPosition(45)
		timeSkeletalHorror_oid = AddTextOption(stringTimeRemain_SkeletalHorror, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(46)
		dndTearsOfGuthix_oid = AddTextOption("Tears Of Guthix", aVal)
		
		SetCursorPosition(47)
		timeTearsOfGuthix_oid = AddTextOption(stringTimeRemain_TearsOfGuthix, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(50)
		AddHeaderOption("6-Hour Distractions and Diversions")
		
		SetCursorPosition(51)
		AddHeaderOption("Time Remaining:")
		;=================================================================================================================================================================================================
		SetCursorPosition(52)
		dndGiantOyster_oid = AddTextOption("Giant Oyster", aVal)
		
		SetCursorPosition(53)
		timeGiantOyster_oid = AddTextOption(stringTimeRemain_GiantOyster, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(54)
		dndGodStatues_oid = AddTextOption("God Statues", aVal)
		
		SetCursorPosition(55)
		timeGodStatues_oid = AddTextOption(stringTimeRemain_GodStatues, aVal)
		;=================================================================================================================================================================================================
		SetCursorPosition(56)
		dndTrollInvasion_oid = AddTextOption("Troll Invasion", aVal)
		
		SetCursorPosition(57)
		timeTrollInvasion_oid = AddTextOption(stringTimeRemain_TrollInvasion, aVal)
		
	ElseIf (a_page == "Teleport")
		Float gvSkyrimHealth = RS_GV_SkyrimHealth.GetValue()
		Float gvSkyrimMagicka = RS_GV_SkyrimMagicka.GetValue()
		Float gvSkyrimMagickaRate = RS_GV_SkyrimMagickaRate.GetValue()
		Float gvSkyrimStamina = RS_GV_SkyrimStamina.GetValue()
		Float gvSkyrimStaminaRate = RS_GV_SkyrimStaminarate.GetValue()
		Float gvSkyrimSpeechcraft = RS_GV_SkyrimSpeechcraft.GetValue()
		Float gvSkyrimUnarmedDamage = RS_GV_SkyrimUnarmedDamage.GetValue()
		Float gvSkyrimCarryWeight = RS_GV_SkyrimCarryWeight.GetValue()
		
		Float gvRuneSkyHealth = RS_GV_RuneSkyHealth.GetValue()
		Float gvRuneSkyMagicka = RS_GV_RuneSkyMagicka.GetValue()
		Float gvRuneSkyMagickaRate = RS_GV_RuneSkyMagickaRate.GetValue()
		Float gvRuneSkyStamina = RS_GV_RuneSkyStamina.GetValue()
		Float gvRuneSkyStaminaRate = RS_GV_RuneSkyStaminarate.GetValue()
		Float gvRuneSkySpeechcraft = RS_GV_RuneSkySpeechcraft.GetValue()
		Float gvRuneSkyUnarmedDamage = RS_GV_RuneSkyUnarmedDamage.GetValue()
		Float gvRuneSkyCarryWeight = RS_GV_RuneSkyCarryWeight.GetValue()
				
		If (RS_Check_ModStatus.GetValue()) == 0;start mod
			if (rscc.Reset())
				Debug.Trace("rscc cell reset!")
			endif
			Game.GetPlayer().RestoreActorValue("health", 9999)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().RestoreActorValue("stamina", 9999)
			Float SkyrimHealth = Game.GetPlayer().GetAV("health") as Float
			Float SkyrimMagicka = Game.GetPlayer().GetAV("magicka") as Float
			Float SkyrimMagickaRate = Game.GetPlayer().GetAV("magickarate") as Float
			Float SkyrimStamina = Game.GetPlayer().GetAV("stamina") as Float
			Float SkyrimStaminaRate = Game.GetPlayer().GetAV("staminarate") as Float
			Float SkyrimUnarmedDamage = Game.GetPlayer().GetAV("Unarmeddamage") as Float
			Float SkyrimSpeechcraft = Game.GetPlayer().GetAV("Speechcraft") as Float
			Float SkyrimCarryWeight = Game.GetPlayer().GetAV("CarryWeight") as Float
			
			RS_GV_SkyrimHealth.SetValue(SkyrimHealth)
			RS_GV_SkyrimMagicka.SetValue(SkyrimMagicka)
			RS_GV_SkyrimMagickaRate.SetValue(SkyrimMagickaRate)
			RS_GV_SkyrimStamina.SetValue(SkyrimStamina)
			RS_GV_SkyrimStaminaRate.SetValue(SkyrimStaminaRate)
			RS_GV_SkyrimUnarmedDamage.SetValue(SkyrimUnarmedDamage)
			RS_GV_SkyrimSpeechcraft.SetValue(SkyrimSpeechcraft)
			RS_GV_SkyrimCarryWeight.SetValue(SkyrimCarryWeight)
						
			Game.GetPlayer().SetActorValue("health", 10)
			Game.GetPlayer().SetActorValue("magicka", 1)
			Game.GetPlayer().SetActorValue("magickarate", 0)
			Game.GetPlayer().SetActorValue("stamina", 500)
			Game.GetPlayer().SetActorValue("staminarate", 0.125)
			Game.GetPlayer().SetActorValue("Unarmeddamage", 1)
			Game.GetPlayer().SetActorValue("Speechcraft", 100)
			Game.GetPlayer().SetActorValue("CarryWeight", 40)
			Game.GetPlayer().GetActorBase().SetEssential()
			
			RS_Check_ModStatus.SetValue(1)
			SkyrimLocation.MoveTo(Game.GetPlayer())
			Game.GetPlayer().RemoveAllItems(akTransferTo = SkyrimPlayerStorage, abRemoveQuestItems = true); Move Skyrim items to temporary container.
			Game.GetPlayer().Additem(RS_Item_Armor_StartClothes)
			Game.GetPlayer().Additem(RS_Item_Armor_StartShoes)
			Game.GetPlayer().MoveTo(RuneSkyStartLocation)
			Utility.wait(0.25)
			Game.GetPlayer().EquipItem(RS_Item_Armor_StartClothes, False, True)
			Game.GetPlayer().EquipItem(RS_Item_Armor_StartShoes, False, True)
			RS_Inventory_Current.SetValue(2)
			
		ElseIf (RS_Check_ModStatus.GetValue()) == 1;exit mod
			if (rscc.Reset())
				Debug.Trace("rscc cell reset!")
			endif
			Game.GetPlayer().RestoreActorValue("health", 9999)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)			
			Game.GetPlayer().RestoreActorValue("stamina", 9999)
			Float RuneSkyHealth = Game.GetPlayer().GetAV("health") as Float
			Float RuneSkyMagicka = Game.GetPlayer().GetAV("magicka") as Float
			Float RuneSkyMagickaRate = Game.GetPlayer().GetAV("magickarate") as Float
			Float RuneSkyStamina = Game.GetPlayer().GetAV("stamina") as Float
			Float RuneSkyStaminaRate = Game.GetPlayer().GetAV("staminarate") as Float
			Float RuneSkySpeechcraft = Game.GetPlayer().GetAV("Speechcraft") as Float
			Float RuneSkyUnarmedDamage = Game.GetPlayer().GetAV("Unarmeddamage") as Float
			Float RuneSkyCarryWeight = Game.GetPlayer().GetAV("CarryWeight" as Float)
			
			RS_GV_RuneSkyHealth.SetValue(RuneSkyHealth)
			RS_GV_RuneSkyMagicka.SetValue(RuneSkyMagicka)
			RS_GV_RuneSkyMagickaRate.SetValue(RuneSkyMagickaRate)
			RS_GV_RuneSkyStamina.SetValue(RuneSkyStamina)
			RS_GV_RuneSkyStaminaRate.SetValue(RuneSkyStaminaRate)
			RS_GV_RuneSkySpeechcraft.SetValue(RuneSkySpeechcraft)
			RS_GV_RuneSkyUnarmedDamage.SetValue(RuneSkyUnarmedDamage)
			RS_GV_RuneSkyCarryWeight.SetValue(RuneSkyCarryWeight)
						
			Game.GetPlayer().SetActorValue("health", gvSkyrimHealth)
			Game.GetPlayer().SetActorValue("magicka", gvSkyrimMagicka)
			Game.GetPlayer().SetActorValue("magickarate", gvSkyrimMagickaRate)
			Game.GetPlayer().SetActorValue("stamina", gvSkyrimStamina)
			Game.GetPlayer().SetActorValue("staminarate", gvSkyrimStaminaRate)
			Game.GetPlayer().SetActorValue("Speechcraft", gvSkyrimSpeechcraft)
			Game.GetPlayer().SetActorValue("Unarmeddamage", gvSkyrimUnarmedDamage)
			Game.GetPlayer().SetActorValue("CarryWeight", gvSkyrimCarryWeight)
			Game.GetPlayer().GetActorBase().SetEssential(false)
			
			RS_Check_ModStatus.SetValue(2)
			RuneSkyLocation.MoveTo(Game.GetPlayer())
			Game.GetPlayer().RemoveAllItems(akTransferTo = RuneSkyPlayerStorage, abRemoveQuestItems = true); Move RuneSky items to temporary container.
			SkyrimPlayerStorage.RemoveAllItems(akTransferTo = Game.GetPlayer(), abRemoveQuestItems = true);Return Skyrim items
			Game.GetPlayer().MoveTo(SkyrimLocation)
			
		ElseIf (RS_Check_ModStatus.GetValue()) == 2;continue mod
			if (rscc.Reset())
				Debug.Trace("rscc cell reset!")
			endif
			Game.GetPlayer().RestoreActorValue("health", 9999)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().RestoreActorValue("stamina", 9999)
			Float SkyrimHealth = Game.GetPlayer().GetAV("health") as Float
			Float SkyrimMagicka = Game.GetPlayer().GetAV("magicka") as Float
			Float SkyrimMagickaRate = Game.GetPlayer().GetAV("magickarate") as Float
			Float SkyrimStamina = Game.GetPlayer().GetAV("stamina") as Float
			Float SkyrimStaminaRate = Game.GetPlayer().GetAV("staminarate") as Float
			Float SkyrimSpeechcraft = Game.GetPlayer().GetAV("Speechcraft") as Float
			Float SkyrimUnarmedDamage = Game.GetPlayer().GetAV("Unarmeddamage") as Float
			Float SkyrimCarryWeight = Game.GetPlayer().GetAV("CarryWeight") as Float
			
			RS_GV_SkyrimHealth.SetValue(gvSkyrimHealth)
			RS_GV_SkyrimMagicka.SetValue(gvSkyrimMagicka)
			RS_GV_SkyrimMagickaRate.SetValue(gvSkyrimMagickaRate)
			RS_GV_SkyrimStamina.SetValue(gvSkyrimStamina)
			RS_GV_SkyrimStaminaRate.SetValue(gvSkyrimStaminaRate)
			RS_GV_SkyrimSpeechcraft.SetValue(gvSkyrimSpeechcraft)
			RS_GV_SkyrimUnarmedDamage.SetValue(gvSkyrimUnarmedDamage)
			RS_GV_SkyrimCarryWeight.SetValue(gvSkyrimCarryWeight)
			
			Game.GetPlayer().SetActorValue("health", gvRuneSkyHealth)
			Game.GetPlayer().SetActorValue("magicka", gvRuneSkyMagicka)
			Game.GetPlayer().SetActorValue("magickarate", gvRuneSkyMagickaRate)
			Game.GetPlayer().SetActorValue("stamina", gvRuneSkyStamina)
			Game.GetPlayer().SetActorValue("staminarate", gvRuneSkyStaminaRate)
			Game.GetPlayer().SetActorValue("Speechcraft", gvRuneSkySpeechcraft)
			Game.GetPlayer().SetActorValue("Unarmeddamage", gvRuneSkyUnarmedDamage)
			Game.GetPlayer().SetActorValue("CarryWeight", gvRuneSkyCarryWeight)
			Game.GetPlayer().GetActorBase().SetEssential()
			
			RS_Check_ModStatus.SetValue(1)
			SkyrimLocation.MoveTo(Game.GetPlayer())
			Game.GetPlayer().RemoveAllItems(akTransferTo = SkyrimPlayerStorage, abRemoveQuestItems = true); Move Skyrim items to temporary container.
			RuneSkyPlayerStorage.RemoveAllItems(akTransferTo = Game.GetPlayer(), abRemoveQuestItems = true);Return RuneSky items
			Game.GetPlayer().MoveTo(RuneSkyLocation)
			
		EndIf
	ElseIf (a_page == "Settings")
		XPM = AddSliderOption("Experience Multipler", RS_GV_XPMultiplier.GetValueInt(), "{1}")
		Inventory = AddTextOption("Inventory Reset if bugged", aVal)
		InvCur = AddTextOption("Current Inventory -- " + RS_Inventory_Current.GetValue() + " / 28", aVal)
		InvMax = AddTextOption("If your inventory numbers do not match up, with the exclusion of stackable items, please reset.", aVal)
	EndIf
endEvent
;>

Event OnOptionSliderOpen(Int Slider)
	If Slider == XPM
		SetSliderDialogStartValue(RS_GV_XPMultiplier.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(1, 1000)
		SetSliderDialogInterval(5)
	EndIf
EndEvent

Event OnOptionSliderAccept(Int Slider, Float Value)
	If Slider == XPM
		RS_GV_XPMultiplier.SetValue(Value)
		SetSliderOptionValue(Slider, Value, "{0}")
	EndIf
EndEvent

;< EVENT - OnOptionHighlight()
event OnOptionHighlight(int option)
	if (option == Agility_T)
		SetInfoText("Agility Skill Not In This Beta")
	elseif (option == AgilityXP_T)
		SetInfoText((tAgilityXP - cAgilityXP) + " more Agility XP until next level!")
		
	elseif (option == Attack_T)
		SetInfoText("View 'Attack' Guide [Coming Soon!]")
	elseif (option == AttackXP_T)
		SetInfoText((tAttackXP - cAttackXP) + " more Attack XP until next level!")
		
	elseif (option == Construction_T)
		SetInfoText("Construction Skill Not In This Beta")
	elseif (option == ConstructionXP_T)
		SetInfoText((tConstructionXP - cConstructionXP) + " more Construction XP until next level!")
		
	elseif (option == Cooking_T)
		SetInfoText("View 'Cooking' Guide [Coming Soon!]")
	elseif (option == CookingXP_T)
		SetInfoText((tCookingXP - cCookingXP) + " more Cooking XP until next level!")
		
	elseif (option == Crafting_T)
		SetInfoText("View 'Crafting' Guide [Coming Soon!]")
	elseif (option == CraftingXP_T)
		SetInfoText((tCraftingXP - cCraftingXP) + " more Crafting XP until next level!")
		
	elseif (option == Defense_T)
		SetInfoText("View 'Defence' Guide [Coming Soon!]")
	elseif (option == DefenseXP_T)
		SetInfoText((tDefenseXP - cDefenseXP) + " more Defense XP until next level!")
		
	elseif (option == Dungeoneering_T)
		SetInfoText("Dungeoneering Skill Not In This Beta")
	elseif (option == DungeoneeringXP_T)
		SetInfoText((tDungeoneeringXP - cDungeoneeringXP) + " more Dungeoneering XP until next level!")
		
	elseif (option == Farming_T)
		SetInfoText("Farming Skill Not In This Beta")
	elseif (option == FarmingXP_T)
		SetInfoText((tFarmingXP - cFarmingXP) + " more Farming XP until next level!")
		
	elseif (option == Firemaking_T)
		SetInfoText("View 'Firemaking' Guide [Coming Soon!]")
	elseif (option == FiremakingXP_T)
		SetInfoText((tFiremakingXP - cFiremakingXP) + " more Firemaking XP until next level!")
		
	elseif (option == Fishing_T)
		SetInfoText("View 'Fishing' Guide [Coming Soon!]")
	elseif (option == FishingXP_T)
		SetInfoText((tFishingXP - cFishingXP) + " more Fishing XP until next level!")
		
	elseif (option == Fletching_T)
		SetInfoText("Fletching Skill Not In This Beta")
	elseif (option == FletchingXP_T)
		SetInfoText((tFletchingXP - cFletchingXP) + " more Fletching XP until next level!")
		
	elseif (option == Herblore_T)
		SetInfoText("Herblore Skill Not In This Beta")
	elseif (option == HerbloreXP_T)
		SetInfoText((tHerbloreXP - cHerbloreXP) + " more Herblore XP until next level!")
		
	elseif (option == Hitpoint_T)
		SetInfoText("View 'Hitpoint' Guide [Coming Soon!]")
	elseif (option == HitpointXP_T)
		SetInfoText((tHitpointXP - cHitpointXP) + " more Hitpoint XP until next level!")
		
	elseif (option == Hunter_T)
		SetInfoText("Hunter Skill Not In This Beta")
	elseif (option == HunterXP_T)
		SetInfoText((tHunterXP - cHunterXP) + " more Hunter XP until next level!")
		
	elseif (option == Magic_T)
		SetInfoText("Magic Skill Not In This Beta")
	elseif (option == MagicXP_T)
		SetInfoText((tMagicXP - cMagicXP) + " more Magic XP until next level!")
		
	elseif (option == Mining_T)
		SetInfoText("View 'Mining' Guide [Coming Soon!]")
	elseif (option == MiningXP_T)
		SetInfoText((tMiningXP - cMiningXP) + " more Mining XP until next level!")
		
	elseif (option == Prayer_T)
		SetInfoText("View 'Prayer' Guide [Coming Soon!]")
	elseif (option == PrayerXP_T)
		SetInfoText((tPrayerXP - cPrayerXP) + " more Prayer XP until next level!")
		
	elseif (option == Ranged_T)
		SetInfoText("Ranged Skill Not In This Beta")
	elseif (option == RangedXP_T)
		SetInfoText((tRangedXP - cRangedXP) + " more Ranged XP until next level!")
		
	elseif (option == Runecrafting_T)
		SetInfoText("Runecrafting Skill Not In This Beta")
	elseif (option == RunecraftingXP_T)
		SetInfoText((tRunecraftingXP - cRunecraftingXP) + " more Runecrafting XP until next level!")
		
	elseif (option == Slayer_T)
		SetInfoText("Slayer Skill Not In This Beta")
	elseif (option == SlayerXP_T)
		SetInfoText((tSlayerXP - cSlayerXP) + " more Slayer XP until next level!")
		
	elseif (option == Smithing_T)
		SetInfoText("View 'Smithing' Guide [Coming Soon!]")
	elseif (option == SmithingXP_T)
		SetInfoText((tSmithingXP - cSmithingXP) + " more Smithing XP until next level!")
		
	elseif (option == Strength_T)
		SetInfoText("View 'Strength' Guide [Coming Soon!]")
	elseif (option == StrengthXP_T)
		SetInfoText((tStrengthXP - cStrengthXP) + " more Strength XP until next level!")
		
	elseif (option == Summoning_T)
		SetInfoText("Summoning Skill Not In This Beta")
	elseif (option == SummoningXP_T)
		SetInfoText((tSummoningXP - cSummoningXP) + " more Summoning XP until next level!")
		
	elseif (option == Thieving_T)
		SetInfoText("Thieving Skill Not In This Beta")
	elseif (option == ThievingXP_T)
		SetInfoText((tThievingXP - cThievingXP) + " more Thieving XP until next level!")
		
	elseif (option == Woodcutting_T)
		SetInfoText("View 'Woodcutting' Guide [Coming Soon!]")
	elseif (option == WoodcuttingXP_T)
		SetInfoText((tWoodcuttingXP - cWoodcuttingXP) + " more Woodcutting XP until next level!")
	ElseIf (option == Inventory)
		SetInfoText("Resets your inventory counter. Only used if bugged! Will destroy all items in inventory!")
	else
	EndIf
endEvent
;>

;< EVENT - OnOptionSelect()
event OnOptionSelect(int option)
	if (option == Agility_T)
		SetCursorFillMode(LEFT_TO_RIGHT)
		AddToggleOption("A", true)
		AddToggleOption("B", true)
		AddToggleOption("C", true)
		AddToggleOption("D", true)
	elseif (option == Attack_T)
	
	elseif (option == Construction_T)
		
	elseif (option == Cooking_T)
		
	elseif (option == Crafting_T)
		
	elseif (option == Defense_T)
		
	elseif (option == Dungeoneering_T)
		
	elseif (option == Farming_T)
		
	elseif (option == Firemaking_T)
		
	elseif (option == Fishing_T)
		
	elseif (option == Fletching_T)
		
	elseif (option == Herblore_T)
		
	elseif (option == Hitpoint_T)
		
	elseif (option == Hunter_T)
		
	elseif (option == Magic_T)
		
	elseif (option == Mining_T)
		
	elseif (option == Prayer_T)
		
	elseif (option == Ranged_T)
		
	elseif (option == Runecrafting_T)
		
	elseif (option == Slayer_T)
		
	elseif (option == Smithing_T)
		
	elseif (option == Strength_T)
		
	elseif (option == Summoning_T)
		
	elseif (option == Thieving_T)
		
	elseif (option == Woodcutting_T)		
	
	elseif (option == Inventory)
		RS_Inventory_Current.SetValue(0)
		Game.GetPlayer().RemoveAllItems()
	
	EndIf
endEvent
;>

;< EVENT - OnKeyDown()
Event OnKeyDown(Int KeyCode)
	;Debug.MessageBox("A registered key has been pressed")
	If ((RS_Check_ModStatus.GetValue()) == 0) || ((RS_Check_ModStatus.GetValue()) == 2)
		;do nothing
	Else
		If KeyCode == 59
			UpdateCurrentInstanceGlobal(RS_GV_AttackStyle)
			if (RS_GV_AttackStyle.GetValue()) == 0;Accurate
				attackStyleString = "Accurate"
			elseif (RS_GV_AttackStyle.GetValue()) == 1;Agressive
				attackStyleString = "Agressive"
			elseif (RS_GV_AttackStyle.GetValue()) == 2;Defensive
				attackStyleString = "Defensive"
			elseif (RS_GV_AttackStyle.GetValue()) == 3;Controlled
				attackStyleString = "Controlled"
			Else
				Debug.MessageBox("Problem with setting attack style for display!")
			EndIf
			Debug.Notification("Current attack style: " + attackStyleString)
			int attackStyle = RS_Message_Combat_SelectAttackStyle.show()
			if attackStyle == 0;Accurate
				RS_GV_AttackStyle.SetValue(0)
				RS_GV_FightStyleAttackBoost.SetValue(3)
				RS_GV_FightStyleStrengthBoost.SetValue(0)
				RS_GV_FightStyleDefenceBoost.SetValue(0)
			elseif attackStyle == 1;Agressive
				RS_GV_AttackStyle.SetValue(1)
				RS_GV_FightStyleAttackBoost.SetValue(0)
				RS_GV_FightStyleStrengthBoost.SetValue(3)
				RS_GV_FightStyleDefenceBoost.SetValue(0)
			elseif attackStyle == 2;Defensive
				RS_GV_AttackStyle.SetValue(2)
				RS_GV_FightStyleAttackBoost.SetValue(0)
				RS_GV_FightStyleStrengthBoost.SetValue(0)
				RS_GV_FightStyleDefenceBoost.SetValue(3)
			elseif attackStyle == 3;Controlled
				RS_GV_AttackStyle.SetValue(3)
				RS_GV_FightStyleAttackBoost.SetValue(1)
				RS_GV_FightStyleStrengthBoost.SetValue(1)
				RS_GV_FightStyleDefenceBoost.SetValue(1)
			Else
			
			EndIf
		EndIf
	EndIf
EndEvent
;>

Function AttackInit()
	AttackLVL = RS_GV_AttackLVL.GetValue() as Int
	cAttackXP = RS_GV_AttackXP.GetValue() as Int
	If AttackLVL == 1
		tAttackXP = 83
	ElseIf AttackLVL == 2
		tAttackXP = 174
	ElseIf AttackLVL == 3
		tAttackXP = 276
	ElseIf AttackLVL == 4
		tAttackXP = 388
	ElseIf AttackLVL == 5
		tAttackXP = 512
	ElseIf AttackLVL == 6
		tAttackXP = 650
	ElseIf AttackLVL == 7
		tAttackXP = 801
	ElseIf AttackLVL == 8
		tAttackXP = 969
	ElseIf AttackLVL == 9
		tAttackXP = 1154
	ElseIf AttackLVL == 10
		tAttackXP = 1358
	ElseIf AttackLVL == 11
		tAttackXP = 1584
	ElseIf AttackLVL == 12
		tAttackXP = 1833
	ElseIf AttackLVL == 13
		tAttackXP = 2107
	ElseIf AttackLVL == 14
		tAttackXP = 2411
	ElseIf AttackLVL == 15
		tAttackXP = 2746
	ElseIf AttackLVL == 16
		tAttackXP = 3115
	ElseIf AttackLVL == 17
		tAttackXP = 3523
	ElseIf AttackLVL == 18
		tAttackXP = 3973
	ElseIf AttackLVL == 19
		tAttackXP = 4470
	ElseIf AttackLVL == 20
		tAttackXP = 5018
	ElseIf AttackLVL == 21
		tAttackXP = 5624
	ElseIf AttackLVL == 22
		tAttackXP = 6291
	ElseIf AttackLVL == 23
		tAttackXP = 7028
	ElseIf AttackLVL == 24
		tAttackXP = 7842
	ElseIf AttackLVL == 25
		tAttackXP = 8740
	ElseIf AttackLVL == 26
		tAttackXP = 9730
	ElseIf AttackLVL == 27
		tAttackXP = 10824
	ElseIf AttackLVL == 28
		tAttackXP = 12031
	ElseIf AttackLVL == 29
		tAttackXP = 13363
	ElseIf AttackLVL == 30
		tAttackXP = 14833
	ElseIf AttackLVL == 31
		tAttackXP = 16456
	ElseIf AttackLVL == 32
		tAttackXP = 18247
	ElseIf AttackLVL == 33
		tAttackXP = 20224
	ElseIf AttackLVL == 34
		tAttackXP = 22406
	ElseIf AttackLVL == 35
		tAttackXP = 24815
	ElseIf AttackLVL == 36
		tAttackXP = 27473
	ElseIf AttackLVL == 37
		tAttackXP = 30408
	ElseIf AttackLVL == 38
		tAttackXP = 33648
	ElseIf AttackLVL == 39
		tAttackXP = 37224
	ElseIf AttackLVL == 40
		tAttackXP = 41171
	ElseIf AttackLVL == 41
		tAttackXP = 45529
	ElseIf AttackLVL == 42
		tAttackXP = 50339
	ElseIf AttackLVL == 43
		tAttackXP = 55649
	ElseIf AttackLVL == 44
		tAttackXP = 61512
	ElseIf AttackLVL == 45
		tAttackXP = 67983
	ElseIf AttackLVL == 46
		tAttackXP = 75127
	ElseIf AttackLVL == 47
		tAttackXP = 83014
	ElseIf AttackLVL == 48
		tAttackXP = 91721
	ElseIf AttackLVL == 49
		tAttackXP = 101333
	ElseIf AttackLVL == 50
		tAttackXP = 111945
	ElseIf AttackLVL == 51
		tAttackXP = 123660
	ElseIf AttackLVL == 52
		tAttackXP = 136594
	ElseIf AttackLVL == 53
		tAttackXP = 150872
	ElseIf AttackLVL == 54
		tAttackXP = 166636
	ElseIf AttackLVL == 55
		tAttackXP = 184040
	ElseIf AttackLVL == 56
		tAttackXP = 203254
	ElseIf AttackLVL == 57
		tAttackXP = 224466
	ElseIf AttackLVL == 58
		tAttackXP = 247886
	ElseIf AttackLVL == 59
		tAttackXP = 273742
	ElseIf AttackLVL == 60
		tAttackXP = 302288
	ElseIf AttackLVL == 61
		tAttackXP = 333804
	ElseIf AttackLVL == 62
		tAttackXP = 368599
	ElseIf AttackLVL == 63
		tAttackXP = 407015
	ElseIf AttackLVL == 64
		tAttackXP = 449428
	ElseIf AttackLVL == 65
		tAttackXP = 496254
	ElseIf AttackLVL == 66
		tAttackXP = 547953
	ElseIf AttackLVL == 67
		tAttackXP = 605032
	ElseIf AttackLVL == 68
		tAttackXP = 668051
	ElseIf AttackLVL == 69
		tAttackXP = 737627
	ElseIf AttackLVL == 70
		tAttackXP = 814445
	ElseIf AttackLVL == 71
		tAttackXP = 899257
	ElseIf AttackLVL == 72
		tAttackXP = 992895
	ElseIf AttackLVL == 73
		tAttackXP = 1096278
	ElseIf AttackLVL == 74
		tAttackXP = 1210421
	ElseIf AttackLVL == 75
		tAttackXP = 1336443
	ElseIf AttackLVL == 75
		tAttackXP = 1336443
	ElseIf AttackLVL == 76
		tAttackXP = 1475581
	ElseIf AttackLVL == 77
		tAttackXP = 1629200
	ElseIf AttackLVL == 78
		tAttackXP = 1798808
	ElseIf AttackLVL == 79
		tAttackXP = 1986068
	ElseIf AttackLVL == 80
		tAttackXP = 2192818
	ElseIf AttackLVL == 81
		tAttackXP = 2421087
	ElseIf AttackLVL == 82
		tAttackXP = 2673114
	ElseIf AttackLVL == 83
		tAttackXP = 2951373
	ElseIf AttackLVL == 84
		tAttackXP = 3258594
	ElseIf AttackLVL == 85
		tAttackXP = 3597792
	ElseIf AttackLVL == 86
		tAttackXP = 3972294
	ElseIf AttackLVL == 87
		tAttackXP = 4385776
	ElseIf AttackLVL == 88
		tAttackXP = 4842295
	ElseIf AttackLVL == 89
		tAttackXP = 5346332
	ElseIf AttackLVL == 90
		tAttackXP = 5902831
	ElseIf AttackLVL == 91
		tAttackXP = 6517253
	ElseIf AttackLVL == 92
		tAttackXP = 7195629
	ElseIf AttackLVL == 93
		tAttackXP = 7944614
	ElseIf AttackLVL == 94
		tAttackXP = 8771558
	ElseIf AttackLVL == 95
		tAttackXP = 9684577
	ElseIf AttackLVL == 96
		tAttackXP = 10692629
	ElseIf AttackLVL == 97
		tAttackXP = 11805606
	ElseIf AttackLVL == 98
		tAttackXP = 13034431
	Else
		tAttackXP = 0
	EndIf
EndFunction

Function StrengthInit()
	StrengthLVL = RS_GV_StrengthLVL.GetValue() as Int
	cStrengthXP = RS_GV_StrengthXP.GetValue() as Int
	If StrengthLVL == 1
		tStrengthXP = 83
	ElseIf StrengthLVL == 2
		tStrengthXP = 174
	ElseIf StrengthLVL == 3
		tStrengthXP = 276
	ElseIf StrengthLVL == 4
		tStrengthXP = 388
	ElseIf StrengthLVL == 5
		tStrengthXP = 512
	ElseIf StrengthLVL == 6
		tStrengthXP = 650
	ElseIf StrengthLVL == 7
		tStrengthXP = 801
	ElseIf StrengthLVL == 8
		tStrengthXP = 969
	ElseIf StrengthLVL == 9
		tStrengthXP = 1154
	ElseIf StrengthLVL == 10
		tStrengthXP = 1358
	ElseIf StrengthLVL == 11
		tStrengthXP = 1584
	ElseIf StrengthLVL == 12
		tStrengthXP = 1833
	ElseIf StrengthLVL == 13
		tStrengthXP = 2107
	ElseIf StrengthLVL == 14
		tStrengthXP = 2411
	ElseIf StrengthLVL == 15
		tStrengthXP = 2746
	ElseIf StrengthLVL == 16
		tStrengthXP = 3115
	ElseIf StrengthLVL == 17
		tStrengthXP = 3523
	ElseIf StrengthLVL == 18
		tStrengthXP = 3973
	ElseIf StrengthLVL == 19
		tStrengthXP = 4470
	ElseIf StrengthLVL == 20
		tStrengthXP = 5018
	ElseIf StrengthLVL == 21
		tStrengthXP = 5624
	ElseIf StrengthLVL == 22
		tStrengthXP = 6291
	ElseIf StrengthLVL == 23
		tStrengthXP = 7028
	ElseIf StrengthLVL == 24
		tStrengthXP = 7842
	ElseIf StrengthLVL == 25
		tStrengthXP = 8740
	ElseIf StrengthLVL == 26
		tStrengthXP = 9730
	ElseIf StrengthLVL == 27
		tStrengthXP = 10824
	ElseIf StrengthLVL == 28
		tStrengthXP = 12031
	ElseIf StrengthLVL == 29
		tStrengthXP = 13363
	ElseIf StrengthLVL == 30
		tStrengthXP = 14833
	ElseIf StrengthLVL == 31
		tStrengthXP = 16456
	ElseIf StrengthLVL == 32
		tStrengthXP = 18247
	ElseIf StrengthLVL == 33
		tStrengthXP = 20224
	ElseIf StrengthLVL == 34
		tStrengthXP = 22406
	ElseIf StrengthLVL == 35
		tStrengthXP = 24815
	ElseIf StrengthLVL == 36
		tStrengthXP = 27473
	ElseIf StrengthLVL == 37
		tStrengthXP = 30408
	ElseIf StrengthLVL == 38
		tStrengthXP = 33648
	ElseIf StrengthLVL == 39
		tStrengthXP = 37224
	ElseIf StrengthLVL == 40
		tStrengthXP = 41171
	ElseIf StrengthLVL == 41
		tStrengthXP = 45529
	ElseIf StrengthLVL == 42
		tStrengthXP = 50339
	ElseIf StrengthLVL == 43
		tStrengthXP = 55649
	ElseIf StrengthLVL == 44
		tStrengthXP = 61512
	ElseIf StrengthLVL == 45
		tStrengthXP = 67983
	ElseIf StrengthLVL == 46
		tStrengthXP = 75127
	ElseIf StrengthLVL == 47
		tStrengthXP = 83014
	ElseIf StrengthLVL == 48
		tStrengthXP = 91721
	ElseIf StrengthLVL == 49
		tStrengthXP = 101333
	ElseIf StrengthLVL == 50
		tStrengthXP = 111945
	ElseIf StrengthLVL == 51
		tStrengthXP = 123660
	ElseIf StrengthLVL == 52
		tStrengthXP = 136594
	ElseIf StrengthLVL == 53
		tStrengthXP = 150872
	ElseIf StrengthLVL == 54
		tStrengthXP = 166636
	ElseIf StrengthLVL == 55
		tStrengthXP = 184040
	ElseIf StrengthLVL == 56
		tStrengthXP = 203254
	ElseIf StrengthLVL == 57
		tStrengthXP = 224466
	ElseIf StrengthLVL == 58
		tStrengthXP = 247886
	ElseIf StrengthLVL == 59
		tStrengthXP = 273742
	ElseIf StrengthLVL == 60
		tStrengthXP = 302288
	ElseIf StrengthLVL == 61
		tStrengthXP = 333804
	ElseIf StrengthLVL == 62
		tStrengthXP = 368599
	ElseIf StrengthLVL == 63
		tStrengthXP = 407015
	ElseIf StrengthLVL == 64
		tStrengthXP = 449428
	ElseIf StrengthLVL == 65
		tStrengthXP = 496254
	ElseIf StrengthLVL == 66
		tStrengthXP = 547953
	ElseIf StrengthLVL == 67
		tStrengthXP = 605032
	ElseIf StrengthLVL == 68
		tStrengthXP = 668051
	ElseIf StrengthLVL == 69
		tStrengthXP = 737627
	ElseIf StrengthLVL == 70
		tStrengthXP = 814445
	ElseIf StrengthLVL == 71
		tStrengthXP = 899257
	ElseIf StrengthLVL == 72
		tStrengthXP = 992895
	ElseIf StrengthLVL == 73
		tStrengthXP = 1096278
	ElseIf StrengthLVL == 74
		tStrengthXP = 1210421
	ElseIf StrengthLVL == 75
		tStrengthXP = 1336443
	ElseIf StrengthLVL == 75
		tStrengthXP = 1336443
	ElseIf StrengthLVL == 76
		tStrengthXP = 1475581
	ElseIf StrengthLVL == 77
		tStrengthXP = 1629200
	ElseIf StrengthLVL == 78
		tStrengthXP = 1798808
	ElseIf StrengthLVL == 79
		tStrengthXP = 1986068
	ElseIf StrengthLVL == 80
		tStrengthXP = 2192818
	ElseIf StrengthLVL == 81
		tStrengthXP = 2421087
	ElseIf StrengthLVL == 82
		tStrengthXP = 2673114
	ElseIf StrengthLVL == 83
		tStrengthXP = 2951373
	ElseIf StrengthLVL == 84
		tStrengthXP = 3258594
	ElseIf StrengthLVL == 85
		tStrengthXP = 3597792
	ElseIf StrengthLVL == 86
		tStrengthXP = 3972294
	ElseIf StrengthLVL == 87
		tStrengthXP = 4385776
	ElseIf StrengthLVL == 88
		tStrengthXP = 4842295
	ElseIf StrengthLVL == 89
		tStrengthXP = 5346332
	ElseIf StrengthLVL == 90
		tStrengthXP = 5902831
	ElseIf StrengthLVL == 91
		tStrengthXP = 6517253
	ElseIf StrengthLVL == 92
		tStrengthXP = 7195629
	ElseIf StrengthLVL == 93
		tStrengthXP = 7944614
	ElseIf StrengthLVL == 94
		tStrengthXP = 8771558
	ElseIf StrengthLVL == 95
		tStrengthXP = 9684577
	ElseIf StrengthLVL == 96
		tStrengthXP = 10692629
	ElseIf StrengthLVL == 97
		tStrengthXP = 11805606
	ElseIf StrengthLVL == 98
		tStrengthXP = 13034431
	Else
		tStrengthXP = 0
	EndIf
EndFunction

Function DefenseInit()
	DefenseLVL = RS_GV_DefenseLVL.GetValue() as Int
	cDefenseXP = RS_GV_DefenseXP.GetValue() as Int
	If DefenseLVL == 1
		tDefenseXP = 83
	ElseIf DefenseLVL == 2
		tDefenseXP = 174
	ElseIf DefenseLVL == 3
		tDefenseXP = 276
	ElseIf DefenseLVL == 4
		tDefenseXP = 388
	ElseIf DefenseLVL == 5
		tDefenseXP = 512
	ElseIf DefenseLVL == 6
		tDefenseXP = 650
	ElseIf DefenseLVL == 7
		tDefenseXP = 801
	ElseIf DefenseLVL == 8
		tDefenseXP = 969
	ElseIf DefenseLVL == 9
		tDefenseXP = 1154
	ElseIf DefenseLVL == 10
		tDefenseXP = 1358
	ElseIf DefenseLVL == 11
		tDefenseXP = 1584
	ElseIf DefenseLVL == 12
		tDefenseXP = 1833
	ElseIf DefenseLVL == 13
		tDefenseXP = 2107
	ElseIf DefenseLVL == 14
		tDefenseXP = 2411
	ElseIf DefenseLVL == 15
		tDefenseXP = 2746
	ElseIf DefenseLVL == 16
		tDefenseXP = 3115
	ElseIf DefenseLVL == 17
		tDefenseXP = 3523
	ElseIf DefenseLVL == 18
		tDefenseXP = 3973
	ElseIf DefenseLVL == 19
		tDefenseXP = 4470
	ElseIf DefenseLVL == 20
		tDefenseXP = 5018
	ElseIf DefenseLVL == 21
		tDefenseXP = 5624
	ElseIf DefenseLVL == 22
		tDefenseXP = 6291
	ElseIf DefenseLVL == 23
		tDefenseXP = 7028
	ElseIf DefenseLVL == 24
		tDefenseXP = 7842
	ElseIf DefenseLVL == 25
		tDefenseXP = 8740
	ElseIf DefenseLVL == 26
		tDefenseXP = 9730
	ElseIf DefenseLVL == 27
		tDefenseXP = 10824
	ElseIf DefenseLVL == 28
		tDefenseXP = 12031
	ElseIf DefenseLVL == 29
		tDefenseXP = 13363
	ElseIf DefenseLVL == 30
		tDefenseXP = 14833
	ElseIf DefenseLVL == 31
		tDefenseXP = 16456
	ElseIf DefenseLVL == 32
		tDefenseXP = 18247
	ElseIf DefenseLVL == 33
		tDefenseXP = 20224
	ElseIf DefenseLVL == 34
		tDefenseXP = 22406
	ElseIf DefenseLVL == 35
		tDefenseXP = 24815
	ElseIf DefenseLVL == 36
		tDefenseXP = 27473
	ElseIf DefenseLVL == 37
		tDefenseXP = 30408
	ElseIf DefenseLVL == 38
		tDefenseXP = 33648
	ElseIf DefenseLVL == 39
		tDefenseXP = 37224
	ElseIf DefenseLVL == 40
		tDefenseXP = 41171
	ElseIf DefenseLVL == 41
		tDefenseXP = 45529
	ElseIf DefenseLVL == 42
		tDefenseXP = 50339
	ElseIf DefenseLVL == 43
		tDefenseXP = 55649
	ElseIf DefenseLVL == 44
		tDefenseXP = 61512
	ElseIf DefenseLVL == 45
		tDefenseXP = 67983
	ElseIf DefenseLVL == 46
		tDefenseXP = 75127
	ElseIf DefenseLVL == 47
		tDefenseXP = 83014
	ElseIf DefenseLVL == 48
		tDefenseXP = 91721
	ElseIf DefenseLVL == 49
		tDefenseXP = 101333
	ElseIf DefenseLVL == 50
		tDefenseXP = 111945
	ElseIf DefenseLVL == 51
		tDefenseXP = 123660
	ElseIf DefenseLVL == 52
		tDefenseXP = 136594
	ElseIf DefenseLVL == 53
		tDefenseXP = 150872
	ElseIf DefenseLVL == 54
		tDefenseXP = 166636
	ElseIf DefenseLVL == 55
		tDefenseXP = 184040
	ElseIf DefenseLVL == 56
		tDefenseXP = 203254
	ElseIf DefenseLVL == 57
		tDefenseXP = 224466
	ElseIf DefenseLVL == 58
		tDefenseXP = 247886
	ElseIf DefenseLVL == 59
		tDefenseXP = 273742
	ElseIf DefenseLVL == 60
		tDefenseXP = 302288
	ElseIf DefenseLVL == 61
		tDefenseXP = 333804
	ElseIf DefenseLVL == 62
		tDefenseXP = 368599
	ElseIf DefenseLVL == 63
		tDefenseXP = 407015
	ElseIf DefenseLVL == 64
		tDefenseXP = 449428
	ElseIf DefenseLVL == 65
		tDefenseXP = 496254
	ElseIf DefenseLVL == 66
		tDefenseXP = 547953
	ElseIf DefenseLVL == 67
		tDefenseXP = 605032
	ElseIf DefenseLVL == 68
		tDefenseXP = 668051
	ElseIf DefenseLVL == 69
		tDefenseXP = 737627
	ElseIf DefenseLVL == 70
		tDefenseXP = 814445
	ElseIf DefenseLVL == 71
		tDefenseXP = 899257
	ElseIf DefenseLVL == 72
		tDefenseXP = 992895
	ElseIf DefenseLVL == 73
		tDefenseXP = 1096278
	ElseIf DefenseLVL == 74
		tDefenseXP = 1210421
	ElseIf DefenseLVL == 75
		tDefenseXP = 1336443
	ElseIf DefenseLVL == 75
		tDefenseXP = 1336443
	ElseIf DefenseLVL == 76
		tDefenseXP = 1475581
	ElseIf DefenseLVL == 77
		tDefenseXP = 1629200
	ElseIf DefenseLVL == 78
		tDefenseXP = 1798808
	ElseIf DefenseLVL == 79
		tDefenseXP = 1986068
	ElseIf DefenseLVL == 80
		tDefenseXP = 2192818
	ElseIf DefenseLVL == 81
		tDefenseXP = 2421087
	ElseIf DefenseLVL == 82
		tDefenseXP = 2673114
	ElseIf DefenseLVL == 83
		tDefenseXP = 2951373
	ElseIf DefenseLVL == 84
		tDefenseXP = 3258594
	ElseIf DefenseLVL == 85
		tDefenseXP = 3597792
	ElseIf DefenseLVL == 86
		tDefenseXP = 3972294
	ElseIf DefenseLVL == 87
		tDefenseXP = 4385776
	ElseIf DefenseLVL == 88
		tDefenseXP = 4842295
	ElseIf DefenseLVL == 89
		tDefenseXP = 5346332
	ElseIf DefenseLVL == 90
		tDefenseXP = 5902831
	ElseIf DefenseLVL == 91
		tDefenseXP = 6517253
	ElseIf DefenseLVL == 92
		tDefenseXP = 7195629
	ElseIf DefenseLVL == 93
		tDefenseXP = 7944614
	ElseIf DefenseLVL == 94
		tDefenseXP = 8771558
	ElseIf DefenseLVL == 95
		tDefenseXP = 9684577
	ElseIf DefenseLVL == 96
		tDefenseXP = 10692629
	ElseIf DefenseLVL == 97
		tDefenseXP = 11805606
	ElseIf DefenseLVL == 98
		tDefenseXP = 13034431
	Else
		tDefenseXP = 0
	EndIf
EndFunction

Function RangedInit()
	RangedLVL = RS_GV_RangedLVL.GetValue() as Int
	cRangedXP = RS_GV_RangedXP.GetValue() as Int
	If RangedLVL == 1
		tRangedXP = 83
	ElseIf RangedLVL == 2
		tRangedXP = 174
	ElseIf RangedLVL == 3
		tRangedXP = 276
	ElseIf RangedLVL == 4
		tRangedXP = 388
	ElseIf RangedLVL == 5
		tRangedXP = 512
	ElseIf RangedLVL == 6
		tRangedXP = 650
	ElseIf RangedLVL == 7
		tRangedXP = 801
	ElseIf RangedLVL == 8
		tRangedXP = 969
	ElseIf RangedLVL == 9
		tRangedXP = 1154
	ElseIf RangedLVL == 10
		tRangedXP = 1358
	ElseIf RangedLVL == 11
		tRangedXP = 1584
	ElseIf RangedLVL == 12
		tRangedXP = 1833
	ElseIf RangedLVL == 13
		tRangedXP = 2107
	ElseIf RangedLVL == 14
		tRangedXP = 2411
	ElseIf RangedLVL == 15
		tRangedXP = 2746
	ElseIf RangedLVL == 16
		tRangedXP = 3115
	ElseIf RangedLVL == 17
		tRangedXP = 3523
	ElseIf RangedLVL == 18
		tRangedXP = 3973
	ElseIf RangedLVL == 19
		tRangedXP = 4470
	ElseIf RangedLVL == 20
		tRangedXP = 5018
	ElseIf RangedLVL == 21
		tRangedXP = 5624
	ElseIf RangedLVL == 22
		tRangedXP = 6291
	ElseIf RangedLVL == 23
		tRangedXP = 7028
	ElseIf RangedLVL == 24
		tRangedXP = 7842
	ElseIf RangedLVL == 25
		tRangedXP = 8740
	ElseIf RangedLVL == 26
		tRangedXP = 9730
	ElseIf RangedLVL == 27
		tRangedXP = 10824
	ElseIf RangedLVL == 28
		tRangedXP = 12031
	ElseIf RangedLVL == 29
		tRangedXP = 13363
	ElseIf RangedLVL == 30
		tRangedXP = 14833
	ElseIf RangedLVL == 31
		tRangedXP = 16456
	ElseIf RangedLVL == 32
		tRangedXP = 18247
	ElseIf RangedLVL == 33
		tRangedXP = 20224
	ElseIf RangedLVL == 34
		tRangedXP = 22406
	ElseIf RangedLVL == 35
		tRangedXP = 24815
	ElseIf RangedLVL == 36
		tRangedXP = 27473
	ElseIf RangedLVL == 37
		tRangedXP = 30408
	ElseIf RangedLVL == 38
		tRangedXP = 33648
	ElseIf RangedLVL == 39
		tRangedXP = 37224
	ElseIf RangedLVL == 40
		tRangedXP = 41171
	ElseIf RangedLVL == 41
		tRangedXP = 45529
	ElseIf RangedLVL == 42
		tRangedXP = 50339
	ElseIf RangedLVL == 43
		tRangedXP = 55649
	ElseIf RangedLVL == 44
		tRangedXP = 61512
	ElseIf RangedLVL == 45
		tRangedXP = 67983
	ElseIf RangedLVL == 46
		tRangedXP = 75127
	ElseIf RangedLVL == 47
		tRangedXP = 83014
	ElseIf RangedLVL == 48
		tRangedXP = 91721
	ElseIf RangedLVL == 49
		tRangedXP = 101333
	ElseIf RangedLVL == 50
		tRangedXP = 111945
	ElseIf RangedLVL == 51
		tRangedXP = 123660
	ElseIf RangedLVL == 52
		tRangedXP = 136594
	ElseIf RangedLVL == 53
		tRangedXP = 150872
	ElseIf RangedLVL == 54
		tRangedXP = 166636
	ElseIf RangedLVL == 55
		tRangedXP = 184040
	ElseIf RangedLVL == 56
		tRangedXP = 203254
	ElseIf RangedLVL == 57
		tRangedXP = 224466
	ElseIf RangedLVL == 58
		tRangedXP = 247886
	ElseIf RangedLVL == 59
		tRangedXP = 273742
	ElseIf RangedLVL == 60
		tRangedXP = 302288
	ElseIf RangedLVL == 61
		tRangedXP = 333804
	ElseIf RangedLVL == 62
		tRangedXP = 368599
	ElseIf RangedLVL == 63
		tRangedXP = 407015
	ElseIf RangedLVL == 64
		tRangedXP = 449428
	ElseIf RangedLVL == 65
		tRangedXP = 496254
	ElseIf RangedLVL == 66
		tRangedXP = 547953
	ElseIf RangedLVL == 67
		tRangedXP = 605032
	ElseIf RangedLVL == 68
		tRangedXP = 668051
	ElseIf RangedLVL == 69
		tRangedXP = 737627
	ElseIf RangedLVL == 70
		tRangedXP = 814445
	ElseIf RangedLVL == 71
		tRangedXP = 899257
	ElseIf RangedLVL == 72
		tRangedXP = 992895
	ElseIf RangedLVL == 73
		tRangedXP = 1096278
	ElseIf RangedLVL == 74
		tRangedXP = 1210421
	ElseIf RangedLVL == 75
		tRangedXP = 1336443
	ElseIf RangedLVL == 75
		tRangedXP = 1336443
	ElseIf RangedLVL == 76
		tRangedXP = 1475581
	ElseIf RangedLVL == 77
		tRangedXP = 1629200
	ElseIf RangedLVL == 78
		tRangedXP = 1798808
	ElseIf RangedLVL == 79
		tRangedXP = 1986068
	ElseIf RangedLVL == 80
		tRangedXP = 2192818
	ElseIf RangedLVL == 81
		tRangedXP = 2421087
	ElseIf RangedLVL == 82
		tRangedXP = 2673114
	ElseIf RangedLVL == 83
		tRangedXP = 2951373
	ElseIf RangedLVL == 84
		tRangedXP = 3258594
	ElseIf RangedLVL == 85
		tRangedXP = 3597792
	ElseIf RangedLVL == 86
		tRangedXP = 3972294
	ElseIf RangedLVL == 87
		tRangedXP = 4385776
	ElseIf RangedLVL == 88
		tRangedXP = 4842295
	ElseIf RangedLVL == 89
		tRangedXP = 5346332
	ElseIf RangedLVL == 90
		tRangedXP = 5902831
	ElseIf RangedLVL == 91
		tRangedXP = 6517253
	ElseIf RangedLVL == 92
		tRangedXP = 7195629
	ElseIf RangedLVL == 93
		tRangedXP = 7944614
	ElseIf RangedLVL == 94
		tRangedXP = 8771558
	ElseIf RangedLVL == 95
		tRangedXP = 9684577
	ElseIf RangedLVL == 96
		tRangedXP = 10692629
	ElseIf RangedLVL == 97
		tRangedXP = 11805606
	ElseIf RangedLVL == 98
		tRangedXP = 13034431
	Else
		tRangedXP = 0
	EndIf
EndFunction

Function PrayerInit()
	PrayerLVL = RS_GV_PrayerLVL.GetValue() as Int
	cPrayerXP = RS_GV_PrayerXP.GetValue() as Int
	If PrayerLVL == 1
		tPrayerXP = 83
	ElseIf PrayerLVL == 2
		tPrayerXP = 174
	ElseIf PrayerLVL == 3
		tPrayerXP = 276
	ElseIf PrayerLVL == 4
		tPrayerXP = 388
	ElseIf PrayerLVL == 5
		tPrayerXP = 512
	ElseIf PrayerLVL == 6
		tPrayerXP = 650
	ElseIf PrayerLVL == 7
		tPrayerXP = 801
	ElseIf PrayerLVL == 8
		tPrayerXP = 969
	ElseIf PrayerLVL == 9
		tPrayerXP = 1154
	ElseIf PrayerLVL == 10
		tPrayerXP = 1358
	ElseIf PrayerLVL == 11
		tPrayerXP = 1584
	ElseIf PrayerLVL == 12
		tPrayerXP = 1833
	ElseIf PrayerLVL == 13
		tPrayerXP = 2107
	ElseIf PrayerLVL == 14
		tPrayerXP = 2411
	ElseIf PrayerLVL == 15
		tPrayerXP = 2746
	ElseIf PrayerLVL == 16
		tPrayerXP = 3115
	ElseIf PrayerLVL == 17
		tPrayerXP = 3523
	ElseIf PrayerLVL == 18
		tPrayerXP = 3973
	ElseIf PrayerLVL == 19
		tPrayerXP = 4470
	ElseIf PrayerLVL == 20
		tPrayerXP = 5018
	ElseIf PrayerLVL == 21
		tPrayerXP = 5624
	ElseIf PrayerLVL == 22
		tPrayerXP = 6291
	ElseIf PrayerLVL == 23
		tPrayerXP = 7028
	ElseIf PrayerLVL == 24
		tPrayerXP = 7842
	ElseIf PrayerLVL == 25
		tPrayerXP = 8740
	ElseIf PrayerLVL == 26
		tPrayerXP = 9730
	ElseIf PrayerLVL == 27
		tPrayerXP = 10824
	ElseIf PrayerLVL == 28
		tPrayerXP = 12031
	ElseIf PrayerLVL == 29
		tPrayerXP = 13363
	ElseIf PrayerLVL == 30
		tPrayerXP = 14833
	ElseIf PrayerLVL == 31
		tPrayerXP = 16456
	ElseIf PrayerLVL == 32
		tPrayerXP = 18247
	ElseIf PrayerLVL == 33
		tPrayerXP = 20224
	ElseIf PrayerLVL == 34
		tPrayerXP = 22406
	ElseIf PrayerLVL == 35
		tPrayerXP = 24815
	ElseIf PrayerLVL == 36
		tPrayerXP = 27473
	ElseIf PrayerLVL == 37
		tPrayerXP = 30408
	ElseIf PrayerLVL == 38
		tPrayerXP = 33648
	ElseIf PrayerLVL == 39
		tPrayerXP = 37224
	ElseIf PrayerLVL == 40
		tPrayerXP = 41171
	ElseIf PrayerLVL == 41
		tPrayerXP = 45529
	ElseIf PrayerLVL == 42
		tPrayerXP = 50339
	ElseIf PrayerLVL == 43
		tPrayerXP = 55649
	ElseIf PrayerLVL == 44
		tPrayerXP = 61512
	ElseIf PrayerLVL == 45
		tPrayerXP = 67983
	ElseIf PrayerLVL == 46
		tPrayerXP = 75127
	ElseIf PrayerLVL == 47
		tPrayerXP = 83014
	ElseIf PrayerLVL == 48
		tPrayerXP = 91721
	ElseIf PrayerLVL == 49
		tPrayerXP = 101333
	ElseIf PrayerLVL == 50
		tPrayerXP = 111945
	ElseIf PrayerLVL == 51
		tPrayerXP = 123660
	ElseIf PrayerLVL == 52
		tPrayerXP = 136594
	ElseIf PrayerLVL == 53
		tPrayerXP = 150872
	ElseIf PrayerLVL == 54
		tPrayerXP = 166636
	ElseIf PrayerLVL == 55
		tPrayerXP = 184040
	ElseIf PrayerLVL == 56
		tPrayerXP = 203254
	ElseIf PrayerLVL == 57
		tPrayerXP = 224466
	ElseIf PrayerLVL == 58
		tPrayerXP = 247886
	ElseIf PrayerLVL == 59
		tPrayerXP = 273742
	ElseIf PrayerLVL == 60
		tPrayerXP = 302288
	ElseIf PrayerLVL == 61
		tPrayerXP = 333804
	ElseIf PrayerLVL == 62
		tPrayerXP = 368599
	ElseIf PrayerLVL == 63
		tPrayerXP = 407015
	ElseIf PrayerLVL == 64
		tPrayerXP = 449428
	ElseIf PrayerLVL == 65
		tPrayerXP = 496254
	ElseIf PrayerLVL == 66
		tPrayerXP = 547953
	ElseIf PrayerLVL == 67
		tPrayerXP = 605032
	ElseIf PrayerLVL == 68
		tPrayerXP = 668051
	ElseIf PrayerLVL == 69
		tPrayerXP = 737627
	ElseIf PrayerLVL == 70
		tPrayerXP = 814445
	ElseIf PrayerLVL == 71
		tPrayerXP = 899257
	ElseIf PrayerLVL == 72
		tPrayerXP = 992895
	ElseIf PrayerLVL == 73
		tPrayerXP = 1096278
	ElseIf PrayerLVL == 74
		tPrayerXP = 1210421
	ElseIf PrayerLVL == 75
		tPrayerXP = 1336443
	ElseIf PrayerLVL == 75
		tPrayerXP = 1336443
	ElseIf PrayerLVL == 76
		tPrayerXP = 1475581
	ElseIf PrayerLVL == 77
		tPrayerXP = 1629200
	ElseIf PrayerLVL == 78
		tPrayerXP = 1798808
	ElseIf PrayerLVL == 79
		tPrayerXP = 1986068
	ElseIf PrayerLVL == 80
		tPrayerXP = 2192818
	ElseIf PrayerLVL == 81
		tPrayerXP = 2421087
	ElseIf PrayerLVL == 82
		tPrayerXP = 2673114
	ElseIf PrayerLVL == 83
		tPrayerXP = 2951373
	ElseIf PrayerLVL == 84
		tPrayerXP = 3258594
	ElseIf PrayerLVL == 85
		tPrayerXP = 3597792
	ElseIf PrayerLVL == 86
		tPrayerXP = 3972294
	ElseIf PrayerLVL == 87
		tPrayerXP = 4385776
	ElseIf PrayerLVL == 88
		tPrayerXP = 4842295
	ElseIf PrayerLVL == 89
		tPrayerXP = 5346332
	ElseIf PrayerLVL == 90
		tPrayerXP = 5902831
	ElseIf PrayerLVL == 91
		tPrayerXP = 6517253
	ElseIf PrayerLVL == 92
		tPrayerXP = 7195629
	ElseIf PrayerLVL == 93
		tPrayerXP = 7944614
	ElseIf PrayerLVL == 94
		tPrayerXP = 8771558
	ElseIf PrayerLVL == 95
		tPrayerXP = 9684577
	ElseIf PrayerLVL == 96
		tPrayerXP = 10692629
	ElseIf PrayerLVL == 97
		tPrayerXP = 11805606
	ElseIf PrayerLVL == 98
		tPrayerXP = 13034431
	Else
		tPrayerXP = 0
	EndIf
EndFunction

Function MagicInit()
	MagicLVL = RS_GV_MagicLVL.GetValue() as Int
	cMagicXP = RS_GV_MagicXP.GetValue() as Int
	If MagicLVL == 1
		tMagicXP = 83
	ElseIf MagicLVL == 2
		tMagicXP = 174
	ElseIf MagicLVL == 3
		tMagicXP = 276
	ElseIf MagicLVL == 4
		tMagicXP = 388
	ElseIf MagicLVL == 5
		tMagicXP = 512
	ElseIf MagicLVL == 6
		tMagicXP = 650
	ElseIf MagicLVL == 7
		tMagicXP = 801
	ElseIf MagicLVL == 8
		tMagicXP = 969
	ElseIf MagicLVL == 9
		tMagicXP = 1154
	ElseIf MagicLVL == 10
		tMagicXP = 1358
	ElseIf MagicLVL == 11
		tMagicXP = 1584
	ElseIf MagicLVL == 12
		tMagicXP = 1833
	ElseIf MagicLVL == 13
		tMagicXP = 2107
	ElseIf MagicLVL == 14
		tMagicXP = 2411
	ElseIf MagicLVL == 15
		tMagicXP = 2746
	ElseIf MagicLVL == 16
		tMagicXP = 3115
	ElseIf MagicLVL == 17
		tMagicXP = 3523
	ElseIf MagicLVL == 18
		tMagicXP = 3973
	ElseIf MagicLVL == 19
		tMagicXP = 4470
	ElseIf MagicLVL == 20
		tMagicXP = 5018
	ElseIf MagicLVL == 21
		tMagicXP = 5624
	ElseIf MagicLVL == 22
		tMagicXP = 6291
	ElseIf MagicLVL == 23
		tMagicXP = 7028
	ElseIf MagicLVL == 24
		tMagicXP = 7842
	ElseIf MagicLVL == 25
		tMagicXP = 8740
	ElseIf MagicLVL == 26
		tMagicXP = 9730
	ElseIf MagicLVL == 27
		tMagicXP = 10824
	ElseIf MagicLVL == 28
		tMagicXP = 12031
	ElseIf MagicLVL == 29
		tMagicXP = 13363
	ElseIf MagicLVL == 30
		tMagicXP = 14833
	ElseIf MagicLVL == 31
		tMagicXP = 16456
	ElseIf MagicLVL == 32
		tMagicXP = 18247
	ElseIf MagicLVL == 33
		tMagicXP = 20224
	ElseIf MagicLVL == 34
		tMagicXP = 22406
	ElseIf MagicLVL == 35
		tMagicXP = 24815
	ElseIf MagicLVL == 36
		tMagicXP = 27473
	ElseIf MagicLVL == 37
		tMagicXP = 30408
	ElseIf MagicLVL == 38
		tMagicXP = 33648
	ElseIf MagicLVL == 39
		tMagicXP = 37224
	ElseIf MagicLVL == 40
		tMagicXP = 41171
	ElseIf MagicLVL == 41
		tMagicXP = 45529
	ElseIf MagicLVL == 42
		tMagicXP = 50339
	ElseIf MagicLVL == 43
		tMagicXP = 55649
	ElseIf MagicLVL == 44
		tMagicXP = 61512
	ElseIf MagicLVL == 45
		tMagicXP = 67983
	ElseIf MagicLVL == 46
		tMagicXP = 75127
	ElseIf MagicLVL == 47
		tMagicXP = 83014
	ElseIf MagicLVL == 48
		tMagicXP = 91721
	ElseIf MagicLVL == 49
		tMagicXP = 101333
	ElseIf MagicLVL == 50
		tMagicXP = 111945
	ElseIf MagicLVL == 51
		tMagicXP = 123660
	ElseIf MagicLVL == 52
		tMagicXP = 136594
	ElseIf MagicLVL == 53
		tMagicXP = 150872
	ElseIf MagicLVL == 54
		tMagicXP = 166636
	ElseIf MagicLVL == 55
		tMagicXP = 184040
	ElseIf MagicLVL == 56
		tMagicXP = 203254
	ElseIf MagicLVL == 57
		tMagicXP = 224466
	ElseIf MagicLVL == 58
		tMagicXP = 247886
	ElseIf MagicLVL == 59
		tMagicXP = 273742
	ElseIf MagicLVL == 60
		tMagicXP = 302288
	ElseIf MagicLVL == 61
		tMagicXP = 333804
	ElseIf MagicLVL == 62
		tMagicXP = 368599
	ElseIf MagicLVL == 63
		tMagicXP = 407015
	ElseIf MagicLVL == 64
		tMagicXP = 449428
	ElseIf MagicLVL == 65
		tMagicXP = 496254
	ElseIf MagicLVL == 66
		tMagicXP = 547953
	ElseIf MagicLVL == 67
		tMagicXP = 605032
	ElseIf MagicLVL == 68
		tMagicXP = 668051
	ElseIf MagicLVL == 69
		tMagicXP = 737627
	ElseIf MagicLVL == 70
		tMagicXP = 814445
	ElseIf MagicLVL == 71
		tMagicXP = 899257
	ElseIf MagicLVL == 72
		tMagicXP = 992895
	ElseIf MagicLVL == 73
		tMagicXP = 1096278
	ElseIf MagicLVL == 74
		tMagicXP = 1210421
	ElseIf MagicLVL == 75
		tMagicXP = 1336443
	ElseIf MagicLVL == 75
		tMagicXP = 1336443
	ElseIf MagicLVL == 76
		tMagicXP = 1475581
	ElseIf MagicLVL == 77
		tMagicXP = 1629200
	ElseIf MagicLVL == 78
		tMagicXP = 1798808
	ElseIf MagicLVL == 79
		tMagicXP = 1986068
	ElseIf MagicLVL == 80
		tMagicXP = 2192818
	ElseIf MagicLVL == 81
		tMagicXP = 2421087
	ElseIf MagicLVL == 82
		tMagicXP = 2673114
	ElseIf MagicLVL == 83
		tMagicXP = 2951373
	ElseIf MagicLVL == 84
		tMagicXP = 3258594
	ElseIf MagicLVL == 85
		tMagicXP = 3597792
	ElseIf MagicLVL == 86
		tMagicXP = 3972294
	ElseIf MagicLVL == 87
		tMagicXP = 4385776
	ElseIf MagicLVL == 88
		tMagicXP = 4842295
	ElseIf MagicLVL == 89
		tMagicXP = 5346332
	ElseIf MagicLVL == 90
		tMagicXP = 5902831
	ElseIf MagicLVL == 91
		tMagicXP = 6517253
	ElseIf MagicLVL == 92
		tMagicXP = 7195629
	ElseIf MagicLVL == 93
		tMagicXP = 7944614
	ElseIf MagicLVL == 94
		tMagicXP = 8771558
	ElseIf MagicLVL == 95
		tMagicXP = 9684577
	ElseIf MagicLVL == 96
		tMagicXP = 10692629
	ElseIf MagicLVL == 97
		tMagicXP = 11805606
	ElseIf MagicLVL == 98
		tMagicXP = 13034431
	Else
		tMagicXP = 0
	EndIf
EndFunction

Function RunecraftingInit()
	RunecraftingLVL = RS_GV_RunecraftingLVL.GetValue() as Int
	cRunecraftingXP = RS_GV_RunecraftingXP.GetValue() as Int
	If RunecraftingLVL == 1
		tRunecraftingXP = 83
	ElseIf RunecraftingLVL == 2
		tRunecraftingXP = 174
	ElseIf RunecraftingLVL == 3
		tRunecraftingXP = 276
	ElseIf RunecraftingLVL == 4
		tRunecraftingXP = 388
	ElseIf RunecraftingLVL == 5
		tRunecraftingXP = 512
	ElseIf RunecraftingLVL == 6
		tRunecraftingXP = 650
	ElseIf RunecraftingLVL == 7
		tRunecraftingXP = 801
	ElseIf RunecraftingLVL == 8
		tRunecraftingXP = 969
	ElseIf RunecraftingLVL == 9
		tRunecraftingXP = 1154
	ElseIf RunecraftingLVL == 10
		tRunecraftingXP = 1358
	ElseIf RunecraftingLVL == 11
		tRunecraftingXP = 1584
	ElseIf RunecraftingLVL == 12
		tRunecraftingXP = 1833
	ElseIf RunecraftingLVL == 13
		tRunecraftingXP = 2107
	ElseIf RunecraftingLVL == 14
		tRunecraftingXP = 2411
	ElseIf RunecraftingLVL == 15
		tRunecraftingXP = 2746
	ElseIf RunecraftingLVL == 16
		tRunecraftingXP = 3115
	ElseIf RunecraftingLVL == 17
		tRunecraftingXP = 3523
	ElseIf RunecraftingLVL == 18
		tRunecraftingXP = 3973
	ElseIf RunecraftingLVL == 19
		tRunecraftingXP = 4470
	ElseIf RunecraftingLVL == 20
		tRunecraftingXP = 5018
	ElseIf RunecraftingLVL == 21
		tRunecraftingXP = 5624
	ElseIf RunecraftingLVL == 22
		tRunecraftingXP = 6291
	ElseIf RunecraftingLVL == 23
		tRunecraftingXP = 7028
	ElseIf RunecraftingLVL == 24
		tRunecraftingXP = 7842
	ElseIf RunecraftingLVL == 25
		tRunecraftingXP = 8740
	ElseIf RunecraftingLVL == 26
		tRunecraftingXP = 9730
	ElseIf RunecraftingLVL == 27
		tRunecraftingXP = 10824
	ElseIf RunecraftingLVL == 28
		tRunecraftingXP = 12031
	ElseIf RunecraftingLVL == 29
		tRunecraftingXP = 13363
	ElseIf RunecraftingLVL == 30
		tRunecraftingXP = 14833
	ElseIf RunecraftingLVL == 31
		tRunecraftingXP = 16456
	ElseIf RunecraftingLVL == 32
		tRunecraftingXP = 18247
	ElseIf RunecraftingLVL == 33
		tRunecraftingXP = 20224
	ElseIf RunecraftingLVL == 34
		tRunecraftingXP = 22406
	ElseIf RunecraftingLVL == 35
		tRunecraftingXP = 24815
	ElseIf RunecraftingLVL == 36
		tRunecraftingXP = 27473
	ElseIf RunecraftingLVL == 37
		tRunecraftingXP = 30408
	ElseIf RunecraftingLVL == 38
		tRunecraftingXP = 33648
	ElseIf RunecraftingLVL == 39
		tRunecraftingXP = 37224
	ElseIf RunecraftingLVL == 40
		tRunecraftingXP = 41171
	ElseIf RunecraftingLVL == 41
		tRunecraftingXP = 45529
	ElseIf RunecraftingLVL == 42
		tRunecraftingXP = 50339
	ElseIf RunecraftingLVL == 43
		tRunecraftingXP = 55649
	ElseIf RunecraftingLVL == 44
		tRunecraftingXP = 61512
	ElseIf RunecraftingLVL == 45
		tRunecraftingXP = 67983
	ElseIf RunecraftingLVL == 46
		tRunecraftingXP = 75127
	ElseIf RunecraftingLVL == 47
		tRunecraftingXP = 83014
	ElseIf RunecraftingLVL == 48
		tRunecraftingXP = 91721
	ElseIf RunecraftingLVL == 49
		tRunecraftingXP = 101333
	ElseIf RunecraftingLVL == 50
		tRunecraftingXP = 111945
	ElseIf RunecraftingLVL == 51
		tRunecraftingXP = 123660
	ElseIf RunecraftingLVL == 52
		tRunecraftingXP = 136594
	ElseIf RunecraftingLVL == 53
		tRunecraftingXP = 150872
	ElseIf RunecraftingLVL == 54
		tRunecraftingXP = 166636
	ElseIf RunecraftingLVL == 55
		tRunecraftingXP = 184040
	ElseIf RunecraftingLVL == 56
		tRunecraftingXP = 203254
	ElseIf RunecraftingLVL == 57
		tRunecraftingXP = 224466
	ElseIf RunecraftingLVL == 58
		tRunecraftingXP = 247886
	ElseIf RunecraftingLVL == 59
		tRunecraftingXP = 273742
	ElseIf RunecraftingLVL == 60
		tRunecraftingXP = 302288
	ElseIf RunecraftingLVL == 61
		tRunecraftingXP = 333804
	ElseIf RunecraftingLVL == 62
		tRunecraftingXP = 368599
	ElseIf RunecraftingLVL == 63
		tRunecraftingXP = 407015
	ElseIf RunecraftingLVL == 64
		tRunecraftingXP = 449428
	ElseIf RunecraftingLVL == 65
		tRunecraftingXP = 496254
	ElseIf RunecraftingLVL == 66
		tRunecraftingXP = 547953
	ElseIf RunecraftingLVL == 67
		tRunecraftingXP = 605032
	ElseIf RunecraftingLVL == 68
		tRunecraftingXP = 668051
	ElseIf RunecraftingLVL == 69
		tRunecraftingXP = 737627
	ElseIf RunecraftingLVL == 70
		tRunecraftingXP = 814445
	ElseIf RunecraftingLVL == 71
		tRunecraftingXP = 899257
	ElseIf RunecraftingLVL == 72
		tRunecraftingXP = 992895
	ElseIf RunecraftingLVL == 73
		tRunecraftingXP = 1096278
	ElseIf RunecraftingLVL == 74
		tRunecraftingXP = 1210421
	ElseIf RunecraftingLVL == 75
		tRunecraftingXP = 1336443
	ElseIf RunecraftingLVL == 75
		tRunecraftingXP = 1336443
	ElseIf RunecraftingLVL == 76
		tRunecraftingXP = 1475581
	ElseIf RunecraftingLVL == 77
		tRunecraftingXP = 1629200
	ElseIf RunecraftingLVL == 78
		tRunecraftingXP = 1798808
	ElseIf RunecraftingLVL == 79
		tRunecraftingXP = 1986068
	ElseIf RunecraftingLVL == 80
		tRunecraftingXP = 2192818
	ElseIf RunecraftingLVL == 81
		tRunecraftingXP = 2421087
	ElseIf RunecraftingLVL == 82
		tRunecraftingXP = 2673114
	ElseIf RunecraftingLVL == 83
		tRunecraftingXP = 2951373
	ElseIf RunecraftingLVL == 84
		tRunecraftingXP = 3258594
	ElseIf RunecraftingLVL == 85
		tRunecraftingXP = 3597792
	ElseIf RunecraftingLVL == 86
		tRunecraftingXP = 3972294
	ElseIf RunecraftingLVL == 87
		tRunecraftingXP = 4385776
	ElseIf RunecraftingLVL == 88
		tRunecraftingXP = 4842295
	ElseIf RunecraftingLVL == 89
		tRunecraftingXP = 5346332
	ElseIf RunecraftingLVL == 90
		tRunecraftingXP = 5902831
	ElseIf RunecraftingLVL == 91
		tRunecraftingXP = 6517253
	ElseIf RunecraftingLVL == 92
		tRunecraftingXP = 7195629
	ElseIf RunecraftingLVL == 93
		tRunecraftingXP = 7944614
	ElseIf RunecraftingLVL == 94
		tRunecraftingXP = 8771558
	ElseIf RunecraftingLVL == 95
		tRunecraftingXP = 9684577
	ElseIf RunecraftingLVL == 96
		tRunecraftingXP = 10692629
	ElseIf RunecraftingLVL == 97
		tRunecraftingXP = 11805606
	ElseIf RunecraftingLVL == 98
		tRunecraftingXP = 13034431
	Else
		tRunecraftingXP = 0
	EndIf
EndFunction

Function ConstructionInit()
	ConstructionLVL = RS_GV_ConstructionLVL.GetValue() as Int
	cConstructionXP = RS_GV_ConstructionXP.GetValue() as Int
	If ConstructionLVL == 1
		tConstructionXP = 83
	ElseIf ConstructionLVL == 2
		tConstructionXP = 174
	ElseIf ConstructionLVL == 3
		tConstructionXP = 276
	ElseIf ConstructionLVL == 4
		tConstructionXP = 388
	ElseIf ConstructionLVL == 5
		tConstructionXP = 512
	ElseIf ConstructionLVL == 6
		tConstructionXP = 650
	ElseIf ConstructionLVL == 7
		tConstructionXP = 801
	ElseIf ConstructionLVL == 8
		tConstructionXP = 969
	ElseIf ConstructionLVL == 9
		tConstructionXP = 1154
	ElseIf ConstructionLVL == 10
		tConstructionXP = 1358
	ElseIf ConstructionLVL == 11
		tConstructionXP = 1584
	ElseIf ConstructionLVL == 12
		tConstructionXP = 1833
	ElseIf ConstructionLVL == 13
		tConstructionXP = 2107
	ElseIf ConstructionLVL == 14
		tConstructionXP = 2411
	ElseIf ConstructionLVL == 15
		tConstructionXP = 2746
	ElseIf ConstructionLVL == 16
		tConstructionXP = 3115
	ElseIf ConstructionLVL == 17
		tConstructionXP = 3523
	ElseIf ConstructionLVL == 18
		tConstructionXP = 3973
	ElseIf ConstructionLVL == 19
		tConstructionXP = 4470
	ElseIf ConstructionLVL == 20
		tConstructionXP = 5018
	ElseIf ConstructionLVL == 21
		tConstructionXP = 5624
	ElseIf ConstructionLVL == 22
		tConstructionXP = 6291
	ElseIf ConstructionLVL == 23
		tConstructionXP = 7028
	ElseIf ConstructionLVL == 24
		tConstructionXP = 7842
	ElseIf ConstructionLVL == 25
		tConstructionXP = 8740
	ElseIf ConstructionLVL == 26
		tConstructionXP = 9730
	ElseIf ConstructionLVL == 27
		tConstructionXP = 10824
	ElseIf ConstructionLVL == 28
		tConstructionXP = 12031
	ElseIf ConstructionLVL == 29
		tConstructionXP = 13363
	ElseIf ConstructionLVL == 30
		tConstructionXP = 14833
	ElseIf ConstructionLVL == 31
		tConstructionXP = 16456
	ElseIf ConstructionLVL == 32
		tConstructionXP = 18247
	ElseIf ConstructionLVL == 33
		tConstructionXP = 20224
	ElseIf ConstructionLVL == 34
		tConstructionXP = 22406
	ElseIf ConstructionLVL == 35
		tConstructionXP = 24815
	ElseIf ConstructionLVL == 36
		tConstructionXP = 27473
	ElseIf ConstructionLVL == 37
		tConstructionXP = 30408
	ElseIf ConstructionLVL == 38
		tConstructionXP = 33648
	ElseIf ConstructionLVL == 39
		tConstructionXP = 37224
	ElseIf ConstructionLVL == 40
		tConstructionXP = 41171
	ElseIf ConstructionLVL == 41
		tConstructionXP = 45529
	ElseIf ConstructionLVL == 42
		tConstructionXP = 50339
	ElseIf ConstructionLVL == 43
		tConstructionXP = 55649
	ElseIf ConstructionLVL == 44
		tConstructionXP = 61512
	ElseIf ConstructionLVL == 45
		tConstructionXP = 67983
	ElseIf ConstructionLVL == 46
		tConstructionXP = 75127
	ElseIf ConstructionLVL == 47
		tConstructionXP = 83014
	ElseIf ConstructionLVL == 48
		tConstructionXP = 91721
	ElseIf ConstructionLVL == 49
		tConstructionXP = 101333
	ElseIf ConstructionLVL == 50
		tConstructionXP = 111945
	ElseIf ConstructionLVL == 51
		tConstructionXP = 123660
	ElseIf ConstructionLVL == 52
		tConstructionXP = 136594
	ElseIf ConstructionLVL == 53
		tConstructionXP = 150872
	ElseIf ConstructionLVL == 54
		tConstructionXP = 166636
	ElseIf ConstructionLVL == 55
		tConstructionXP = 184040
	ElseIf ConstructionLVL == 56
		tConstructionXP = 203254
	ElseIf ConstructionLVL == 57
		tConstructionXP = 224466
	ElseIf ConstructionLVL == 58
		tConstructionXP = 247886
	ElseIf ConstructionLVL == 59
		tConstructionXP = 273742
	ElseIf ConstructionLVL == 60
		tConstructionXP = 302288
	ElseIf ConstructionLVL == 61
		tConstructionXP = 333804
	ElseIf ConstructionLVL == 62
		tConstructionXP = 368599
	ElseIf ConstructionLVL == 63
		tConstructionXP = 407015
	ElseIf ConstructionLVL == 64
		tConstructionXP = 449428
	ElseIf ConstructionLVL == 65
		tConstructionXP = 496254
	ElseIf ConstructionLVL == 66
		tConstructionXP = 547953
	ElseIf ConstructionLVL == 67
		tConstructionXP = 605032
	ElseIf ConstructionLVL == 68
		tConstructionXP = 668051
	ElseIf ConstructionLVL == 69
		tConstructionXP = 737627
	ElseIf ConstructionLVL == 70
		tConstructionXP = 814445
	ElseIf ConstructionLVL == 71
		tConstructionXP = 899257
	ElseIf ConstructionLVL == 72
		tConstructionXP = 992895
	ElseIf ConstructionLVL == 73
		tConstructionXP = 1096278
	ElseIf ConstructionLVL == 74
		tConstructionXP = 1210421
	ElseIf ConstructionLVL == 75
		tConstructionXP = 1336443
	ElseIf ConstructionLVL == 75
		tConstructionXP = 1336443
	ElseIf ConstructionLVL == 76
		tConstructionXP = 1475581
	ElseIf ConstructionLVL == 77
		tConstructionXP = 1629200
	ElseIf ConstructionLVL == 78
		tConstructionXP = 1798808
	ElseIf ConstructionLVL == 79
		tConstructionXP = 1986068
	ElseIf ConstructionLVL == 80
		tConstructionXP = 2192818
	ElseIf ConstructionLVL == 81
		tConstructionXP = 2421087
	ElseIf ConstructionLVL == 82
		tConstructionXP = 2673114
	ElseIf ConstructionLVL == 83
		tConstructionXP = 2951373
	ElseIf ConstructionLVL == 84
		tConstructionXP = 3258594
	ElseIf ConstructionLVL == 85
		tConstructionXP = 3597792
	ElseIf ConstructionLVL == 86
		tConstructionXP = 3972294
	ElseIf ConstructionLVL == 87
		tConstructionXP = 4385776
	ElseIf ConstructionLVL == 88
		tConstructionXP = 4842295
	ElseIf ConstructionLVL == 89
		tConstructionXP = 5346332
	ElseIf ConstructionLVL == 90
		tConstructionXP = 5902831
	ElseIf ConstructionLVL == 91
		tConstructionXP = 6517253
	ElseIf ConstructionLVL == 92
		tConstructionXP = 7195629
	ElseIf ConstructionLVL == 93
		tConstructionXP = 7944614
	ElseIf ConstructionLVL == 94
		tConstructionXP = 8771558
	ElseIf ConstructionLVL == 95
		tConstructionXP = 9684577
	ElseIf ConstructionLVL == 96
		tConstructionXP = 10692629
	ElseIf ConstructionLVL == 97
		tConstructionXP = 11805606
	ElseIf ConstructionLVL == 98
		tConstructionXP = 13034431
	Else
		tConstructionXP = 0
	EndIf
EndFunction

Function HitpointInit()
	HitpointLVL = RS_GV_HitpointLVL.GetValue() as Int
	cHitpointXP = RS_GV_HitpointXP.GetValue() as Int
	If HitpointLVL == 1
		tHitpointXP = 83
	ElseIf HitpointLVL == 2
		tHitpointXP = 174
	ElseIf HitpointLVL == 3
		tHitpointXP = 276
	ElseIf HitpointLVL == 4
		tHitpointXP = 388
	ElseIf HitpointLVL == 5
		tHitpointXP = 512
	ElseIf HitpointLVL == 6
		tHitpointXP = 650
	ElseIf HitpointLVL == 7
		tHitpointXP = 801
	ElseIf HitpointLVL == 8
		tHitpointXP = 969
	ElseIf HitpointLVL == 9
		tHitpointXP = 1154
	ElseIf HitpointLVL == 10
		tHitpointXP = 1358
	ElseIf HitpointLVL == 11
		tHitpointXP = 1584
	ElseIf HitpointLVL == 12
		tHitpointXP = 1833
	ElseIf HitpointLVL == 13
		tHitpointXP = 2107
	ElseIf HitpointLVL == 14
		tHitpointXP = 2411
	ElseIf HitpointLVL == 15
		tHitpointXP = 2746
	ElseIf HitpointLVL == 16
		tHitpointXP = 3115
	ElseIf HitpointLVL == 17
		tHitpointXP = 3523
	ElseIf HitpointLVL == 18
		tHitpointXP = 3973
	ElseIf HitpointLVL == 19
		tHitpointXP = 4470
	ElseIf HitpointLVL == 20
		tHitpointXP = 5018
	ElseIf HitpointLVL == 21
		tHitpointXP = 5624
	ElseIf HitpointLVL == 22
		tHitpointXP = 6291
	ElseIf HitpointLVL == 23
		tHitpointXP = 7028
	ElseIf HitpointLVL == 24
		tHitpointXP = 7842
	ElseIf HitpointLVL == 25
		tHitpointXP = 8740
	ElseIf HitpointLVL == 26
		tHitpointXP = 9730
	ElseIf HitpointLVL == 27
		tHitpointXP = 10824
	ElseIf HitpointLVL == 28
		tHitpointXP = 12031
	ElseIf HitpointLVL == 29
		tHitpointXP = 13363
	ElseIf HitpointLVL == 30
		tHitpointXP = 14833
	ElseIf HitpointLVL == 31
		tHitpointXP = 16456
	ElseIf HitpointLVL == 32
		tHitpointXP = 18247
	ElseIf HitpointLVL == 33
		tHitpointXP = 20224
	ElseIf HitpointLVL == 34
		tHitpointXP = 22406
	ElseIf HitpointLVL == 35
		tHitpointXP = 24815
	ElseIf HitpointLVL == 36
		tHitpointXP = 27473
	ElseIf HitpointLVL == 37
		tHitpointXP = 30408
	ElseIf HitpointLVL == 38
		tHitpointXP = 33648
	ElseIf HitpointLVL == 39
		tHitpointXP = 37224
	ElseIf HitpointLVL == 40
		tHitpointXP = 41171
	ElseIf HitpointLVL == 41
		tHitpointXP = 45529
	ElseIf HitpointLVL == 42
		tHitpointXP = 50339
	ElseIf HitpointLVL == 43
		tHitpointXP = 55649
	ElseIf HitpointLVL == 44
		tHitpointXP = 61512
	ElseIf HitpointLVL == 45
		tHitpointXP = 67983
	ElseIf HitpointLVL == 46
		tHitpointXP = 75127
	ElseIf HitpointLVL == 47
		tHitpointXP = 83014
	ElseIf HitpointLVL == 48
		tHitpointXP = 91721
	ElseIf HitpointLVL == 49
		tHitpointXP = 101333
	ElseIf HitpointLVL == 50
		tHitpointXP = 111945
	ElseIf HitpointLVL == 51
		tHitpointXP = 123660
	ElseIf HitpointLVL == 52
		tHitpointXP = 136594
	ElseIf HitpointLVL == 53
		tHitpointXP = 150872
	ElseIf HitpointLVL == 54
		tHitpointXP = 166636
	ElseIf HitpointLVL == 55
		tHitpointXP = 184040
	ElseIf HitpointLVL == 56
		tHitpointXP = 203254
	ElseIf HitpointLVL == 57
		tHitpointXP = 224466
	ElseIf HitpointLVL == 58
		tHitpointXP = 247886
	ElseIf HitpointLVL == 59
		tHitpointXP = 273742
	ElseIf HitpointLVL == 60
		tHitpointXP = 302288
	ElseIf HitpointLVL == 61
		tHitpointXP = 333804
	ElseIf HitpointLVL == 62
		tHitpointXP = 368599
	ElseIf HitpointLVL == 63
		tHitpointXP = 407015
	ElseIf HitpointLVL == 64
		tHitpointXP = 449428
	ElseIf HitpointLVL == 65
		tHitpointXP = 496254
	ElseIf HitpointLVL == 66
		tHitpointXP = 547953
	ElseIf HitpointLVL == 67
		tHitpointXP = 605032
	ElseIf HitpointLVL == 68
		tHitpointXP = 668051
	ElseIf HitpointLVL == 69
		tHitpointXP = 737627
	ElseIf HitpointLVL == 70
		tHitpointXP = 814445
	ElseIf HitpointLVL == 71
		tHitpointXP = 899257
	ElseIf HitpointLVL == 72
		tHitpointXP = 992895
	ElseIf HitpointLVL == 73
		tHitpointXP = 1096278
	ElseIf HitpointLVL == 74
		tHitpointXP = 1210421
	ElseIf HitpointLVL == 75
		tHitpointXP = 1336443
	ElseIf HitpointLVL == 75
		tHitpointXP = 1336443
	ElseIf HitpointLVL == 76
		tHitpointXP = 1475581
	ElseIf HitpointLVL == 77
		tHitpointXP = 1629200
	ElseIf HitpointLVL == 78
		tHitpointXP = 1798808
	ElseIf HitpointLVL == 79
		tHitpointXP = 1986068
	ElseIf HitpointLVL == 80
		tHitpointXP = 2192818
	ElseIf HitpointLVL == 81
		tHitpointXP = 2421087
	ElseIf HitpointLVL == 82
		tHitpointXP = 2673114
	ElseIf HitpointLVL == 83
		tHitpointXP = 2951373
	ElseIf HitpointLVL == 84
		tHitpointXP = 3258594
	ElseIf HitpointLVL == 85
		tHitpointXP = 3597792
	ElseIf HitpointLVL == 86
		tHitpointXP = 3972294
	ElseIf HitpointLVL == 87
		tHitpointXP = 4385776
	ElseIf HitpointLVL == 88
		tHitpointXP = 4842295
	ElseIf HitpointLVL == 89
		tHitpointXP = 5346332
	ElseIf HitpointLVL == 90
		tHitpointXP = 5902831
	ElseIf HitpointLVL == 91
		tHitpointXP = 6517253
	ElseIf HitpointLVL == 92
		tHitpointXP = 7195629
	ElseIf HitpointLVL == 93
		tHitpointXP = 7944614
	ElseIf HitpointLVL == 94
		tHitpointXP = 8771558
	ElseIf HitpointLVL == 95
		tHitpointXP = 9684577
	ElseIf HitpointLVL == 96
		tHitpointXP = 10692629
	ElseIf HitpointLVL == 97
		tHitpointXP = 11805606
	ElseIf HitpointLVL == 98
		tHitpointXP = 13034431
	Else
		tHitpointXP = 0
	EndIf
EndFunction

Function AgilityInit()
	AgilityLVL = RS_GV_AgilityLVL.GetValue() as Int
	cAgilityXP = RS_GV_AgilityXP.GetValue() as Int
	If AgilityLVL == 1
		tAgilityXP = 83
	ElseIf AgilityLVL == 2
		tAgilityXP = 174
	ElseIf AgilityLVL == 3
		tAgilityXP = 276
	ElseIf AgilityLVL == 4
		tAgilityXP = 388
	ElseIf AgilityLVL == 5
		tAgilityXP = 512
	ElseIf AgilityLVL == 6
		tAgilityXP = 650
	ElseIf AgilityLVL == 7
		tAgilityXP = 801
	ElseIf AgilityLVL == 8
		tAgilityXP = 969
	ElseIf AgilityLVL == 9
		tAgilityXP = 1154
	ElseIf AgilityLVL == 10
		tAgilityXP = 1358
	ElseIf AgilityLVL == 11
		tAgilityXP = 1584
	ElseIf AgilityLVL == 12
		tAgilityXP = 1833
	ElseIf AgilityLVL == 13
		tAgilityXP = 2107
	ElseIf AgilityLVL == 14
		tAgilityXP = 2411
	ElseIf AgilityLVL == 15
		tAgilityXP = 2746
	ElseIf AgilityLVL == 16
		tAgilityXP = 3115
	ElseIf AgilityLVL == 17
		tAgilityXP = 3523
	ElseIf AgilityLVL == 18
		tAgilityXP = 3973
	ElseIf AgilityLVL == 19
		tAgilityXP = 4470
	ElseIf AgilityLVL == 20
		tAgilityXP = 5018
	ElseIf AgilityLVL == 21
		tAgilityXP = 5624
	ElseIf AgilityLVL == 22
		tAgilityXP = 6291
	ElseIf AgilityLVL == 23
		tAgilityXP = 7028
	ElseIf AgilityLVL == 24
		tAgilityXP = 7842
	ElseIf AgilityLVL == 25
		tAgilityXP = 8740
	ElseIf AgilityLVL == 26
		tAgilityXP = 9730
	ElseIf AgilityLVL == 27
		tAgilityXP = 10824
	ElseIf AgilityLVL == 28
		tAgilityXP = 12031
	ElseIf AgilityLVL == 29
		tAgilityXP = 13363
	ElseIf AgilityLVL == 30
		tAgilityXP = 14833
	ElseIf AgilityLVL == 31
		tAgilityXP = 16456
	ElseIf AgilityLVL == 32
		tAgilityXP = 18247
	ElseIf AgilityLVL == 33
		tAgilityXP = 20224
	ElseIf AgilityLVL == 34
		tAgilityXP = 22406
	ElseIf AgilityLVL == 35
		tAgilityXP = 24815
	ElseIf AgilityLVL == 36
		tAgilityXP = 27473
	ElseIf AgilityLVL == 37
		tAgilityXP = 30408
	ElseIf AgilityLVL == 38
		tAgilityXP = 33648
	ElseIf AgilityLVL == 39
		tAgilityXP = 37224
	ElseIf AgilityLVL == 40
		tAgilityXP = 41171
	ElseIf AgilityLVL == 41
		tAgilityXP = 45529
	ElseIf AgilityLVL == 42
		tAgilityXP = 50339
	ElseIf AgilityLVL == 43
		tAgilityXP = 55649
	ElseIf AgilityLVL == 44
		tAgilityXP = 61512
	ElseIf AgilityLVL == 45
		tAgilityXP = 67983
	ElseIf AgilityLVL == 46
		tAgilityXP = 75127
	ElseIf AgilityLVL == 47
		tAgilityXP = 83014
	ElseIf AgilityLVL == 48
		tAgilityXP = 91721
	ElseIf AgilityLVL == 49
		tAgilityXP = 101333
	ElseIf AgilityLVL == 50
		tAgilityXP = 111945
	ElseIf AgilityLVL == 51
		tAgilityXP = 123660
	ElseIf AgilityLVL == 52
		tAgilityXP = 136594
	ElseIf AgilityLVL == 53
		tAgilityXP = 150872
	ElseIf AgilityLVL == 54
		tAgilityXP = 166636
	ElseIf AgilityLVL == 55
		tAgilityXP = 184040
	ElseIf AgilityLVL == 56
		tAgilityXP = 203254
	ElseIf AgilityLVL == 57
		tAgilityXP = 224466
	ElseIf AgilityLVL == 58
		tAgilityXP = 247886
	ElseIf AgilityLVL == 59
		tAgilityXP = 273742
	ElseIf AgilityLVL == 60
		tAgilityXP = 302288
	ElseIf AgilityLVL == 61
		tAgilityXP = 333804
	ElseIf AgilityLVL == 62
		tAgilityXP = 368599
	ElseIf AgilityLVL == 63
		tAgilityXP = 407015
	ElseIf AgilityLVL == 64
		tAgilityXP = 449428
	ElseIf AgilityLVL == 65
		tAgilityXP = 496254
	ElseIf AgilityLVL == 66
		tAgilityXP = 547953
	ElseIf AgilityLVL == 67
		tAgilityXP = 605032
	ElseIf AgilityLVL == 68
		tAgilityXP = 668051
	ElseIf AgilityLVL == 69
		tAgilityXP = 737627
	ElseIf AgilityLVL == 70
		tAgilityXP = 814445
	ElseIf AgilityLVL == 71
		tAgilityXP = 899257
	ElseIf AgilityLVL == 72
		tAgilityXP = 992895
	ElseIf AgilityLVL == 73
		tAgilityXP = 1096278
	ElseIf AgilityLVL == 74
		tAgilityXP = 1210421
	ElseIf AgilityLVL == 75
		tAgilityXP = 1336443
	ElseIf AgilityLVL == 75
		tAgilityXP = 1336443
	ElseIf AgilityLVL == 76
		tAgilityXP = 1475581
	ElseIf AgilityLVL == 77
		tAgilityXP = 1629200
	ElseIf AgilityLVL == 78
		tAgilityXP = 1798808
	ElseIf AgilityLVL == 79
		tAgilityXP = 1986068
	ElseIf AgilityLVL == 80
		tAgilityXP = 2192818
	ElseIf AgilityLVL == 81
		tAgilityXP = 2421087
	ElseIf AgilityLVL == 82
		tAgilityXP = 2673114
	ElseIf AgilityLVL == 83
		tAgilityXP = 2951373
	ElseIf AgilityLVL == 84
		tAgilityXP = 3258594
	ElseIf AgilityLVL == 85
		tAgilityXP = 3597792
	ElseIf AgilityLVL == 86
		tAgilityXP = 3972294
	ElseIf AgilityLVL == 87
		tAgilityXP = 4385776
	ElseIf AgilityLVL == 88
		tAgilityXP = 4842295
	ElseIf AgilityLVL == 89
		tAgilityXP = 5346332
	ElseIf AgilityLVL == 90
		tAgilityXP = 5902831
	ElseIf AgilityLVL == 91
		tAgilityXP = 6517253
	ElseIf AgilityLVL == 92
		tAgilityXP = 7195629
	ElseIf AgilityLVL == 93
		tAgilityXP = 7944614
	ElseIf AgilityLVL == 94
		tAgilityXP = 8771558
	ElseIf AgilityLVL == 95
		tAgilityXP = 9684577
	ElseIf AgilityLVL == 96
		tAgilityXP = 10692629
	ElseIf AgilityLVL == 97
		tAgilityXP = 11805606
	ElseIf AgilityLVL == 98
		tAgilityXP = 13034431
	Else
		tAgilityXP = 0
	EndIf
EndFunction

Function HerbloreInit()
	HerbloreLVL = RS_GV_HerbloreLVL.GetValue() as Int
	cHerbloreXP = RS_GV_HerbloreXP.GetValue() as Int
	If HerbloreLVL == 1
		tHerbloreXP = 83
	ElseIf HerbloreLVL == 2
		tHerbloreXP = 174
	ElseIf HerbloreLVL == 3
		tHerbloreXP = 276
	ElseIf HerbloreLVL == 4
		tHerbloreXP = 388
	ElseIf HerbloreLVL == 5
		tHerbloreXP = 512
	ElseIf HerbloreLVL == 6
		tHerbloreXP = 650
	ElseIf HerbloreLVL == 7
		tHerbloreXP = 801
	ElseIf HerbloreLVL == 8
		tHerbloreXP = 969
	ElseIf HerbloreLVL == 9
		tHerbloreXP = 1154
	ElseIf HerbloreLVL == 10
		tHerbloreXP = 1358
	ElseIf HerbloreLVL == 11
		tHerbloreXP = 1584
	ElseIf HerbloreLVL == 12
		tHerbloreXP = 1833
	ElseIf HerbloreLVL == 13
		tHerbloreXP = 2107
	ElseIf HerbloreLVL == 14
		tHerbloreXP = 2411
	ElseIf HerbloreLVL == 15
		tHerbloreXP = 2746
	ElseIf HerbloreLVL == 16
		tHerbloreXP = 3115
	ElseIf HerbloreLVL == 17
		tHerbloreXP = 3523
	ElseIf HerbloreLVL == 18
		tHerbloreXP = 3973
	ElseIf HerbloreLVL == 19
		tHerbloreXP = 4470
	ElseIf HerbloreLVL == 20
		tHerbloreXP = 5018
	ElseIf HerbloreLVL == 21
		tHerbloreXP = 5624
	ElseIf HerbloreLVL == 22
		tHerbloreXP = 6291
	ElseIf HerbloreLVL == 23
		tHerbloreXP = 7028
	ElseIf HerbloreLVL == 24
		tHerbloreXP = 7842
	ElseIf HerbloreLVL == 25
		tHerbloreXP = 8740
	ElseIf HerbloreLVL == 26
		tHerbloreXP = 9730
	ElseIf HerbloreLVL == 27
		tHerbloreXP = 10824
	ElseIf HerbloreLVL == 28
		tHerbloreXP = 12031
	ElseIf HerbloreLVL == 29
		tHerbloreXP = 13363
	ElseIf HerbloreLVL == 30
		tHerbloreXP = 14833
	ElseIf HerbloreLVL == 31
		tHerbloreXP = 16456
	ElseIf HerbloreLVL == 32
		tHerbloreXP = 18247
	ElseIf HerbloreLVL == 33
		tHerbloreXP = 20224
	ElseIf HerbloreLVL == 34
		tHerbloreXP = 22406
	ElseIf HerbloreLVL == 35
		tHerbloreXP = 24815
	ElseIf HerbloreLVL == 36
		tHerbloreXP = 27473
	ElseIf HerbloreLVL == 37
		tHerbloreXP = 30408
	ElseIf HerbloreLVL == 38
		tHerbloreXP = 33648
	ElseIf HerbloreLVL == 39
		tHerbloreXP = 37224
	ElseIf HerbloreLVL == 40
		tHerbloreXP = 41171
	ElseIf HerbloreLVL == 41
		tHerbloreXP = 45529
	ElseIf HerbloreLVL == 42
		tHerbloreXP = 50339
	ElseIf HerbloreLVL == 43
		tHerbloreXP = 55649
	ElseIf HerbloreLVL == 44
		tHerbloreXP = 61512
	ElseIf HerbloreLVL == 45
		tHerbloreXP = 67983
	ElseIf HerbloreLVL == 46
		tHerbloreXP = 75127
	ElseIf HerbloreLVL == 47
		tHerbloreXP = 83014
	ElseIf HerbloreLVL == 48
		tHerbloreXP = 91721
	ElseIf HerbloreLVL == 49
		tHerbloreXP = 101333
	ElseIf HerbloreLVL == 50
		tHerbloreXP = 111945
	ElseIf HerbloreLVL == 51
		tHerbloreXP = 123660
	ElseIf HerbloreLVL == 52
		tHerbloreXP = 136594
	ElseIf HerbloreLVL == 53
		tHerbloreXP = 150872
	ElseIf HerbloreLVL == 54
		tHerbloreXP = 166636
	ElseIf HerbloreLVL == 55
		tHerbloreXP = 184040
	ElseIf HerbloreLVL == 56
		tHerbloreXP = 203254
	ElseIf HerbloreLVL == 57
		tHerbloreXP = 224466
	ElseIf HerbloreLVL == 58
		tHerbloreXP = 247886
	ElseIf HerbloreLVL == 59
		tHerbloreXP = 273742
	ElseIf HerbloreLVL == 60
		tHerbloreXP = 302288
	ElseIf HerbloreLVL == 61
		tHerbloreXP = 333804
	ElseIf HerbloreLVL == 62
		tHerbloreXP = 368599
	ElseIf HerbloreLVL == 63
		tHerbloreXP = 407015
	ElseIf HerbloreLVL == 64
		tHerbloreXP = 449428
	ElseIf HerbloreLVL == 65
		tHerbloreXP = 496254
	ElseIf HerbloreLVL == 66
		tHerbloreXP = 547953
	ElseIf HerbloreLVL == 67
		tHerbloreXP = 605032
	ElseIf HerbloreLVL == 68
		tHerbloreXP = 668051
	ElseIf HerbloreLVL == 69
		tHerbloreXP = 737627
	ElseIf HerbloreLVL == 70
		tHerbloreXP = 814445
	ElseIf HerbloreLVL == 71
		tHerbloreXP = 899257
	ElseIf HerbloreLVL == 72
		tHerbloreXP = 992895
	ElseIf HerbloreLVL == 73
		tHerbloreXP = 1096278
	ElseIf HerbloreLVL == 74
		tHerbloreXP = 1210421
	ElseIf HerbloreLVL == 75
		tHerbloreXP = 1336443
	ElseIf HerbloreLVL == 75
		tHerbloreXP = 1336443
	ElseIf HerbloreLVL == 76
		tHerbloreXP = 1475581
	ElseIf HerbloreLVL == 77
		tHerbloreXP = 1629200
	ElseIf HerbloreLVL == 78
		tHerbloreXP = 1798808
	ElseIf HerbloreLVL == 79
		tHerbloreXP = 1986068
	ElseIf HerbloreLVL == 80
		tHerbloreXP = 2192818
	ElseIf HerbloreLVL == 81
		tHerbloreXP = 2421087
	ElseIf HerbloreLVL == 82
		tHerbloreXP = 2673114
	ElseIf HerbloreLVL == 83
		tHerbloreXP = 2951373
	ElseIf HerbloreLVL == 84
		tHerbloreXP = 3258594
	ElseIf HerbloreLVL == 85
		tHerbloreXP = 3597792
	ElseIf HerbloreLVL == 86
		tHerbloreXP = 3972294
	ElseIf HerbloreLVL == 87
		tHerbloreXP = 4385776
	ElseIf HerbloreLVL == 88
		tHerbloreXP = 4842295
	ElseIf HerbloreLVL == 89
		tHerbloreXP = 5346332
	ElseIf HerbloreLVL == 90
		tHerbloreXP = 5902831
	ElseIf HerbloreLVL == 91
		tHerbloreXP = 6517253
	ElseIf HerbloreLVL == 92
		tHerbloreXP = 7195629
	ElseIf HerbloreLVL == 93
		tHerbloreXP = 7944614
	ElseIf HerbloreLVL == 94
		tHerbloreXP = 8771558
	ElseIf HerbloreLVL == 95
		tHerbloreXP = 9684577
	ElseIf HerbloreLVL == 96
		tHerbloreXP = 10692629
	ElseIf HerbloreLVL == 97
		tHerbloreXP = 11805606
	ElseIf HerbloreLVL == 98
		tHerbloreXP = 13034431
	Else
		tHerbloreXP = 0
	EndIf
EndFunction

Function ThievingInit()
	ThievingLVL = RS_GV_ThievingLVL.GetValue() as Int
	cThievingXP = RS_GV_ThievingXP.GetValue() as Int
	If ThievingLVL == 1
		tThievingXP = 83
	ElseIf ThievingLVL == 2
		tThievingXP = 174
	ElseIf ThievingLVL == 3
		tThievingXP = 276
	ElseIf ThievingLVL == 4
		tThievingXP = 388
	ElseIf ThievingLVL == 5
		tThievingXP = 512
	ElseIf ThievingLVL == 6
		tThievingXP = 650
	ElseIf ThievingLVL == 7
		tThievingXP = 801
	ElseIf ThievingLVL == 8
		tThievingXP = 969
	ElseIf ThievingLVL == 9
		tThievingXP = 1154
	ElseIf ThievingLVL == 10
		tThievingXP = 1358
	ElseIf ThievingLVL == 11
		tThievingXP = 1584
	ElseIf ThievingLVL == 12
		tThievingXP = 1833
	ElseIf ThievingLVL == 13
		tThievingXP = 2107
	ElseIf ThievingLVL == 14
		tThievingXP = 2411
	ElseIf ThievingLVL == 15
		tThievingXP = 2746
	ElseIf ThievingLVL == 16
		tThievingXP = 3115
	ElseIf ThievingLVL == 17
		tThievingXP = 3523
	ElseIf ThievingLVL == 18
		tThievingXP = 3973
	ElseIf ThievingLVL == 19
		tThievingXP = 4470
	ElseIf ThievingLVL == 20
		tThievingXP = 5018
	ElseIf ThievingLVL == 21
		tThievingXP = 5624
	ElseIf ThievingLVL == 22
		tThievingXP = 6291
	ElseIf ThievingLVL == 23
		tThievingXP = 7028
	ElseIf ThievingLVL == 24
		tThievingXP = 7842
	ElseIf ThievingLVL == 25
		tThievingXP = 8740
	ElseIf ThievingLVL == 26
		tThievingXP = 9730
	ElseIf ThievingLVL == 27
		tThievingXP = 10824
	ElseIf ThievingLVL == 28
		tThievingXP = 12031
	ElseIf ThievingLVL == 29
		tThievingXP = 13363
	ElseIf ThievingLVL == 30
		tThievingXP = 14833
	ElseIf ThievingLVL == 31
		tThievingXP = 16456
	ElseIf ThievingLVL == 32
		tThievingXP = 18247
	ElseIf ThievingLVL == 33
		tThievingXP = 20224
	ElseIf ThievingLVL == 34
		tThievingXP = 22406
	ElseIf ThievingLVL == 35
		tThievingXP = 24815
	ElseIf ThievingLVL == 36
		tThievingXP = 27473
	ElseIf ThievingLVL == 37
		tThievingXP = 30408
	ElseIf ThievingLVL == 38
		tThievingXP = 33648
	ElseIf ThievingLVL == 39
		tThievingXP = 37224
	ElseIf ThievingLVL == 40
		tThievingXP = 41171
	ElseIf ThievingLVL == 41
		tThievingXP = 45529
	ElseIf ThievingLVL == 42
		tThievingXP = 50339
	ElseIf ThievingLVL == 43
		tThievingXP = 55649
	ElseIf ThievingLVL == 44
		tThievingXP = 61512
	ElseIf ThievingLVL == 45
		tThievingXP = 67983
	ElseIf ThievingLVL == 46
		tThievingXP = 75127
	ElseIf ThievingLVL == 47
		tThievingXP = 83014
	ElseIf ThievingLVL == 48
		tThievingXP = 91721
	ElseIf ThievingLVL == 49
		tThievingXP = 101333
	ElseIf ThievingLVL == 50
		tThievingXP = 111945
	ElseIf ThievingLVL == 51
		tThievingXP = 123660
	ElseIf ThievingLVL == 52
		tThievingXP = 136594
	ElseIf ThievingLVL == 53
		tThievingXP = 150872
	ElseIf ThievingLVL == 54
		tThievingXP = 166636
	ElseIf ThievingLVL == 55
		tThievingXP = 184040
	ElseIf ThievingLVL == 56
		tThievingXP = 203254
	ElseIf ThievingLVL == 57
		tThievingXP = 224466
	ElseIf ThievingLVL == 58
		tThievingXP = 247886
	ElseIf ThievingLVL == 59
		tThievingXP = 273742
	ElseIf ThievingLVL == 60
		tThievingXP = 302288
	ElseIf ThievingLVL == 61
		tThievingXP = 333804
	ElseIf ThievingLVL == 62
		tThievingXP = 368599
	ElseIf ThievingLVL == 63
		tThievingXP = 407015
	ElseIf ThievingLVL == 64
		tThievingXP = 449428
	ElseIf ThievingLVL == 65
		tThievingXP = 496254
	ElseIf ThievingLVL == 66
		tThievingXP = 547953
	ElseIf ThievingLVL == 67
		tThievingXP = 605032
	ElseIf ThievingLVL == 68
		tThievingXP = 668051
	ElseIf ThievingLVL == 69
		tThievingXP = 737627
	ElseIf ThievingLVL == 70
		tThievingXP = 814445
	ElseIf ThievingLVL == 71
		tThievingXP = 899257
	ElseIf ThievingLVL == 72
		tThievingXP = 992895
	ElseIf ThievingLVL == 73
		tThievingXP = 1096278
	ElseIf ThievingLVL == 74
		tThievingXP = 1210421
	ElseIf ThievingLVL == 75
		tThievingXP = 1336443
	ElseIf ThievingLVL == 75
		tThievingXP = 1336443
	ElseIf ThievingLVL == 76
		tThievingXP = 1475581
	ElseIf ThievingLVL == 77
		tThievingXP = 1629200
	ElseIf ThievingLVL == 78
		tThievingXP = 1798808
	ElseIf ThievingLVL == 79
		tThievingXP = 1986068
	ElseIf ThievingLVL == 80
		tThievingXP = 2192818
	ElseIf ThievingLVL == 81
		tThievingXP = 2421087
	ElseIf ThievingLVL == 82
		tThievingXP = 2673114
	ElseIf ThievingLVL == 83
		tThievingXP = 2951373
	ElseIf ThievingLVL == 84
		tThievingXP = 3258594
	ElseIf ThievingLVL == 85
		tThievingXP = 3597792
	ElseIf ThievingLVL == 86
		tThievingXP = 3972294
	ElseIf ThievingLVL == 87
		tThievingXP = 4385776
	ElseIf ThievingLVL == 88
		tThievingXP = 4842295
	ElseIf ThievingLVL == 89
		tThievingXP = 5346332
	ElseIf ThievingLVL == 90
		tThievingXP = 5902831
	ElseIf ThievingLVL == 91
		tThievingXP = 6517253
	ElseIf ThievingLVL == 92
		tThievingXP = 7195629
	ElseIf ThievingLVL == 93
		tThievingXP = 7944614
	ElseIf ThievingLVL == 94
		tThievingXP = 8771558
	ElseIf ThievingLVL == 95
		tThievingXP = 9684577
	ElseIf ThievingLVL == 96
		tThievingXP = 10692629
	ElseIf ThievingLVL == 97
		tThievingXP = 11805606
	ElseIf ThievingLVL == 98
		tThievingXP = 13034431
	Else
		tThievingXP = 0
	EndIf
EndFunction

Function CraftingInit()
	CraftingLVL = RS_GV_CraftingLVL.GetValue() as Int
	cCraftingXP = RS_GV_CraftingXP.GetValue() as Int
	If CraftingLVL == 1
		tCraftingXP = 83
	ElseIf CraftingLVL == 2
		tCraftingXP = 174
	ElseIf CraftingLVL == 3
		tCraftingXP = 276
	ElseIf CraftingLVL == 4
		tCraftingXP = 388
	ElseIf CraftingLVL == 5
		tCraftingXP = 512
	ElseIf CraftingLVL == 6
		tCraftingXP = 650
	ElseIf CraftingLVL == 7
		tCraftingXP = 801
	ElseIf CraftingLVL == 8
		tCraftingXP = 969
	ElseIf CraftingLVL == 9
		tCraftingXP = 1154
	ElseIf CraftingLVL == 10
		tCraftingXP = 1358
	ElseIf CraftingLVL == 11
		tCraftingXP = 1584
	ElseIf CraftingLVL == 12
		tCraftingXP = 1833
	ElseIf CraftingLVL == 13
		tCraftingXP = 2107
	ElseIf CraftingLVL == 14
		tCraftingXP = 2411
	ElseIf CraftingLVL == 15
		tCraftingXP = 2746
	ElseIf CraftingLVL == 16
		tCraftingXP = 3115
	ElseIf CraftingLVL == 17
		tCraftingXP = 3523
	ElseIf CraftingLVL == 18
		tCraftingXP = 3973
	ElseIf CraftingLVL == 19
		tCraftingXP = 4470
	ElseIf CraftingLVL == 20
		tCraftingXP = 5018
	ElseIf CraftingLVL == 21
		tCraftingXP = 5624
	ElseIf CraftingLVL == 22
		tCraftingXP = 6291
	ElseIf CraftingLVL == 23
		tCraftingXP = 7028
	ElseIf CraftingLVL == 24
		tCraftingXP = 7842
	ElseIf CraftingLVL == 25
		tCraftingXP = 8740
	ElseIf CraftingLVL == 26
		tCraftingXP = 9730
	ElseIf CraftingLVL == 27
		tCraftingXP = 10824
	ElseIf CraftingLVL == 28
		tCraftingXP = 12031
	ElseIf CraftingLVL == 29
		tCraftingXP = 13363
	ElseIf CraftingLVL == 30
		tCraftingXP = 14833
	ElseIf CraftingLVL == 31
		tCraftingXP = 16456
	ElseIf CraftingLVL == 32
		tCraftingXP = 18247
	ElseIf CraftingLVL == 33
		tCraftingXP = 20224
	ElseIf CraftingLVL == 34
		tCraftingXP = 22406
	ElseIf CraftingLVL == 35
		tCraftingXP = 24815
	ElseIf CraftingLVL == 36
		tCraftingXP = 27473
	ElseIf CraftingLVL == 37
		tCraftingXP = 30408
	ElseIf CraftingLVL == 38
		tCraftingXP = 33648
	ElseIf CraftingLVL == 39
		tCraftingXP = 37224
	ElseIf CraftingLVL == 40
		tCraftingXP = 41171
	ElseIf CraftingLVL == 41
		tCraftingXP = 45529
	ElseIf CraftingLVL == 42
		tCraftingXP = 50339
	ElseIf CraftingLVL == 43
		tCraftingXP = 55649
	ElseIf CraftingLVL == 44
		tCraftingXP = 61512
	ElseIf CraftingLVL == 45
		tCraftingXP = 67983
	ElseIf CraftingLVL == 46
		tCraftingXP = 75127
	ElseIf CraftingLVL == 47
		tCraftingXP = 83014
	ElseIf CraftingLVL == 48
		tCraftingXP = 91721
	ElseIf CraftingLVL == 49
		tCraftingXP = 101333
	ElseIf CraftingLVL == 50
		tCraftingXP = 111945
	ElseIf CraftingLVL == 51
		tCraftingXP = 123660
	ElseIf CraftingLVL == 52
		tCraftingXP = 136594
	ElseIf CraftingLVL == 53
		tCraftingXP = 150872
	ElseIf CraftingLVL == 54
		tCraftingXP = 166636
	ElseIf CraftingLVL == 55
		tCraftingXP = 184040
	ElseIf CraftingLVL == 56
		tCraftingXP = 203254
	ElseIf CraftingLVL == 57
		tCraftingXP = 224466
	ElseIf CraftingLVL == 58
		tCraftingXP = 247886
	ElseIf CraftingLVL == 59
		tCraftingXP = 273742
	ElseIf CraftingLVL == 60
		tCraftingXP = 302288
	ElseIf CraftingLVL == 61
		tCraftingXP = 333804
	ElseIf CraftingLVL == 62
		tCraftingXP = 368599
	ElseIf CraftingLVL == 63
		tCraftingXP = 407015
	ElseIf CraftingLVL == 64
		tCraftingXP = 449428
	ElseIf CraftingLVL == 65
		tCraftingXP = 496254
	ElseIf CraftingLVL == 66
		tCraftingXP = 547953
	ElseIf CraftingLVL == 67
		tCraftingXP = 605032
	ElseIf CraftingLVL == 68
		tCraftingXP = 668051
	ElseIf CraftingLVL == 69
		tCraftingXP = 737627
	ElseIf CraftingLVL == 70
		tCraftingXP = 814445
	ElseIf CraftingLVL == 71
		tCraftingXP = 899257
	ElseIf CraftingLVL == 72
		tCraftingXP = 992895
	ElseIf CraftingLVL == 73
		tCraftingXP = 1096278
	ElseIf CraftingLVL == 74
		tCraftingXP = 1210421
	ElseIf CraftingLVL == 75
		tCraftingXP = 1336443
	ElseIf CraftingLVL == 75
		tCraftingXP = 1336443
	ElseIf CraftingLVL == 76
		tCraftingXP = 1475581
	ElseIf CraftingLVL == 77
		tCraftingXP = 1629200
	ElseIf CraftingLVL == 78
		tCraftingXP = 1798808
	ElseIf CraftingLVL == 79
		tCraftingXP = 1986068
	ElseIf CraftingLVL == 80
		tCraftingXP = 2192818
	ElseIf CraftingLVL == 81
		tCraftingXP = 2421087
	ElseIf CraftingLVL == 82
		tCraftingXP = 2673114
	ElseIf CraftingLVL == 83
		tCraftingXP = 2951373
	ElseIf CraftingLVL == 84
		tCraftingXP = 3258594
	ElseIf CraftingLVL == 85
		tCraftingXP = 3597792
	ElseIf CraftingLVL == 86
		tCraftingXP = 3972294
	ElseIf CraftingLVL == 87
		tCraftingXP = 4385776
	ElseIf CraftingLVL == 88
		tCraftingXP = 4842295
	ElseIf CraftingLVL == 89
		tCraftingXP = 5346332
	ElseIf CraftingLVL == 90
		tCraftingXP = 5902831
	ElseIf CraftingLVL == 91
		tCraftingXP = 6517253
	ElseIf CraftingLVL == 92
		tCraftingXP = 7195629
	ElseIf CraftingLVL == 93
		tCraftingXP = 7944614
	ElseIf CraftingLVL == 94
		tCraftingXP = 8771558
	ElseIf CraftingLVL == 95
		tCraftingXP = 9684577
	ElseIf CraftingLVL == 96
		tCraftingXP = 10692629
	ElseIf CraftingLVL == 97
		tCraftingXP = 11805606
	ElseIf CraftingLVL == 98
		tCraftingXP = 13034431
	Else
		tCraftingXP = 0
	EndIf
EndFunction

Function FletchingInit()
	FletchingLVL = RS_GV_FletchingLVL.GetValue() as Int
	cFletchingXP = RS_GV_FletchingXP.GetValue() as Int
	If FletchingLVL == 1
		tFletchingXP = 83
	ElseIf FletchingLVL == 2
		tFletchingXP = 174
	ElseIf FletchingLVL == 3
		tFletchingXP = 276
	ElseIf FletchingLVL == 4
		tFletchingXP = 388
	ElseIf FletchingLVL == 5
		tFletchingXP = 512
	ElseIf FletchingLVL == 6
		tFletchingXP = 650
	ElseIf FletchingLVL == 7
		tFletchingXP = 801
	ElseIf FletchingLVL == 8
		tFletchingXP = 969
	ElseIf FletchingLVL == 9
		tFletchingXP = 1154
	ElseIf FletchingLVL == 10
		tFletchingXP = 1358
	ElseIf FletchingLVL == 11
		tFletchingXP = 1584
	ElseIf FletchingLVL == 12
		tFletchingXP = 1833
	ElseIf FletchingLVL == 13
		tFletchingXP = 2107
	ElseIf FletchingLVL == 14
		tFletchingXP = 2411
	ElseIf FletchingLVL == 15
		tFletchingXP = 2746
	ElseIf FletchingLVL == 16
		tFletchingXP = 3115
	ElseIf FletchingLVL == 17
		tFletchingXP = 3523
	ElseIf FletchingLVL == 18
		tFletchingXP = 3973
	ElseIf FletchingLVL == 19
		tFletchingXP = 4470
	ElseIf FletchingLVL == 20
		tFletchingXP = 5018
	ElseIf FletchingLVL == 21
		tFletchingXP = 5624
	ElseIf FletchingLVL == 22
		tFletchingXP = 6291
	ElseIf FletchingLVL == 23
		tFletchingXP = 7028
	ElseIf FletchingLVL == 24
		tFletchingXP = 7842
	ElseIf FletchingLVL == 25
		tFletchingXP = 8740
	ElseIf FletchingLVL == 26
		tFletchingXP = 9730
	ElseIf FletchingLVL == 27
		tFletchingXP = 10824
	ElseIf FletchingLVL == 28
		tFletchingXP = 12031
	ElseIf FletchingLVL == 29
		tFletchingXP = 13363
	ElseIf FletchingLVL == 30
		tFletchingXP = 14833
	ElseIf FletchingLVL == 31
		tFletchingXP = 16456
	ElseIf FletchingLVL == 32
		tFletchingXP = 18247
	ElseIf FletchingLVL == 33
		tFletchingXP = 20224
	ElseIf FletchingLVL == 34
		tFletchingXP = 22406
	ElseIf FletchingLVL == 35
		tFletchingXP = 24815
	ElseIf FletchingLVL == 36
		tFletchingXP = 27473
	ElseIf FletchingLVL == 37
		tFletchingXP = 30408
	ElseIf FletchingLVL == 38
		tFletchingXP = 33648
	ElseIf FletchingLVL == 39
		tFletchingXP = 37224
	ElseIf FletchingLVL == 40
		tFletchingXP = 41171
	ElseIf FletchingLVL == 41
		tFletchingXP = 45529
	ElseIf FletchingLVL == 42
		tFletchingXP = 50339
	ElseIf FletchingLVL == 43
		tFletchingXP = 55649
	ElseIf FletchingLVL == 44
		tFletchingXP = 61512
	ElseIf FletchingLVL == 45
		tFletchingXP = 67983
	ElseIf FletchingLVL == 46
		tFletchingXP = 75127
	ElseIf FletchingLVL == 47
		tFletchingXP = 83014
	ElseIf FletchingLVL == 48
		tFletchingXP = 91721
	ElseIf FletchingLVL == 49
		tFletchingXP = 101333
	ElseIf FletchingLVL == 50
		tFletchingXP = 111945
	ElseIf FletchingLVL == 51
		tFletchingXP = 123660
	ElseIf FletchingLVL == 52
		tFletchingXP = 136594
	ElseIf FletchingLVL == 53
		tFletchingXP = 150872
	ElseIf FletchingLVL == 54
		tFletchingXP = 166636
	ElseIf FletchingLVL == 55
		tFletchingXP = 184040
	ElseIf FletchingLVL == 56
		tFletchingXP = 203254
	ElseIf FletchingLVL == 57
		tFletchingXP = 224466
	ElseIf FletchingLVL == 58
		tFletchingXP = 247886
	ElseIf FletchingLVL == 59
		tFletchingXP = 273742
	ElseIf FletchingLVL == 60
		tFletchingXP = 302288
	ElseIf FletchingLVL == 61
		tFletchingXP = 333804
	ElseIf FletchingLVL == 62
		tFletchingXP = 368599
	ElseIf FletchingLVL == 63
		tFletchingXP = 407015
	ElseIf FletchingLVL == 64
		tFletchingXP = 449428
	ElseIf FletchingLVL == 65
		tFletchingXP = 496254
	ElseIf FletchingLVL == 66
		tFletchingXP = 547953
	ElseIf FletchingLVL == 67
		tFletchingXP = 605032
	ElseIf FletchingLVL == 68
		tFletchingXP = 668051
	ElseIf FletchingLVL == 69
		tFletchingXP = 737627
	ElseIf FletchingLVL == 70
		tFletchingXP = 814445
	ElseIf FletchingLVL == 71
		tFletchingXP = 899257
	ElseIf FletchingLVL == 72
		tFletchingXP = 992895
	ElseIf FletchingLVL == 73
		tFletchingXP = 1096278
	ElseIf FletchingLVL == 74
		tFletchingXP = 1210421
	ElseIf FletchingLVL == 75
		tFletchingXP = 1336443
	ElseIf FletchingLVL == 75
		tFletchingXP = 1336443
	ElseIf FletchingLVL == 76
		tFletchingXP = 1475581
	ElseIf FletchingLVL == 77
		tFletchingXP = 1629200
	ElseIf FletchingLVL == 78
		tFletchingXP = 1798808
	ElseIf FletchingLVL == 79
		tFletchingXP = 1986068
	ElseIf FletchingLVL == 80
		tFletchingXP = 2192818
	ElseIf FletchingLVL == 81
		tFletchingXP = 2421087
	ElseIf FletchingLVL == 82
		tFletchingXP = 2673114
	ElseIf FletchingLVL == 83
		tFletchingXP = 2951373
	ElseIf FletchingLVL == 84
		tFletchingXP = 3258594
	ElseIf FletchingLVL == 85
		tFletchingXP = 3597792
	ElseIf FletchingLVL == 86
		tFletchingXP = 3972294
	ElseIf FletchingLVL == 87
		tFletchingXP = 4385776
	ElseIf FletchingLVL == 88
		tFletchingXP = 4842295
	ElseIf FletchingLVL == 89
		tFletchingXP = 5346332
	ElseIf FletchingLVL == 90
		tFletchingXP = 5902831
	ElseIf FletchingLVL == 91
		tFletchingXP = 6517253
	ElseIf FletchingLVL == 92
		tFletchingXP = 7195629
	ElseIf FletchingLVL == 93
		tFletchingXP = 7944614
	ElseIf FletchingLVL == 94
		tFletchingXP = 8771558
	ElseIf FletchingLVL == 95
		tFletchingXP = 9684577
	ElseIf FletchingLVL == 96
		tFletchingXP = 10692629
	ElseIf FletchingLVL == 97
		tFletchingXP = 11805606
	ElseIf FletchingLVL == 98
		tFletchingXP = 13034431
	Else
		tFletchingXP = 0
	EndIf
EndFunction

Function SlayerInit()
	SlayerLVL = RS_GV_SlayerLVL.GetValue() as Int
	cSlayerXP = RS_GV_SlayerXP.GetValue() as Int
	If SlayerLVL == 1
		tSlayerXP = 83
	ElseIf SlayerLVL == 2
		tSlayerXP = 174
	ElseIf SlayerLVL == 3
		tSlayerXP = 276
	ElseIf SlayerLVL == 4
		tSlayerXP = 388
	ElseIf SlayerLVL == 5
		tSlayerXP = 512
	ElseIf SlayerLVL == 6
		tSlayerXP = 650
	ElseIf SlayerLVL == 7
		tSlayerXP = 801
	ElseIf SlayerLVL == 8
		tSlayerXP = 969
	ElseIf SlayerLVL == 9
		tSlayerXP = 1154
	ElseIf SlayerLVL == 10
		tSlayerXP = 1358
	ElseIf SlayerLVL == 11
		tSlayerXP = 1584
	ElseIf SlayerLVL == 12
		tSlayerXP = 1833
	ElseIf SlayerLVL == 13
		tSlayerXP = 2107
	ElseIf SlayerLVL == 14
		tSlayerXP = 2411
	ElseIf SlayerLVL == 15
		tSlayerXP = 2746
	ElseIf SlayerLVL == 16
		tSlayerXP = 3115
	ElseIf SlayerLVL == 17
		tSlayerXP = 3523
	ElseIf SlayerLVL == 18
		tSlayerXP = 3973
	ElseIf SlayerLVL == 19
		tSlayerXP = 4470
	ElseIf SlayerLVL == 20
		tSlayerXP = 5018
	ElseIf SlayerLVL == 21
		tSlayerXP = 5624
	ElseIf SlayerLVL == 22
		tSlayerXP = 6291
	ElseIf SlayerLVL == 23
		tSlayerXP = 7028
	ElseIf SlayerLVL == 24
		tSlayerXP = 7842
	ElseIf SlayerLVL == 25
		tSlayerXP = 8740
	ElseIf SlayerLVL == 26
		tSlayerXP = 9730
	ElseIf SlayerLVL == 27
		tSlayerXP = 10824
	ElseIf SlayerLVL == 28
		tSlayerXP = 12031
	ElseIf SlayerLVL == 29
		tSlayerXP = 13363
	ElseIf SlayerLVL == 30
		tSlayerXP = 14833
	ElseIf SlayerLVL == 31
		tSlayerXP = 16456
	ElseIf SlayerLVL == 32
		tSlayerXP = 18247
	ElseIf SlayerLVL == 33
		tSlayerXP = 20224
	ElseIf SlayerLVL == 34
		tSlayerXP = 22406
	ElseIf SlayerLVL == 35
		tSlayerXP = 24815
	ElseIf SlayerLVL == 36
		tSlayerXP = 27473
	ElseIf SlayerLVL == 37
		tSlayerXP = 30408
	ElseIf SlayerLVL == 38
		tSlayerXP = 33648
	ElseIf SlayerLVL == 39
		tSlayerXP = 37224
	ElseIf SlayerLVL == 40
		tSlayerXP = 41171
	ElseIf SlayerLVL == 41
		tSlayerXP = 45529
	ElseIf SlayerLVL == 42
		tSlayerXP = 50339
	ElseIf SlayerLVL == 43
		tSlayerXP = 55649
	ElseIf SlayerLVL == 44
		tSlayerXP = 61512
	ElseIf SlayerLVL == 45
		tSlayerXP = 67983
	ElseIf SlayerLVL == 46
		tSlayerXP = 75127
	ElseIf SlayerLVL == 47
		tSlayerXP = 83014
	ElseIf SlayerLVL == 48
		tSlayerXP = 91721
	ElseIf SlayerLVL == 49
		tSlayerXP = 101333
	ElseIf SlayerLVL == 50
		tSlayerXP = 111945
	ElseIf SlayerLVL == 51
		tSlayerXP = 123660
	ElseIf SlayerLVL == 52
		tSlayerXP = 136594
	ElseIf SlayerLVL == 53
		tSlayerXP = 150872
	ElseIf SlayerLVL == 54
		tSlayerXP = 166636
	ElseIf SlayerLVL == 55
		tSlayerXP = 184040
	ElseIf SlayerLVL == 56
		tSlayerXP = 203254
	ElseIf SlayerLVL == 57
		tSlayerXP = 224466
	ElseIf SlayerLVL == 58
		tSlayerXP = 247886
	ElseIf SlayerLVL == 59
		tSlayerXP = 273742
	ElseIf SlayerLVL == 60
		tSlayerXP = 302288
	ElseIf SlayerLVL == 61
		tSlayerXP = 333804
	ElseIf SlayerLVL == 62
		tSlayerXP = 368599
	ElseIf SlayerLVL == 63
		tSlayerXP = 407015
	ElseIf SlayerLVL == 64
		tSlayerXP = 449428
	ElseIf SlayerLVL == 65
		tSlayerXP = 496254
	ElseIf SlayerLVL == 66
		tSlayerXP = 547953
	ElseIf SlayerLVL == 67
		tSlayerXP = 605032
	ElseIf SlayerLVL == 68
		tSlayerXP = 668051
	ElseIf SlayerLVL == 69
		tSlayerXP = 737627
	ElseIf SlayerLVL == 70
		tSlayerXP = 814445
	ElseIf SlayerLVL == 71
		tSlayerXP = 899257
	ElseIf SlayerLVL == 72
		tSlayerXP = 992895
	ElseIf SlayerLVL == 73
		tSlayerXP = 1096278
	ElseIf SlayerLVL == 74
		tSlayerXP = 1210421
	ElseIf SlayerLVL == 75
		tSlayerXP = 1336443
	ElseIf SlayerLVL == 75
		tSlayerXP = 1336443
	ElseIf SlayerLVL == 76
		tSlayerXP = 1475581
	ElseIf SlayerLVL == 77
		tSlayerXP = 1629200
	ElseIf SlayerLVL == 78
		tSlayerXP = 1798808
	ElseIf SlayerLVL == 79
		tSlayerXP = 1986068
	ElseIf SlayerLVL == 80
		tSlayerXP = 2192818
	ElseIf SlayerLVL == 81
		tSlayerXP = 2421087
	ElseIf SlayerLVL == 82
		tSlayerXP = 2673114
	ElseIf SlayerLVL == 83
		tSlayerXP = 2951373
	ElseIf SlayerLVL == 84
		tSlayerXP = 3258594
	ElseIf SlayerLVL == 85
		tSlayerXP = 3597792
	ElseIf SlayerLVL == 86
		tSlayerXP = 3972294
	ElseIf SlayerLVL == 87
		tSlayerXP = 4385776
	ElseIf SlayerLVL == 88
		tSlayerXP = 4842295
	ElseIf SlayerLVL == 89
		tSlayerXP = 5346332
	ElseIf SlayerLVL == 90
		tSlayerXP = 5902831
	ElseIf SlayerLVL == 91
		tSlayerXP = 6517253
	ElseIf SlayerLVL == 92
		tSlayerXP = 7195629
	ElseIf SlayerLVL == 93
		tSlayerXP = 7944614
	ElseIf SlayerLVL == 94
		tSlayerXP = 8771558
	ElseIf SlayerLVL == 95
		tSlayerXP = 9684577
	ElseIf SlayerLVL == 96
		tSlayerXP = 10692629
	ElseIf SlayerLVL == 97
		tSlayerXP = 11805606
	ElseIf SlayerLVL == 98
		tSlayerXP = 13034431
	Else
		tSlayerXP = 0
	EndIf
EndFunction

Function HunterInit()
	HunterLVL = RS_GV_HunterLVL.GetValue() as Int
	cHunterXP = RS_GV_HunterXP.GetValue() as Int
	If HunterLVL == 1
		tHunterXP = 83
	ElseIf HunterLVL == 2
		tHunterXP = 174
	ElseIf HunterLVL == 3
		tHunterXP = 276
	ElseIf HunterLVL == 4
		tHunterXP = 388
	ElseIf HunterLVL == 5
		tHunterXP = 512
	ElseIf HunterLVL == 6
		tHunterXP = 650
	ElseIf HunterLVL == 7
		tHunterXP = 801
	ElseIf HunterLVL == 8
		tHunterXP = 969
	ElseIf HunterLVL == 9
		tHunterXP = 1154
	ElseIf HunterLVL == 10
		tHunterXP = 1358
	ElseIf HunterLVL == 11
		tHunterXP = 1584
	ElseIf HunterLVL == 12
		tHunterXP = 1833
	ElseIf HunterLVL == 13
		tHunterXP = 2107
	ElseIf HunterLVL == 14
		tHunterXP = 2411
	ElseIf HunterLVL == 15
		tHunterXP = 2746
	ElseIf HunterLVL == 16
		tHunterXP = 3115
	ElseIf HunterLVL == 17
		tHunterXP = 3523
	ElseIf HunterLVL == 18
		tHunterXP = 3973
	ElseIf HunterLVL == 19
		tHunterXP = 4470
	ElseIf HunterLVL == 20
		tHunterXP = 5018
	ElseIf HunterLVL == 21
		tHunterXP = 5624
	ElseIf HunterLVL == 22
		tHunterXP = 6291
	ElseIf HunterLVL == 23
		tHunterXP = 7028
	ElseIf HunterLVL == 24
		tHunterXP = 7842
	ElseIf HunterLVL == 25
		tHunterXP = 8740
	ElseIf HunterLVL == 26
		tHunterXP = 9730
	ElseIf HunterLVL == 27
		tHunterXP = 10824
	ElseIf HunterLVL == 28
		tHunterXP = 12031
	ElseIf HunterLVL == 29
		tHunterXP = 13363
	ElseIf HunterLVL == 30
		tHunterXP = 14833
	ElseIf HunterLVL == 31
		tHunterXP = 16456
	ElseIf HunterLVL == 32
		tHunterXP = 18247
	ElseIf HunterLVL == 33
		tHunterXP = 20224
	ElseIf HunterLVL == 34
		tHunterXP = 22406
	ElseIf HunterLVL == 35
		tHunterXP = 24815
	ElseIf HunterLVL == 36
		tHunterXP = 27473
	ElseIf HunterLVL == 37
		tHunterXP = 30408
	ElseIf HunterLVL == 38
		tHunterXP = 33648
	ElseIf HunterLVL == 39
		tHunterXP = 37224
	ElseIf HunterLVL == 40
		tHunterXP = 41171
	ElseIf HunterLVL == 41
		tHunterXP = 45529
	ElseIf HunterLVL == 42
		tHunterXP = 50339
	ElseIf HunterLVL == 43
		tHunterXP = 55649
	ElseIf HunterLVL == 44
		tHunterXP = 61512
	ElseIf HunterLVL == 45
		tHunterXP = 67983
	ElseIf HunterLVL == 46
		tHunterXP = 75127
	ElseIf HunterLVL == 47
		tHunterXP = 83014
	ElseIf HunterLVL == 48
		tHunterXP = 91721
	ElseIf HunterLVL == 49
		tHunterXP = 101333
	ElseIf HunterLVL == 50
		tHunterXP = 111945
	ElseIf HunterLVL == 51
		tHunterXP = 123660
	ElseIf HunterLVL == 52
		tHunterXP = 136594
	ElseIf HunterLVL == 53
		tHunterXP = 150872
	ElseIf HunterLVL == 54
		tHunterXP = 166636
	ElseIf HunterLVL == 55
		tHunterXP = 184040
	ElseIf HunterLVL == 56
		tHunterXP = 203254
	ElseIf HunterLVL == 57
		tHunterXP = 224466
	ElseIf HunterLVL == 58
		tHunterXP = 247886
	ElseIf HunterLVL == 59
		tHunterXP = 273742
	ElseIf HunterLVL == 60
		tHunterXP = 302288
	ElseIf HunterLVL == 61
		tHunterXP = 333804
	ElseIf HunterLVL == 62
		tHunterXP = 368599
	ElseIf HunterLVL == 63
		tHunterXP = 407015
	ElseIf HunterLVL == 64
		tHunterXP = 449428
	ElseIf HunterLVL == 65
		tHunterXP = 496254
	ElseIf HunterLVL == 66
		tHunterXP = 547953
	ElseIf HunterLVL == 67
		tHunterXP = 605032
	ElseIf HunterLVL == 68
		tHunterXP = 668051
	ElseIf HunterLVL == 69
		tHunterXP = 737627
	ElseIf HunterLVL == 70
		tHunterXP = 814445
	ElseIf HunterLVL == 71
		tHunterXP = 899257
	ElseIf HunterLVL == 72
		tHunterXP = 992895
	ElseIf HunterLVL == 73
		tHunterXP = 1096278
	ElseIf HunterLVL == 74
		tHunterXP = 1210421
	ElseIf HunterLVL == 75
		tHunterXP = 1336443
	ElseIf HunterLVL == 75
		tHunterXP = 1336443
	ElseIf HunterLVL == 76
		tHunterXP = 1475581
	ElseIf HunterLVL == 77
		tHunterXP = 1629200
	ElseIf HunterLVL == 78
		tHunterXP = 1798808
	ElseIf HunterLVL == 79
		tHunterXP = 1986068
	ElseIf HunterLVL == 80
		tHunterXP = 2192818
	ElseIf HunterLVL == 81
		tHunterXP = 2421087
	ElseIf HunterLVL == 82
		tHunterXP = 2673114
	ElseIf HunterLVL == 83
		tHunterXP = 2951373
	ElseIf HunterLVL == 84
		tHunterXP = 3258594
	ElseIf HunterLVL == 85
		tHunterXP = 3597792
	ElseIf HunterLVL == 86
		tHunterXP = 3972294
	ElseIf HunterLVL == 87
		tHunterXP = 4385776
	ElseIf HunterLVL == 88
		tHunterXP = 4842295
	ElseIf HunterLVL == 89
		tHunterXP = 5346332
	ElseIf HunterLVL == 90
		tHunterXP = 5902831
	ElseIf HunterLVL == 91
		tHunterXP = 6517253
	ElseIf HunterLVL == 92
		tHunterXP = 7195629
	ElseIf HunterLVL == 93
		tHunterXP = 7944614
	ElseIf HunterLVL == 94
		tHunterXP = 8771558
	ElseIf HunterLVL == 95
		tHunterXP = 9684577
	ElseIf HunterLVL == 96
		tHunterXP = 10692629
	ElseIf HunterLVL == 97
		tHunterXP = 11805606
	ElseIf HunterLVL == 98
		tHunterXP = 13034431
	Else
		tHunterXP = 0
	EndIf
EndFunction

Function MiningInit()
	MiningLVL = RS_GV_MiningLVL.GetValue() as Int
	cMiningXP = RS_GV_MiningXP.GetValue() as Int
	If MiningLVL == 1
		tMiningXP = 83
	ElseIf MiningLVL == 2
		tMiningXP = 174
	ElseIf MiningLVL == 3
		tMiningXP = 276
	ElseIf MiningLVL == 4
		tMiningXP = 388
	ElseIf MiningLVL == 5
		tMiningXP = 512
	ElseIf MiningLVL == 6
		tMiningXP = 650
	ElseIf MiningLVL == 7
		tMiningXP = 801
	ElseIf MiningLVL == 8
		tMiningXP = 969
	ElseIf MiningLVL == 9
		tMiningXP = 1154
	ElseIf MiningLVL == 10
		tMiningXP = 1358
	ElseIf MiningLVL == 11
		tMiningXP = 1584
	ElseIf MiningLVL == 12
		tMiningXP = 1833
	ElseIf MiningLVL == 13
		tMiningXP = 2107
	ElseIf MiningLVL == 14
		tMiningXP = 2411
	ElseIf MiningLVL == 15
		tMiningXP = 2746
	ElseIf MiningLVL == 16
		tMiningXP = 3115
	ElseIf MiningLVL == 17
		tMiningXP = 3523
	ElseIf MiningLVL == 18
		tMiningXP = 3973
	ElseIf MiningLVL == 19
		tMiningXP = 4470
	ElseIf MiningLVL == 20
		tMiningXP = 5018
	ElseIf MiningLVL == 21
		tMiningXP = 5624
	ElseIf MiningLVL == 22
		tMiningXP = 6291
	ElseIf MiningLVL == 23
		tMiningXP = 7028
	ElseIf MiningLVL == 24
		tMiningXP = 7842
	ElseIf MiningLVL == 25
		tMiningXP = 8740
	ElseIf MiningLVL == 26
		tMiningXP = 9730
	ElseIf MiningLVL == 27
		tMiningXP = 10824
	ElseIf MiningLVL == 28
		tMiningXP = 12031
	ElseIf MiningLVL == 29
		tMiningXP = 13363
	ElseIf MiningLVL == 30
		tMiningXP = 14833
	ElseIf MiningLVL == 31
		tMiningXP = 16456
	ElseIf MiningLVL == 32
		tMiningXP = 18247
	ElseIf MiningLVL == 33
		tMiningXP = 20224
	ElseIf MiningLVL == 34
		tMiningXP = 22406
	ElseIf MiningLVL == 35
		tMiningXP = 24815
	ElseIf MiningLVL == 36
		tMiningXP = 27473
	ElseIf MiningLVL == 37
		tMiningXP = 30408
	ElseIf MiningLVL == 38
		tMiningXP = 33648
	ElseIf MiningLVL == 39
		tMiningXP = 37224
	ElseIf MiningLVL == 40
		tMiningXP = 41171
	ElseIf MiningLVL == 41
		tMiningXP = 45529
	ElseIf MiningLVL == 42
		tMiningXP = 50339
	ElseIf MiningLVL == 43
		tMiningXP = 55649
	ElseIf MiningLVL == 44
		tMiningXP = 61512
	ElseIf MiningLVL == 45
		tMiningXP = 67983
	ElseIf MiningLVL == 46
		tMiningXP = 75127
	ElseIf MiningLVL == 47
		tMiningXP = 83014
	ElseIf MiningLVL == 48
		tMiningXP = 91721
	ElseIf MiningLVL == 49
		tMiningXP = 101333
	ElseIf MiningLVL == 50
		tMiningXP = 111945
	ElseIf MiningLVL == 51
		tMiningXP = 123660
	ElseIf MiningLVL == 52
		tMiningXP = 136594
	ElseIf MiningLVL == 53
		tMiningXP = 150872
	ElseIf MiningLVL == 54
		tMiningXP = 166636
	ElseIf MiningLVL == 55
		tMiningXP = 184040
	ElseIf MiningLVL == 56
		tMiningXP = 203254
	ElseIf MiningLVL == 57
		tMiningXP = 224466
	ElseIf MiningLVL == 58
		tMiningXP = 247886
	ElseIf MiningLVL == 59
		tMiningXP = 273742
	ElseIf MiningLVL == 60
		tMiningXP = 302288
	ElseIf MiningLVL == 61
		tMiningXP = 333804
	ElseIf MiningLVL == 62
		tMiningXP = 368599
	ElseIf MiningLVL == 63
		tMiningXP = 407015
	ElseIf MiningLVL == 64
		tMiningXP = 449428
	ElseIf MiningLVL == 65
		tMiningXP = 496254
	ElseIf MiningLVL == 66
		tMiningXP = 547953
	ElseIf MiningLVL == 67
		tMiningXP = 605032
	ElseIf MiningLVL == 68
		tMiningXP = 668051
	ElseIf MiningLVL == 69
		tMiningXP = 737627
	ElseIf MiningLVL == 70
		tMiningXP = 814445
	ElseIf MiningLVL == 71
		tMiningXP = 899257
	ElseIf MiningLVL == 72
		tMiningXP = 992895
	ElseIf MiningLVL == 73
		tMiningXP = 1096278
	ElseIf MiningLVL == 74
		tMiningXP = 1210421
	ElseIf MiningLVL == 75
		tMiningXP = 1336443
	ElseIf MiningLVL == 75
		tMiningXP = 1336443
	ElseIf MiningLVL == 76
		tMiningXP = 1475581
	ElseIf MiningLVL == 77
		tMiningXP = 1629200
	ElseIf MiningLVL == 78
		tMiningXP = 1798808
	ElseIf MiningLVL == 79
		tMiningXP = 1986068
	ElseIf MiningLVL == 80
		tMiningXP = 2192818
	ElseIf MiningLVL == 81
		tMiningXP = 2421087
	ElseIf MiningLVL == 82
		tMiningXP = 2673114
	ElseIf MiningLVL == 83
		tMiningXP = 2951373
	ElseIf MiningLVL == 84
		tMiningXP = 3258594
	ElseIf MiningLVL == 85
		tMiningXP = 3597792
	ElseIf MiningLVL == 86
		tMiningXP = 3972294
	ElseIf MiningLVL == 87
		tMiningXP = 4385776
	ElseIf MiningLVL == 88
		tMiningXP = 4842295
	ElseIf MiningLVL == 89
		tMiningXP = 5346332
	ElseIf MiningLVL == 90
		tMiningXP = 5902831
	ElseIf MiningLVL == 91
		tMiningXP = 6517253
	ElseIf MiningLVL == 92
		tMiningXP = 7195629
	ElseIf MiningLVL == 93
		tMiningXP = 7944614
	ElseIf MiningLVL == 94
		tMiningXP = 8771558
	ElseIf MiningLVL == 95
		tMiningXP = 9684577
	ElseIf MiningLVL == 96
		tMiningXP = 10692629
	ElseIf MiningLVL == 97
		tMiningXP = 11805606
	ElseIf MiningLVL == 98
		tMiningXP = 13034431
	Else
		tMiningXP = 0
	EndIf
EndFunction

Function SmithingInit()
	SmithingLVL = RS_GV_SmithingLVL.GetValue() as Int
	cSmithingXP = RS_GV_SmithingXP.GetValue() as Int
	If SmithingLVL == 1
		tSmithingXP = 83
	ElseIf SmithingLVL == 2
		tSmithingXP = 174
	ElseIf SmithingLVL == 3
		tSmithingXP = 276
	ElseIf SmithingLVL == 4
		tSmithingXP = 388
	ElseIf SmithingLVL == 5
		tSmithingXP = 512
	ElseIf SmithingLVL == 6
		tSmithingXP = 650
	ElseIf SmithingLVL == 7
		tSmithingXP = 801
	ElseIf SmithingLVL == 8
		tSmithingXP = 969
	ElseIf SmithingLVL == 9
		tSmithingXP = 1154
	ElseIf SmithingLVL == 10
		tSmithingXP = 1358
	ElseIf SmithingLVL == 11
		tSmithingXP = 1584
	ElseIf SmithingLVL == 12
		tSmithingXP = 1833
	ElseIf SmithingLVL == 13
		tSmithingXP = 2107
	ElseIf SmithingLVL == 14
		tSmithingXP = 2411
	ElseIf SmithingLVL == 15
		tSmithingXP = 2746
	ElseIf SmithingLVL == 16
		tSmithingXP = 3115
	ElseIf SmithingLVL == 17
		tSmithingXP = 3523
	ElseIf SmithingLVL == 18
		tSmithingXP = 3973
	ElseIf SmithingLVL == 19
		tSmithingXP = 4470
	ElseIf SmithingLVL == 20
		tSmithingXP = 5018
	ElseIf SmithingLVL == 21
		tSmithingXP = 5624
	ElseIf SmithingLVL == 22
		tSmithingXP = 6291
	ElseIf SmithingLVL == 23
		tSmithingXP = 7028
	ElseIf SmithingLVL == 24
		tSmithingXP = 7842
	ElseIf SmithingLVL == 25
		tSmithingXP = 8740
	ElseIf SmithingLVL == 26
		tSmithingXP = 9730
	ElseIf SmithingLVL == 27
		tSmithingXP = 10824
	ElseIf SmithingLVL == 28
		tSmithingXP = 12031
	ElseIf SmithingLVL == 29
		tSmithingXP = 13363
	ElseIf SmithingLVL == 30
		tSmithingXP = 14833
	ElseIf SmithingLVL == 31
		tSmithingXP = 16456
	ElseIf SmithingLVL == 32
		tSmithingXP = 18247
	ElseIf SmithingLVL == 33
		tSmithingXP = 20224
	ElseIf SmithingLVL == 34
		tSmithingXP = 22406
	ElseIf SmithingLVL == 35
		tSmithingXP = 24815
	ElseIf SmithingLVL == 36
		tSmithingXP = 27473
	ElseIf SmithingLVL == 37
		tSmithingXP = 30408
	ElseIf SmithingLVL == 38
		tSmithingXP = 33648
	ElseIf SmithingLVL == 39
		tSmithingXP = 37224
	ElseIf SmithingLVL == 40
		tSmithingXP = 41171
	ElseIf SmithingLVL == 41
		tSmithingXP = 45529
	ElseIf SmithingLVL == 42
		tSmithingXP = 50339
	ElseIf SmithingLVL == 43
		tSmithingXP = 55649
	ElseIf SmithingLVL == 44
		tSmithingXP = 61512
	ElseIf SmithingLVL == 45
		tSmithingXP = 67983
	ElseIf SmithingLVL == 46
		tSmithingXP = 75127
	ElseIf SmithingLVL == 47
		tSmithingXP = 83014
	ElseIf SmithingLVL == 48
		tSmithingXP = 91721
	ElseIf SmithingLVL == 49
		tSmithingXP = 101333
	ElseIf SmithingLVL == 50
		tSmithingXP = 111945
	ElseIf SmithingLVL == 51
		tSmithingXP = 123660
	ElseIf SmithingLVL == 52
		tSmithingXP = 136594
	ElseIf SmithingLVL == 53
		tSmithingXP = 150872
	ElseIf SmithingLVL == 54
		tSmithingXP = 166636
	ElseIf SmithingLVL == 55
		tSmithingXP = 184040
	ElseIf SmithingLVL == 56
		tSmithingXP = 203254
	ElseIf SmithingLVL == 57
		tSmithingXP = 224466
	ElseIf SmithingLVL == 58
		tSmithingXP = 247886
	ElseIf SmithingLVL == 59
		tSmithingXP = 273742
	ElseIf SmithingLVL == 60
		tSmithingXP = 302288
	ElseIf SmithingLVL == 61
		tSmithingXP = 333804
	ElseIf SmithingLVL == 62
		tSmithingXP = 368599
	ElseIf SmithingLVL == 63
		tSmithingXP = 407015
	ElseIf SmithingLVL == 64
		tSmithingXP = 449428
	ElseIf SmithingLVL == 65
		tSmithingXP = 496254
	ElseIf SmithingLVL == 66
		tSmithingXP = 547953
	ElseIf SmithingLVL == 67
		tSmithingXP = 605032
	ElseIf SmithingLVL == 68
		tSmithingXP = 668051
	ElseIf SmithingLVL == 69
		tSmithingXP = 737627
	ElseIf SmithingLVL == 70
		tSmithingXP = 814445
	ElseIf SmithingLVL == 71
		tSmithingXP = 899257
	ElseIf SmithingLVL == 72
		tSmithingXP = 992895
	ElseIf SmithingLVL == 73
		tSmithingXP = 1096278
	ElseIf SmithingLVL == 74
		tSmithingXP = 1210421
	ElseIf SmithingLVL == 75
		tSmithingXP = 1336443
	ElseIf SmithingLVL == 75
		tSmithingXP = 1336443
	ElseIf SmithingLVL == 76
		tSmithingXP = 1475581
	ElseIf SmithingLVL == 77
		tSmithingXP = 1629200
	ElseIf SmithingLVL == 78
		tSmithingXP = 1798808
	ElseIf SmithingLVL == 79
		tSmithingXP = 1986068
	ElseIf SmithingLVL == 80
		tSmithingXP = 2192818
	ElseIf SmithingLVL == 81
		tSmithingXP = 2421087
	ElseIf SmithingLVL == 82
		tSmithingXP = 2673114
	ElseIf SmithingLVL == 83
		tSmithingXP = 2951373
	ElseIf SmithingLVL == 84
		tSmithingXP = 3258594
	ElseIf SmithingLVL == 85
		tSmithingXP = 3597792
	ElseIf SmithingLVL == 86
		tSmithingXP = 3972294
	ElseIf SmithingLVL == 87
		tSmithingXP = 4385776
	ElseIf SmithingLVL == 88
		tSmithingXP = 4842295
	ElseIf SmithingLVL == 89
		tSmithingXP = 5346332
	ElseIf SmithingLVL == 90
		tSmithingXP = 5902831
	ElseIf SmithingLVL == 91
		tSmithingXP = 6517253
	ElseIf SmithingLVL == 92
		tSmithingXP = 7195629
	ElseIf SmithingLVL == 93
		tSmithingXP = 7944614
	ElseIf SmithingLVL == 94
		tSmithingXP = 8771558
	ElseIf SmithingLVL == 95
		tSmithingXP = 9684577
	ElseIf SmithingLVL == 96
		tSmithingXP = 10692629
	ElseIf SmithingLVL == 97
		tSmithingXP = 11805606
	ElseIf SmithingLVL == 98
		tSmithingXP = 13034431
	Else
		tSmithingXP = 0
	EndIf
EndFunction

Function FishingInit()
	FishingLVL = RS_GV_FishingLVL.GetValue() as Int
	cFishingXP = RS_GV_FishingXP.GetValue() as Int
	If FishingLVL == 1
		tFishingXP = 83
	ElseIf FishingLVL == 2
		tFishingXP = 174
	ElseIf FishingLVL == 3
		tFishingXP = 276
	ElseIf FishingLVL == 4
		tFishingXP = 388
	ElseIf FishingLVL == 5
		tFishingXP = 512
	ElseIf FishingLVL == 6
		tFishingXP = 650
	ElseIf FishingLVL == 7
		tFishingXP = 801
	ElseIf FishingLVL == 8
		tFishingXP = 969
	ElseIf FishingLVL == 9
		tFishingXP = 1154
	ElseIf FishingLVL == 10
		tFishingXP = 1358
	ElseIf FishingLVL == 11
		tFishingXP = 1584
	ElseIf FishingLVL == 12
		tFishingXP = 1833
	ElseIf FishingLVL == 13
		tFishingXP = 2107
	ElseIf FishingLVL == 14
		tFishingXP = 2411
	ElseIf FishingLVL == 15
		tFishingXP = 2746
	ElseIf FishingLVL == 16
		tFishingXP = 3115
	ElseIf FishingLVL == 17
		tFishingXP = 3523
	ElseIf FishingLVL == 18
		tFishingXP = 3973
	ElseIf FishingLVL == 19
		tFishingXP = 4470
	ElseIf FishingLVL == 20
		tFishingXP = 5018
	ElseIf FishingLVL == 21
		tFishingXP = 5624
	ElseIf FishingLVL == 22
		tFishingXP = 6291
	ElseIf FishingLVL == 23
		tFishingXP = 7028
	ElseIf FishingLVL == 24
		tFishingXP = 7842
	ElseIf FishingLVL == 25
		tFishingXP = 8740
	ElseIf FishingLVL == 26
		tFishingXP = 9730
	ElseIf FishingLVL == 27
		tFishingXP = 10824
	ElseIf FishingLVL == 28
		tFishingXP = 12031
	ElseIf FishingLVL == 29
		tFishingXP = 13363
	ElseIf FishingLVL == 30
		tFishingXP = 14833
	ElseIf FishingLVL == 31
		tFishingXP = 16456
	ElseIf FishingLVL == 32
		tFishingXP = 18247
	ElseIf FishingLVL == 33
		tFishingXP = 20224
	ElseIf FishingLVL == 34
		tFishingXP = 22406
	ElseIf FishingLVL == 35
		tFishingXP = 24815
	ElseIf FishingLVL == 36
		tFishingXP = 27473
	ElseIf FishingLVL == 37
		tFishingXP = 30408
	ElseIf FishingLVL == 38
		tFishingXP = 33648
	ElseIf FishingLVL == 39
		tFishingXP = 37224
	ElseIf FishingLVL == 40
		tFishingXP = 41171
	ElseIf FishingLVL == 41
		tFishingXP = 45529
	ElseIf FishingLVL == 42
		tFishingXP = 50339
	ElseIf FishingLVL == 43
		tFishingXP = 55649
	ElseIf FishingLVL == 44
		tFishingXP = 61512
	ElseIf FishingLVL == 45
		tFishingXP = 67983
	ElseIf FishingLVL == 46
		tFishingXP = 75127
	ElseIf FishingLVL == 47
		tFishingXP = 83014
	ElseIf FishingLVL == 48
		tFishingXP = 91721
	ElseIf FishingLVL == 49
		tFishingXP = 101333
	ElseIf FishingLVL == 50
		tFishingXP = 111945
	ElseIf FishingLVL == 51
		tFishingXP = 123660
	ElseIf FishingLVL == 52
		tFishingXP = 136594
	ElseIf FishingLVL == 53
		tFishingXP = 150872
	ElseIf FishingLVL == 54
		tFishingXP = 166636
	ElseIf FishingLVL == 55
		tFishingXP = 184040
	ElseIf FishingLVL == 56
		tFishingXP = 203254
	ElseIf FishingLVL == 57
		tFishingXP = 224466
	ElseIf FishingLVL == 58
		tFishingXP = 247886
	ElseIf FishingLVL == 59
		tFishingXP = 273742
	ElseIf FishingLVL == 60
		tFishingXP = 302288
	ElseIf FishingLVL == 61
		tFishingXP = 333804
	ElseIf FishingLVL == 62
		tFishingXP = 368599
	ElseIf FishingLVL == 63
		tFishingXP = 407015
	ElseIf FishingLVL == 64
		tFishingXP = 449428
	ElseIf FishingLVL == 65
		tFishingXP = 496254
	ElseIf FishingLVL == 66
		tFishingXP = 547953
	ElseIf FishingLVL == 67
		tFishingXP = 605032
	ElseIf FishingLVL == 68
		tFishingXP = 668051
	ElseIf FishingLVL == 69
		tFishingXP = 737627
	ElseIf FishingLVL == 70
		tFishingXP = 814445
	ElseIf FishingLVL == 71
		tFishingXP = 899257
	ElseIf FishingLVL == 72
		tFishingXP = 992895
	ElseIf FishingLVL == 73
		tFishingXP = 1096278
	ElseIf FishingLVL == 74
		tFishingXP = 1210421
	ElseIf FishingLVL == 75
		tFishingXP = 1336443
	ElseIf FishingLVL == 75
		tFishingXP = 1336443
	ElseIf FishingLVL == 76
		tFishingXP = 1475581
	ElseIf FishingLVL == 77
		tFishingXP = 1629200
	ElseIf FishingLVL == 78
		tFishingXP = 1798808
	ElseIf FishingLVL == 79
		tFishingXP = 1986068
	ElseIf FishingLVL == 80
		tFishingXP = 2192818
	ElseIf FishingLVL == 81
		tFishingXP = 2421087
	ElseIf FishingLVL == 82
		tFishingXP = 2673114
	ElseIf FishingLVL == 83
		tFishingXP = 2951373
	ElseIf FishingLVL == 84
		tFishingXP = 3258594
	ElseIf FishingLVL == 85
		tFishingXP = 3597792
	ElseIf FishingLVL == 86
		tFishingXP = 3972294
	ElseIf FishingLVL == 87
		tFishingXP = 4385776
	ElseIf FishingLVL == 88
		tFishingXP = 4842295
	ElseIf FishingLVL == 89
		tFishingXP = 5346332
	ElseIf FishingLVL == 90
		tFishingXP = 5902831
	ElseIf FishingLVL == 91
		tFishingXP = 6517253
	ElseIf FishingLVL == 92
		tFishingXP = 7195629
	ElseIf FishingLVL == 93
		tFishingXP = 7944614
	ElseIf FishingLVL == 94
		tFishingXP = 8771558
	ElseIf FishingLVL == 95
		tFishingXP = 9684577
	ElseIf FishingLVL == 96
		tFishingXP = 10692629
	ElseIf FishingLVL == 97
		tFishingXP = 11805606
	ElseIf FishingLVL == 98
		tFishingXP = 13034431
	Else
		tFishingXP = 0
	EndIf
EndFunction

Function CookingInit()
	CookingLVL = RS_GV_CookingLVL.GetValue() as Int
	cCookingXP = RS_GV_CookingXP.GetValue() as Int
	If CookingLVL == 1
		tCookingXP = 83
	ElseIf CookingLVL == 2
		tCookingXP = 174
	ElseIf CookingLVL == 3
		tCookingXP = 276
	ElseIf CookingLVL == 4
		tCookingXP = 388
	ElseIf CookingLVL == 5
		tCookingXP = 512
	ElseIf CookingLVL == 6
		tCookingXP = 650
	ElseIf CookingLVL == 7
		tCookingXP = 801
	ElseIf CookingLVL == 8
		tCookingXP = 969
	ElseIf CookingLVL == 9
		tCookingXP = 1154
	ElseIf CookingLVL == 10
		tCookingXP = 1358
	ElseIf CookingLVL == 11
		tCookingXP = 1584
	ElseIf CookingLVL == 12
		tCookingXP = 1833
	ElseIf CookingLVL == 13
		tCookingXP = 2107
	ElseIf CookingLVL == 14
		tCookingXP = 2411
	ElseIf CookingLVL == 15
		tCookingXP = 2746
	ElseIf CookingLVL == 16
		tCookingXP = 3115
	ElseIf CookingLVL == 17
		tCookingXP = 3523
	ElseIf CookingLVL == 18
		tCookingXP = 3973
	ElseIf CookingLVL == 19
		tCookingXP = 4470
	ElseIf CookingLVL == 20
		tCookingXP = 5018
	ElseIf CookingLVL == 21
		tCookingXP = 5624
	ElseIf CookingLVL == 22
		tCookingXP = 6291
	ElseIf CookingLVL == 23
		tCookingXP = 7028
	ElseIf CookingLVL == 24
		tCookingXP = 7842
	ElseIf CookingLVL == 25
		tCookingXP = 8740
	ElseIf CookingLVL == 26
		tCookingXP = 9730
	ElseIf CookingLVL == 27
		tCookingXP = 10824
	ElseIf CookingLVL == 28
		tCookingXP = 12031
	ElseIf CookingLVL == 29
		tCookingXP = 13363
	ElseIf CookingLVL == 30
		tCookingXP = 14833
	ElseIf CookingLVL == 31
		tCookingXP = 16456
	ElseIf CookingLVL == 32
		tCookingXP = 18247
	ElseIf CookingLVL == 33
		tCookingXP = 20224
	ElseIf CookingLVL == 34
		tCookingXP = 22406
	ElseIf CookingLVL == 35
		tCookingXP = 24815
	ElseIf CookingLVL == 36
		tCookingXP = 27473
	ElseIf CookingLVL == 37
		tCookingXP = 30408
	ElseIf CookingLVL == 38
		tCookingXP = 33648
	ElseIf CookingLVL == 39
		tCookingXP = 37224
	ElseIf CookingLVL == 40
		tCookingXP = 41171
	ElseIf CookingLVL == 41
		tCookingXP = 45529
	ElseIf CookingLVL == 42
		tCookingXP = 50339
	ElseIf CookingLVL == 43
		tCookingXP = 55649
	ElseIf CookingLVL == 44
		tCookingXP = 61512
	ElseIf CookingLVL == 45
		tCookingXP = 67983
	ElseIf CookingLVL == 46
		tCookingXP = 75127
	ElseIf CookingLVL == 47
		tCookingXP = 83014
	ElseIf CookingLVL == 48
		tCookingXP = 91721
	ElseIf CookingLVL == 49
		tCookingXP = 101333
	ElseIf CookingLVL == 50
		tCookingXP = 111945
	ElseIf CookingLVL == 51
		tCookingXP = 123660
	ElseIf CookingLVL == 52
		tCookingXP = 136594
	ElseIf CookingLVL == 53
		tCookingXP = 150872
	ElseIf CookingLVL == 54
		tCookingXP = 166636
	ElseIf CookingLVL == 55
		tCookingXP = 184040
	ElseIf CookingLVL == 56
		tCookingXP = 203254
	ElseIf CookingLVL == 57
		tCookingXP = 224466
	ElseIf CookingLVL == 58
		tCookingXP = 247886
	ElseIf CookingLVL == 59
		tCookingXP = 273742
	ElseIf CookingLVL == 60
		tCookingXP = 302288
	ElseIf CookingLVL == 61
		tCookingXP = 333804
	ElseIf CookingLVL == 62
		tCookingXP = 368599
	ElseIf CookingLVL == 63
		tCookingXP = 407015
	ElseIf CookingLVL == 64
		tCookingXP = 449428
	ElseIf CookingLVL == 65
		tCookingXP = 496254
	ElseIf CookingLVL == 66
		tCookingXP = 547953
	ElseIf CookingLVL == 67
		tCookingXP = 605032
	ElseIf CookingLVL == 68
		tCookingXP = 668051
	ElseIf CookingLVL == 69
		tCookingXP = 737627
	ElseIf CookingLVL == 70
		tCookingXP = 814445
	ElseIf CookingLVL == 71
		tCookingXP = 899257
	ElseIf CookingLVL == 72
		tCookingXP = 992895
	ElseIf CookingLVL == 73
		tCookingXP = 1096278
	ElseIf CookingLVL == 74
		tCookingXP = 1210421
	ElseIf CookingLVL == 75
		tCookingXP = 1336443
	ElseIf CookingLVL == 75
		tCookingXP = 1336443
	ElseIf CookingLVL == 76
		tCookingXP = 1475581
	ElseIf CookingLVL == 77
		tCookingXP = 1629200
	ElseIf CookingLVL == 78
		tCookingXP = 1798808
	ElseIf CookingLVL == 79
		tCookingXP = 1986068
	ElseIf CookingLVL == 80
		tCookingXP = 2192818
	ElseIf CookingLVL == 81
		tCookingXP = 2421087
	ElseIf CookingLVL == 82
		tCookingXP = 2673114
	ElseIf CookingLVL == 83
		tCookingXP = 2951373
	ElseIf CookingLVL == 84
		tCookingXP = 3258594
	ElseIf CookingLVL == 85
		tCookingXP = 3597792
	ElseIf CookingLVL == 86
		tCookingXP = 3972294
	ElseIf CookingLVL == 87
		tCookingXP = 4385776
	ElseIf CookingLVL == 88
		tCookingXP = 4842295
	ElseIf CookingLVL == 89
		tCookingXP = 5346332
	ElseIf CookingLVL == 90
		tCookingXP = 5902831
	ElseIf CookingLVL == 91
		tCookingXP = 6517253
	ElseIf CookingLVL == 92
		tCookingXP = 7195629
	ElseIf CookingLVL == 93
		tCookingXP = 7944614
	ElseIf CookingLVL == 94
		tCookingXP = 8771558
	ElseIf CookingLVL == 95
		tCookingXP = 9684577
	ElseIf CookingLVL == 96
		tCookingXP = 10692629
	ElseIf CookingLVL == 97
		tCookingXP = 11805606
	ElseIf CookingLVL == 98
		tCookingXP = 13034431
	Else
		tCookingXP = 0
	EndIf
EndFunction

Function FiremakingInit()
	FiremakingLVL = RS_GV_FiremakingLVL.GetValue() as Int
	cFiremakingXP = RS_GV_FiremakingXP.GetValue() as Int
	If FiremakingLVL == 1
		tFiremakingXP = 83
	ElseIf FiremakingLVL == 2
		tFiremakingXP = 174
	ElseIf FiremakingLVL == 3
		tFiremakingXP = 276
	ElseIf FiremakingLVL == 4
		tFiremakingXP = 388
	ElseIf FiremakingLVL == 5
		tFiremakingXP = 512
	ElseIf FiremakingLVL == 6
		tFiremakingXP = 650
	ElseIf FiremakingLVL == 7
		tFiremakingXP = 801
	ElseIf FiremakingLVL == 8
		tFiremakingXP = 969
	ElseIf FiremakingLVL == 9
		tFiremakingXP = 1154
	ElseIf FiremakingLVL == 10
		tFiremakingXP = 1358
	ElseIf FiremakingLVL == 11
		tFiremakingXP = 1584
	ElseIf FiremakingLVL == 12
		tFiremakingXP = 1833
	ElseIf FiremakingLVL == 13
		tFiremakingXP = 2107
	ElseIf FiremakingLVL == 14
		tFiremakingXP = 2411
	ElseIf FiremakingLVL == 15
		tFiremakingXP = 2746
	ElseIf FiremakingLVL == 16
		tFiremakingXP = 3115
	ElseIf FiremakingLVL == 17
		tFiremakingXP = 3523
	ElseIf FiremakingLVL == 18
		tFiremakingXP = 3973
	ElseIf FiremakingLVL == 19
		tFiremakingXP = 4470
	ElseIf FiremakingLVL == 20
		tFiremakingXP = 5018
	ElseIf FiremakingLVL == 21
		tFiremakingXP = 5624
	ElseIf FiremakingLVL == 22
		tFiremakingXP = 6291
	ElseIf FiremakingLVL == 23
		tFiremakingXP = 7028
	ElseIf FiremakingLVL == 24
		tFiremakingXP = 7842
	ElseIf FiremakingLVL == 25
		tFiremakingXP = 8740
	ElseIf FiremakingLVL == 26
		tFiremakingXP = 9730
	ElseIf FiremakingLVL == 27
		tFiremakingXP = 10824
	ElseIf FiremakingLVL == 28
		tFiremakingXP = 12031
	ElseIf FiremakingLVL == 29
		tFiremakingXP = 13363
	ElseIf FiremakingLVL == 30
		tFiremakingXP = 14833
	ElseIf FiremakingLVL == 31
		tFiremakingXP = 16456
	ElseIf FiremakingLVL == 32
		tFiremakingXP = 18247
	ElseIf FiremakingLVL == 33
		tFiremakingXP = 20224
	ElseIf FiremakingLVL == 34
		tFiremakingXP = 22406
	ElseIf FiremakingLVL == 35
		tFiremakingXP = 24815
	ElseIf FiremakingLVL == 36
		tFiremakingXP = 27473
	ElseIf FiremakingLVL == 37
		tFiremakingXP = 30408
	ElseIf FiremakingLVL == 38
		tFiremakingXP = 33648
	ElseIf FiremakingLVL == 39
		tFiremakingXP = 37224
	ElseIf FiremakingLVL == 40
		tFiremakingXP = 41171
	ElseIf FiremakingLVL == 41
		tFiremakingXP = 45529
	ElseIf FiremakingLVL == 42
		tFiremakingXP = 50339
	ElseIf FiremakingLVL == 43
		tFiremakingXP = 55649
	ElseIf FiremakingLVL == 44
		tFiremakingXP = 61512
	ElseIf FiremakingLVL == 45
		tFiremakingXP = 67983
	ElseIf FiremakingLVL == 46
		tFiremakingXP = 75127
	ElseIf FiremakingLVL == 47
		tFiremakingXP = 83014
	ElseIf FiremakingLVL == 48
		tFiremakingXP = 91721
	ElseIf FiremakingLVL == 49
		tFiremakingXP = 101333
	ElseIf FiremakingLVL == 50
		tFiremakingXP = 111945
	ElseIf FiremakingLVL == 51
		tFiremakingXP = 123660
	ElseIf FiremakingLVL == 52
		tFiremakingXP = 136594
	ElseIf FiremakingLVL == 53
		tFiremakingXP = 150872
	ElseIf FiremakingLVL == 54
		tFiremakingXP = 166636
	ElseIf FiremakingLVL == 55
		tFiremakingXP = 184040
	ElseIf FiremakingLVL == 56
		tFiremakingXP = 203254
	ElseIf FiremakingLVL == 57
		tFiremakingXP = 224466
	ElseIf FiremakingLVL == 58
		tFiremakingXP = 247886
	ElseIf FiremakingLVL == 59
		tFiremakingXP = 273742
	ElseIf FiremakingLVL == 60
		tFiremakingXP = 302288
	ElseIf FiremakingLVL == 61
		tFiremakingXP = 333804
	ElseIf FiremakingLVL == 62
		tFiremakingXP = 368599
	ElseIf FiremakingLVL == 63
		tFiremakingXP = 407015
	ElseIf FiremakingLVL == 64
		tFiremakingXP = 449428
	ElseIf FiremakingLVL == 65
		tFiremakingXP = 496254
	ElseIf FiremakingLVL == 66
		tFiremakingXP = 547953
	ElseIf FiremakingLVL == 67
		tFiremakingXP = 605032
	ElseIf FiremakingLVL == 68
		tFiremakingXP = 668051
	ElseIf FiremakingLVL == 69
		tFiremakingXP = 737627
	ElseIf FiremakingLVL == 70
		tFiremakingXP = 814445
	ElseIf FiremakingLVL == 71
		tFiremakingXP = 899257
	ElseIf FiremakingLVL == 72
		tFiremakingXP = 992895
	ElseIf FiremakingLVL == 73
		tFiremakingXP = 1096278
	ElseIf FiremakingLVL == 74
		tFiremakingXP = 1210421
	ElseIf FiremakingLVL == 75
		tFiremakingXP = 1336443
	ElseIf FiremakingLVL == 75
		tFiremakingXP = 1336443
	ElseIf FiremakingLVL == 76
		tFiremakingXP = 1475581
	ElseIf FiremakingLVL == 77
		tFiremakingXP = 1629200
	ElseIf FiremakingLVL == 78
		tFiremakingXP = 1798808
	ElseIf FiremakingLVL == 79
		tFiremakingXP = 1986068
	ElseIf FiremakingLVL == 80
		tFiremakingXP = 2192818
	ElseIf FiremakingLVL == 81
		tFiremakingXP = 2421087
	ElseIf FiremakingLVL == 82
		tFiremakingXP = 2673114
	ElseIf FiremakingLVL == 83
		tFiremakingXP = 2951373
	ElseIf FiremakingLVL == 84
		tFiremakingXP = 3258594
	ElseIf FiremakingLVL == 85
		tFiremakingXP = 3597792
	ElseIf FiremakingLVL == 86
		tFiremakingXP = 3972294
	ElseIf FiremakingLVL == 87
		tFiremakingXP = 4385776
	ElseIf FiremakingLVL == 88
		tFiremakingXP = 4842295
	ElseIf FiremakingLVL == 89
		tFiremakingXP = 5346332
	ElseIf FiremakingLVL == 90
		tFiremakingXP = 5902831
	ElseIf FiremakingLVL == 91
		tFiremakingXP = 6517253
	ElseIf FiremakingLVL == 92
		tFiremakingXP = 7195629
	ElseIf FiremakingLVL == 93
		tFiremakingXP = 7944614
	ElseIf FiremakingLVL == 94
		tFiremakingXP = 8771558
	ElseIf FiremakingLVL == 95
		tFiremakingXP = 9684577
	ElseIf FiremakingLVL == 96
		tFiremakingXP = 10692629
	ElseIf FiremakingLVL == 97
		tFiremakingXP = 11805606
	ElseIf FiremakingLVL == 98
		tFiremakingXP = 13034431
	Else
		tFiremakingXP = 0
	EndIf
EndFunction

Function WoodcuttingInit()
	WoodcuttingLVL = RS_GV_WoodcuttingLVL.GetValue() as Int
	cWoodcuttingXP = RS_GV_WoodcuttingXP.GetValue() as Int
	If WoodcuttingLVL == 1
		tWoodcuttingXP = 83
	ElseIf WoodcuttingLVL == 2
		tWoodcuttingXP = 174
	ElseIf WoodcuttingLVL == 3
		tWoodcuttingXP = 276
	ElseIf WoodcuttingLVL == 4
		tWoodcuttingXP = 388
	ElseIf WoodcuttingLVL == 5
		tWoodcuttingXP = 512
	ElseIf WoodcuttingLVL == 6
		tWoodcuttingXP = 650
	ElseIf WoodcuttingLVL == 7
		tWoodcuttingXP = 801
	ElseIf WoodcuttingLVL == 8
		tWoodcuttingXP = 969
	ElseIf WoodcuttingLVL == 9
		tWoodcuttingXP = 1154
	ElseIf WoodcuttingLVL == 10
		tWoodcuttingXP = 1358
	ElseIf WoodcuttingLVL == 11
		tWoodcuttingXP = 1584
	ElseIf WoodcuttingLVL == 12
		tWoodcuttingXP = 1833
	ElseIf WoodcuttingLVL == 13
		tWoodcuttingXP = 2107
	ElseIf WoodcuttingLVL == 14
		tWoodcuttingXP = 2411
	ElseIf WoodcuttingLVL == 15
		tWoodcuttingXP = 2746
	ElseIf WoodcuttingLVL == 16
		tWoodcuttingXP = 3115
	ElseIf WoodcuttingLVL == 17
		tWoodcuttingXP = 3523
	ElseIf WoodcuttingLVL == 18
		tWoodcuttingXP = 3973
	ElseIf WoodcuttingLVL == 19
		tWoodcuttingXP = 4470
	ElseIf WoodcuttingLVL == 20
		tWoodcuttingXP = 5018
	ElseIf WoodcuttingLVL == 21
		tWoodcuttingXP = 5624
	ElseIf WoodcuttingLVL == 22
		tWoodcuttingXP = 6291
	ElseIf WoodcuttingLVL == 23
		tWoodcuttingXP = 7028
	ElseIf WoodcuttingLVL == 24
		tWoodcuttingXP = 7842
	ElseIf WoodcuttingLVL == 25
		tWoodcuttingXP = 8740
	ElseIf WoodcuttingLVL == 26
		tWoodcuttingXP = 9730
	ElseIf WoodcuttingLVL == 27
		tWoodcuttingXP = 10824
	ElseIf WoodcuttingLVL == 28
		tWoodcuttingXP = 12031
	ElseIf WoodcuttingLVL == 29
		tWoodcuttingXP = 13363
	ElseIf WoodcuttingLVL == 30
		tWoodcuttingXP = 14833
	ElseIf WoodcuttingLVL == 31
		tWoodcuttingXP = 16456
	ElseIf WoodcuttingLVL == 32
		tWoodcuttingXP = 18247
	ElseIf WoodcuttingLVL == 33
		tWoodcuttingXP = 20224
	ElseIf WoodcuttingLVL == 34
		tWoodcuttingXP = 22406
	ElseIf WoodcuttingLVL == 35
		tWoodcuttingXP = 24815
	ElseIf WoodcuttingLVL == 36
		tWoodcuttingXP = 27473
	ElseIf WoodcuttingLVL == 37
		tWoodcuttingXP = 30408
	ElseIf WoodcuttingLVL == 38
		tWoodcuttingXP = 33648
	ElseIf WoodcuttingLVL == 39
		tWoodcuttingXP = 37224
	ElseIf WoodcuttingLVL == 40
		tWoodcuttingXP = 41171
	ElseIf WoodcuttingLVL == 41
		tWoodcuttingXP = 45529
	ElseIf WoodcuttingLVL == 42
		tWoodcuttingXP = 50339
	ElseIf WoodcuttingLVL == 43
		tWoodcuttingXP = 55649
	ElseIf WoodcuttingLVL == 44
		tWoodcuttingXP = 61512
	ElseIf WoodcuttingLVL == 45
		tWoodcuttingXP = 67983
	ElseIf WoodcuttingLVL == 46
		tWoodcuttingXP = 75127
	ElseIf WoodcuttingLVL == 47
		tWoodcuttingXP = 83014
	ElseIf WoodcuttingLVL == 48
		tWoodcuttingXP = 91721
	ElseIf WoodcuttingLVL == 49
		tWoodcuttingXP = 101333
	ElseIf WoodcuttingLVL == 50
		tWoodcuttingXP = 111945
	ElseIf WoodcuttingLVL == 51
		tWoodcuttingXP = 123660
	ElseIf WoodcuttingLVL == 52
		tWoodcuttingXP = 136594
	ElseIf WoodcuttingLVL == 53
		tWoodcuttingXP = 150872
	ElseIf WoodcuttingLVL == 54
		tWoodcuttingXP = 166636
	ElseIf WoodcuttingLVL == 55
		tWoodcuttingXP = 184040
	ElseIf WoodcuttingLVL == 56
		tWoodcuttingXP = 203254
	ElseIf WoodcuttingLVL == 57
		tWoodcuttingXP = 224466
	ElseIf WoodcuttingLVL == 58
		tWoodcuttingXP = 247886
	ElseIf WoodcuttingLVL == 59
		tWoodcuttingXP = 273742
	ElseIf WoodcuttingLVL == 60
		tWoodcuttingXP = 302288
	ElseIf WoodcuttingLVL == 61
		tWoodcuttingXP = 333804
	ElseIf WoodcuttingLVL == 62
		tWoodcuttingXP = 368599
	ElseIf WoodcuttingLVL == 63
		tWoodcuttingXP = 407015
	ElseIf WoodcuttingLVL == 64
		tWoodcuttingXP = 449428
	ElseIf WoodcuttingLVL == 65
		tWoodcuttingXP = 496254
	ElseIf WoodcuttingLVL == 66
		tWoodcuttingXP = 547953
	ElseIf WoodcuttingLVL == 67
		tWoodcuttingXP = 605032
	ElseIf WoodcuttingLVL == 68
		tWoodcuttingXP = 668051
	ElseIf WoodcuttingLVL == 69
		tWoodcuttingXP = 737627
	ElseIf WoodcuttingLVL == 70
		tWoodcuttingXP = 814445
	ElseIf WoodcuttingLVL == 71
		tWoodcuttingXP = 899257
	ElseIf WoodcuttingLVL == 72
		tWoodcuttingXP = 992895
	ElseIf WoodcuttingLVL == 73
		tWoodcuttingXP = 1096278
	ElseIf WoodcuttingLVL == 74
		tWoodcuttingXP = 1210421
	ElseIf WoodcuttingLVL == 75
		tWoodcuttingXP = 1336443
	ElseIf WoodcuttingLVL == 75
		tWoodcuttingXP = 1336443
	ElseIf WoodcuttingLVL == 76
		tWoodcuttingXP = 1475581
	ElseIf WoodcuttingLVL == 77
		tWoodcuttingXP = 1629200
	ElseIf WoodcuttingLVL == 78
		tWoodcuttingXP = 1798808
	ElseIf WoodcuttingLVL == 79
		tWoodcuttingXP = 1986068
	ElseIf WoodcuttingLVL == 80
		tWoodcuttingXP = 2192818
	ElseIf WoodcuttingLVL == 81
		tWoodcuttingXP = 2421087
	ElseIf WoodcuttingLVL == 82
		tWoodcuttingXP = 2673114
	ElseIf WoodcuttingLVL == 83
		tWoodcuttingXP = 2951373
	ElseIf WoodcuttingLVL == 84
		tWoodcuttingXP = 3258594
	ElseIf WoodcuttingLVL == 85
		tWoodcuttingXP = 3597792
	ElseIf WoodcuttingLVL == 86
		tWoodcuttingXP = 3972294
	ElseIf WoodcuttingLVL == 87
		tWoodcuttingXP = 4385776
	ElseIf WoodcuttingLVL == 88
		tWoodcuttingXP = 4842295
	ElseIf WoodcuttingLVL == 89
		tWoodcuttingXP = 5346332
	ElseIf WoodcuttingLVL == 90
		tWoodcuttingXP = 5902831
	ElseIf WoodcuttingLVL == 91
		tWoodcuttingXP = 6517253
	ElseIf WoodcuttingLVL == 92
		tWoodcuttingXP = 7195629
	ElseIf WoodcuttingLVL == 93
		tWoodcuttingXP = 7944614
	ElseIf WoodcuttingLVL == 94
		tWoodcuttingXP = 8771558
	ElseIf WoodcuttingLVL == 95
		tWoodcuttingXP = 9684577
	ElseIf WoodcuttingLVL == 96
		tWoodcuttingXP = 10692629
	ElseIf WoodcuttingLVL == 97
		tWoodcuttingXP = 11805606
	ElseIf WoodcuttingLVL == 98
		tWoodcuttingXP = 13034431
	Else
		tWoodcuttingXP = 0
	EndIf
EndFunction

Function FarmingInit()
	FarmingLVL = RS_GV_FarmingLVL.GetValue() as Int
	cFarmingXP = RS_GV_FarmingXP.GetValue() as Int
	If FarmingLVL == 1
		tFarmingXP = 83
	ElseIf FarmingLVL == 2
		tFarmingXP = 174
	ElseIf FarmingLVL == 3
		tFarmingXP = 276
	ElseIf FarmingLVL == 4
		tFarmingXP = 388
	ElseIf FarmingLVL == 5
		tFarmingXP = 512
	ElseIf FarmingLVL == 6
		tFarmingXP = 650
	ElseIf FarmingLVL == 7
		tFarmingXP = 801
	ElseIf FarmingLVL == 8
		tFarmingXP = 969
	ElseIf FarmingLVL == 9
		tFarmingXP = 1154
	ElseIf FarmingLVL == 10
		tFarmingXP = 1358
	ElseIf FarmingLVL == 11
		tFarmingXP = 1584
	ElseIf FarmingLVL == 12
		tFarmingXP = 1833
	ElseIf FarmingLVL == 13
		tFarmingXP = 2107
	ElseIf FarmingLVL == 14
		tFarmingXP = 2411
	ElseIf FarmingLVL == 15
		tFarmingXP = 2746
	ElseIf FarmingLVL == 16
		tFarmingXP = 3115
	ElseIf FarmingLVL == 17
		tFarmingXP = 3523
	ElseIf FarmingLVL == 18
		tFarmingXP = 3973
	ElseIf FarmingLVL == 19
		tFarmingXP = 4470
	ElseIf FarmingLVL == 20
		tFarmingXP = 5018
	ElseIf FarmingLVL == 21
		tFarmingXP = 5624
	ElseIf FarmingLVL == 22
		tFarmingXP = 6291
	ElseIf FarmingLVL == 23
		tFarmingXP = 7028
	ElseIf FarmingLVL == 24
		tFarmingXP = 7842
	ElseIf FarmingLVL == 25
		tFarmingXP = 8740
	ElseIf FarmingLVL == 26
		tFarmingXP = 9730
	ElseIf FarmingLVL == 27
		tFarmingXP = 10824
	ElseIf FarmingLVL == 28
		tFarmingXP = 12031
	ElseIf FarmingLVL == 29
		tFarmingXP = 13363
	ElseIf FarmingLVL == 30
		tFarmingXP = 14833
	ElseIf FarmingLVL == 31
		tFarmingXP = 16456
	ElseIf FarmingLVL == 32
		tFarmingXP = 18247
	ElseIf FarmingLVL == 33
		tFarmingXP = 20224
	ElseIf FarmingLVL == 34
		tFarmingXP = 22406
	ElseIf FarmingLVL == 35
		tFarmingXP = 24815
	ElseIf FarmingLVL == 36
		tFarmingXP = 27473
	ElseIf FarmingLVL == 37
		tFarmingXP = 30408
	ElseIf FarmingLVL == 38
		tFarmingXP = 33648
	ElseIf FarmingLVL == 39
		tFarmingXP = 37224
	ElseIf FarmingLVL == 40
		tFarmingXP = 41171
	ElseIf FarmingLVL == 41
		tFarmingXP = 45529
	ElseIf FarmingLVL == 42
		tFarmingXP = 50339
	ElseIf FarmingLVL == 43
		tFarmingXP = 55649
	ElseIf FarmingLVL == 44
		tFarmingXP = 61512
	ElseIf FarmingLVL == 45
		tFarmingXP = 67983
	ElseIf FarmingLVL == 46
		tFarmingXP = 75127
	ElseIf FarmingLVL == 47
		tFarmingXP = 83014
	ElseIf FarmingLVL == 48
		tFarmingXP = 91721
	ElseIf FarmingLVL == 49
		tFarmingXP = 101333
	ElseIf FarmingLVL == 50
		tFarmingXP = 111945
	ElseIf FarmingLVL == 51
		tFarmingXP = 123660
	ElseIf FarmingLVL == 52
		tFarmingXP = 136594
	ElseIf FarmingLVL == 53
		tFarmingXP = 150872
	ElseIf FarmingLVL == 54
		tFarmingXP = 166636
	ElseIf FarmingLVL == 55
		tFarmingXP = 184040
	ElseIf FarmingLVL == 56
		tFarmingXP = 203254
	ElseIf FarmingLVL == 57
		tFarmingXP = 224466
	ElseIf FarmingLVL == 58
		tFarmingXP = 247886
	ElseIf FarmingLVL == 59
		tFarmingXP = 273742
	ElseIf FarmingLVL == 60
		tFarmingXP = 302288
	ElseIf FarmingLVL == 61
		tFarmingXP = 333804
	ElseIf FarmingLVL == 62
		tFarmingXP = 368599
	ElseIf FarmingLVL == 63
		tFarmingXP = 407015
	ElseIf FarmingLVL == 64
		tFarmingXP = 449428
	ElseIf FarmingLVL == 65
		tFarmingXP = 496254
	ElseIf FarmingLVL == 66
		tFarmingXP = 547953
	ElseIf FarmingLVL == 67
		tFarmingXP = 605032
	ElseIf FarmingLVL == 68
		tFarmingXP = 668051
	ElseIf FarmingLVL == 69
		tFarmingXP = 737627
	ElseIf FarmingLVL == 70
		tFarmingXP = 814445
	ElseIf FarmingLVL == 71
		tFarmingXP = 899257
	ElseIf FarmingLVL == 72
		tFarmingXP = 992895
	ElseIf FarmingLVL == 73
		tFarmingXP = 1096278
	ElseIf FarmingLVL == 74
		tFarmingXP = 1210421
	ElseIf FarmingLVL == 75
		tFarmingXP = 1336443
	ElseIf FarmingLVL == 75
		tFarmingXP = 1336443
	ElseIf FarmingLVL == 76
		tFarmingXP = 1475581
	ElseIf FarmingLVL == 77
		tFarmingXP = 1629200
	ElseIf FarmingLVL == 78
		tFarmingXP = 1798808
	ElseIf FarmingLVL == 79
		tFarmingXP = 1986068
	ElseIf FarmingLVL == 80
		tFarmingXP = 2192818
	ElseIf FarmingLVL == 81
		tFarmingXP = 2421087
	ElseIf FarmingLVL == 82
		tFarmingXP = 2673114
	ElseIf FarmingLVL == 83
		tFarmingXP = 2951373
	ElseIf FarmingLVL == 84
		tFarmingXP = 3258594
	ElseIf FarmingLVL == 85
		tFarmingXP = 3597792
	ElseIf FarmingLVL == 86
		tFarmingXP = 3972294
	ElseIf FarmingLVL == 87
		tFarmingXP = 4385776
	ElseIf FarmingLVL == 88
		tFarmingXP = 4842295
	ElseIf FarmingLVL == 89
		tFarmingXP = 5346332
	ElseIf FarmingLVL == 90
		tFarmingXP = 5902831
	ElseIf FarmingLVL == 91
		tFarmingXP = 6517253
	ElseIf FarmingLVL == 92
		tFarmingXP = 7195629
	ElseIf FarmingLVL == 93
		tFarmingXP = 7944614
	ElseIf FarmingLVL == 94
		tFarmingXP = 8771558
	ElseIf FarmingLVL == 95
		tFarmingXP = 9684577
	ElseIf FarmingLVL == 96
		tFarmingXP = 10692629
	ElseIf FarmingLVL == 97
		tFarmingXP = 11805606
	ElseIf FarmingLVL == 98
		tFarmingXP = 13034431
	Else
		tFarmingXP = 0
	EndIf
EndFunction

Function SummoningInit()
	SummoningLVL = RS_GV_SummoningLVL.GetValue() as Int
	cSummoningXP = RS_GV_SummoningXP.GetValue() as Int
	If SummoningLVL == 1
		tSummoningXP = 83
	ElseIf SummoningLVL == 2
		tSummoningXP = 174
	ElseIf SummoningLVL == 3
		tSummoningXP = 276
	ElseIf SummoningLVL == 4
		tSummoningXP = 388
	ElseIf SummoningLVL == 5
		tSummoningXP = 512
	ElseIf SummoningLVL == 6
		tSummoningXP = 650
	ElseIf SummoningLVL == 7
		tSummoningXP = 801
	ElseIf SummoningLVL == 8
		tSummoningXP = 969
	ElseIf SummoningLVL == 9
		tSummoningXP = 1154
	ElseIf SummoningLVL == 10
		tSummoningXP = 1358
	ElseIf SummoningLVL == 11
		tSummoningXP = 1584
	ElseIf SummoningLVL == 12
		tSummoningXP = 1833
	ElseIf SummoningLVL == 13
		tSummoningXP = 2107
	ElseIf SummoningLVL == 14
		tSummoningXP = 2411
	ElseIf SummoningLVL == 15
		tSummoningXP = 2746
	ElseIf SummoningLVL == 16
		tSummoningXP = 3115
	ElseIf SummoningLVL == 17
		tSummoningXP = 3523
	ElseIf SummoningLVL == 18
		tSummoningXP = 3973
	ElseIf SummoningLVL == 19
		tSummoningXP = 4470
	ElseIf SummoningLVL == 20
		tSummoningXP = 5018
	ElseIf SummoningLVL == 21
		tSummoningXP = 5624
	ElseIf SummoningLVL == 22
		tSummoningXP = 6291
	ElseIf SummoningLVL == 23
		tSummoningXP = 7028
	ElseIf SummoningLVL == 24
		tSummoningXP = 7842
	ElseIf SummoningLVL == 25
		tSummoningXP = 8740
	ElseIf SummoningLVL == 26
		tSummoningXP = 9730
	ElseIf SummoningLVL == 27
		tSummoningXP = 10824
	ElseIf SummoningLVL == 28
		tSummoningXP = 12031
	ElseIf SummoningLVL == 29
		tSummoningXP = 13363
	ElseIf SummoningLVL == 30
		tSummoningXP = 14833
	ElseIf SummoningLVL == 31
		tSummoningXP = 16456
	ElseIf SummoningLVL == 32
		tSummoningXP = 18247
	ElseIf SummoningLVL == 33
		tSummoningXP = 20224
	ElseIf SummoningLVL == 34
		tSummoningXP = 22406
	ElseIf SummoningLVL == 35
		tSummoningXP = 24815
	ElseIf SummoningLVL == 36
		tSummoningXP = 27473
	ElseIf SummoningLVL == 37
		tSummoningXP = 30408
	ElseIf SummoningLVL == 38
		tSummoningXP = 33648
	ElseIf SummoningLVL == 39
		tSummoningXP = 37224
	ElseIf SummoningLVL == 40
		tSummoningXP = 41171
	ElseIf SummoningLVL == 41
		tSummoningXP = 45529
	ElseIf SummoningLVL == 42
		tSummoningXP = 50339
	ElseIf SummoningLVL == 43
		tSummoningXP = 55649
	ElseIf SummoningLVL == 44
		tSummoningXP = 61512
	ElseIf SummoningLVL == 45
		tSummoningXP = 67983
	ElseIf SummoningLVL == 46
		tSummoningXP = 75127
	ElseIf SummoningLVL == 47
		tSummoningXP = 83014
	ElseIf SummoningLVL == 48
		tSummoningXP = 91721
	ElseIf SummoningLVL == 49
		tSummoningXP = 101333
	ElseIf SummoningLVL == 50
		tSummoningXP = 111945
	ElseIf SummoningLVL == 51
		tSummoningXP = 123660
	ElseIf SummoningLVL == 52
		tSummoningXP = 136594
	ElseIf SummoningLVL == 53
		tSummoningXP = 150872
	ElseIf SummoningLVL == 54
		tSummoningXP = 166636
	ElseIf SummoningLVL == 55
		tSummoningXP = 184040
	ElseIf SummoningLVL == 56
		tSummoningXP = 203254
	ElseIf SummoningLVL == 57
		tSummoningXP = 224466
	ElseIf SummoningLVL == 58
		tSummoningXP = 247886
	ElseIf SummoningLVL == 59
		tSummoningXP = 273742
	ElseIf SummoningLVL == 60
		tSummoningXP = 302288
	ElseIf SummoningLVL == 61
		tSummoningXP = 333804
	ElseIf SummoningLVL == 62
		tSummoningXP = 368599
	ElseIf SummoningLVL == 63
		tSummoningXP = 407015
	ElseIf SummoningLVL == 64
		tSummoningXP = 449428
	ElseIf SummoningLVL == 65
		tSummoningXP = 496254
	ElseIf SummoningLVL == 66
		tSummoningXP = 547953
	ElseIf SummoningLVL == 67
		tSummoningXP = 605032
	ElseIf SummoningLVL == 68
		tSummoningXP = 668051
	ElseIf SummoningLVL == 69
		tSummoningXP = 737627
	ElseIf SummoningLVL == 70
		tSummoningXP = 814445
	ElseIf SummoningLVL == 71
		tSummoningXP = 899257
	ElseIf SummoningLVL == 72
		tSummoningXP = 992895
	ElseIf SummoningLVL == 73
		tSummoningXP = 1096278
	ElseIf SummoningLVL == 74
		tSummoningXP = 1210421
	ElseIf SummoningLVL == 75
		tSummoningXP = 1336443
	ElseIf SummoningLVL == 75
		tSummoningXP = 1336443
	ElseIf SummoningLVL == 76
		tSummoningXP = 1475581
	ElseIf SummoningLVL == 77
		tSummoningXP = 1629200
	ElseIf SummoningLVL == 78
		tSummoningXP = 1798808
	ElseIf SummoningLVL == 79
		tSummoningXP = 1986068
	ElseIf SummoningLVL == 80
		tSummoningXP = 2192818
	ElseIf SummoningLVL == 81
		tSummoningXP = 2421087
	ElseIf SummoningLVL == 82
		tSummoningXP = 2673114
	ElseIf SummoningLVL == 83
		tSummoningXP = 2951373
	ElseIf SummoningLVL == 84
		tSummoningXP = 3258594
	ElseIf SummoningLVL == 85
		tSummoningXP = 3597792
	ElseIf SummoningLVL == 86
		tSummoningXP = 3972294
	ElseIf SummoningLVL == 87
		tSummoningXP = 4385776
	ElseIf SummoningLVL == 88
		tSummoningXP = 4842295
	ElseIf SummoningLVL == 89
		tSummoningXP = 5346332
	ElseIf SummoningLVL == 90
		tSummoningXP = 5902831
	ElseIf SummoningLVL == 91
		tSummoningXP = 6517253
	ElseIf SummoningLVL == 92
		tSummoningXP = 7195629
	ElseIf SummoningLVL == 93
		tSummoningXP = 7944614
	ElseIf SummoningLVL == 94
		tSummoningXP = 8771558
	ElseIf SummoningLVL == 95
		tSummoningXP = 9684577
	ElseIf SummoningLVL == 96
		tSummoningXP = 10692629
	ElseIf SummoningLVL == 97
		tSummoningXP = 11805606
	ElseIf SummoningLVL == 98
		tSummoningXP = 13034431
	Else
		tSummoningXP = 0
	EndIf
EndFunction

Function DungeoneeringInit()
	DungeoneeringLVL = RS_GV_DungeoneeringLVL.GetValue() as Int
	cDungeoneeringXP = RS_GV_DungeoneeringXP.GetValue() as Int
	If DungeoneeringLVL == 1
		tDungeoneeringXP = 83
	ElseIf DungeoneeringLVL == 2
		tDungeoneeringXP = 174
	ElseIf DungeoneeringLVL == 3
		tDungeoneeringXP = 276
	ElseIf DungeoneeringLVL == 4
		tDungeoneeringXP = 388
	ElseIf DungeoneeringLVL == 5
		tDungeoneeringXP = 512
	ElseIf DungeoneeringLVL == 6
		tDungeoneeringXP = 650
	ElseIf DungeoneeringLVL == 7
		tDungeoneeringXP = 801
	ElseIf DungeoneeringLVL == 8
		tDungeoneeringXP = 969
	ElseIf DungeoneeringLVL == 9
		tDungeoneeringXP = 1154
	ElseIf DungeoneeringLVL == 10
		tDungeoneeringXP = 1358
	ElseIf DungeoneeringLVL == 11
		tDungeoneeringXP = 1584
	ElseIf DungeoneeringLVL == 12
		tDungeoneeringXP = 1833
	ElseIf DungeoneeringLVL == 13
		tDungeoneeringXP = 2107
	ElseIf DungeoneeringLVL == 14
		tDungeoneeringXP = 2411
	ElseIf DungeoneeringLVL == 15
		tDungeoneeringXP = 2746
	ElseIf DungeoneeringLVL == 16
		tDungeoneeringXP = 3115
	ElseIf DungeoneeringLVL == 17
		tDungeoneeringXP = 3523
	ElseIf DungeoneeringLVL == 18
		tDungeoneeringXP = 3973
	ElseIf DungeoneeringLVL == 19
		tDungeoneeringXP = 4470
	ElseIf DungeoneeringLVL == 20
		tDungeoneeringXP = 5018
	ElseIf DungeoneeringLVL == 21
		tDungeoneeringXP = 5624
	ElseIf DungeoneeringLVL == 22
		tDungeoneeringXP = 6291
	ElseIf DungeoneeringLVL == 23
		tDungeoneeringXP = 7028
	ElseIf DungeoneeringLVL == 24
		tDungeoneeringXP = 7842
	ElseIf DungeoneeringLVL == 25
		tDungeoneeringXP = 8740
	ElseIf DungeoneeringLVL == 26
		tDungeoneeringXP = 9730
	ElseIf DungeoneeringLVL == 27
		tDungeoneeringXP = 10824
	ElseIf DungeoneeringLVL == 28
		tDungeoneeringXP = 12031
	ElseIf DungeoneeringLVL == 29
		tDungeoneeringXP = 13363
	ElseIf DungeoneeringLVL == 30
		tDungeoneeringXP = 14833
	ElseIf DungeoneeringLVL == 31
		tDungeoneeringXP = 16456
	ElseIf DungeoneeringLVL == 32
		tDungeoneeringXP = 18247
	ElseIf DungeoneeringLVL == 33
		tDungeoneeringXP = 20224
	ElseIf DungeoneeringLVL == 34
		tDungeoneeringXP = 22406
	ElseIf DungeoneeringLVL == 35
		tDungeoneeringXP = 24815
	ElseIf DungeoneeringLVL == 36
		tDungeoneeringXP = 27473
	ElseIf DungeoneeringLVL == 37
		tDungeoneeringXP = 30408
	ElseIf DungeoneeringLVL == 38
		tDungeoneeringXP = 33648
	ElseIf DungeoneeringLVL == 39
		tDungeoneeringXP = 37224
	ElseIf DungeoneeringLVL == 40
		tDungeoneeringXP = 41171
	ElseIf DungeoneeringLVL == 41
		tDungeoneeringXP = 45529
	ElseIf DungeoneeringLVL == 42
		tDungeoneeringXP = 50339
	ElseIf DungeoneeringLVL == 43
		tDungeoneeringXP = 55649
	ElseIf DungeoneeringLVL == 44
		tDungeoneeringXP = 61512
	ElseIf DungeoneeringLVL == 45
		tDungeoneeringXP = 67983
	ElseIf DungeoneeringLVL == 46
		tDungeoneeringXP = 75127
	ElseIf DungeoneeringLVL == 47
		tDungeoneeringXP = 83014
	ElseIf DungeoneeringLVL == 48
		tDungeoneeringXP = 91721
	ElseIf DungeoneeringLVL == 49
		tDungeoneeringXP = 101333
	ElseIf DungeoneeringLVL == 50
		tDungeoneeringXP = 111945
	ElseIf DungeoneeringLVL == 51
		tDungeoneeringXP = 123660
	ElseIf DungeoneeringLVL == 52
		tDungeoneeringXP = 136594
	ElseIf DungeoneeringLVL == 53
		tDungeoneeringXP = 150872
	ElseIf DungeoneeringLVL == 54
		tDungeoneeringXP = 166636
	ElseIf DungeoneeringLVL == 55
		tDungeoneeringXP = 184040
	ElseIf DungeoneeringLVL == 56
		tDungeoneeringXP = 203254
	ElseIf DungeoneeringLVL == 57
		tDungeoneeringXP = 224466
	ElseIf DungeoneeringLVL == 58
		tDungeoneeringXP = 247886
	ElseIf DungeoneeringLVL == 59
		tDungeoneeringXP = 273742
	ElseIf DungeoneeringLVL == 60
		tDungeoneeringXP = 302288
	ElseIf DungeoneeringLVL == 61
		tDungeoneeringXP = 333804
	ElseIf DungeoneeringLVL == 62
		tDungeoneeringXP = 368599
	ElseIf DungeoneeringLVL == 63
		tDungeoneeringXP = 407015
	ElseIf DungeoneeringLVL == 64
		tDungeoneeringXP = 449428
	ElseIf DungeoneeringLVL == 65
		tDungeoneeringXP = 496254
	ElseIf DungeoneeringLVL == 66
		tDungeoneeringXP = 547953
	ElseIf DungeoneeringLVL == 67
		tDungeoneeringXP = 605032
	ElseIf DungeoneeringLVL == 68
		tDungeoneeringXP = 668051
	ElseIf DungeoneeringLVL == 69
		tDungeoneeringXP = 737627
	ElseIf DungeoneeringLVL == 70
		tDungeoneeringXP = 814445
	ElseIf DungeoneeringLVL == 71
		tDungeoneeringXP = 899257
	ElseIf DungeoneeringLVL == 72
		tDungeoneeringXP = 992895
	ElseIf DungeoneeringLVL == 73
		tDungeoneeringXP = 1096278
	ElseIf DungeoneeringLVL == 74
		tDungeoneeringXP = 1210421
	ElseIf DungeoneeringLVL == 75
		tDungeoneeringXP = 1336443
	ElseIf DungeoneeringLVL == 75
		tDungeoneeringXP = 1336443
	ElseIf DungeoneeringLVL == 76
		tDungeoneeringXP = 1475581
	ElseIf DungeoneeringLVL == 77
		tDungeoneeringXP = 1629200
	ElseIf DungeoneeringLVL == 78
		tDungeoneeringXP = 1798808
	ElseIf DungeoneeringLVL == 79
		tDungeoneeringXP = 1986068
	ElseIf DungeoneeringLVL == 80
		tDungeoneeringXP = 2192818
	ElseIf DungeoneeringLVL == 81
		tDungeoneeringXP = 2421087
	ElseIf DungeoneeringLVL == 82
		tDungeoneeringXP = 2673114
	ElseIf DungeoneeringLVL == 83
		tDungeoneeringXP = 2951373
	ElseIf DungeoneeringLVL == 84
		tDungeoneeringXP = 3258594
	ElseIf DungeoneeringLVL == 85
		tDungeoneeringXP = 3597792
	ElseIf DungeoneeringLVL == 86
		tDungeoneeringXP = 3972294
	ElseIf DungeoneeringLVL == 87
		tDungeoneeringXP = 4385776
	ElseIf DungeoneeringLVL == 88
		tDungeoneeringXP = 4842295
	ElseIf DungeoneeringLVL == 89
		tDungeoneeringXP = 5346332
	ElseIf DungeoneeringLVL == 90
		tDungeoneeringXP = 5902831
	ElseIf DungeoneeringLVL == 91
		tDungeoneeringXP = 6517253
	ElseIf DungeoneeringLVL == 92
		tDungeoneeringXP = 7195629
	ElseIf DungeoneeringLVL == 93
		tDungeoneeringXP = 7944614
	ElseIf DungeoneeringLVL == 94
		tDungeoneeringXP = 8771558
	ElseIf DungeoneeringLVL == 95
		tDungeoneeringXP = 9684577
	ElseIf DungeoneeringLVL == 96
		tDungeoneeringXP = 10692629
	ElseIf DungeoneeringLVL == 97
		tDungeoneeringXP = 11805606
	ElseIf DungeoneeringLVL == 98
		tDungeoneeringXP = 13034431
	Else
		tDungeoneeringXP = 0
	EndIf
EndFunction

Function UpdateDnDtimers()
	float skyscapeHours = (Utility.GetCurrentRealTime()) / 3600
	float timeRemain_BigChinchompa = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_BigChinchompa.GetValue())
	float timeRemain_Bork = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_Bork.GetValue())
	float timeRemain_DemonFlashmobs = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_DemonFlashmobs.GetValue())
	float timeRemain_EvilTree = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_EvilTree.GetValue())
	float timeRemain_FishFlingers = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_FishFlingers.GetValue())
	float timeRemain_GoblinRaids = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_GoblinRaids.GetValue())
	float timeRemain_GuthixianCaches = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_GuthixianCaches.GetValue())
	float timeRemain_PhoenixLair = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_PhoenixLair.GetValue())
	float timeRemain_RuneGoldbergMachine = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_RuneGoldbergMachine.GetValue())
	float timeRemain_ShootingStar = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_ShootingStar.GetValue())
	float timeRemain_Sinkholes = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_Sinkholes.GetValue())
	float timeRemain_ThePit = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_ThePit.GetValue())
	float timeRemain_WildernessWarbands = RS_Config_DnD_DailyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_WildernessWarbands.GetValue())
	float timeRemain_Agoroth = RS_Config_DnD_WeeklyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_Agoroth.GetValue())
	float timeRemain_Circus = RS_Config_DnD_WeeklyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_Circus.GetValue())
	float timeRemain_Familiarisation = RS_Config_DnD_WeeklyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_Familiarisation.GetValue())
	float timeRemain_MemoryOfNomad = RS_Config_DnD_WeeklyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_MemoryOfNomad.GetValue())
	float timeRemain_PenguinHideAndSeek = RS_Config_DnD_WeeklyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_PenguinHideAndSeek.GetValue())
	float timeRemain_RushOfBlood = RS_Config_DnD_WeeklyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_RushOfBlood.GetValue())
	float timeRemain_SkeletalHorror = RS_Config_DnD_WeeklyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_SkeletalHorror.GetValue())
	float timeRemain_TearsOfGuthix = RS_Config_DnD_WeeklyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_TearsOfGuthix.GetValue())
	float timeRemain_GiantOyster = RS_Config_DnD_MonthlyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_GiantOyster.GetValue())
	float timeRemain_GodStatues = RS_Config_DnD_MonthlyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_GodStatues.GetValue())
	float timeRemain_TrollInvasion = RS_Config_DnD_MonthlyInterval.GetValue() - (skyscapeHours - RS_TimeStamp_TrollInvasion.GetValue())
	Debug.Trace("TRACE --" + timeRemain_GodStatues + " = " + RS_Config_DnD_MonthlyInterval.GetValue() + " - " + skyscapeHours + " - " + RS_TimeStamp_GodStatues.GetValue())
	
	int timeRemain_BigChinchompa_h = Math.Floor(timeRemain_BigChinchompa)
	int timeRemain_Bork_h = Math.Floor(timeRemain_Bork)
	int timeRemain_DemonFlashmobs_h = Math.Floor(timeRemain_DemonFlashmobs)
	int timeRemain_EvilTree_h = Math.Floor(timeRemain_EvilTree)
	int timeRemain_FishFlingers_h = Math.Floor(timeRemain_FishFlingers)
	int timeRemain_GoblinRaids_h = Math.Floor(timeRemain_GoblinRaids)
	int timeRemain_GuthixianCaches_h = Math.Floor(timeRemain_GuthixianCaches)
	int timeRemain_PhoenixLair_h = Math.Floor(timeRemain_PhoenixLair)
	int timeRemain_RuneGoldbergMachine_h = Math.Floor(timeRemain_RuneGoldbergMachine)
	int timeRemain_ShootingStar_h = Math.Floor(timeRemain_ShootingStar)
	int timeRemain_Sinkholes_h = Math.Floor(timeRemain_Sinkholes)
	int timeRemain_ThePit_h = Math.Floor(timeRemain_ThePit)
	int timeRemain_WildernessWarbands_h = Math.Floor(timeRemain_WildernessWarbands)
	int timeRemain_Agoroth_h = Math.Floor(timeRemain_Agoroth)
	int timeRemain_Circus_h = Math.Floor(timeRemain_Circus)
	int timeRemain_Familiarisation_h = Math.Floor(timeRemain_Familiarisation)
	int timeRemain_MemoryOfNomad_h = Math.Floor(timeRemain_MemoryOfNomad)
	int timeRemain_PenguinHideAndSeek_h = Math.Floor(timeRemain_PenguinHideAndSeek)
	int timeRemain_RushOfBlood_h = Math.Floor(timeRemain_RushOfBlood)
	int timeRemain_SkeletalHorror_h = Math.Floor(timeRemain_SkeletalHorror)
	int timeRemain_TearsOfGuthix_h = Math.Floor(timeRemain_TearsOfGuthix)
	int timeRemain_GiantOyster_h = Math.Floor(timeRemain_GiantOyster)
	int timeRemain_GodStatues_h = Math.Floor(timeRemain_GodStatues)
	int timeRemain_TrollInvasion_h = Math.Floor(timeRemain_TrollInvasion)
	
	int timeRemain_BigChinchompa_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_Bork_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_DemonFlashmobs_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_EvilTree_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_FishFlingers_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_GoblinRaids_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_GuthixianCaches_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_PhoenixLair_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_RuneGoldbergMachine_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_ShootingStar_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_Sinkholes_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_ThePit_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_WildernessWarbands_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_Agoroth_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_Circus_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_Familiarisation_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_MemoryOfNomad_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_PenguinHideAndSeek_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_RushOfBlood_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_SkeletalHorror_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_TearsOfGuthix_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_GiantOyster_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_GodStatues_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int
	int timeRemain_TrollInvasion_m = ((timeRemain_BigChinchompa - timeRemain_BigChinchompa_h) * 60) as int

	if timeRemain_BigChinchompa <= 0 || RS_TimeStamp_BigChinchompa.GetValue() <= 0
		stringTimeRemain_BigChinchompa = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_BigChinchompa_h < 10
			zeroHour = "0"
		endif
		if timeRemain_BigChinchompa_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_BigChinchompa = zeroHour + "" + timeRemain_BigChinchompa_h + ":" + zeroMinute + "" + timeRemain_BigChinchompa_m
	endif
	
	if timeRemain_Bork <= 0 || RS_TimeStamp_Bork.GetValue() <= 0
		stringTimeRemain_Bork = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_Bork_h < 10
			zeroHour = "0"
		endif
		if timeRemain_Bork_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_Bork = zeroHour + "" + timeRemain_Bork_h + ":" + zeroMinute + "" + timeRemain_Bork_m
	endif
	
	if timeRemain_DemonFlashmobs <= 0 || RS_TimeStamp_DemonFlashmobs.GetValue() <= 0
		stringTimeRemain_DemonFlashmobs = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_DemonFlashmobs_h < 10
			zeroHour = "0"
		endif
		if timeRemain_DemonFlashmobs_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_DemonFlashmobs = zeroHour + "" + timeRemain_DemonFlashmobs_h + ":" + zeroMinute + "" + timeRemain_DemonFlashmobs_m
	endif
	
	if timeRemain_EvilTree <= 0 || RS_TimeStamp_EvilTree.GetValue() <= 0
		stringTimeRemain_EvilTree = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_EvilTree_h < 10
			zeroHour = "0"
		endif
		if timeRemain_EvilTree_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_EvilTree = zeroHour + "" + timeRemain_EvilTree_h + ":" + zeroMinute + "" + timeRemain_EvilTree_m
	endif
	
	if timeRemain_FishFlingers <= 0 || RS_TimeStamp_FishFlingers.GetValue() <= 0
		stringTimeRemain_FishFlingers = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_FishFlingers_h < 10
			zeroHour = "0"
		endif
		if timeRemain_FishFlingers_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_FishFlingers = zeroHour + "" + timeRemain_FishFlingers_h + ":" + zeroMinute + "" + timeRemain_FishFlingers_m
	endif
	
	if timeRemain_GoblinRaids <= 0 || RS_TimeStamp_GoblinRaids.GetValue() <= 0
		stringTimeRemain_GoblinRaids = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_GoblinRaids_h < 10
			zeroHour = "0"
		endif
		if timeRemain_GoblinRaids_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_GoblinRaids = zeroHour + "" + timeRemain_GoblinRaids_h + ":" + zeroMinute + "" + timeRemain_GoblinRaids_m
	endif
	
	if timeRemain_GuthixianCaches <= 0 || RS_TimeStamp_GuthixianCaches.GetValue() <= 0
		stringTimeRemain_GuthixianCaches = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_GuthixianCaches_h < 10
			zeroHour = "0"
		endif
		if timeRemain_GuthixianCaches_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_GuthixianCaches = zeroHour + "" + timeRemain_GuthixianCaches_h + ":" + zeroMinute + "" + timeRemain_GuthixianCaches_m
	endif
	
	if timeRemain_PhoenixLair <= 0 || RS_TimeStamp_PhoenixLair.GetValue() <= 0
		stringTimeRemain_PhoenixLair = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_PhoenixLair_h < 10
			zeroHour = "0"
		endif
		if timeRemain_PhoenixLair_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_PhoenixLair = zeroHour + "" + timeRemain_PhoenixLair_h + ":" + zeroMinute + "" + timeRemain_PhoenixLair_m
	endif
	
	if timeRemain_RuneGoldbergMachine <= 0 || RS_TimeStamp_RuneGoldbergMachine.GetValue() <= 0
		stringTimeRemain_RuneGoldbergMachine = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_RuneGoldbergMachine_h < 10
			zeroHour = "0"
		endif
		if timeRemain_RuneGoldbergMachine_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_RuneGoldbergMachine = zeroHour + "" + timeRemain_RuneGoldbergMachine_h + ":" + zeroMinute + "" + timeRemain_RuneGoldbergMachine_m
	endif
	
	if timeRemain_ShootingStar <= 0 || RS_TimeStamp_ShootingStar.GetValue() <= 0
		stringTimeRemain_ShootingStar = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_ShootingStar_h < 10
			zeroHour = "0"
		endif
		if timeRemain_ShootingStar_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_ShootingStar = zeroHour + "" + timeRemain_ShootingStar_h + ":" + zeroMinute + "" + timeRemain_ShootingStar_m
	endif
	
	if timeRemain_Sinkholes <= 0 || RS_TimeStamp_Sinkholes.GetValue() <= 0
		stringTimeRemain_Sinkholes = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_Sinkholes_h < 10
			zeroHour = "0"
		endif
		if timeRemain_Sinkholes_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_Sinkholes = zeroHour + "" + timeRemain_Sinkholes_h + ":" + zeroMinute + "" + timeRemain_Sinkholes_m
	endif
	
	if timeRemain_ThePit <= 0 || RS_TimeStamp_ThePit.GetValue() <= 0
		stringTimeRemain_ThePit = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_ThePit_h < 10
			zeroHour = "0"
		endif
		if timeRemain_ThePit_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_ThePit = zeroHour + "" + timeRemain_ThePit_h + ":" + zeroMinute + "" + timeRemain_ThePit_m
	endif
	
	if timeRemain_WildernessWarbands <= 0 || RS_TimeStamp_WildernessWarbands.GetValue() <= 0
		stringTimeRemain_WildernessWarbands = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_WildernessWarbands_h < 10
			zeroHour = "0"
		endif
		if timeRemain_WildernessWarbands_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_WildernessWarbands = zeroHour + "" + timeRemain_WildernessWarbands_h + ":" + zeroMinute + "" + timeRemain_WildernessWarbands_m
	endif
	
	if timeRemain_Agoroth <= 0 || RS_TimeStamp_Agoroth.GetValue() <= 0
		stringTimeRemain_Agoroth = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_Agoroth_h < 10
			zeroHour = "0"
		endif
		if timeRemain_Agoroth_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_Agoroth = zeroHour + "" + timeRemain_Agoroth_h + ":" + zeroMinute + "" + timeRemain_Agoroth_m
	endif
	
	if timeRemain_Circus <= 0 || RS_TimeStamp_Circus.GetValue() <= 0
		stringTimeRemain_Circus = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_Circus_h < 10
			zeroHour = "0"
		endif
		if timeRemain_Circus_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_Circus = zeroHour + "" + timeRemain_Circus_h + ":" + zeroMinute + "" + timeRemain_Circus_m
	endif
	
	if timeRemain_Familiarisation <= 0 || RS_TimeStamp_Familiarisation.GetValue() <= 0
		stringTimeRemain_Familiarisation = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_Familiarisation_h < 10
			zeroHour = "0"
		endif
		if timeRemain_Familiarisation_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_Familiarisation = zeroHour + "" + timeRemain_Familiarisation_h + ":" + zeroMinute + "" + timeRemain_Familiarisation_m
	endif
	
	if timeRemain_MemoryOfNomad <= 0 || RS_TimeStamp_MemoryOfNomad.GetValue() <= 0
		stringTimeRemain_MemoryOfNomad = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_MemoryOfNomad_h < 10
			zeroHour = "0"
		endif
		if timeRemain_MemoryOfNomad_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_MemoryOfNomad = zeroHour + "" + timeRemain_MemoryOfNomad_h + ":" + zeroMinute + "" + timeRemain_MemoryOfNomad_m
	endif
	
	if timeRemain_PenguinHideAndSeek <= 0 || RS_TimeStamp_PenguinHideAndSeek.GetValue() <= 0
		stringTimeRemain_PenguinHideAndSeek = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_PenguinHideAndSeek_h < 10
			zeroHour = "0"
		endif
		if timeRemain_PenguinHideAndSeek_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_PenguinHideAndSeek = zeroHour + "" + timeRemain_PenguinHideAndSeek_h + ":" + zeroMinute + "" + timeRemain_PenguinHideAndSeek_m
	endif
	
	if timeRemain_RushOfBlood <= 0 || RS_TimeStamp_RushOfBlood.GetValue() <= 0
		stringTimeRemain_RushOfBlood = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_RushOfBlood_h < 10
			zeroHour = "0"
		endif
		if timeRemain_RushOfBlood_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_RushOfBlood = zeroHour + "" + timeRemain_RushOfBlood_h + ":" + zeroMinute + "" + timeRemain_RushOfBlood_m
	endif
	
	if timeRemain_SkeletalHorror <= 0 || RS_TimeStamp_SkeletalHorror.GetValue() <= 0
		stringTimeRemain_SkeletalHorror = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_SkeletalHorror_h < 10
			zeroHour = "0"
		endif
		if timeRemain_SkeletalHorror_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_SkeletalHorror = zeroHour + "" + timeRemain_SkeletalHorror_h + ":" + zeroMinute + "" + timeRemain_SkeletalHorror_m
	endif
	
	if timeRemain_TearsOfGuthix <= 0 || RS_TimeStamp_TearsOfGuthix.GetValue() <= 0
		stringTimeRemain_TearsOfGuthix = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_TearsOfGuthix_h < 10
			zeroHour = "0"
		endif
		if timeRemain_TearsOfGuthix_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_TearsOfGuthix = zeroHour + "" + timeRemain_TearsOfGuthix_h + ":" + zeroMinute + "" + timeRemain_TearsOfGuthix_m
	endif
	
	if timeRemain_GiantOyster <= 0 || RS_TimeStamp_GiantOyster.GetValue() <= 0
		stringTimeRemain_GiantOyster = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_GiantOyster_h < 10
			zeroHour = "0"
		endif
		if timeRemain_GiantOyster_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_GiantOyster = zeroHour + "" + timeRemain_GiantOyster_h + ":" + zeroMinute + "" + timeRemain_GiantOyster_m
	endif
	
	if timeRemain_GodStatues <= 0 || RS_TimeStamp_GodStatues.GetValue() <= 0
		Debug.Trace("TRACE -- Our time remaining was " + timeRemain_GodStatues + ". Our timestamp was " + RS_TimeStamp_GodStatues.GetValue() + " IF")
		stringTimeRemain_GodStatues = "00:00"
		ResetDnD_GodStatues()
	else
		Debug.Trace("TRACE -- Our time remaining was " + timeRemain_GodStatues + ". Our timestamp was " + RS_TimeStamp_GodStatues.GetValue() + " ELSE")
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_GodStatues_h < 10
			zeroHour = "0"
		endif
		if timeRemain_GodStatues_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_GodStatues = zeroHour + "" + timeRemain_GodStatues_h + ":" + zeroMinute + "" + timeRemain_GodStatues_m
	endif
	
	if timeRemain_TrollInvasion <= 0 || RS_TimeStamp_TrollInvasion.GetValue() <= 0
		stringTimeRemain_TrollInvasion = "00:00"
	else
		string zeroHour = ""
		string zeroMinute = ""
		if timeRemain_TrollInvasion_h < 10
			zeroHour = "0"
		endif
		if timeRemain_TrollInvasion_m < 10
			zeroMinute = "0"
		endif
		stringTimeRemain_TrollInvasion = zeroHour + "" + timeRemain_TrollInvasion_h + ":" + zeroMinute + "" + timeRemain_TrollInvasion_m
	endif
EndFunction

Function AddSkillSpells()
	If (Game.GetPlayer().HasSpell(RS_Skill_Pickpocketing)) == false
			Game.GetPlayer().AddSpell(RS_Skill_Pickpocketing)
	EndIf
EndFunction

Function UpdateAgressions()
	If CombatLVL > 3
		Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop7)
		If CombatLVL > 4
			Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop9)
			If CombatLVL > 5
				Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop11)
				If CombatLVL > 6
					Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop13)
					If CombatLVL > 7
						Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop15)
						If CombatLVL > 8
							Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop17)
							If CombatLVL > 9
								Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop19)
								If CombatLVL > 10
									Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop21)
									If CombatLVL > 11
										Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop23)
										If CombatLVL > 12
											Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop25)
											If CombatLVL > 13
												Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop27)
												If CombatLVL > 14
													Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop29)
													If CombatLVL > 15
														Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop31)
														If CombatLVL > 16
															Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop33)
															If CombatLVL > 17
																Game.GetPlayer().RemoveFromFaction(RS_aFaction_AgroStop35)
															ElseIf CombatLVL == 17
																Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop35)
															EndIf
														ElseIf CombatLVL == 16
															Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop33)
														EndIf
													ElseIf CombatLVL == 15
														Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop31)
													EndIf
												ElseIf CombatLVL == 14
													Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop29)
												EndIf
											ElseIf CombatLVL == 13
												Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop27)
											EndIf
										ElseIf CombatLVL == 12
											Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop25)
										EndIf	
									ElseIf CombatLVL == 11
										Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop23)
									EndIf
								ElseIf CombatLVL == 10
									Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop21)
								EndIf
							ElseIf CombatLVL == 9
								Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop19)
							EndIf
						ElseIf CombatLVL == 8
							Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop17)
						EndIf
					ElseIf CombatLVL == 7
						Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop15)
					EndIf
				ElseIf CombatLVL == 6
					Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop13)
				EndIf
			ElseIf CombatLVL == 5
				Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop11)
			EndIf
		ElseIf CombatLVL == 4
			Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop9)
		EndIf
	ElseIf CombatLVL == 3
		Game.GetPlayer().AddToFaction(RS_aFaction_AgroStop7)
	EndIf
EndFunction

Function ResetDnD_GodStatues()
	Debug.Trace("TRACE -- ResetDnD_GodStatues called -- Reset Statues and stones.")
	RS_DnD_GodStatue_Rock_Lumbridge.Enable()
	RS_DnD_GodStatue_Statue_Lumbridge_Saradomin.Disable()
	RS_DnD_GodStatue_Statue_Lumbridge_Bandos.Disable()
	RS_DnD_GodStatue_Statue_Lumbridge_Zamorak.Disable()
	RS_DnD_GodStatue_Statue_Lumbridge_Seren.Disable()
	RS_DnD_GodStatue_Statue_Lumbridge_Guthix.Disable()
	RS_DnD_GodStatue_Rock_Taverly.Enable()
	RS_DnD_GodStatue_Statue_Taverly_Saradomin.Disable()
	RS_DnD_GodStatue_Statue_Taverly_Bandos.Disable()
	RS_DnD_GodStatue_Statue_Taverly_Zamorak.Disable()
	RS_DnD_GodStatue_Statue_Taverly_Seren.Disable()
	RS_DnD_GodStatue_Statue_Taverly_Guthix.Disable()
	RS_DnD_GodStatue_Rock_Yanille.Enable()
	RS_DnD_GodStatue_Statue_Yanille_Saradomin.Disable()
	RS_DnD_GodStatue_Statue_Yanille_Bandos.Disable()
	RS_DnD_GodStatue_Statue_Yanille_Zamorak.Disable()
	RS_DnD_GodStatue_Statue_Yanille_Seren.Disable()
	RS_DnD_GodStatue_Statue_Yanille_Guthix.Disable()
	RS_DnD_GodStatue_Rock_Canifis.Enable()
	RS_DnD_GodStatue_Statue_Canifis_Saradomin.Disable()
	RS_DnD_GodStatue_Statue_Canifis_Bandos.Disable()
	RS_DnD_GodStatue_Statue_Canifis_Zamorak.Disable()
	RS_DnD_GodStatue_Statue_Canifis_Seren.Disable()
	RS_DnD_GodStatue_Statue_Canifis_Guthix.Disable()
	RS_DnD_GodStatue_Rock_Prifddinas.Enable()
	RS_DnD_GodStatue_Statue_Prifddinas_Saradomin.Disable()
	RS_DnD_GodStatue_Statue_Prifddinas_Bandos.Disable()
	RS_DnD_GodStatue_Statue_Prifddinas_Zamorak.Disable()
	RS_DnD_GodStatue_Statue_Prifddinase_Seren.Disable()
	RS_DnD_GodStatue_Statue_Prifddinas_Guthix.Disable()
EndFunction

;< Notes:
;The original goal of this script is to provide the necessary functions to other scripts that use a repeated element that appears in each script.
;At this time, I have not tested it, so it is not ready to be put into action, and I am not sure if everything that is here will be here when it gets put in use.
;To add additional requirements for level up unlocks, refer to agility level 53
;>
