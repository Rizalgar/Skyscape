ScriptName rsFrameworkData Extends Quest
{Contains all the properties for rsFramework scripts}

;< Variable Properties
Float Property hoursToHour Auto; How many hours in realtime = an hour in Runescape
Float Property hoursToDay Auto; How many hours in realtime = a day in Runescape
Float Property hoursToWeek Auto; How many hours in realtime = a week in Runescape
Float Property hoursToMonth Auto; How many hours in realtime = a month in Runescape
;>
;< Level Globalvariable Properties
Globalvariable Property RS_GV_AgilityLVL Auto
Globalvariable Property RS_GV_AttackLVL Auto
Globalvariable Property RS_GV_ConstitutionLVL Auto
Globalvariable Property RS_GV_ConstructionLVL Auto
Globalvariable Property RS_GV_CookingLVL Auto
Globalvariable Property RS_GV_CraftingLVL Auto
Globalvariable Property RS_GV_DefenceLVL Auto
Globalvariable Property RS_GV_DivinationLVL Auto
Globalvariable Property RS_GV_DungeoneeringLVL Auto
Globalvariable Property RS_GV_FarmingLVL Auto
Globalvariable Property RS_GV_FiremakingLVL Auto
Globalvariable Property RS_GV_FishingLVL Auto
Globalvariable Property RS_GV_FletchingLVL Auto
Globalvariable Property RS_GV_HerbloreLVL Auto
Globalvariable Property RS_GV_HunterLVL Auto
Globalvariable Property RS_GV_InventionLVL Auto
Globalvariable Property RS_GV_MagicLVL Auto
Globalvariable Property RS_GV_MiningLVL Auto
Globalvariable Property RS_GV_PrayerLVL Auto
Globalvariable Property RS_GV_RangedLVL Auto
Globalvariable Property RS_GV_RunecraftingLVL Auto
Globalvariable Property RS_GV_SlayerLVL Auto
Globalvariable Property RS_GV_SmithingLVL Auto
Globalvariable Property RS_GV_StrengthLVL Auto
Globalvariable Property RS_GV_SummoningLVL Auto
Globalvariable Property RS_GV_ThievingLVL Auto
Globalvariable Property RS_GV_WoodcuttingLVL Auto

;>
;< XP Globalvariable Properties
Globalvariable Property RS_GV_AgilityXP Auto
Globalvariable Property RS_GV_AttackXP Auto
Globalvariable Property RS_GV_ConstitutionXP Auto
Globalvariable Property RS_GV_ConstructionXP Auto
Globalvariable Property RS_GV_CookingXP Auto
Globalvariable Property RS_GV_CraftingXP Auto
Globalvariable Property RS_GV_DefenceXP Auto
Globalvariable Property RS_GV_DivinationXP Auto
Globalvariable Property RS_GV_DungeoneeringXP Auto
Globalvariable Property RS_GV_FarmingXP Auto
Globalvariable Property RS_GV_FiremakingXP Auto
Globalvariable Property RS_GV_FishingXP Auto
Globalvariable Property RS_GV_FletchingXP Auto
Globalvariable Property RS_GV_HerbloreXP Auto
Globalvariable Property RS_GV_HunterXP Auto
Globalvariable Property RS_GV_InventionXP Auto
Globalvariable Property RS_GV_MagicXP Auto
Globalvariable Property RS_GV_MiningXP Auto
Globalvariable Property RS_GV_PrayerXP Auto
Globalvariable Property RS_GV_RangedXP Auto
Globalvariable Property RS_GV_RunecraftingXP Auto
Globalvariable Property RS_GV_SlayerXP Auto
Globalvariable Property RS_GV_SmithingXP Auto
Globalvariable Property RS_GV_StrengthXP Auto
Globalvariable Property RS_GV_SummoningXP Auto
Globalvariable Property RS_GV_ThievingXP Auto
Globalvariable Property RS_GV_WoodcuttingXP Auto

;>
;< Message Properties

;>
;< Count Globalvariable Properties
Globalvariable Property RS_Count_Runecrafting_Ess_Small Auto
Globalvariable Property RS_Count_Runecrafting_Ess_Medium Auto
Globalvariable Property RS_Count_Runecrafting_Ess_Large Auto
Globalvariable Property RS_Count_Runecrafting_Ess_Giant Auto
Globalvariable Property RS_Count_Runecrafting_EssPure_Small Auto
Globalvariable Property RS_Count_Runecrafting_EssPure_Medium Auto
Globalvariable Property RS_Count_Runecrafting_EssPure_Large Auto
Globalvariable Property RS_Count_Runecrafting_EssPure_Giant Auto

Globalvariable Property RS_Count_Charges_BindingNecklace Auto
;>
;< Misc Globalvariable Properties
Globalvariable Property RS_GV_PrayerEndCheck Auto
Globalvariable Property RS_Check_Dungeoneering_PurchaseRapidRenewal Auto
Globalvariable Property RS_GV_RandomEvents Auto
Globalvariable Property RS_Check_IsItHalloween Auto; 1 = false, 0 = True
Globalvariable Property RS_Config_Runecrafting_UnpackPouch AUto
Globalvariable Property RS_GV_MagicEndCheck Auto
;>
;< Quest Properties
Quest Property RS_Quest_WhileGuthixSleeps Auto
Quest Property RS_Quest_KnightWaveTrainingGrounds Auto
;>
;< Sound Properties
Sound Property RS_SM_LevelUpAgility Auto
Sound Property RS_SM_LevelUpAttack Auto
Sound Property RS_SM_LevelUpConstitution Auto
Sound Property RS_SM_LevelUpConstruction Auto
Sound Property RS_SM_LevelUpCooking Auto
Sound Property RS_SM_LevelUpCrafting Auto
Sound Property RS_SM_LevelUpDefence Auto
Sound Property RS_SM_LevelUpDivination Auto
Sound Property RS_SM_LevelUpDungeoneering Auto
Sound Property RS_SM_LevelUpFarming Auto
Sound Property RS_SM_LevelUpFiremaking Auto
Sound Property RS_SM_LevelUpFishing Auto
Sound Property RS_SM_LevelUpFletching Auto
Sound Property RS_SM_LevelUpHerblore Auto
Sound Property RS_SM_LevelUpHunter Auto
Sound Property RS_SM_LevelUpInvention Auto
Sound Property RS_SM_LevelUpMagic Auto
Sound Property RS_SM_LevelUpMining Auto
Sound Property RS_SM_LevelUpPrayer Auto
Sound Property RS_SM_LevelUpRanged Auto
Sound Property RS_SM_LevelUpRunecrafting Auto
Sound Property RS_SM_LevelUpSlayer Auto
Sound Property RS_SM_LevelUpSmithing Auto
Sound Property RS_SM_LevelUpStrength Auto
Sound Property RS_SM_LevelUpSummoning Auto
Sound Property RS_SM_LevelUpThieving Auto
Sound Property RS_SM_LevelUpWoodcutting Auto

Sound Property RS_Sound_UI_Runecraft Auto
;>
;< Spell Properties
Spell Property RS_sPrayer_Augury Auto
Spell Property RS_sPrayer_BurstStrength Auto
Spell Property RS_sPrayer_Charge Auto
Spell Property RS_sPrayer_Chivalry Auto
Spell Property RS_sPrayer_ClarityThought Auto
Spell Property RS_sPrayer_EagleEye Auto
Spell Property RS_sPrayer_HawkEye Auto
Spell Property RS_sPrayer_ImprovedReflexes Auto
Spell Property RS_sPrayer_IncredibleReflexes Auto
Spell Property RS_sPrayer_MysticLore Auto
Spell Property RS_sPrayer_MysticMight Auto
Spell Property RS_sPrayer_MysticWill Auto
Spell Property RS_sPrayer_Overcharge Auto
Spell Property RS_sPrayer_Piety Auto
Spell Property RS_sPrayer_ProtectItem Auto
Spell Property RS_sPrayer_ProtectMelee Auto
Spell Property RS_sPrayer_ProtectMagic Auto
Spell Property RS_sPrayer_ProtectMissiles Auto
Spell Property RS_sPrayer_ProtectSummoning Auto
Spell Property RS_sPrayer_RapidHeal Auto
Spell Property RS_sPrayer_RapidRenewal Auto
Spell Property RS_sPrayer_RapidRestore Auto
Spell Property RS_sPrayer_Redemption Auto
Spell Property RS_sPrayer_Retribution Auto
Spell Property RS_sPrayer_Rigour Auto
Spell Property RS_sPrayer_RockSkin Auto
Spell Property RS_sPrayer_SharpEye Auto
Spell Property RS_sPrayer_Smite Auto
Spell Property RS_sPrayer_SteelSkin Auto
Spell Property RS_sPrayer_Supercharge Auto
Spell Property RS_sPrayer_SuperStrength Auto
Spell Property RS_sPrayer_ThickSkin Auto
Spell Property RS_sPrayer_UltimateStrength Auto
Spell Property RS_sPrayer_UnrelentingForce Auto
Spell Property RS_sPrayer_UnstoppableForce Auto
Spell Property RS_sPrayer_OverpoweringForce Auto

;>
;< FormList Properties
FormList Property RS_FormList_WeaponBronze Auto
FormList Property RS_FormList_WeaponIron Auto
FormList Property RS_FormList_WeaponSteel Auto
FormList Property RS_FormList_WeaponBlack Auto
FormList Property RS_FormList_WeaponWhite Auto
FormList Property RS_FormList_WeaponMithril Auto
FormList Property RS_FormList_WeaponAdamant Auto
FormList Property RS_FormList_WeaponRune Auto
FormList Property RS_FormList_WeaponDragon Auto
FormList Property RS_FormList_WeaponSacredClay Auto
FormList Property RS_FormList_WeaponVolatileClay Auto
;>
;< Actorbase Properties
ActorBase Property RS_Monster_RiverTroll_re_014 Auto
ActorBase Property RS_Monster_RiverTroll_re_029 Auto
ActorBase Property RS_Monster_RiverTroll_re_049 Auto
ActorBase Property RS_Monster_RiverTroll_re_079 Auto
ActorBase Property RS_Monster_RiverTroll_re_120 Auto
ActorBase Property RS_Monster_RiverTroll_re_159 Auto

ActorBase Property RS_Monster_RockGolem_re_014 Auto
ActorBase Property RS_Monster_RockGolem_re_029 Auto
ActorBase Property RS_Monster_RockGolem_re_049 Auto
ActorBase Property RS_Monster_RockGolem_re_079 Auto
ActorBase Property RS_Monster_RockGolem_re_120 Auto
ActorBase Property RS_Monster_RockGolem_re_159 Auto

ActorBase Property RS_Monster_TreeSpirit_re_014 Auto
ActorBase Property RS_Monster_TreeSpirit_re_029 Auto
ActorBase Property RS_Monster_TreeSpirit_re_049 Auto
ActorBase Property RS_Monster_TreeSpirit_re_079 Auto
ActorBase Property RS_Monster_TreeSpirit_re_120 Auto
ActorBase Property RS_Monster_TreeSpirit_re_159 Auto

ActorBase Property RS_Monster_Watchman_re_014 Auto
ActorBase Property RS_Monster_Watchman_re_029 Auto
ActorBase Property RS_Monster_Watchman_re_049 Auto
ActorBase Property RS_Monster_Watchman_re_079 Auto
ActorBase Property RS_Monster_Watchman_re_120 Auto
ActorBase Property RS_Monster_Watchman_re_159 Auto
;>
;< Weapon Properties
Weapon Property RS_Item_Weapon_Special_InfernoAdze Auto

Weapon Property RS_Weapon_Staff_Talisman Auto
Weapon Property RS_Weapon_Staff_Talisman_Air Auto
Weapon Property RS_Weapon_Staff_Talisman_Mind Auto
Weapon Property RS_Weapon_Staff_Talisman_Water Auto
Weapon Property RS_Weapon_Staff_Talisman_Earth Auto
Weapon Property RS_Weapon_Staff_Talisman_Fire Auto
Weapon Property RS_Weapon_Staff_Talisman_Body Auto
Weapon Property RS_Weapon_Staff_Talisman_Cosmic Auto
Weapon Property RS_Weapon_Staff_Talisman_Chaos Auto
Weapon Property RS_Weapon_Staff_Talisman_Nature Auto
Weapon Property RS_Weapon_Staff_Talisman_Law Auto
Weapon Property RS_Weapon_Staff_Talisman_Death Auto
;>
;< Config Properties
Globalvariable Property RS_Check_LampMod Auto; Modifier on lamp xp rates, 1 is normal, 2 is double, etc.
;>
;< ObjectReference Properties
ObjectReference Property RS_Bank Auto
;>
;< MiscObject Properties
MiscObject Property RS_Item_RunecraftingPouch_Small Auto
MiscObject Property RS_Item_RunecraftingPouch_Medium Auto
MiscObject Property RS_Item_RunecraftingPouch_Large Auto
MiscObject Property RS_Item_RunecraftingPouch_Giant Auto

MiscObject Property RS_Item_Talisman_Air Auto
MiscObject Property RS_Item_Talisman_Mind Auto
MiscObject Property RS_Item_Talisman_Water Auto
MiscObject Property RS_Item_Talisman_Earth Auto
MiscObject Property RS_Item_Talisman_Fire Auto
MiscObject Property RS_Item_Talisman_Body Auto
MiscObject Property RS_Item_Talisman_Cosmic Auto
MiscObject Property RS_Item_Talisman_Chaos Auto
MiscObject Property RS_Item_Talisman_Nature Auto
MiscObject Property RS_Item_Talisman_Law Auto
MiscObject Property RS_Item_Talisman_Death Auto

MiscObject Property RS_Item_Runecrafting_RuneEssence Auto
MiscObject Property RS_Item_Runecrafting_RuneEssencePure Auto

MiscObject Property RS_Item_Rune_Air Auto
MiscObject Property RS_Item_Rune_Mind Auto
MiscObject Property RS_Item_Rune_Water Auto
MiscObject Property RS_Item_Rune_Earth Auto
MiscObject Property RS_Item_Rune_Fire Auto
MiscObject Property RS_Item_Rune_Body Auto
MiscObject Property RS_Item_Rune_Cosmic Auto
MiscObject Property RS_Item_Rune_Chaos Auto
MiscObject Property RS_Item_Rune_Astral Auto
MiscObject Property RS_Item_Rune_Nature Auto
MiscObject Property RS_Item_Rune_Law Auto
MiscObject Property RS_Item_Rune_Death Auto

MiscObject Property RS_Item_Rune_Dust Auto
MiscObject Property RS_Item_Rune_Mud Auto
MiscObject Property RS_Item_Rune_Smoke Auto
MiscObject Property RS_Item_Rune_Mist Auto
MiscObject Property RS_Item_Rune_Lava Auto
MiscObject Property RS_Item_Rune_Steam Auto

;>
;< Armor Properties
Armor Property RS_Armor_Head_Tiara Auto
Armor Property RS_Armor_Head_Tiara_Air Auto
Armor Property RS_Armor_Head_Tiara_Mind Auto
Armor Property RS_Armor_Head_Tiara_Water Auto
Armor Property RS_Armor_Head_Tiara_Earth Auto
Armor Property RS_Armor_Head_Tiara_Fire Auto
Armor Property RS_Armor_Head_Tiara_Body Auto
Armor Property RS_Armor_Head_Tiara_Cosmic Auto
Armor Property RS_Armor_Head_Tiara_Chaos Auto
Armor Property RS_Armor_Head_Tiara_Nature Auto
Armor Property RS_Armor_Head_Tiara_Law Auto
Armor Property RS_Armor_Head_Tiara_Death Auto

Armor Property RS_Armor_Neck_Necklace_Binding Auto
;>
;< Magic Effects
MagicEffect Property RS_MagicEffect_Spell_MagicImbue Auto
;>
;<Damage Spells
Spell Property RS_Spell_WindStrike Auto
Spell Property RS_Spell_WaterStrike Auto
Spell Property RS_Spell_EarthStrike Auto
Spell Property RS_Spell_FireStrike Auto
Spell Property RS_Spell_WindBolt Auto
Spell Property RS_Spell_WaterBolt Auto
Spell Property RS_Spell_EarthBolt Auto
Spell Property RS_Spell_FireBolt Auto
Spell Property RS_Spell_WindBlast Auto
Spell Property RS_Spell_WindSurge Auto
Spell Property RS_Spell_Water_Blast Auto
Spell Property RS_Spell_WaterSurge Auto
Spell Property RS_Spell_EarthBlast Auto
Spell Property RS_Spell_EarthSurge Auto
Spell Property RS_Spell_FireBlast Auto
Spell Property RS_Spell_FireSurge Auto
Spell Property RS_Spell_FireWave Auto
Spell Property RS_Spell_EarthWave Auto
Spell Property RS_Spell_WaterWave Auto
Spell Property RS_Spell_WindWave Auto
;>
;< Teleport Spells
Spell Property RS_Spell_VarrockTele Auto
Spell Property RS_Spell_LumbridgeTele Auto
Spell Property RS_Spell_FaladorTele Auto
;>
