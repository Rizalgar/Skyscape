ScriptName rsFrameworkMenu Extends Quest Hidden
{Framework for Skills and Menus in SkyScape}
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

;< Parent functions - use these functions, not it's child below
;Handles XP gain for "SkyScape" skills
Function rsXPGain(string skill, float xp) Global
	if skill == "agility"
		(GetAgilityXP()).SetValue(((GetAgilityXP()).GetValue()) + xp)
	elseif skill == "attack"
		(GetAttackXP()).SetValue(((GetAttackXP()).GetValue()) + xp)
	elseif skill == "constitution"
		(GetConstitutionXP()).SetValue(((GetConstitutionXP()).GetValue()) + xp)
	elseif skill == "construction"
		(GetConstructionXP()).SetValue(((GetConstructionXP()).GetValue()) + xp)
	elseif skill == "cooking"
		(GetCookingXP()).SetValue(((GetCookingXP()).GetValue()) + xp)
	elseif skill == "crafting"
		(GetCraftingXP()).SetValue(((GetCraftingXP()).GetValue()) + xp)
	elseif skill == "defence"
		(GetDefenceXP()).SetValue(((GetDefenceXP()).GetValue()) + xp)
	elseif skill == "divination"
		(GetDivinationXP()).SetValue(((GetDivinationXP()).GetValue()) + xp)
	elseif skill == "dungeoneering"
		(GetDungeoneeringXP()).SetValue(((GetDungeoneeringXP()).GetValue()) + xp)
	elseif skill == "farming"
		(GetFarmingXP()).SetValue(((GetFarmingXP()).GetValue()) + xp)
	elseif skill == "firemaking"
		(GetFiremakingXP()).SetValue(((GetFiremakingXP()).GetValue()) + xp)
	elseif skill == "fishing"
		(GetFishingXP()).SetValue(((GetFishingXP()).GetValue()) + xp)
	elseif skill == "fletching"
		(GetFletchingXP()).SetValue(((GetFletchingXP()).GetValue()) + xp)
	elseif skill == "herblore"
		(GetHerbloreXP()).SetValue(((GetHerbloreXP()).GetValue()) + xp)
	elseif skill == "hunter"
		(GetHunterXP()).SetValue(((GetHunterXP()).GetValue()) + xp)
	elseif skill == "invention"
		(GetInventionXP()).SetValue(((GetInventionXP()).GetValue()) + xp)
	elseif skill == "magic"
		(GetMagicXP()).SetValue(((GetMagicXP()).GetValue()) + xp)
	elseif skill == "mining"
		(GetMiningXP()).SetValue(((GetMiningXP()).GetValue()) + xp)
	elseif skill == "prayer"
		(GetPrayerXP()).SetValue(((GetPrayerXP()).GetValue()) + xp)
	elseif skill == "ranged"
		(GetRangedXP()).SetValue(((GetRangedXP()).GetValue()) + xp)
	elseif skill == "runecrafting"
		(GetRunecraftingXP()).SetValue(((GetRunecraftingXP()).GetValue()) + xp)
	elseif skill == "slayer"
		(GetSlayerXP()).SetValue(((GetSlayerXP()).GetValue()) + xp)
	elseif skill == "smithing"
		(GetSmithingXP()).SetValue(((GetSmithingXP()).GetValue()) + xp)
	elseif skill == "strength"
		(GetStrengthXP()).SetValue(((GetStrengthXP()).GetValue()) + xp)
	elseif skill == "thieving"
		(GetThievingXP()).SetValue(((GetThievingXP()).GetValue()) + xp)
	elseif skill == "woodcutting"
		(GetWoodcuttingXP()).SetValue(((GetWoodcuttingXP()).GetValue()) + xp)
	else
		Debug.Trace("rsXPGain -- Bad string provided '" + skill + "'.")
	endif
	rsCheckForLevelUp(skill)
EndFunction

;--FUNCTION--Checks to see if the player has enough XP to level up in a skill
Function rsCheckForLevelUp(string skill) Global
	if skill == "agility"
		rsLevelCheck_Agility()
	elseif skill == "attack"
		rsLevelCheck_Attack()
	elseif skill == "constitution"
		rsLevelCheck_Constitution()
	elseif skill == "construction"
		rsLevelCheck_Construction()
	elseif skill == "cooking"
		rsLevelCheck_Cooking()
	elseif skill == "crafting"
		rsLevelCheck_Crafting()
	elseif skill == "defence"
		rsLevelCheck_Defence()
	elseif skill == "divination"
		rsLevelCheck_Divination()
	elseif skill == "dungeoneering"
		rsLevelCheck_Dungeoneering()
	elseif skill == "farming"
		rsLevelCheck_Farming()
	elseif skill == "firemaking"
		rsLevelCheck_Firemaking()
	elseif skill == "fishing"
		rsLevelCheck_Fishing()
	elseif skill == "fletching"
		rsLevelCheck_Fletching()
	elseif skill == "herblore"
		rsLevelCheck_Herblore()
	elseif skill == "hunter"
		rsLevelCheck_Hunter()
	elseif skill == "invention"
		rsLevelCheck_Invention()
	elseif skill == "magic"
		rsLevelCheck_Magic()
	elseif skill == "mining"
		rsLevelCheck_Mining()
	elseif skill == "prayer"
		rsLevelCheck_Prayer()
	elseif skill == "ranged"
		rsLevelCheck_Ranged()
	elseif skill == "runecrafting"
		rsLevelCheck_Runecrafting()
	elseif skill == "slayer"
		rsLevelCheck_Slayer()
	elseif skill == "smithing"
		rsLevelCheck_Smithing()
	elseif skill == "strength"
		rsLevelCheck_Strength()
	elseif skill == "thieving"
		rsLevelCheck_Thieving()
	elseif skill == "woodcutting"
		rsLevelCheck_Woodcutting()
	else
		Debug.Trace("rsCheckForLevelUp -- Bad string provided '" + skill + "'.")
	endif
EndFunction

;--ACTION--Inventory processing script, item for item, optional skill xp gain, has random events
Function ItemForItemLoop(MiscObject oldItem, MiscObject newItem, Sound processSound, ObjectReference soundSource, int count, int interval, int removeCount, int addCount, string oldItemPlural, bool xpGain = false, string skillName = "", float gainedXP = 0.0, Objectreference spawnLocation) Global
	Game.DisablePlayerControls(True, True, True, false, True, True, false, false, 0)
	bool bWantToLeave = false
	if count == 666
		While (bWantToLeave == false)
			if (Game.GetPlayer().GetItemCount(oldItem)) >= 1
				Game.GetPlayer().RemoveItem(oldItem, removeCount, true)
				if (processSound != none)
					processSound.Play(soundSource)
				endif
				Utility.Wait(interval)
				Game.GetPlayer().AddItem(newItem, addCount)
				if xpGain == true
					rsXPGain(skillName, gainedXP)
				endif
				if (((GetGlobalCheck_RandomEvents()).GetValue()) == 1)
					RollRandomEvent(skillName, spawnLocation)
				endif
				bWantToLeave = Input.IsKeyPressed(18)
			else
				bWantToLeave = true
				Debug.Notification("You need more " + oldItemPlural + ".")
			endif
		EndWhile
	else
		While (count != 0 && bWantToLeave == false)
			if (Game.GetPlayer().GetItemCount(oldItem)) >= 1
				Game.GetPlayer().RemoveItem(oldItem, removeCount, true)
				if (processSound != none)
					processSound.Play(soundSource)
				endif
				Utility.Wait(interval)
				Game.GetPlayer().AddItem(newItem, addCount)
				if xpGain == true
					rsXPGain(skillName, gainedXP)
				endif
				if (((GetGlobalCheck_RandomEvents()).GetValue()) == 1)
					RollRandomEvent(skillName, spawnLocation)
				endif
				bWantToLeave = Input.IsKeyPressed(18)
				count = (count - 1)
			else
				bWantToLeave = true
				Debug.Notification("You need more " + oldItemPlural + ".")
			endif
		EndWhile
	endif
	Game.EnablePlayerControls()
EndFunction

;--ACTION--Looped Item harvesting script, optional xp gain, has random events -- come back to this part and add multi-add item statements -- not done
Function HarvestItemLoop(MiscObject newItem, Sound harvestSound, ObjectReference soundSource, int addCount, bool xpGain = false, string skillName = "", float gainedXP = 0.0, ObjectReference spawnLocation) Global
	Game.GetPlayer().AddItem(newItem, addCount)
	if xpGain == true
		(rsGetXPGlobalFromString(skillName)).SetValue((rsGetXPGlobalFromString(skillName).GetValue() + gainedXP))
		rsCheckForLevelUp(skillName)
	Endif
	if (((GetGlobalCheck_RandomEvents()).GetValue()) == 1)
		RollRandomEvent(skillName, spawnLocation)
	endif
EndFunction

;--ACTION--Item harvesting script, optional xp gain, has random events -- come back to this part and add multi-add item statements
Function HarvestItemOnce(GlobalVariable skillCounter, ObjectReference objRef, Activator depletedActivator, int reqLVL, MiscObject newItem, weapon equippedTool, Sound harvestSound, Sound depleteSound,  ObjectReference soundSource, Float respawnInterval, int addCount, bool xpGain = false, string skillName = "", float gainedXP = 0.0, ObjectReference spawnLocation) Global
	if (((GetGlobalCheck_RandomEvents()).GetValue()) == 1)
		RollRandomEvent(skillName, spawnLocation)
	endif
	;The meat and potatoes... the probability formula
	If skillCounter.GetValue() <= 0
		float mod = GetToolStrength(equippedTool)
		int LVL = (rsGetLVLGlobalFromString(skillName).GetValue() as int)
		Int intmathDelay = ((20-(LVL/10)) - Mod + reqLVL) as Int
		int probability = Utility.RandomInt(0,intMathDelay)
		skillCounter.SetValue(probability)
	Else
		int probability = skillCounter.GetValue() as Int
		probability = (probability - 1)
		If (probability > 0)
			skillCounter.SetValue(probability)
		ElseIf (probability <= 0)
			skillCounter.SetValue(0)
			ObjectReference harvestedRef = objRef.PlaceAtMe(depletedActivator, 1, False, True)
			if harvestSound != none
				harvestSound.Play(soundSource)
			endif
			depleteSound.Play(soundSource)
			objRef.Disable()
			harvestedRef.Enable()
			Game.GetPlayer().AddItem(newItem, addCount)
			rsXPGain(skillName, gainedXP)
			Utility.wait(respawnInterval)
			harvestedRef.Delete()
			objRef.Enable()
		EndIf
	EndIf	
EndFunction

;--ACTION--Item harvesting script, optional xp gain, has random events -- come back to this part and add multi-add item statements
Function CanoeStationTree(GlobalVariable skillCounter, ObjectReference objRef, Activator depletedActivator, int reqLVL, Weapon equippedTool, Sound harvestSound, Sound depleteSound,  ObjectReference soundSource, Float respawnInterval, bool xpGain = false, string skillName = "", float gainedXP = 0.0, ObjectReference spawnLocation) Global
	if (((GetGlobalCheck_RandomEvents()).GetValue()) == 1)
		RollRandomEvent(skillName, spawnLocation)
	endif
	;The meat and potatoes... the probability formula
	If skillCounter.GetValue() <= 0
		float mod = GetToolStrength(equippedTool)
		int LVL = (rsGetLVLGlobalFromString(skillName).GetValue() as int)
		Int intmathDelay = ((20-(LVL/10)) - Mod + reqLVL) as Int
		int probability = Utility.RandomInt(0,intMathDelay)
		skillCounter.SetValue(probability)
	Else
		int probability = skillCounter.GetValue() as Int
		probability = (probability - 1)
		If (probability > 0)
			skillCounter.SetValue(probability)
		ElseIf (probability <= 0)
			skillCounter.SetValue(0)
			ObjectReference harvestedRef = objRef.PlaceAtMe(depletedActivator, 1, False, True)
			if harvestSound != none
				harvestSound.Play(soundSource)
			endif
			depleteSound.Play(soundSource)
			objRef.Disable()
			harvestedRef.Enable()
			rsXPGain(skillName, gainedXP)
			Utility.wait(respawnInterval)
			harvestedRef.Delete()
			objRef.Enable()
		EndIf
	EndIf	
EndFunction

Function StartRunecrafting(string runeType, string runeType2, bool bOnlyPureEssence, ObjectReference spawnLocation) Global
	MiscObject pureEss = GetItem_Runecrafting_RuneEssencePure()
	MiscObject ess = GetItem_Runecrafting_RuneEssence()
	if (GetGlobalConfig_Runecrafting_UnpackPouch().GetValue()) == 0; Check if player set the config to auto-unpack pouches
		bool small = false
		bool medium = false
		bool large = false
		bool giant = false
		if game.getplayer().GetItemCount(GetItem_RCpouch_Small()) == 1
			small = true
		endif
		if game.getplayer().GetItemCount(GetItem_RCpouch_Medium()) == 1
			medium = true
		endif
		if game.getplayer().GetItemCount(GetItem_RCpouch_Large()) == 1
			large = true
		endif
		if game.getplayer().GetItemCount(GetItem_RCpouch_Giant()) == 1
			giant = true
		endif
		
		int pouchPureCount = GetPouchPureCount(small, medium, large, giant)
		int pouchEssCount = GetPouchEssCount(small, medium, large, giant)
		
		if (bOnlyPureEssence)
			int essCountPure = (Game.GetPlayer().GetItemCount(pureEss)) + pouchPureCount
			Runecraft(runeType, essCountPure, spawnLocation, runeType2)
		else
			int essCountTotal = (Game.GetPlayer().GetItemCount(pureEss)) + (Game.GetPlayer().GetItemCount(ess)) + pouchPureCount + pouchEssCount
			Runecraft(runeType, essCountTotal, spawnLocation, runeType2)
		endif
	else; Player will unpack pouches manually
		if (bOnlyPureEssence)
			int essCountPure = Game.GetPlayer().GetItemCount(pureEss)
			Runecraft(runeType, essCountPure, spawnLocation, runeType2)
		else
			int essCountTotal = (Game.GetPlayer().GetItemCount(pureEss)) + (Game.GetPlayer().GetItemCount(ess))
			Runecraft(runeType, essCountTotal, spawnLocation, runeType2)
		endif
	endif
EndFunction

;--ACTION--Runecrafting script, has random events
Function Runecraft(string runeType, int essCount, ObjectReference spawnLocation, string runeType2) Global
	bool bMagicImbue = (Game.GetPlayer().HasMagicEffect(GetEffect_Spell_MagicImbue()))
	if runeType2 == "dust"
		int req = 10
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			if runeType == "air"
				if Game.GetPlayer().GetItemCount(GetItem_Talisman_Earth()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Earth()) < 1 && bMagicImbue == false
					debug.notification("You require an earth talisman and earth runes to make dust runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Earth()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Earth()) > 1 && bMagicImbue == false
					debug.notification("You require an earth talisman to make dust runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Earth()) > 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Earth()) < essCount
					debug.notification("You require more earth runes to make dust runes at this altar.")
				else
					float xpPerRune = 8.3
					Game.GetPlayer().RemoveItem(GetItem_Talisman_Earth(), 1)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_Rune_Earth(), essCount)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
					rsMakeComboRunes(runeType2, essCount, xpPerRune)
				endif
			elseif runeType == "earth"
				if Game.GetPlayer().GetItemCount(GetItem_Talisman_Air()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Air()) < 1 && bMagicImbue == false
					debug.notification("You require an air talisman and air runes to make dust runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Air()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Air()) > 1 && bMagicImbue == false
					debug.notification("You require an air talisman to make dust runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Air()) > 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Air()) < essCount
					debug.notification("You require more air runes to make dust runes at this altar.")
				else
					float xpPerRune = 9.0
					Game.GetPlayer().RemoveItem(GetItem_Talisman_Air(), 1)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_Rune_Air(), essCount)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
					rsMakeComboRunes(runeType2, essCount, xpPerRune)
				endif
			else
			
			endif
		endif
	elseif runeType2 == "lava"
		int req = 23
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			if runeType == "earth"
				if Game.GetPlayer().GetItemCount(GetItem_Talisman_Fire()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Fire()) < 1 && bMagicImbue == false
					debug.notification("You require an fire talisman and fire runes to make lava runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Fire()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Fire()) > 1 && bMagicImbue == false
					debug.notification("You require an fire talisman to make lava runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Fire()) > 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Fire()) < essCount
					debug.notification("You require more fire runes to make lava runes at this altar.")
				else
					float xpPerRune = 10.0
					Game.GetPlayer().RemoveItem(GetItem_Talisman_Fire(), 1)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_Rune_Fire(), essCount)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
					rsMakeComboRunes(runeType2, essCount, xpPerRune)
				endif
			elseif runeType == "fire"
				if Game.GetPlayer().GetItemCount(GetItem_Talisman_Earth()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Earth()) < 1 && bMagicImbue == false
					debug.notification("You require an earth talisman and earth runes to make lava runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Earth()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Earth()) > 1 && bMagicImbue == false
					debug.notification("You require an earth talisman to make lava runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Earth()) > 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Earth()) < essCount
					debug.notification("You require more earth runes to make lava runes at this altar.")
				else
					float xpPerRune = 10.5
					Game.GetPlayer().RemoveItem(GetItem_Talisman_Earth(), 1)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_Rune_Earth(), essCount)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
					rsMakeComboRunes(runeType2, essCount, xpPerRune)
				endif
			else
			
			endif
		endif
	elseif runeType2 == "mist"
		int req = 6
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			if runeType == "air"
				if Game.GetPlayer().GetItemCount(GetItem_Talisman_Water()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Water()) < 1 && bMagicImbue == false
					debug.notification("You require an water talisman and water runes to make mist runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Water()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Water()) > 1 && bMagicImbue == false
					debug.notification("You require an water talisman to make mist runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Water()) > 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Water()) < essCount
					debug.notification("You require more water runes to make mist runes at this altar.")
				else
					float xpPerRune = 8.0
					Game.GetPlayer().RemoveItem(GetItem_Talisman_Water(), 1)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_Rune_Water(), essCount)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
					rsMakeComboRunes(runeType2, essCount, xpPerRune)
				endif
			elseif runeType == "water"
				if Game.GetPlayer().GetItemCount(GetItem_Talisman_Air()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Air()) < 1 && bMagicImbue == false
					debug.notification("You require an air talisman and air runes to make mist runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Air()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Air()) > 1 && bMagicImbue == false
					debug.notification("You require an air talisman to make mist runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Air()) > 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Air()) < essCount
					debug.notification("You require more air runes to make mist runes at this altar.")
				else
					float xpPerRune = 8.5
					Game.GetPlayer().RemoveItem(GetItem_Talisman_Air(), 1)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_Rune_Air(), essCount)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
					rsMakeComboRunes(runeType2, essCount, xpPerRune)
				endif
			else
			
			endif
		endif
	elseif runeType2 == "mud"
		int req = 13
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			if runeType == "water"
				if Game.GetPlayer().GetItemCount(GetItem_Talisman_Earth()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Earth()) < 1 && bMagicImbue == false
					debug.notification("You require an earth talisman and earth runes to make mud runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Earth()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Earth()) > 1 && bMagicImbue == false
					debug.notification("You require an earth talisman to make mud runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Earth()) > 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Earth()) < essCount
					debug.notification("You require more earth runes to make mud runes at this altar.")
				else
					float xpPerRune = 9.3
					Game.GetPlayer().RemoveItem(GetItem_Talisman_Earth(), 1)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_Rune_Earth(), essCount)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
					rsMakeComboRunes(runeType2, essCount, xpPerRune)
				endif
			elseif runeType == "earth"
				if Game.GetPlayer().GetItemCount(GetItem_Talisman_Water()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Water()) < 1 && bMagicImbue == false
					debug.notification("You require an water talisman and water runes to make mud runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Water()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Water()) > 1 && bMagicImbue == false
					debug.notification("You require an water talisman to make mud runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Water()) > 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Water()) < essCount
					debug.notification("You require more water runes to make mud runes at this altar.")
				else
					float xpPerRune = 9.5
					Game.GetPlayer().RemoveItem(GetItem_Talisman_Water(), 1)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_Rune_Water(), essCount)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
					rsMakeComboRunes(runeType2, essCount, xpPerRune)
				endif
			else
			
			endif
		endif
	elseif runeType2 == "smoke"
		int req = 15
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			if runeType == "air"
				if Game.GetPlayer().GetItemCount(GetItem_Talisman_Fire()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Fire()) < 1 && bMagicImbue == false
					debug.notification("You require an fire talisman and fire runes to make smoke runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Fire()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Fire()) > 1 && bMagicImbue == false
					debug.notification("You require an fire talisman to make smoke runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Fire()) > 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Fire()) < essCount
					debug.notification("You require more fire runes to make smoke runes at this altar.")
				else
					float xpPerRune = 8.5
					Game.GetPlayer().RemoveItem(GetItem_Talisman_Fire(), 1)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_Rune_Fire(), essCount)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
					rsMakeComboRunes(runeType2, essCount, xpPerRune)
				endif
			elseif runeType == "fire"
				if Game.GetPlayer().GetItemCount(GetItem_Talisman_Air()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Air()) < 1 && bMagicImbue == false
					debug.notification("You require an air talisman and air runes to make smoke runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Air()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Air()) > 1 && bMagicImbue == false
					debug.notification("You require an air talisman to make smoke runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Air()) > 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Air()) < essCount
					debug.notification("You require more air runes to make smoke runes at this altar.")
				else
					float xpPerRune = 9.5
					Game.GetPlayer().RemoveItem(GetItem_Talisman_Air(), 1)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_Rune_Air(), essCount)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
					rsMakeComboRunes(runeType2, essCount, xpPerRune)
				endif
			else
			
			endif
		endif
	elseif runeType2 == "steam"
		int req = 19
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			if runeType == "fire"
				if Game.GetPlayer().GetItemCount(GetItem_Talisman_Water()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Water()) < 1 && bMagicImbue == false
					debug.notification("You require an water talisman and water runes to make steam runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Water()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Water()) > 1 && bMagicImbue == false
					debug.notification("You require an water talisman to make steam runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Water()) > 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Water()) < essCount
					debug.notification("You require more water runes to make steam runes at this altar.")
				else
					float xpPerRune = 10.0
					Game.GetPlayer().RemoveItem(GetItem_Talisman_Water(), 1)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_Rune_Water(), essCount)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
					rsMakeComboRunes(runeType2, essCount, xpPerRune)
				endif
			elseif runeType == "water"
				if Game.GetPlayer().GetItemCount(GetItem_Talisman_Fire()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Fire()) < 1 && bMagicImbue == false
					debug.notification("You require an fire talisman and fire runes to make steam runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Fire()) < 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Fire()) > 1 && bMagicImbue == false
					debug.notification("You require an fire talisman to make steam runes at this altar.")
				elseif Game.GetPlayer().GetItemCount(GetItem_Talisman_Fire()) > 1 && Game.GetPlayer().GetItemCount(GetItem_Runecrafting_Rune_Fire()) < essCount
					debug.notification("You require more fire runes to make steam runes at this altar.")
				else
					float xpPerRune = 9.3
					Game.GetPlayer().RemoveItem(GetItem_Talisman_Fire(), 1)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_Rune_Fire(), essCount)
					Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
					rsMakeComboRunes(runeType2, essCount, xpPerRune)
				endif
			else
			
			endif
		endif
	elseif runeType == "air"
		int req = 1
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			;either
			float xpPerRune = 5.0
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssence(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssence())))
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
			int multiplier
			if (rcLVL >= 99)
				multiplier = 10
			elseif (rcLVL >= 88)
				multiplier = 9
			elseif (rcLVL >= 77)
				multiplier = 8
			elseif (rcLVL >= 66)
				multiplier = 7
			elseif (rcLVL >= 55)
				multiplier = 6
			elseif (rcLVL >= 44)
				multiplier = 5
			elseif (rcLVL >= 33)
				multiplier = 4
			elseif (rcLVL >= 22)
				multiplier = 3
			elseif (rcLVL >= 11)
				multiplier = 2
			else
				multiplier = 1
			endif
			Game.GetPlayer().AddItem((GetItem_Runecrafting_Rune_Air()), (essCount*multiplier))
			rsXPGain("runecrafting", (xpPerRune * essCount))
		endif
	elseif runeType == "mind"
		int req = 2
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			;either
			float xpPerRune = 5.5
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssence(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssence())))
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
			int multiplier
			if (rcLVL >= 98)
				multiplier = 8
			elseif (rcLVL >= 84)
				multiplier = 7
			elseif (rcLVL >= 70)
				multiplier = 6
			elseif (rcLVL >= 56)
				multiplier = 5
			elseif (rcLVL >= 42)
				multiplier = 4
			elseif (rcLVL >= 28)
				multiplier = 3
			elseif (rcLVL >= 14)
				multiplier = 2
			else
				multiplier = 1
			endif
			Game.GetPlayer().AddItem((GetItem_Runecrafting_Rune_Mind()), (essCount*multiplier))
			rsXPGain("runecrafting", (xpPerRune * essCount))
		endif
	elseif runeType == "water"
		int req = 5
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			;either
			float xpPerRune = 6.0
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssence(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssence())))
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
			int multiplier
			if (rcLVL >= 95)
				multiplier = 6
			elseif (rcLVL >= 76)
				multiplier = 5
			elseif (rcLVL >= 57)
				multiplier = 4
			elseif (rcLVL >= 38)
				multiplier = 3
			elseif (rcLVL >= 19)
				multiplier = 2
			else
				multiplier = 1
			endif
			Game.GetPlayer().AddItem((GetItem_Runecrafting_Rune_Water()), (essCount*multiplier))
			rsXPGain("runecrafting", (xpPerRune * essCount))
		endif
	elseif runeType == "earth"
		int req = 9
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			;either
			float xpPerRune = 6.5
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssence(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssence())))
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
			int multiplier
			if (rcLVL >= 104)
				multiplier = 5
			elseif (rcLVL >= 78)
				multiplier = 4
			elseif (rcLVL >= 52)
				multiplier = 3
			elseif (rcLVL >= 26)
				multiplier = 2
			else
				multiplier = 1
			endif
			Game.GetPlayer().AddItem((GetItem_Runecrafting_Rune_Earth()), (essCount*multiplier))
			rsXPGain("runecrafting", (xpPerRune * essCount))
		endif
	elseif runeType == "fire"
		int req = 14
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			;either
			float xpPerRune = 7.0
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssence(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssence())))
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
			int multiplier
			if (rcLVL >= 70)
				multiplier = 3
			elseif (rcLVL >= 35)
				multiplier = 2
			else
				multiplier = 1
			endif
			Game.GetPlayer().AddItem((GetItem_Runecrafting_Rune_Fire()), (essCount*multiplier))
			rsXPGain("runecrafting", (xpPerRune * essCount))
		endif
	elseif runeType == "body"
		int req = 20
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			;either
			float xpPerRune = 7.5
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssence(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssence())))
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
			int multiplier
			if (rcLVL >= 92)
				multiplier = 3
			elseif (rcLVL >= 46)
				multiplier = 2
			else
				multiplier = 1
			endif
			Game.GetPlayer().AddItem((GetItem_Runecrafting_Rune_Body()), (essCount*multiplier))
			rsXPGain("runecrafting", (xpPerRune * essCount))
		endif
	elseif runeType == "cosmic"
		int req = 27
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			;pure only
			float xpPerRune = 8.0
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
			int multiplier
			if (rcLVL >= 59)
				multiplier = 2
			else
				multiplier = 1
			endif
			Game.GetPlayer().AddItem((GetItem_Runecrafting_Rune_Cosmic()), (essCount*multiplier))
			rsXPGain("runecrafting", (xpPerRune * essCount))
		endif
	elseif runeType == "chaos"
		int req = 35
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			;pure only
			float xpPerRune = 8.5
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
			int multiplier
			if (rcLVL >= 74)
				multiplier = 2
			else
				multiplier = 1
			endif
			Game.GetPlayer().AddItem((GetItem_Runecrafting_Rune_Chaos()), (essCount*multiplier))
			rsXPGain("runecrafting", (xpPerRune * essCount))
		endif
	elseif runeType == "astral"
		int req = 40
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			;pure only
			float xpPerRune = 8.7
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
			int multiplier
			if (rcLVL >= 82)
				multiplier = 2
			else
				multiplier = 1
			endif
			Game.GetPlayer().AddItem((GetItem_Runecrafting_Rune_Astral()), (essCount*multiplier))
			rsXPGain("runecrafting", (xpPerRune * essCount))
		endif
	elseif runeType == "nature"
		int req = 44
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			;pure only
			float xpPerRune = 9.0
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
			int multiplier
			if (rcLVL >= 91)
				multiplier = 2
			else
				multiplier = 1
			endif
			Game.GetPlayer().AddItem((GetItem_Runecrafting_Rune_Nature()), (essCount*multiplier))
			rsXPGain("runecrafting", (xpPerRune * essCount))
		endif
	elseif runeType == "law"
		int req = 54
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			;pure only
			float xpPerRune = 9.5
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
			int multiplier
			if (rcLVL >= 95)
				multiplier = 2
			else
				multiplier = 1
			endif
			Game.GetPlayer().AddItem((GetItem_Runecrafting_Rune_Law()), (essCount*multiplier))
			rsXPGain("runecrafting", (xpPerRune * essCount))
		endif
	elseif runeType == "death"
		int req = 65
		int rcLVL = GetRunecraftingLVL().GetValue() as int
		if rcLVL < req
			debug.notification("You lack the required runecrafting level of " + req)
		else
			;pure only
			float xpPerRune = 10.0
			Game.GetPlayer().RemoveItem(GetItem_Runecrafting_RuneEssencePure(), (Game.GetPlayer().GetItemCount(GetItem_Runecrafting_RuneEssencePure())))
			int multiplier
			if (rcLVL >= 99)
				multiplier = 2
			else
				multiplier = 1
			endif
			Game.GetPlayer().AddItem((GetItem_Runecrafting_Rune_Death()), (essCount*multiplier))
			rsXPGain("runecrafting", (xpPerRune * essCount))
		endif
	else
		debug.messagebox("Runecrafting Error 002 - Could not parse runeType2")
	endif

	if (((GetGlobalCheck_RandomEvents()).GetValue()) == 1)
		RollRandomEvent("runecrafting", spawnLocation)
	endif
EndFunction

Function rsCraftRCTiara(string runeType, int count, ObjectReference spawnLocation) Global

	float gainedXP = 0
	int countTalisman = 0
	Armor tiara = GetArmor_Head_Tiara()
	int countTiara = Game.GetPlayer().GetItemCount(tiara)
	
	if runeType == "air"
		gainedXP = 25
		MiscObject talisman = GetItem_Talisman_Air()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))		
		rsMakeTiara(GetItem_Talisman_Air(), GetArmor_Head_Tiara_Air(), count, gainedXP, countTalisman, countTiara)
	elseif runeType == "mind"
		gainedXP = 27.5
		MiscObject talisman = GetItem_Talisman_Mind()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTiara(GetItem_Talisman_Mind(), GetArmor_Head_Tiara_Mind(), count, gainedXP, countTalisman, countTiara)
	elseif runeType == "water"
		gainedXP = 30
		MiscObject talisman = GetItem_Talisman_Water()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTiara(GetItem_Talisman_Water(), GetArmor_Head_Tiara_Water(), count, gainedXP, countTalisman, countTiara)
	elseif runeType == "earth"
		gainedXP = 32.5
		MiscObject talisman = GetItem_Talisman_Earth()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTiara(GetItem_Talisman_Earth(), GetArmor_Head_Tiara_Earth(), count, gainedXP, countTalisman, countTiara)
	elseif runeType == "fire"
		gainedXP = 35
		MiscObject talisman = GetItem_Talisman_Fire()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTiara(GetItem_Talisman_Fire(), GetArmor_Head_Tiara_Fire(), count, gainedXP, countTalisman, countTiara)
	elseif runeType == "body"
		gainedXP = 37.5
		MiscObject talisman = GetItem_Talisman_Body()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTiara(GetItem_Talisman_Body(), GetArmor_Head_Tiara_Body(), count, gainedXP, countTalisman, countTiara)
	elseif runeType == "cosmic"
		gainedXP = 40
		MiscObject talisman = GetItem_Talisman_Cosmic()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTiara(GetItem_Talisman_Cosmic(), GetArmor_Head_Tiara_Cosmic(), count, gainedXP, countTalisman, countTiara)
	elseif runeType == "chaos"
		gainedXP = 42.5
		MiscObject talisman = GetItem_Talisman_Chaos()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTiara(GetItem_Talisman_Chaos(), GetArmor_Head_Tiara_Chaos(), count, gainedXP, countTalisman, countTiara)
	elseif runeType == "nature"
		gainedXP = 45
		MiscObject talisman = GetItem_Talisman_Nature()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTiara(GetItem_Talisman_Nature(), GetArmor_Head_Tiara_Nature(), count, gainedXP, countTalisman, countTiara)
	elseif runeType == "law"
		gainedXP = 47.5
		MiscObject talisman = GetItem_Talisman_Law()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTiara(GetItem_Talisman_Law(), GetArmor_Head_Tiara_Law(), count, gainedXP, countTalisman, countTiara)
	elseif runeType == "death"
		gainedXP = 50
		MiscObject talisman = GetItem_Talisman_Death()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTiara(GetItem_Talisman_Death(), GetArmor_Head_Tiara_Death(), count, gainedXP, countTalisman, countTiara)
	else
		debug.messagebox("Runecrafting Error 001 - Could not parse runeType")
	endif
	
	if (((GetGlobalCheck_RandomEvents()).GetValue()) == 1)
		RollRandomEvent("runecrafting", spawnLocation)
	endif
	
EndFunction

Function rsCraftTalismanStaff(string runeType, int count, ObjectReference spawnLocation) Global
	
	float gainedXP = 0
	int countTalisman = 0
	Weapon staff = GetWeapon_Staff_Talisman()
	int countStaff = Game.GetPlayer().GetItemCount(staff)
	
	if runeType == "air"
		gainedXP = 25
		MiscObject talisman = GetItem_Talisman_Air()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))		
		rsMakeTalismanStaff(GetItem_Talisman_Air(), GetWeapon_Staff_Talisman_Air(), count, gainedXP, countTalisman, countStaff)
	elseif runeType == "mind"
		gainedXP = 27.5
		MiscObject talisman = GetItem_Talisman_Mind()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTalismanStaff(GetItem_Talisman_Mind(), GetWeapon_Staff_Talisman_Mind(), count, gainedXP, countTalisman, countStaff)
	elseif runeType == "water"
		gainedXP = 30
		MiscObject talisman = GetItem_Talisman_Water()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTalismanStaff(GetItem_Talisman_Water(), GetWeapon_Staff_Talisman_Water(), count, gainedXP, countTalisman, countStaff)
	elseif runeType == "earth"
		gainedXP = 32.5
		MiscObject talisman = GetItem_Talisman_Earth()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTalismanStaff(GetItem_Talisman_Earth(), GetWeapon_Staff_Talisman_Earth(), count, gainedXP, countTalisman, countStaff)
	elseif runeType == "fire"
		gainedXP = 35
		MiscObject talisman = GetItem_Talisman_Fire()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTalismanStaff(GetItem_Talisman_Fire(), GetWeapon_Staff_Talisman_Fire(), count, gainedXP, countTalisman, countStaff)
	elseif runeType == "body"
		gainedXP = 37.5
		MiscObject talisman = GetItem_Talisman_Body()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTalismanStaff(GetItem_Talisman_Body(), GetWeapon_Staff_Talisman_Body(), count, gainedXP, countTalisman, countStaff)
	elseif runeType == "cosmic"
		gainedXP = 40
		MiscObject talisman = GetItem_Talisman_Cosmic()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTalismanStaff(GetItem_Talisman_Cosmic(), GetWeapon_Staff_Talisman_Cosmic(), count, gainedXP, countTalisman, countStaff)
	elseif runeType == "chaos"
		gainedXP = 42.5
		MiscObject talisman = GetItem_Talisman_Chaos()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTalismanStaff(GetItem_Talisman_Chaos(), GetWeapon_Staff_Talisman_Chaos(), count, gainedXP, countTalisman, countStaff)
	elseif runeType == "nature"
		gainedXP = 45
		MiscObject talisman = GetItem_Talisman_Nature()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTalismanStaff(GetItem_Talisman_Nature(), GetWeapon_Staff_Talisman_Nature(), count, gainedXP, countTalisman, countStaff)
	elseif runeType == "law"
		gainedXP = 47.5
		MiscObject talisman = GetItem_Talisman_Law()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTalismanStaff(GetItem_Talisman_Law(), GetWeapon_Staff_Talisman_Law(), count, gainedXP, countTalisman, countStaff)
	elseif runeType == "death"
		gainedXP = 50
		MiscObject talisman = GetItem_Talisman_Death()
		countTalisman = (Game.GetPlayer().GetItemCount(talisman))
		rsMakeTalismanStaff(GetItem_Talisman_Death(), GetWeapon_Staff_Talisman_Death(), count, gainedXP, countTalisman, countStaff)
	else
		debug.messagebox("Runecrafting Error 001 - Could not parse runeType")
	endif
	
	if (((GetGlobalCheck_RandomEvents()).GetValue()) == 1)
		RollRandomEvent("runecrafting", spawnLocation)
	endif
	
EndFunction

;Gets amount of pure ess in pouches, zeroes out involved pouches afterwards
int Function GetPouchPureCount(bool small, bool medium, bool large, bool giant) Global
	RemoveSparePouches();Removes spare pouches
	int smallCount = 0
	int mediumCount = 0
	int largeCount = 0
	int giantCount = 0
	
	if (small == true)
		smallCount = GetCount_Runecrafting_EssPure_Small().GetValue() as int
		GetCount_Runecrafting_EssPure_Small().SetValue(0)
	endif
	if (medium == true)
		mediumCount = GetCount_Runecrafting_EssPure_Medium().GetValue() as int
		GetCount_Runecrafting_EssPure_Medium().SetValue(0)
	endif
	if (large == true)
		largeCount = GetCount_Runecrafting_EssPure_Large().GetValue() as int
		GetCount_Runecrafting_EssPure_Large().SetValue(0)
	endif
	if (giant == true)
		giantCount = GetCount_Runecrafting_EssPure_Giant().GetValue() as int
		GetCount_Runecrafting_EssPure_Giant().SetValue(0)
	endif
	
	return (smallCount + mediumCount + largeCount + giantCount)
EndFunction

;Gets amount of either ess in pouches, zeroes out involved pouches afterwards
int Function GetPouchEssCount(bool small, bool medium, bool large, bool giant) Global
	RemoveSparePouches();Removes spare pouches
	int smallCount = 0
	int mediumCount = 0
	int largeCount = 0
	int giantCount = 0
	
	if (small == true)
		smallCount = ((GetCount_Runecrafting_Ess_Small().GetValue()) + (GetCount_Runecrafting_EssPure_Small().GetValue())) as int
		GetCount_Runecrafting_EssPure_Small().SetValue(0)
		GetCount_Runecrafting_Ess_Small().SetValue(0)
	endif
	if (medium == true)
		mediumCount = ((GetCount_Runecrafting_Ess_Medium().GetValue()) + (GetCount_Runecrafting_EssPure_Medium().GetValue())) as int
		GetCount_Runecrafting_EssPure_Medium().SetValue(0)
		GetCount_Runecrafting_Ess_Medium().SetValue(0)
	endif
	if (large == true)
		largeCount = ((GetCount_Runecrafting_Ess_Large().GetValue()) + (GetCount_Runecrafting_EssPure_Large().GetValue())) as int
		GetCount_Runecrafting_EssPure_Large().SetValue(0)
		GetCount_Runecrafting_Ess_Large().SetValue(0)
	endif
	if (giant == true)
		giantCount = ((GetCount_Runecrafting_Ess_Giant().GetValue()) + (GetCount_Runecrafting_EssPure_Giant().GetValue())) as int
		GetCount_Runecrafting_EssPure_Giant().SetValue(0)
		GetCount_Runecrafting_Ess_Giant().SetValue(0)
	endif
	
	return (smallCount + mediumCount + largeCount + giantCount)
EndFunction

;< Information
;WIP
;
;Resources:
;http://runescape.wikia.com/wiki/Thieving
;https://www.reddit.com/r/2007scape/comments/301w6d/the_laws_of_gielnor_jagex_formula_transparency/
;maybe take the probability of woodcutting (a number between 0-100) and minus 100, then get the absolute value.... 62=62%               [62-100] = 38%
;
;Knights (Req. 55) 59-60 (Analysis of data in above paragrph;
;                                       not an identical run.)
;Actual: 150/198 = 75.76%
;Avg Time per Success: 1.91 sec
;XP: 84.3 (159k/hr)
;Loot: 50 gp (94k/hr)
;
;Master Farmers (Req. 38) 61
;Actual: 108/138 = 78.26%
;Avg Time per Success: 1.77 sec
;XP: 43 (87k/hr)
;Loot: 95.7 gp (195k/hr)
;      I ignored all low-value seeds, valuing only seeds exceeding 1k each.
;      I got: 1 Rannar, 1 Snap, 2 Toadflax, 1 Watermelon - 10.3k total
;
;Warriors (Req. 25) 61
;Actual: 137/167 = 82.04% (This number may be inflated, I was interrupted
;                          by a rather rude newbie who intentionally killed my
;                          targets. I noticed a much higher success rate against
;                          warriors under attack.)
;Avg Time per Success: 1.57 sec
;XP: 26 (60k/hr)
;Loot: 18 gp (41k/hr)
;
;Farmers (Req. 10) 61
;Actual: 131/161 = 81.37%
;Avg Time per Success: 1.61 sec
;XP: 14.5(32k/hr)
;Loot: 9 gp(20k/hr)
;
;Man (Req 1) 61
;Actual: 176/191 = 92.15%
;Avg Time per Success: 1.02 sec
;XP: 8 (28k/hr)
;Loot: 3 gp (11k/hr)
;	
;	
;	
;	
;	A counter that starts when stealing from a stall, that counts down from 5 minutes after the last successful thieving (Steal cake, timer starts, steal cake again, timer resets)
;	
;	Possible prob:
;	(1% for every thieving level above the required lvl)
;
;	Reminder to make Strange Rock DnD in framework, this can be toggled off. Finding the 2nd rock in a set is 50% less likely after obtaining the first
;	xp gained = level^2 - (2 * level) + 100
;>
;--ACTION--Item stealing script, optional xp gain, has random events
bool Function TryToSteal_NPC(int reqLVL, ObjectReference spawnLocation) Global
	if (((GetGlobalCheck_RandomEvents()).GetValue()) == 1)
		RollRandomEvent("thieving", spawnLocation)
	endif
	;The shitty probability formula
	if ((GetThievingLVL()).GetValue() - reqLVL) < 20
		if (Utility.RandomInt(1,4) == 1)
            return false
		else
			return true
		endif
	else
		if (Utility.RandomInt(1,8) == 1)
            return false
		else
			return true
		endif
	endif
EndFunction

;--FUNCTION--This checks the player's Thieving LVL and Agility LVL and sees if the player is going to steal more than once
int Function RollMultiSteal(int reqLVL) Global
	int tLVL = (GetThievingLVL().GetValue()) as int
	int aLVL = (GetAgilityLVL().GetValue()) as int
	If tLVL - 30 >= reqLVL && aLVL - 20 >= reqLVL
		return 4; Steal 4 times
	ElseIf tLVL - 20 >= reqLVL && aLVL - 10 >= reqLVL
		return 3; Steal 3 times
	ElseIf  tLVL - 10 >= reqLVL && aLVL >= reqLVL
		return 2; Steal 2 times
	Else
		return 1; Steal 1 time
	EndIf
EndFunction

;--ACTION--Cluster-Item harvesting script (like oak trees and LRC mineral deposits), optional xp gain, has random events -- come back to this part and add multi-add item statements  
Function HarvestItemCluster(GlobalVariable skillCounter, ObjectReference objRef, Activator depletedActivator, int reqLVL, MiscObject newItem, weapon equippedTool, Sound harvestSound, Sound depleteSound,  ObjectReference soundSource, Float respawnInterval, int addCount, bool xpGain = false, string skillName = "", float gainedXP = 0.0, ObjectReference spawnLocation) Global
	if (((GetGlobalCheck_RandomEvents()).GetValue()) == 1)
		RollRandomEvent(skillName, spawnLocation)
	endif
	;The meat and potatoes... the probability formula
	If skillCounter.GetValue() <= 0
		float mod = GetToolStrength(equippedTool)
		int LVL = (rsGetLVLGlobalFromString(skillName).GetValue() as int)
		Int intmathDelay = ((20-(LVL/10)) - Mod + reqLVL) as Int
		int probability = Utility.RandomInt(0,intMathDelay)
		skillCounter.SetValue(probability)
	Else
		int probability = skillCounter.GetValue() as Int
		probability = (probability - 1)
		If (probability > 0)
			skillCounter.SetValue(probability)
		ElseIf (probability <= 0)
			skillCounter.SetValue(0)
			if harvestSound != none
				harvestSound.Play(soundSource)
			endif
			Game.GetPlayer().AddItem(newItem, addCount)
			rsXPGain(skillName, gainedXP)
			Int depletedChance = Utility.RandomInt(1,6)
			If depletedChance == 6
				ObjectReference harvestedRef = objRef.PlaceAtMe(depletedActivator, 1, False, True)
				depleteSound.Play(soundSource)
				objRef.Disable()
				harvestedRef.Enable()
				Utility.Wait(respawnInterval)
				harvestedRef.Delete()
				objRef.Enable()
			EndIf
		EndIf
	EndIf	
EndFunction

;--MENU--This is the crafting count screen for crafting and other utilities
int Function rsMakeCount(Message makeCount) Global
	int count = makeCount.Show()
	If count == 0;1x
		return 1
	ElseIf count == 1;5x
		return 5
	ElseIf count == 2;10x
		return 10
	ElseIf count == 3;all
		return 666
	ElseIf count == 4;back
		return 0
	Else;exit
		return 0
	EndIf
EndFunction

;--FUNCTION--This gets the currentgametime, then subtracts the passed in global time marker, and gets the difference in hours
float Function GetElapsedHours(GlobalVariable prevTime) Global
	float skyscapeHours = (Utility.GetCurrentRealTime()) / 3600; Take current game-seconds, make it game-hours
	return (skyscapeHours - (prevTime.GetValue()))
EndFunction

;--FUNCTION--This gets the currentgametime, then subtracts the passed in global time marker, and gets the difference in hours
float Function GetElapsedMinutes(GlobalVariable prevTime) Global
	float skyscapeMinutes = (Utility.GetCurrentRealTime()) / 60; Take current game-seconds, make it game-hours
	return (skyscapeMinutes - (prevTime.GetValue()))
EndFunction

;--FUNCTION--This gets the currentgametime, then subtracts the passed in global time marker, and gets the difference in hours
float Function GetElapsedSeconds(GlobalVariable prevTime) Global
	float skyscapeSeconds = (Utility.GetCurrentRealTime()); Take current game-seconds, make it game-hours
	return (skyscapeSeconds - (prevTime.GetValue()))
EndFunction

Function TimeStampHours(GlobalVariable globalValue) Global
	float skyscapeHours = (Utility.GetCurrentRealTime()) / 3600
	globalValue.SetValue(skyscapeHours)
EndFunction

Function TimeStampMinutes(GlobalVariable globalValue) Global
	float skyscapeMinutes = (Utility.GetCurrentRealTime()) / 60
	globalValue.SetValue(skyscapeMinutes)
EndFunction

Function TimeStampSeconds(GlobalVariable globalValue) Global
	float skyscapeSeconds = (Utility.GetCurrentRealTime())
	globalValue.SetValue(skyscapeSeconds)
EndFunction

;>
;< Child functions - do not use these functions, use the parent above

Function rsMakeComboRunes(string runeType2, int essCount, float xpPerRune) Global
	bool bWornBindingNecklace = Game.GetPlayer().IsEquipped(GetArmor_Neck_Necklace_Binding())
	if bWornBindingNecklace == true; Binding Necklace is worn, 100% success rate, degrades slightly
		GetCount_Charges_BindingNecklace().SetValue((GetCount_Charges_BindingNecklace().GetValue() - 1))
		if runeType2 == "dust"
			Game.GetPlayer().AddItem(GetItem_Runecrafting_Rune_Dust(), essCount)
			rsXPGain("runecrafting", (esscount*xpPerRune))
		elseif runeType2 == "lava"
			Game.GetPlayer().AddItem(GetItem_Runecrafting_Rune_Lava(), essCount)
			rsXPGain("runecrafting", (esscount*xpPerRune))
		elseif runeType2 == "mist"
			Game.GetPlayer().AddItem(GetItem_Runecrafting_Rune_Mist(), essCount)
			rsXPGain("runecrafting", (esscount*xpPerRune))
		elseif runeType2 == "mud"
			Game.GetPlayer().AddItem(GetItem_Runecrafting_Rune_Mud(), essCount)
			rsXPGain("runecrafting", (esscount*xpPerRune))
		elseif runeType2 == "smoke"
			Game.GetPlayer().AddItem(GetItem_Runecrafting_Rune_Smoke(), essCount)
			rsXPGain("runecrafting", (esscount*xpPerRune))
		elseif runeType2 == "steam"
			Game.GetPlayer().AddItem(GetItem_Runecrafting_Rune_Steam(), essCount)
			rsXPGain("runecrafting", (esscount*xpPerRune))
		endif
	else; Binding Necklace is not worn, 50% success rate
		essCount = RollLoss50Percent(essCount)
		if runeType2 == "dust"
			Game.GetPlayer().AddItem(GetItem_Runecrafting_Rune_Dust(), essCount)
			rsXPGain("runecrafting", (esscount*xpPerRune))
		elseif runeType2 == "lava"
			Game.GetPlayer().AddItem(GetItem_Runecrafting_Rune_Lava(), essCount)
			rsXPGain("runecrafting", (esscount*xpPerRune))
		elseif runeType2 == "mist"
			Game.GetPlayer().AddItem(GetItem_Runecrafting_Rune_Mist(), essCount)
			rsXPGain("runecrafting", (esscount*xpPerRune))
		elseif runeType2 == "mud"
			Game.GetPlayer().AddItem(GetItem_Runecrafting_Rune_Mud(), essCount)
			rsXPGain("runecrafting", (esscount*xpPerRune))
		elseif runeType2 == "smoke"
			Game.GetPlayer().AddItem(GetItem_Runecrafting_Rune_Smoke(), essCount)
			rsXPGain("runecrafting", (esscount*xpPerRune))
		elseif runeType2 == "steam"
			Game.GetPlayer().AddItem(GetItem_Runecrafting_Rune_Steam(), essCount)
			rsXPGain("runecrafting", (esscount*xpPerRune))
		endif
	endif
EndFunction

Function rsMakeTalismanStaff(MiscObject talisman, Weapon staff, int count, float gainedXP, int countTalisman, int countStaff) Global
	bool bWantToLeave = false
	if count == 666
		While (bWantToLeave == false)
			if countTalisman >= 1 && countStaff >= 1
				Game.GetPlayer().RemoveItem(GetWeapon_Staff_Talisman(), 1, true)
				Game.GetPlayer().RemoveItem(talisman, 1, true)
				GetSound_UI_Runecrafting().Play(Game.GetPlayer())
				Utility.Wait(1)
				Game.GetPlayer().AddItem(staff, 1)
				rsXPGain("runecrafting", gainedXP)
				bWantToLeave = Input.IsKeyPressed(18)
			elseif countTalisman >= 1 && countStaff < 1; not enough Staffs
				bWantToLeave = true
				Debug.Notification("You need need an additional Talisman Staff before you can craft more.")
			elseif countStaff >= 1 && countTalisman < 1; not enough Talismans
				bWantToLeave = true
				Debug.Notification("You need need an additional Talisman before you can craft more.")
			else;not enough of either item
				bWantToLeave = true
				Debug.Notification("You need need an additional Talisman Staff and Talisman before you can craft more.")
			endif
		EndWhile
	else
		While (count != 0 && bWantToLeave == false)
			if countTalisman >= 1 && countStaff >= 1
				Game.GetPlayer().RemoveItem(GetWeapon_Staff_Talisman(), 1, true)
				Game.GetPlayer().RemoveItem(talisman, 1, true)
				GetSound_UI_Runecrafting().Play(Game.GetPlayer())
				Utility.Wait(1)
				Game.GetPlayer().AddItem(staff, 1)
				rsXPGain("runecrafting", gainedXP)
				bWantToLeave = Input.IsKeyPressed(18)
				count = (count - 1)
			elseif countTalisman >= 1 && countStaff < 1; not enough Staffs
				bWantToLeave = true
				Debug.Notification("You need need an additional Talisman Staff before you can craft more.")
			elseif countStaff >= 1 && countTalisman < 1; not enough Talismans
				bWantToLeave = true
				Debug.Notification("You need need an additional Talisman before you can craft more.")
			else;not enough of either item
				bWantToLeave = true
				Debug.Notification("You need need an additional Talisman Staff and Talisman before you can craft more.")
			endif
		EndWhile
	endif
endfunction

Function rsMakeTiara(MiscObject talisman, Armor tiara, int count, float gainedXP, int countTalisman, int countTiara) Global
	bool bWantToLeave = false
	if count == 666
		While (bWantToLeave == false)
			if countTalisman >= 1 && countTiara >= 1
				Game.GetPlayer().RemoveItem(GetArmor_Head_Tiara(), 1, true)
				Game.GetPlayer().RemoveItem(talisman, 1, true)
				GetSound_UI_Runecrafting().Play(Game.GetPlayer())
				Utility.Wait(1)
				Game.GetPlayer().AddItem(tiara, 1)
				rsXPGain("runecrafting", gainedXP)
				bWantToLeave = Input.IsKeyPressed(18)
			elseif countTalisman >= 1 && countTiara < 1; not enough tiaras
				bWantToLeave = true
				Debug.Notification("You need need an additional tiara before you can craft more.")
			elseif countTiara >= 1 && countTalisman < 1; not enough talismans
				bWantToLeave = true
				Debug.Notification("You need need an additional talisman before you can craft more.")
			else;not enough of either item
				bWantToLeave = true
				Debug.Notification("You need need an additional tiara and talisman before you can craft more.")
			endif
		EndWhile
	else
		While (count != 0 && bWantToLeave == false)
			if countTalisman >= 1 && countTiara >= 1
				Game.GetPlayer().RemoveItem(GetArmor_Head_Tiara(), 1, true)
				Game.GetPlayer().RemoveItem(talisman, 1, true)
				GetSound_UI_Runecrafting().Play(Game.GetPlayer())
				Utility.Wait(1)
				Game.GetPlayer().AddItem(tiara, 1)
				rsXPGain("runecrafting", gainedXP)
				bWantToLeave = Input.IsKeyPressed(18)
				count = (count - 1)
			elseif countTalisman >= 1 && countTiara < 1; not enough tiaras
				bWantToLeave = true
				Debug.Notification("You need need an additional tiara before you can craft more.")
			elseif countTiara >= 1 && countTalisman < 1; not enough talismans
				bWantToLeave = true
				Debug.Notification("You need need an additional talisman before you can craft more.")
			else;not enough of either item
				bWantToLeave = true
				Debug.Notification("You need need an additional tiara and talisman before you can craft more.")
			endif
		EndWhile
	endif
endfunction
;Returns the strength of the equipped tool (pickaxe or hatchet)
Float Function GetToolStrength(weapon equippedTool) Global
	If (GetFormList_WeaponBronze()).HasForm(equippedTool)
		return 0.0
	ElseIf (GetFormList_WeaponIron()).HasForm(equippedTool)
		return 0.5
	ElseIf (GetFormList_WeaponSteel()).HasForm(equippedTool)
		return 1.0
	ElseIf (GetFormList_WeaponBlack()).HasForm(equippedTool)
		return 1.5
	ElseIf (GetFormList_WeaponMithril()).HasForm(equippedTool)
		return 2.0
	ElseIf (GetFormList_WeaponAdamant()).HasForm(equippedTool)
		return 3.0
	ElseIf (GetFormList_WeaponRune()).HasForm(equippedTool) || (GetFormList_WeaponSacredClay()).HasForm(equippedTool) || (GetFormList_WeaponVolatileClay()).HasForm(equippedTool)
		return 4.0
	ElseIf (GetFormList_WeaponDragon()).HasForm(equippedTool) || equippedTool == (GetWeapon_Special_InfernoAdze())
		return 5.0
	Else
		Debug.MessageBox("Couldn't get the tool strength for item = " + equippedTool.GetName())
	EndIf
EndFunction

;Pass in a Skill as a String, and get the matching Globalvariable for LVL
Globalvariable Function rsGetLVLGlobalFromString(string skillName) Global
	if skillName == "agility"
		return Game.GetFormFromFile(0x029524, "skyscape.esm") as GlobalVariable
	elseif skillName == "attack"
		return Game.GetFormFromFile(0x02951A, "skyscape.esm") as GlobalVariable
	elseif skillName == "constitution"
		return Game.GetFormFromFile(0x029534, "skyscape.esm") as GlobalVariable
	elseif skillName == "construction"
		return Game.GetFormFromFile(0x029526, "skyscape.esm") as GlobalVariable
	elseif skillName == "cooking"
		return Game.GetFormFromFile(0x029528, "skyscape.esm") as GlobalVariable
	elseif skillName == "crafting"
		return Game.GetFormFromFile(0x02952A, "skyscape.esm") as GlobalVariable
	elseif skillName == "defence"
		return Game.GetFormFromFile(0x02951E, "skyscape.esm") as GlobalVariable
	elseif skillName == "divination"
		return Game.GetFormFromFile(0x294A8F, "skyscape.esm") as GlobalVariable
	elseif skillName == "dungeoneering"
		return Game.GetFormFromFile(0x02952C, "skyscape.esm") as GlobalVariable
	elseif skillName == "farming"
		return Game.GetFormFromFile(0x029530, "skyscape.esm") as GlobalVariable
	elseif skillName == "firemaking"
		return Game.GetFormFromFile(0x001DAB, "skyscape.esm") as GlobalVariable
	elseif skillName == "fishing"
		return Game.GetFormFromFile(0x004BCE, "skyscape.esm") as GlobalVariable
	elseif skillName == "fletching"
		return Game.GetFormFromFile(0x029532, "skyscape.esm") as GlobalVariable
	elseif skillName == "herblore"
		return Game.GetFormFromFile(0x026778, "skyscape.esm") as GlobalVariable
	elseif skillName == "hunter"
		return Game.GetFormFromFile(0x029536, "skyscape.esm") as GlobalVariable
	elseif skillName == "invention"
		return Game.GetFormFromFile(0x294A90, "skyscape.esm") as GlobalVariable
	elseif skillName == "magic"
		return Game.GetFormFromFile(0x029522, "skyscape.esm") as GlobalVariable
	elseif skillName == "mining"
		return Game.GetFormFromFile(0x00BD72, "skyscape.esm") as GlobalVariable
	elseif skillName == "prayer"
		return Game.GetFormFromFile(0x0261E5, "skyscape.esm") as GlobalVariable
	elseif skillName == "ranged"
		return Game.GetFormFromFile(0x029520, "skyscape.esm") as GlobalVariable
	elseif skillName == "runecrafting"
		return Game.GetFormFromFile(0x029538, "skyscape.esm") as GlobalVariable
	elseif skillName == "slayer"
		return Game.GetFormFromFile(0x02953A, "skyscape.esm") as GlobalVariable
	elseif skillName == "smithing"
		return Game.GetFormFromFile(0x01B0D1, "skyscape.esm") as GlobalVariable
	elseif skillName == "strength"
		return Game.GetFormFromFile(0x02951B, "skyscape.esm") as GlobalVariable
	elseif skillName == "thieving"
		return Game.GetFormFromFile(0x02953D, "skyscape.esm") as GlobalVariable
	elseif skillName == "woodcutting"
		return Game.GetFormFromFile(0x0012C8, "skyscape.esm") as GlobalVariable
	else
		Debug.Trace("rsGetLVLGlobalFromString -- Bad string provided '" + skillName + "'.")
	endif
EndFunction

;Pass in a Skill as a String, and get the matching Globalvariable for XP
Globalvariable Function rsGetXPGlobalFromString(string skillName) Global
	if skillName == "agility"
		return Game.GetFormFromFile(0x029525, "skyscape.esm") as GlobalVariable
	elseif skillName == "attack"
		return Game.GetFormFromFile(0x02951C, "skyscape.esm") as GlobalVariable
	elseif skillName == "constitution"
		return Game.GetFormFromFile(0x029535, "skyscape.esm") as GlobalVariable
	elseif skillName == "construction"
		return Game.GetFormFromFile(0x029527, "skyscape.esm") as GlobalVariable
	elseif skillName == "cooking"
		return Game.GetFormFromFile(0x029529, "skyscape.esm") as GlobalVariable
	elseif skillName == "crafting"
		return Game.GetFormFromFile(0x02952B, "skyscape.esm") as GlobalVariable
	elseif skillName == "defence"
		return Game.GetFormFromFile(0x02951F, "skyscape.esm") as GlobalVariable
	elseif skillName == "divination"
		return Game.GetFormFromFile(0x294A91, "skyscape.esm") as GlobalVariable
	elseif skillName == "dungeoneering"
		return Game.GetFormFromFile(0x02952D, "skyscape.esm") as GlobalVariable
	elseif skillName == "farming"
		return Game.GetFormFromFile(0x029531, "skyscape.esm") as GlobalVariable
	elseif skillName == "firemaking"
		return Game.GetFormFromFile(0x001DAA, "skyscape.esm") as GlobalVariable
	elseif skillName == "fishing"
		return Game.GetFormFromFile(0x004BCF, "skyscape.esm") as GlobalVariable
	elseif skillName == "fletching"
		return Game.GetFormFromFile(0x029533, "skyscape.esm") as GlobalVariable
	elseif skillName == "herblore"
		return Game.GetFormFromFile(0x026779, "skyscape.esm") as GlobalVariable
	elseif skillName == "hunter"
		return Game.GetFormFromFile(0x029537, "skyscape.esm") as GlobalVariable
	elseif skillName == "invention"
		return Game.GetFormFromFile(0x294A92, "skyscape.esm") as GlobalVariable
	elseif skillName == "magic"
		return Game.GetFormFromFile(0x029523, "skyscape.esm") as GlobalVariable
	elseif skillName == "mining"
		return Game.GetFormFromFile(0x00BD73, "skyscape.esm") as GlobalVariable
	elseif skillName == "prayer"
		return Game.GetFormFromFile(0x0261E6, "skyscape.esm") as GlobalVariable
	elseif skillName == "ranged"
		return Game.GetFormFromFile(0x029521, "skyscape.esm") as GlobalVariable
	elseif skillName == "runecrafting"
		return Game.GetFormFromFile(0x029539, "skyscape.esm") as GlobalVariable
	elseif skillName == "slayer"
		return Game.GetFormFromFile(0x02953B, "skyscape.esm") as GlobalVariable
	elseif skillName == "smithing"
		return Game.GetFormFromFile(0x01B0D2, "skyscape.esm") as GlobalVariable
	elseif skillName == "strength"
		return Game.GetFormFromFile(0x02951D, "skyscape.esm") as GlobalVariable
	elseif skillName == "thieving"
		return Game.GetFormFromFile(0x02953C, "skyscape.esm") as GlobalVariable
	elseif skillName == "woodcutting"
		return Game.GetFormFromFile(0x0012C9, "skyscape.esm") as GlobalVariable
	else
		Debug.Trace("rsGetXPGlobalFromString -- Bad string provided '" + skillName + "'.")
	endif
EndFunction

;Rolls for a random event, pass through what you were doing when it was triggered, and the spawn location of the actorbase (can be location of skilling activator -- self) -- untested
Function RollRandomEvent(string randomType = "general", objectreference spawnLocation) Global
	;=====================
	;Add condition to check if player is in a non-event area:
	;TzHaar Fight Cave, Pest Control (While in bank or during the activity and waiting in the boats), Soul Wars, God Wars Dungeon, Kuradal's Dungeon, Pyramid Plunder, Runecrafting Altars during the Great Orb Project (though they can still appear in the guild itself after finishing the game) They did happen when runecrafting normally to get runes, Fist of Guthix (while playing), Under Daemonheim during Dungeoneering, While Guthix Sleeps cavern (tormented demons), Balthazar Beauregard's Big Top Bonanza, Clan Wars (though they can still happen after a war), Ape Atoll (with greegree equipped, without the greegree on, you can still get randoms), Waterbirth Island Dungeon, Clan Citadels, Ancient Cavern, Glacor Cave (The area available after completion of the quest, Ritual of the Mahjarrat), which contains Glacors.(non-aggressive) 
	;=====================
	If Utility.RandomInt(1,512) == 1
		if randomType == "general"
			;spawn a unique actor that engages the player in a conversation, dialogue take over from there. Remember to disable the actor after a while.
		elseif randomType == "fishing"
			Game.EnablePlayerControls()
			spawnLocation.PlaceActorAtMe((GetActorBase_RandomEvent_RiverTroll())).StartCombat(Game.GetPlayer())
			;---Delete two statements above this one when ready to add more randoms
			;randomChoice = Utility.RandomInt(0,x)
			;if randomChoice == 0 Certer
			;elseif randomChoice == 1 Drill Demon
			;elseif randomChoice == 2 Freaky Forester, etc.
			;endif
		elseif randomType == "mining"
			spawnLocation.PlaceActorAtMe((GetActorBase_RandomEvent_RockGolem())).StartCombat(Game.GetPlayer())
			;---Delete two statements above this one when ready to add more randoms
			;randomChoice = Utility.RandomInt(0,x)
			;if randomChoice == 0 Certer
			;elseif randomChoice == 1 Drill Demon
			;elseif randomChoice == 2 Freaky Forester, etc.
			;endif
		elseif randomType == "woodcutting"
			spawnLocation.PlaceActorAtMe((GetActorBase_RandomEvent_TreeSpirit())).StartCombat(Game.GetPlayer())
			;---Delete two statements above this one when ready to add more randoms
			;randomChoice = Utility.RandomInt(0,x)
			;if randomChoice == 0 Certer
			;elseif randomChoice == 1 Drill Demon
			;elseif randomChoice == 2 Freaky Forester, etc.
			;endif
		elseif randomType == "thieving"
			spawnLocation.PlaceActorAtMe((GetActorBase_RandomEvent_Watchman())).StartCombat(Game.GetPlayer())
			;---Delete two statements above this one when ready to add more randoms
			;randomChoice = Utility.RandomInt(0,x)
			;if randomChoice == 0 Certer
			;elseif randomChoice == 1 Drill Demon
			;elseif randomChoice == 2 Freaky Forester, etc.
			;endif
		endif
	EndIf
EndFunction

;Get player's combat level -- untested
int Function GetCombatLVL() Global
	
	Int pLVL = (((GetPrayerLVL()).GetValue())/2) as Int
	Int sLVL = (((GetSummoningLVL()).GetValue())/2) as Int
	Int dLVL = (GetDefenceLVL()).GetValue() as Int
	Int cLVL = (GetConstitutionLVL()).GetValue() as Int
	Int strLVL = (GetStrengthLVL()).GetValue() as Int
	Int attLVL = (GetAttackLVL()).GetValue() as Int
	Int rLVL = (GetRangedLVL()).GetValue() as Int
	Int mLVL = (GetMagicLVL()).GetValue() as Int
	Float BaseLVL = 0.25 * (dLVL + cLVL + pLVL + sLVL)
	
	Float WarriorLVL = 0.325 * (attLVL + strLVL);\
	Float RangerLVL = 0.325 * (1.5 * rLVL);       }Highest of three to be added to BaseLevel
	Float MageLVL = 0.325 * (1.5 * mLVL);        /
	
	If WarriorLVL > RangerLVL && WarriorLVL > MageLVL
		Int CombatLVL = (BaseLVL + WarriorLVL) as Int
		return CombatLVL
	ElseIf RangerLVL > WarriorLVL && RangerLVL > MageLVL
		Int CombatLVL = (BaseLVL + RangerLVL) as Int
		return CombatLVL
	ElseIf MageLVL > WarriorLVL && MageLVL > RangerLVL
		Int CombatLVL = (BaseLVL + MageLVL) as Int
		return CombatLVL
	ElseIf WarriorLVL == RangerLVL || WarriorLVL == MageLVL
		Int CombatLVL = (BaseLVL + WarriorLVL) as Int
		return CombatLVL
	ElseIf RangerLVL == MageLVL
		Int CombatLVL = (BaseLVL + RangerLVL) as Int
		return CombatLVL
	EndIf
EndFunction
	
;This function gets the script attached to the quest RS_FrameworkController, and is where the rsFramework properties are stored
rsFrameworkData Function GetFrameworkData() Global
	return (Game.GetFormFromFile(0x294A97, "skyscape.esm") as Quest) as rsFrameworkData
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Agility)
Function rsLevelCheck_Agility() Global
	Float xp  = (GetAgilityXP()).GetValue()
	Float level = (GetAgilityLVL()).GetValue()
	
	If xp >= 0 && xp < 83;1
		(GetAgilityLVL()).SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 2!")
			(GetAgilityLVL()).SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 3!")
			(GetAgilityLVL()).SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 4!")
			(GetAgilityLVL()).SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 5!")
			Debug.MessageBox("You can now use the Falador shortcut!")
			(GetAgilityLVL()).SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 6!")
			(GetAgilityLVL()).SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 7!")
			(GetAgilityLVL()).SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 8!")
			Debug.MessageBox("You can now grapple over the River Lum to Al Kharid!")
			(GetAgilityLVL()).SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 9!")
			(GetAgilityLVL()).SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 10!")
			Debug.MessageBox("You can now use the Moss Giant island rope shortcut!")
			(GetAgilityLVL()).SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 11!")
			Debug.MessageBox("You can now grapple over Falador north wall!")
			(GetAgilityLVL()).SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 12!")
			Debug.MessageBox("You can now use the Karamja Dungeon stepping stone shortcut!")
			(GetAgilityLVL()).SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 13!")
			Debug.MessageBox("You can now use the Varrock south fence shortcut!")
			(GetAgilityLVL()).SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 14!")
			(GetAgilityLVL()).SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 15!")
			Debug.MessageBox("You can now use the Edgeville dungeon monkey bar shortcut!")
			(GetAgilityLVL()).SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 16!")
			Debug.MessageBox("You can now use the Yanille shortcut!")
			(GetAgilityLVL()).SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 17!")
			(GetAgilityLVL()).SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 18!")
			Debug.MessageBox("You can now use the Watchtower shortcut!")
			(GetAgilityLVL()).SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 19!")
			Debug.MessageBox("You can now use the Grand Tree rock scramble shortcut!")
			(GetAgilityLVL()).SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 20!")
			Debug.MessageBox("You can now use the Coal Truck log balance shortcut!")
			(GetAgilityLVL()).SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 21!")
			Debug.MessageBox("You can now use the Grand Exchange underwall tunnel shortcut!")
			(GetAgilityLVL()).SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 22!")
			Debug.MessageBox("You can now use the Karamja dungeon pipe shortcut!")
			(GetAgilityLVL()).SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 23!")
			Debug.MessageBox("You can now use the Kalphite King shortcut!")
			(GetAgilityLVL()).SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 24!")
			(GetAgilityLVL()).SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 25!")
			Debug.MessageBox("You can now train at the Werewolf Skullball course and use the Eagles' Peak shortcut!")
			(GetAgilityLVL()).SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 26!")
			Debug.MessageBox("You can now use the Falador south wall agility shortcut!")
			(GetAgilityLVL()).SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 27!")
			(GetAgilityLVL()).SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 28!")
			Debug.MessageBox("You can now use the Draynor Manor railing agility shortcut!")
			(GetAgilityLVL()).SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 29!")
			Debug.MessageBox("You can now use the Oo'glog agility shortcut!")
			(GetAgilityLVL()).SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 30!")
			Debug.MessageBox("You can now train at the Agility Pyramid and Penguin Agility courses, as well as use the South-east Karamja stepping stones shortcut!")
			(GetAgilityLVL()).SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 31!")
			Debug.MessageBox("You can now use the Draynor Manor stepping stones to the Champion's Guild agility shortcut!")
			(GetAgilityLVL()).SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 32!")
			Debug.MessageBox("You can now grapple and scale the Catherby cliff!")
			(GetAgilityLVL()).SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 33!")
			Debug.MessageBox("You can now use the Ardougne log balance agility shortcut!")
			(GetAgilityLVL()).SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 34!")
			Debug.MessageBox("You can now use the Karamja dungeon pipe shortcut!")
			(GetAgilityLVL()).SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 35!")
			Debug.MessageBox("You can now train at the Barbarian Outpost Agility course!")
			(GetAgilityLVL()).SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 36!")
			Debug.MessageBox("You can now grapple to escape from the Water Obelisk Island!")
			(GetAgilityLVL()).SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 37!")
			Debug.MessageBox("You can now use the Gnome Stronghold agility shortcut!")
			(GetAgilityLVL()).SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 38!")
			Debug.MessageBox("You can now use the Al Kharid mining pit cliffside scramble agility shortcut!")
			(GetAgilityLVL()).SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 39!")
			Debug.MessageBox("You can now grapple and scale Yanille's south wall!")
			(GetAgilityLVL()).SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 40!")
			(GetAgilityLVL()).SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 41!")
			Debug.MessageBox("You can now use the Trollheim easy cliffside scramble agility shortcut!")
			(GetAgilityLVL()).SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 42!")
			Debug.MessageBox("You can now use the Dwarven Mine narrow crevice agility shortcut!")
			(GetAgilityLVL()).SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 43!")
			Debug.MessageBox("You can now use the Trollheim medium cliffside scramble agility shortcut!")
			(GetAgilityLVL()).SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 44!")
			Debug.MessageBox("You can now use the Trollheim advanced cliffside scramble agility shortcut!")
			(GetAgilityLVL()).SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 45!")
			Debug.MessageBox("You can now use the Isafdar log balance shortcut!")
			(GetAgilityLVL()).SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 46!")
			Debug.MessageBox("You can now use the Cosmic Temple medium narrow walkway shortcut!")
			(GetAgilityLVL()).SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 47!")
			Debug.MessageBox("You can now use the Trollheim hard cliffside scramble agility shortcut!")
			(GetAgilityLVL()).SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 48!")
			Debug.MessageBox("You can now train at the Ape Atoll Agility course, and use the log balance to the Fremennik Province!")
			(GetAgilityLVL()).SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 49!")
			Debug.MessageBox("You can now use the Yanille dungeon contortion agility shortcut!")
			(GetAgilityLVL()).SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 50!")
			Debug.MessageBox("You can now use the Grotworm Lair agility shortcut!")
			(GetAgilityLVL()).SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 51!")
			Debug.MessageBox("You can now use the pipe from Edgeville dungeon to Varrock sewers agility shortcut!")
			(GetAgilityLVL()).SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 52!")
			Debug.MessageBox("You can now train at the Wilderness Agility course, and use the stepping stones to Taverly dungeon agility shortcut!")
			(GetAgilityLVL()).SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 53!")
				if ((GetStrengthLVL()).GetValue()) < 21 && ((GetRangedLVL()).GetValue()) < 42
					Debug.MessageBox("You can now grapple from Karamja volcano to south Karamja crossing!")
				endif
			(GetAgilityLVL()).SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 54!")
			Debug.MessageBox("You can now use the Red Draon Isle agility shortcut!")
			(GetAgilityLVL()).SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 55!")
			(GetAgilityLVL()).SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 56!")
			(GetAgilityLVL()).SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 57!")
			(GetAgilityLVL()).SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 58!")
			Debug.MessageBox("You can now use the Port Phasmatys ectopool agility shortcut!")
			(GetAgilityLVL()).SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 59!")
			Debug.MessageBox("You can now use the Arandar easy cliffside scramble agility shortcut!")
			(GetAgilityLVL()).SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 60!")
			Debug.MessageBox("You can now train at the Bandos and Werewolf agility courses, as well as the Monastery of Ascension statue shortcut, God Wars Dungeon access, and God Wars Dungeon escape to the Wilderness!")
			(GetAgilityLVL()).SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 61!")
			(GetAgilityLVL()).SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 62!")
			Debug.MessageBox("You can now use the Fremennik Slayer Dungeon narrow crevice agility shortcut!")
			(GetAgilityLVL()).SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 63!")
			(GetAgilityLVL()).SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 64!")
			Debug.MessageBox("You can now use the Trollheim Wilderness route!")
			(GetAgilityLVL()).SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 65!")
			Debug.MessageBox("You can now use the Temple on the Salve to Morytania agility shortcut!")
			(GetAgilityLVL()).SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 66!")
			Debug.MessageBox("You can now use the Cosmic Temple advanced narrow walkway agility shortcut!")
			(GetAgilityLVL()).SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 67!")
			Debug.MessageBox("You can now use the Yanille dungeon rubble climb agility shortcut!")
			(GetAgilityLVL()).SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 68!")
			Debug.MessageBox("You can now use the Arandar medium cliffside scramble agility shortcut!")
			(GetAgilityLVL()).SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 69!")
			(GetAgilityLVL()).SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 70!")
			Debug.MessageBox("You can now use the Taverly dungeon pipe squeeze to blue dragon lair, Monastery of Ascension chasm jump, and God Wars Dungeon Saradomin encampment wall climb agility shortcuts!")
			(GetAgilityLVL()).SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 71!")
			Debug.MessageBox("You can now use the Slayer Tower plank crossing agility shortcut!")
			(GetAgilityLVL()).SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 72!")
			(GetAgilityLVL()).SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 73!")
			Debug.MessageBox("You can now use the Polypore dungeon extra access agility shortcut!")
			(GetAgilityLVL()).SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 74!")
			Debug.MessageBox("You can now use the Shilo Village stepping stones and northern wall agility shortcuts!")
			(GetAgilityLVL()).SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 75!")
			(GetAgilityLVL()).SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 76!")
			(GetAgilityLVL()).SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 77!")
			Debug.MessageBox("You can now start training at the Hefin Agility course!")
			(GetAgilityLVL()).SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 78!")
			(GetAgilityLVL()).SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 79!")
			(GetAgilityLVL()).SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 80!")
			Debug.MessageBox("You can now train at the Dorgesh-Kaan Agility course, as well as the cave crossing south of Dorgesh-Kaan, the Taverly dungeon spiked blades jump, and the Monastery of Ascension chasm leap shortcuts!")
			(GetAgilityLVL()).SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 81!")
			Debug.MessageBox("You can now use the Fremennik Slayer Dungeon chasm jump agility shortcut!")
			(GetAgilityLVL()).SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 82!")
			Debug.MessageBox("You can train longer in the Hefin Agility course!")
			(GetAgilityLVL()).SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 83!")
			(GetAgilityLVL()).SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 84!")
			(GetAgilityLVL()).SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 85!")
			Debug.MessageBox("You can now train at the Advanced Gnome Stronghold Agility course, wear Agile legs, and traverse the Arandar advanced cliffside scramble agility shortcut!")
			(GetAgilityLVL()).SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 86!")
			Debug.MessageBox("You can now use Kuradal's dungeon wall climb agility shortcut!")
			(GetAgilityLVL()).SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 87!")
			Debug.MessageBox("You can train longer in the Hefin Agility course!")
			(GetAgilityLVL()).SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 88!")
			(GetAgilityLVL()).SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 89!")
			(GetAgilityLVL()).SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 90!")
			Debug.MessageBox("You can now train at the Advanced Gnome Stronghold Agility course, as well as Kuradal's dungeon wall run, and Monastery of Ascension extra area access agility shortcuts!")
			(GetAgilityLVL()).SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 91!")
			(GetAgilityLVL()).SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 92!")
			Debug.MessageBox("You can train longer in the Hefin Agility course, as well as Port Phasmatys low wall agility shortcut!")
			(GetAgilityLVL()).SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 93!")
			(GetAgilityLVL()).SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 94!")
			(GetAgilityLVL()).SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 95!")
			(GetAgilityLVL()).SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 96!")
			(GetAgilityLVL()).SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 97!")
			Debug.MessageBox("You can train longer in the Hefin Agility course!")
			(GetAgilityLVL()).SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 98!")
			(GetAgilityLVL()).SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			(GetSoundAgility_LevelUp()).Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Agility level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Agility. Why not visit Cap'n Izzy No-Beard at the Brimhaven Agility Arena? He has something special that is only available to true masters of the Agility skill!")
			(GetAgilityLVL()).SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Attack)
Function rsLevelCheck_Attack() Global
	Float xp  = GetAttackXP().GetValue()
	Float level = GetAttackLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetAttackLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 2!")
			GetAttackLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 3!")
			GetAttackLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 4!")
			GetAttackLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 5!")
			GetAttackLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 6!")
			GetAttackLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 7!")
			GetAttackLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 8!")
			GetAttackLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 9!")
			GetAttackLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 10!")
			Debug.MessageBox("You can now wield iron weaponry!")
			GetAttackLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 11!")
			GetAttackLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 12!")
			GetAttackLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 13!")
			GetAttackLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 14!")
			GetAttackLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 15!")
			GetAttackLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 16!")
			GetAttackLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 17!")
			GetAttackLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 18!")
			GetAttackLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 19!")
			GetAttackLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 20!")
			Debug.MessageBox("You can now wield steel weaponry!")
			GetAttackLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 21!")
			GetAttackLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 22!")
			GetAttackLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 23!")
			GetAttackLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 24!")
			GetAttackLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 25!")
			Debug.MessageBox("You can now wield black and white weaponry!")
			GetAttackLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 26!")
			GetAttackLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 27!")
			GetAttackLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 28!")
			GetAttackLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 29!")
			GetAttackLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 30!")
			Debug.MessageBox("You can now wield mithril weaponry!")
			GetAttackLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 31!")
			GetAttackLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 32!")
			GetAttackLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 33!")
			GetAttackLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 34!")
			GetAttackLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 35!")
			GetAttackLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 36!")
			GetAttackLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 37!")
			GetAttackLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 38!")
			GetAttackLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 39!")
			GetAttackLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 40!")
			Debug.MessageBox("You can now wield adamant weaponry!")
			GetAttackLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 41!")
			GetAttackLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 42!")
			GetAttackLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 43!")
			GetAttackLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 44!")
			GetAttackLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 45!")
			GetAttackLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 46!")
			GetAttackLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 47!")
			GetAttackLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 48!")
			GetAttackLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 49!")
			GetAttackLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 50!")
			Debug.MessageBox("You can now wield rune and leaf-bladed weaponry!")
			GetAttackLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 51!")
			GetAttackLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 52!")
			GetAttackLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 53!")
			GetAttackLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 54!")
			GetAttackLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 55!")
			Debug.MessageBox("You can now wield granite weaponry!")
			GetAttackLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 56!")
			GetAttackLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 57!")
			GetAttackLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 58!")
			GetAttackLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 59!")
			GetAttackLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 60!")
			Debug.MessageBox("You can now wield dragon and obsidian weaponry!")
			GetAttackLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 61!")
			GetAttackLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 62!")
			GetAttackLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 63!")
			GetAttackLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 64!")
			GetAttackLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 65!")
			GetAttackLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 66!")
			GetAttackLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 67!")
			GetAttackLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 68!")
			GetAttackLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 69!")
			GetAttackLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 70!")
			Debug.MessageBox("You can now wield abyssal whips and barrows weaponry!")
			GetAttackLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 71!")
			GetAttackLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 72!")
			GetAttackLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 73!")
			GetAttackLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 74!")
			GetAttackLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 75!")
			Debug.MessageBox("You can now wield godswords!")
			GetAttackLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 76!")
			GetAttackLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 77!")
			GetAttackLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 78!")
			GetAttackLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 79!")
			GetAttackLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 80!")
			GetAttackLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 81!")
			GetAttackLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 82!")
			GetAttackLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 83!")
			GetAttackLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 84!")
			GetAttackLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 85!")
			GetAttackLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 86!")
			GetAttackLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 87!")
			GetAttackLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 88!")
			GetAttackLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 89!")
			GetAttackLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 90!")
			Debug.MessageBox("You can now wield drygore weaponry!")
			GetAttackLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 91!")
			GetAttackLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 92!")
			GetAttackLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 93!")
			GetAttackLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 94!")
			GetAttackLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 95!")
			GetAttackLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 96!")
			GetAttackLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 97!")
			GetAttackLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 98!")
			GetAttackLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundAttack_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Attack level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Attack. Why not visit Ajjat in the Warriors' Guild. He has something special that is only available to true masters of the Attack skill!")
			GetAttackLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Constitution)
Function rsLevelCheck_Constitution() Global
	Float xp  = GetConstitutionXP().GetValue()
	Float level = GetConstitutionLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetConstitutionLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 2!")
			GetConstitutionLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 3!")
			GetConstitutionLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 4!")
			GetConstitutionLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 5!")
			GetConstitutionLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 6!")
			GetConstitutionLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 7!")
			GetConstitutionLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 8!")
			GetConstitutionLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 9!")
			GetConstitutionLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 10!")
			GetConstitutionLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 11!")
			GetConstitutionLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 12!")
			GetConstitutionLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 13!")
			GetConstitutionLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 14!")
			GetConstitutionLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 15!")
			GetConstitutionLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 16!")
			GetConstitutionLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 17!")
			GetConstitutionLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 18!")
			GetConstitutionLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 19!")
			GetConstitutionLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 20!")
			GetConstitutionLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 21!")
			GetConstitutionLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 22!")
			GetConstitutionLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 23!")
			GetConstitutionLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 24!")
			GetConstitutionLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 25!")
			GetConstitutionLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 26!")
			GetConstitutionLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 27!")
			GetConstitutionLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 28!")
			GetConstitutionLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 29!")
			GetConstitutionLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 30!")
			GetConstitutionLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 31!")
			GetConstitutionLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 32!")
			GetConstitutionLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 33!")
			GetConstitutionLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 34!")
			GetConstitutionLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 35!")
			GetConstitutionLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 36!")
			GetConstitutionLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 37!")
			GetConstitutionLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 38!")
			GetConstitutionLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 39!")
			GetConstitutionLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 40!")
			GetConstitutionLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 41!")
			GetConstitutionLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 42!")
			GetConstitutionLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 43!")
			GetConstitutionLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 44!")
			GetConstitutionLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 45!")
			GetConstitutionLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 46!")
			GetConstitutionLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 47!")
			GetConstitutionLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 48!")
			GetConstitutionLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 49!")
			GetConstitutionLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 50!")
			GetConstitutionLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 51!")
			GetConstitutionLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 52!")
			GetConstitutionLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 53!")
			GetConstitutionLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 54!")
			GetConstitutionLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 55!")
			GetConstitutionLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 56!")
			GetConstitutionLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 57!")
			GetConstitutionLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 58!")
			GetConstitutionLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 59!")
			GetConstitutionLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 60!")
			GetConstitutionLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 61!")
			GetConstitutionLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 62!")
			GetConstitutionLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 63!")
			GetConstitutionLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 64!")
			GetConstitutionLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 65!")
			GetConstitutionLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 66!")
			GetConstitutionLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 67!")
			GetConstitutionLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 68!")
			GetConstitutionLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 69!")
			GetConstitutionLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 70!")
			GetConstitutionLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 71!")
			GetConstitutionLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 72!")
			GetConstitutionLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 73!")
			GetConstitutionLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 74!")
			GetConstitutionLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 75!")
			GetConstitutionLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 76!")
			GetConstitutionLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 77!")
			GetConstitutionLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 78!")
			GetConstitutionLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 79!")
			GetConstitutionLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 80!")
			GetConstitutionLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 81!")
			GetConstitutionLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 82!")
			GetConstitutionLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 83!")
			GetConstitutionLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 84!")
			GetConstitutionLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 85!")
			GetConstitutionLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 86!")
			GetConstitutionLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 87!")
			GetConstitutionLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 88!")
			GetConstitutionLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 89!")
			GetConstitutionLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 90!")
			GetConstitutionLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 91!")
			GetConstitutionLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 92!")
			GetConstitutionLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 93!")
			GetConstitutionLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 94!")
			GetConstitutionLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 95!")
			GetConstitutionLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 96!")
			GetConstitutionLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 97!")
			GetConstitutionLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 98!")
			GetConstitutionLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundConstitution_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Constitution level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Constitution. Why not visit Surgeon General Tafani. She has something special that is only available to true masters of the Constitution skill!")
			GetConstitutionLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Construction)
Function rsLevelCheck_Construction() Global
	Float xp  = GetConstructionXP().GetValue()
	Float level = GetConstructionLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetConstructionLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 2!")
			GetConstructionLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 3!")
			GetConstructionLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 4!")
			GetConstructionLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 5!")
			GetConstructionLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 6!")
			GetConstructionLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 7!")
			GetConstructionLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 8!")
			GetConstructionLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 9!")
			GetConstructionLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 10!")
			GetConstructionLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 11!")
			GetConstructionLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 12!")
			GetConstructionLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 13!")
			GetConstructionLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 14!")
			GetConstructionLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 15!")
			GetConstructionLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 16!")
			GetConstructionLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 17!")
			GetConstructionLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 18!")
			GetConstructionLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 19!")
			GetConstructionLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 20!")
			GetConstructionLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 21!")
			GetConstructionLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 22!")
			GetConstructionLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 23!")
			GetConstructionLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 24!")
			GetConstructionLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 25!")
			GetConstructionLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 26!")
			GetConstructionLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 27!")
			GetConstructionLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 28!")
			GetConstructionLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 29!")
			GetConstructionLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 30!")
			GetConstructionLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 31!")
			GetConstructionLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 32!")
			GetConstructionLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 33!")
			GetConstructionLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 34!")
			GetConstructionLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 35!")
			GetConstructionLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 36!")
			GetConstructionLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 37!")
			GetConstructionLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 38!")
			GetConstructionLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 39!")
			GetConstructionLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 40!")
			GetConstructionLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 41!")
			GetConstructionLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 42!")
			GetConstructionLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 43!")
			GetConstructionLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 44!")
			GetConstructionLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 45!")
			GetConstructionLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 46!")
			GetConstructionLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 47!")
			GetConstructionLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 48!")
			GetConstructionLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 49!")
			GetConstructionLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 50!")
			GetConstructionLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 51!")
			GetConstructionLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 52!")
			GetConstructionLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 53!")
			GetConstructionLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 54!")
			GetConstructionLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 55!")
			GetConstructionLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 56!")
			GetConstructionLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 57!")
			GetConstructionLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 58!")
			GetConstructionLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 59!")
			GetConstructionLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 60!")
			GetConstructionLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 61!")
			GetConstructionLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 62!")
			GetConstructionLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 63!")
			GetConstructionLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 64!")
			GetConstructionLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 65!")
			GetConstructionLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 66!")
			GetConstructionLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 67!")
			GetConstructionLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 68!")
			GetConstructionLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 69!")
			GetConstructionLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 70!")
			GetConstructionLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 71!")
			GetConstructionLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 72!")
			GetConstructionLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 73!")
			GetConstructionLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 74!")
			GetConstructionLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 75!")
			GetConstructionLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 76!")
			GetConstructionLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 77!")
			GetConstructionLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 78!")
			GetConstructionLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 79!")
			GetConstructionLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 80!")
			GetConstructionLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 81!")
			GetConstructionLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 82!")
			GetConstructionLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 83!")
			GetConstructionLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 84!")
			GetConstructionLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 85!")
			GetConstructionLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 86!")
			GetConstructionLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 87!")
			GetConstructionLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 88!")
			GetConstructionLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 89!")
			GetConstructionLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 90!")
			GetConstructionLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 91!")
			GetConstructionLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 92!")
			GetConstructionLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 93!")
			GetConstructionLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 94!")
			GetConstructionLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 95!")
			GetConstructionLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 96!")
			GetConstructionLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 97!")
			GetConstructionLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 98!")
			GetConstructionLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundConstruction_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Construction level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Construction. Why not visit a real estate agent? He/she will have something special that is only available to true masters of the Construction skill!")
			GetConstructionLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Cooking)
Function rsLevelCheck_Cooking() Global
	Float xp  = GetCookingXP().GetValue()
	Float level = GetCookingLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetCookingLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 2!")
			GetCookingLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 3!")
			GetCookingLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 4!")
			GetCookingLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 5!")
			GetCookingLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 6!")
			GetCookingLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 7!")
			GetCookingLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 8!")
			GetCookingLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 9!")
			GetCookingLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 10!")
			GetCookingLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 11!")
			GetCookingLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 12!")
			GetCookingLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 13!")
			GetCookingLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 14!")
			GetCookingLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 15!")
			GetCookingLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 16!")
			GetCookingLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 17!")
			GetCookingLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 18!")
			GetCookingLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 19!")
			GetCookingLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 20!")
			GetCookingLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 21!")
			GetCookingLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 22!")
			GetCookingLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 23!")
			GetCookingLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 24!")
			GetCookingLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 25!")
			GetCookingLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 26!")
			GetCookingLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 27!")
			GetCookingLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 28!")
			GetCookingLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 29!")
			GetCookingLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 30!")
			GetCookingLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 31!")
			GetCookingLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 32!")
			GetCookingLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 33!")
			GetCookingLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 34!")
			GetCookingLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 35!")
			GetCookingLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 36!")
			GetCookingLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 37!")
			GetCookingLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 38!")
			GetCookingLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 39!")
			GetCookingLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 40!")
			GetCookingLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 41!")
			GetCookingLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 42!")
			GetCookingLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 43!")
			GetCookingLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 44!")
			GetCookingLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 45!")
			GetCookingLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 46!")
			GetCookingLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 47!")
			GetCookingLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 48!")
			GetCookingLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 49!")
			GetCookingLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 50!")
			GetCookingLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 51!")
			GetCookingLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 52!")
			GetCookingLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 53!")
			GetCookingLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 54!")
			GetCookingLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 55!")
			GetCookingLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 56!")
			GetCookingLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 57!")
			GetCookingLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 58!")
			GetCookingLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 59!")
			GetCookingLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 60!")
			GetCookingLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 61!")
			GetCookingLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 62!")
			GetCookingLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 63!")
			GetCookingLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 64!")
			GetCookingLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 65!")
			GetCookingLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 66!")
			GetCookingLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 67!")
			GetCookingLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 68!")
			GetCookingLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 69!")
			GetCookingLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 70!")
			GetCookingLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 71!")
			GetCookingLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 72!")
			GetCookingLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 73!")
			GetCookingLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 74!")
			GetCookingLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 75!")
			GetCookingLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 76!")
			GetCookingLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 77!")
			GetCookingLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 78!")
			GetCookingLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 79!")
			GetCookingLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 80!")
			GetCookingLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 81!")
			GetCookingLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 82!")
			GetCookingLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 83!")
			GetCookingLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 84!")
			GetCookingLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 85!")
			GetCookingLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 86!")
			GetCookingLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 87!")
			GetCookingLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 88!")
			GetCookingLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 89!")
			GetCookingLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 90!")
			GetCookingLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 91!")
			GetCookingLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 92!")
			GetCookingLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 93!")
			GetCookingLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 94!")
			GetCookingLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 95!")
			GetCookingLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 96!")
			GetCookingLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 97!")
			GetCookingLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 98!")
			GetCookingLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundCooking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Cooking level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Cooking. Why not visit the head chef at the Cooking Guild. He has something special that is only available to true masters of the Cooking skill!")
			GetCookingLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Crafting)
Function rsLevelCheck_Crafting() Global
	Float xp  = GetCraftingXP().GetValue()
	Float level = GetCraftingLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetCraftingLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 2!")
			GetCraftingLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 3!")
			GetCraftingLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 4!")
			GetCraftingLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 5!")
			GetCraftingLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 6!")
			GetCraftingLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 7!")
			GetCraftingLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 8!")
			GetCraftingLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 9!")
			GetCraftingLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 10!")
			GetCraftingLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 11!")
			GetCraftingLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 12!")
			GetCraftingLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 13!")
			GetCraftingLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 14!")
			GetCraftingLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 15!")
			GetCraftingLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 16!")
			GetCraftingLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 17!")
			GetCraftingLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 18!")
			GetCraftingLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 19!")
			GetCraftingLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 20!")
			GetCraftingLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 21!")
			GetCraftingLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 22!")
			GetCraftingLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 23!")
			GetCraftingLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 24!")
			GetCraftingLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 25!")
			GetCraftingLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 26!")
			GetCraftingLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 27!")
			GetCraftingLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 28!")
			GetCraftingLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 29!")
			GetCraftingLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 30!")
			GetCraftingLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 31!")
			GetCraftingLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 32!")
			GetCraftingLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 33!")
			GetCraftingLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 34!")
			GetCraftingLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 35!")
			GetCraftingLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 36!")
			GetCraftingLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 37!")
			GetCraftingLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 38!")
			GetCraftingLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 39!")
			GetCraftingLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 40!")
			GetCraftingLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 41!")
			GetCraftingLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 42!")
			GetCraftingLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 43!")
			GetCraftingLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 44!")
			GetCraftingLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 45!")
			GetCraftingLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 46!")
			GetCraftingLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 47!")
			GetCraftingLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 48!")
			GetCraftingLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 49!")
			GetCraftingLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 50!")
			GetCraftingLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 51!")
			GetCraftingLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 52!")
			GetCraftingLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 53!")
			GetCraftingLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 54!")
			GetCraftingLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 55!")
			GetCraftingLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 56!")
			GetCraftingLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 57!")
			GetCraftingLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 58!")
			GetCraftingLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 59!")
			GetCraftingLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 60!")
			GetCraftingLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 61!")
			GetCraftingLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 62!")
			GetCraftingLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 63!")
			GetCraftingLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 64!")
			GetCraftingLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 65!")
			GetCraftingLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 66!")
			GetCraftingLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 67!")
			GetCraftingLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 68!")
			GetCraftingLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 69!")
			GetCraftingLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 70!")
			GetCraftingLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 71!")
			GetCraftingLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 72!")
			GetCraftingLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 73!")
			GetCraftingLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 74!")
			GetCraftingLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 75!")
			GetCraftingLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 76!")
			GetCraftingLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 77!")
			GetCraftingLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 78!")
			GetCraftingLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 79!")
			GetCraftingLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 80!")
			GetCraftingLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 81!")
			GetCraftingLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 82!")
			GetCraftingLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 83!")
			GetCraftingLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 84!")
			GetCraftingLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 85!")
			GetCraftingLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 86!")
			GetCraftingLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 87!")
			GetCraftingLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 88!")
			GetCraftingLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 89!")
			GetCraftingLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 90!")
			GetCraftingLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 91!")
			GetCraftingLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 92!")
			GetCraftingLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 93!")
			GetCraftingLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 94!")
			GetCraftingLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 95!")
			GetCraftingLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 96!")
			GetCraftingLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 97!")
			GetCraftingLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 98!")
			GetCraftingLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundCrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Crafting level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Crafting. Why not visit the master crafter in the Crafting Guild? He has something special that is only available to true masters of the Crafting skill!")
			GetCraftingLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Defence)
Function rsLevelCheck_Defence() Global
	Float xp  = GetDefenceXP().GetValue()
	Float level = GetDefenceLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetDefenceLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 2!")
			GetDefenceLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 3!")
			GetDefenceLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 4!")
			GetDefenceLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 5!")
			GetDefenceLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 6!")
			GetDefenceLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 7!")
			GetDefenceLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 8!")
			GetDefenceLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 9!")
			GetDefenceLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 10!")
			GetDefenceLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 11!")
			GetDefenceLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 12!")
			GetDefenceLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 13!")
			GetDefenceLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 14!")
			GetDefenceLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 15!")
			GetDefenceLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 16!")
			GetDefenceLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 17!")
			GetDefenceLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 18!")
			GetDefenceLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 19!")
			GetDefenceLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 20!")
			GetDefenceLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 21!")
			GetDefenceLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 22!")
			GetDefenceLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 23!")
			GetDefenceLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 24!")
			GetDefenceLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 25!")
			GetDefenceLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 26!")
			GetDefenceLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 27!")
			GetDefenceLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 28!")
			GetDefenceLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 29!")
			GetDefenceLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 30!")
			GetDefenceLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 31!")
			GetDefenceLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 32!")
			GetDefenceLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 33!")
			GetDefenceLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 34!")
			GetDefenceLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 35!")
			GetDefenceLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 36!")
			GetDefenceLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 37!")
			GetDefenceLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 38!")
			GetDefenceLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 39!")
			GetDefenceLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 40!")
			GetDefenceLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 41!")
			GetDefenceLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 42!")
			GetDefenceLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 43!")
			GetDefenceLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 44!")
			GetDefenceLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 45!")
			GetDefenceLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 46!")
			GetDefenceLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 47!")
			GetDefenceLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 48!")
			GetDefenceLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 49!")
			GetDefenceLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 50!")
			GetDefenceLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 51!")
			GetDefenceLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 52!")
			GetDefenceLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 53!")
			GetDefenceLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 54!")
			GetDefenceLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 55!")
			GetDefenceLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 56!")
			GetDefenceLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 57!")
			GetDefenceLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 58!")
			GetDefenceLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 59!")
			GetDefenceLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 60!")
			GetDefenceLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 61!")
			GetDefenceLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 62!")
			GetDefenceLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 63!")
			GetDefenceLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 64!")
			GetDefenceLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 65!")
			GetDefenceLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 66!")
			GetDefenceLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 67!")
			GetDefenceLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 68!")
			GetDefenceLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 69!")
			GetDefenceLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 70!")
			GetDefenceLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 71!")
			GetDefenceLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 72!")
			GetDefenceLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 73!")
			GetDefenceLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 74!")
			GetDefenceLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 75!")
			GetDefenceLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 76!")
			GetDefenceLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 77!")
			GetDefenceLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 78!")
			GetDefenceLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 79!")
			GetDefenceLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 80!")
			GetDefenceLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 81!")
			GetDefenceLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 82!")
			GetDefenceLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 83!")
			GetDefenceLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 84!")
			GetDefenceLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 85!")
			GetDefenceLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 86!")
			GetDefenceLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 87!")
			GetDefenceLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 88!")
			GetDefenceLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 89!")
			GetDefenceLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 90!")
			GetDefenceLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 91!")
			GetDefenceLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 92!")
			GetDefenceLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 93!")
			GetDefenceLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 94!")
			GetDefenceLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 95!")
			GetDefenceLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 96!")
			GetDefenceLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 97!")
			GetDefenceLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 98!")
			GetDefenceLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundDefence_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Defence level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Defence. Why not visit Harlan at the combat academy? He has something special that is only available to true masters of the Defence skill!")
			GetDefenceLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Divination)
Function rsLevelCheck_Divination() Global
	Float xp  = GetDivinationXP().GetValue()
	Float level = GetDivinationLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetDivinationLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 2!")
			GetDivinationLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 3!")
			GetDivinationLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 4!")
			GetDivinationLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 5!")
			GetDivinationLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 6!")
			GetDivinationLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 7!")
			GetDivinationLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 8!")
			GetDivinationLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 9!")
			GetDivinationLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 10!")
			GetDivinationLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 11!")
			GetDivinationLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 12!")
			GetDivinationLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 13!")
			GetDivinationLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 14!")
			GetDivinationLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 15!")
			GetDivinationLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 16!")
			GetDivinationLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 17!")
			GetDivinationLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 18!")
			GetDivinationLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 19!")
			GetDivinationLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 20!")
			GetDivinationLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 21!")
			GetDivinationLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 22!")
			GetDivinationLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 23!")
			GetDivinationLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 24!")
			GetDivinationLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 25!")
			GetDivinationLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 26!")
			GetDivinationLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 27!")
			GetDivinationLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 28!")
			GetDivinationLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 29!")
			GetDivinationLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 30!")
			GetDivinationLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 31!")
			GetDivinationLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 32!")
			GetDivinationLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 33!")
			GetDivinationLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 34!")
			GetDivinationLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 35!")
			GetDivinationLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 36!")
			GetDivinationLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 37!")
			GetDivinationLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 38!")
			GetDivinationLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 39!")
			GetDivinationLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 40!")
			GetDivinationLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 41!")
			GetDivinationLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 42!")
			GetDivinationLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 43!")
			GetDivinationLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 44!")
			GetDivinationLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 45!")
			GetDivinationLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 46!")
			GetDivinationLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 47!")
			GetDivinationLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 48!")
			GetDivinationLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 49!")
			GetDivinationLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 50!")
			GetDivinationLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 51!")
			GetDivinationLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 52!")
			GetDivinationLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 53!")
			GetDivinationLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 54!")
			GetDivinationLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 55!")
			GetDivinationLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 56!")
			GetDivinationLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 57!")
			GetDivinationLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 58!")
			GetDivinationLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 59!")
			GetDivinationLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 60!")
			GetDivinationLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 61!")
			GetDivinationLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 62!")
			GetDivinationLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 63!")
			GetDivinationLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 64!")
			GetDivinationLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 65!")
			GetDivinationLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 66!")
			GetDivinationLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 67!")
			GetDivinationLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 68!")
			GetDivinationLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 69!")
			GetDivinationLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 70!")
			GetDivinationLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 71!")
			GetDivinationLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 72!")
			GetDivinationLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 73!")
			GetDivinationLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 74!")
			GetDivinationLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 75!")
			GetDivinationLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 76!")
			GetDivinationLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 77!")
			GetDivinationLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 78!")
			GetDivinationLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 79!")
			GetDivinationLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 80!")
			GetDivinationLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 81!")
			GetDivinationLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 82!")
			GetDivinationLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 83!")
			GetDivinationLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 84!")
			GetDivinationLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 85!")
			GetDivinationLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 86!")
			GetDivinationLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 87!")
			GetDivinationLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 88!")
			GetDivinationLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 89!")
			GetDivinationLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 90!")
			GetDivinationLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 91!")
			GetDivinationLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 92!")
			GetDivinationLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 93!")
			GetDivinationLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 94!")
			GetDivinationLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 95!")
			GetDivinationLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 96!")
			GetDivinationLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 97!")
			GetDivinationLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 98!")
			GetDivinationLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundDivination_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Divination level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Divination. Why not visit Orla Fairweather slightly east of the pale wisp colony? She has something special that is only available to true masters of the Divination skill!")
			GetDivinationLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Dungeoneering)
Function rsLevelCheck_Dungeoneering() Global
	Float xp  = GetDungeoneeringXP().GetValue()
	Float level = GetDungeoneeringLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetDungeoneeringLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 2!")
			GetDungeoneeringLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 3!")
			GetDungeoneeringLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 4!")
			GetDungeoneeringLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 5!")
			GetDungeoneeringLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 6!")
			GetDungeoneeringLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 7!")
			GetDungeoneeringLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 8!")
			GetDungeoneeringLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 9!")
			GetDungeoneeringLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 10!")
			GetDungeoneeringLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 11!")
			GetDungeoneeringLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 12!")
			GetDungeoneeringLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 13!")
			GetDungeoneeringLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 14!")
			GetDungeoneeringLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 15!")
			GetDungeoneeringLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 16!")
			GetDungeoneeringLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 17!")
			GetDungeoneeringLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 18!")
			GetDungeoneeringLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 19!")
			GetDungeoneeringLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 20!")
			GetDungeoneeringLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 21!")
			GetDungeoneeringLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 22!")
			GetDungeoneeringLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 23!")
			GetDungeoneeringLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 24!")
			GetDungeoneeringLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 25!")
			GetDungeoneeringLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 26!")
			GetDungeoneeringLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 27!")
			GetDungeoneeringLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 28!")
			GetDungeoneeringLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 29!")
			GetDungeoneeringLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 30!")
			GetDungeoneeringLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 31!")
			GetDungeoneeringLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 32!")
			GetDungeoneeringLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 33!")
			GetDungeoneeringLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 34!")
			GetDungeoneeringLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 35!")
			GetDungeoneeringLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 36!")
			GetDungeoneeringLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 37!")
			GetDungeoneeringLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 38!")
			GetDungeoneeringLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 39!")
			GetDungeoneeringLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 40!")
			GetDungeoneeringLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 41!")
			GetDungeoneeringLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 42!")
			GetDungeoneeringLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 43!")
			GetDungeoneeringLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 44!")
			GetDungeoneeringLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 45!")
			GetDungeoneeringLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 46!")
			GetDungeoneeringLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 47!")
			GetDungeoneeringLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 48!")
			GetDungeoneeringLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 49!")
			GetDungeoneeringLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 50!")
			GetDungeoneeringLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 51!")
			GetDungeoneeringLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 52!")
			GetDungeoneeringLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 53!")
			GetDungeoneeringLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 54!")
			GetDungeoneeringLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 55!")
			GetDungeoneeringLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 56!")
			GetDungeoneeringLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 57!")
			GetDungeoneeringLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 58!")
			GetDungeoneeringLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 59!")
			GetDungeoneeringLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 60!")
			GetDungeoneeringLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 61!")
			GetDungeoneeringLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 62!")
			GetDungeoneeringLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 63!")
			GetDungeoneeringLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 64!")
			GetDungeoneeringLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 65!")
			GetDungeoneeringLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 66!")
			GetDungeoneeringLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 67!")
			GetDungeoneeringLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 68!")
			GetDungeoneeringLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 69!")
			GetDungeoneeringLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 70!")
			GetDungeoneeringLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 71!")
			GetDungeoneeringLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 72!")
			GetDungeoneeringLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 73!")
			GetDungeoneeringLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 74!")
			GetDungeoneeringLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 75!")
			GetDungeoneeringLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 76!")
			GetDungeoneeringLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 77!")
			GetDungeoneeringLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 78!")
			GetDungeoneeringLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 79!")
			GetDungeoneeringLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 80!")
			GetDungeoneeringLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 81!")
			GetDungeoneeringLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 82!")
			GetDungeoneeringLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 83!")
			GetDungeoneeringLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 84!")
			GetDungeoneeringLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 85!")
			GetDungeoneeringLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 86!")
			GetDungeoneeringLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 87!")
			GetDungeoneeringLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 88!")
			GetDungeoneeringLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 89!")
			GetDungeoneeringLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 90!")
			GetDungeoneeringLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 91!")
			GetDungeoneeringLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 92!")
			GetDungeoneeringLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 93!")
			GetDungeoneeringLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 94!")
			GetDungeoneeringLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 95!")
			GetDungeoneeringLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 96!")
			GetDungeoneeringLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 97!")
			GetDungeoneeringLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 98!")
			GetDungeoneeringLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundDungeoneering_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Dungeoneering level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Dungeoneering. Why not visit Thok in the fremennik camp in Daemonheim? He has something special that is only available to true masters of the Dungeoneering skill!")
			GetDungeoneeringLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Farming)
Function rsLevelCheck_Farming() Global
	Float xp  = GetFarmingXP().GetValue()
	Float level = GetFarmingLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetFarmingLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 2!")
			GetFarmingLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 3!")
			GetFarmingLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 4!")
			GetFarmingLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 5!")
			GetFarmingLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 6!")
			GetFarmingLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 7!")
			GetFarmingLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 8!")
			GetFarmingLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 9!")
			GetFarmingLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 10!")
			GetFarmingLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 11!")
			GetFarmingLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 12!")
			GetFarmingLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 13!")
			GetFarmingLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 14!")
			GetFarmingLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 15!")
			GetFarmingLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 16!")
			GetFarmingLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 17!")
			GetFarmingLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 18!")
			GetFarmingLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 19!")
			GetFarmingLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 20!")
			GetFarmingLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 21!")
			GetFarmingLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 22!")
			GetFarmingLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 23!")
			GetFarmingLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 24!")
			GetFarmingLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 25!")
			GetFarmingLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 26!")
			GetFarmingLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 27!")
			GetFarmingLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 28!")
			GetFarmingLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 29!")
			GetFarmingLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 30!")
			GetFarmingLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 31!")
			GetFarmingLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 32!")
			GetFarmingLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 33!")
			GetFarmingLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 34!")
			GetFarmingLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 35!")
			GetFarmingLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 36!")
			GetFarmingLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 37!")
			GetFarmingLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 38!")
			GetFarmingLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 39!")
			GetFarmingLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 40!")
			GetFarmingLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 41!")
			GetFarmingLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 42!")
			GetFarmingLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 43!")
			GetFarmingLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 44!")
			GetFarmingLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 45!")
			GetFarmingLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 46!")
			GetFarmingLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 47!")
			GetFarmingLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 48!")
			GetFarmingLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 49!")
			GetFarmingLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 50!")
			GetFarmingLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 51!")
			GetFarmingLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 52!")
			GetFarmingLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 53!")
			GetFarmingLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 54!")
			GetFarmingLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 55!")
			GetFarmingLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 56!")
			GetFarmingLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 57!")
			GetFarmingLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 58!")
			GetFarmingLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 59!")
			GetFarmingLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 60!")
			GetFarmingLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 61!")
			GetFarmingLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 62!")
			GetFarmingLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 63!")
			GetFarmingLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 64!")
			GetFarmingLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 65!")
			GetFarmingLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 66!")
			GetFarmingLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 67!")
			GetFarmingLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 68!")
			GetFarmingLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 69!")
			GetFarmingLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 70!")
			GetFarmingLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 71!")
			GetFarmingLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 72!")
			GetFarmingLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 73!")
			GetFarmingLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 74!")
			GetFarmingLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 75!")
			GetFarmingLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 76!")
			GetFarmingLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 77!")
			GetFarmingLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 78!")
			GetFarmingLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 79!")
			GetFarmingLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 80!")
			GetFarmingLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 81!")
			GetFarmingLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 82!")
			GetFarmingLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 83!")
			GetFarmingLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 84!")
			GetFarmingLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 85!")
			GetFarmingLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 86!")
			GetFarmingLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 87!")
			GetFarmingLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 88!")
			GetFarmingLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 89!")
			GetFarmingLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 90!")
			GetFarmingLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 91!")
			GetFarmingLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 92!")
			GetFarmingLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 93!")
			GetFarmingLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 94!")
			GetFarmingLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 95!")
			GetFarmingLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 96!")
			GetFarmingLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 97!")
			GetFarmingLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 98!")
			GetFarmingLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundFarming_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Farming level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Farming. Why not visit Martin the Master Gardener in Draynor Village? He has something special that is only available to true masters of the Farming skill!")
			GetFarmingLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Firemaking)
Function rsLevelCheck_Firemaking() Global
	Float xp  = GetFiremakingXP().GetValue()
	Float level = GetFiremakingLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetFiremakingLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 2!")
			GetFiremakingLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 3!")
			GetFiremakingLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 4!")
			GetFiremakingLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 5!")
			Debug.MessageBox("You can now burn Regular Pyre logs!")
			GetFiremakingLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 6!")
			GetFiremakingLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 7!")
			GetFiremakingLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 8!")
			GetFiremakingLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 9!")
			GetFiremakingLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 10!")
			GetFiremakingLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 11!")
			GetFiremakingLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 12!")
			GetFiremakingLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 13!")
			GetFiremakingLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 14!")
			GetFiremakingLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 15!")
			Debug.MessageBox("You can now burn Oak logs!")
			GetFiremakingLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 16!")
			GetFiremakingLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 17!")
			GetFiremakingLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 18!")
			GetFiremakingLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 19!")
			GetFiremakingLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 20!")
			Debug.MessageBox("You can now burn Oak Pyre logs!")
			GetFiremakingLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 21!")
			GetFiremakingLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 22!")
			GetFiremakingLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 23!")
			GetFiremakingLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 24!")
			GetFiremakingLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 25!")
			GetFiremakingLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 26!")
			GetFiremakingLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 27!")
			GetFiremakingLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 28!")
			GetFiremakingLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 29!")
			GetFiremakingLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 30!")
			Debug.MessageBox("You can now burn Willow logs!")
			GetFiremakingLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 31!")
			GetFiremakingLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 32!")
			GetFiremakingLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 33!")
			GetFiremakingLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 34!")
			GetFiremakingLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 35!")
			Debug.MessageBox("You can now burn Teak logs and Willow Pyre logs!")
			GetFiremakingLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 36!")
			GetFiremakingLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 37!")
			GetFiremakingLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 38!")
			GetFiremakingLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 39!")
			GetFiremakingLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 40!")
			Debug.MessageBox("You can now burn Teak Pyre logs!")
			GetFiremakingLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 41!")
			GetFiremakingLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 42!")
			Debug.MessageBox("You can now burn Arctic Pine logs!")
			GetFiremakingLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 43!")
			Debug.MessageBox("You can now light the Rag and Bone Man and River Salve Beacons!")
			GetFiremakingLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 44!")
			GetFiremakingLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 45!")
			Debug.MessageBox("You can now burn Maple logs!")
			GetFiremakingLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 46!")
			GetFiremakingLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 47!")
			Debug.MessageBox("You can now burn Arctic Pine Pyre logs!")
			GetFiremakingLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 48!")
			Debug.MessageBox("You can now light the Jolly Boar Inn Beacon!")
			GetFiremakingLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 49!")
			GetFiremakingLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 50!")
			Debug.MessageBox("You can now burn Mohogany logs!")
			GetFiremakingLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 51!")
			GetFiremakingLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 52!")
			GetFiremakingLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 53!")
			GetFiremakingLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 54!")
			GetFiremakingLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 55!")
			Debug.MessageBox("You can now burn Mohogany Pyre logs!")
			GetFiremakingLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 56!")
			GetFiremakingLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 57!")
			GetFiremakingLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 58!")
			Debug.MessageBox("You can now burn Eucalyptus logs!")
			GetFiremakingLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 59!")
			Debug.MessageBox("You can now light the Grand Exchange Beacon!")
			GetFiremakingLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 60!")
			Debug.MessageBox("You can now burn Yew logs!")
			GetFiremakingLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 61!")
			GetFiremakingLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 62!")
			Debug.MessageBox("You can now light the Edgeville Beacon and have six beacons lit simultaneously!")
			GetFiremakingLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 63!")
			Debug.MessageBox("You can now burn Eucalyptus Pyre logs!")
			GetFiremakingLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 64!")
			GetFiremakingLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 65!")
			Debug.MessageBox("You can now burn Yew Pyre logs!")	
			GetFiremakingLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 66!")
			GetFiremakingLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 67!")
			GetFiremakingLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 68!")
			Debug.MessageBox("You can now light the Black Knights' Fortress Beacon!")
			GetFiremakingLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 69!")
			GetFiremakingLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 70!")
			GetFiremakingLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 71!")
			GetFiremakingLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 72!")
			Debug.MessageBox("You can now light the Goblin Village Beacon!")
			GetFiremakingLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 73!")
			GetFiremakingLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 74!")
			GetFiremakingLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 75!")
			Debug.MessageBox("You can now burn Magic logs!")
			GetFiremakingLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 76!")
			Debug.MessageBox("You can now light the Burthope Beacon!")
			GetFiremakingLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 77!")
			GetFiremakingLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 78!")
			GetFiremakingLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 79!")
			Debug.MessageBox("You can now light the Beacon East of Death Plateau, and have 10 beacons lit simultaneously!")
			GetFiremakingLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 80!")
			Debug.MessageBox("You can now burn Magic Pyre logs!")
			GetFiremakingLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 81!")
			GetFiremakingLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 82!")
			GetFiremakingLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 83!")
			Debug.MessageBox("You can now light the Beacon East of Trollheim!")
			GetFiremakingLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 84!")
			GetFiremakingLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 85!")
			GetFiremakingLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 86!")
			GetFiremakingLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 87!")
			Debug.MessageBox("You can now light the Beacon East of the God Wars Dungeon!")
			GetFiremakingLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 88!")
			GetFiremakingLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 89!")
			Debug.MessageBox("You can now light the Wilderness Temple Beacon!")
			GetFiremakingLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 90!")
			GetFiremakingLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 91!")
			GetFiremakingLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 92!")
			Debug.MessageBox("You can now light the Frozen Waste Plateau Beacon, and have 14 beacons lit simultaneously!")
			GetFiremakingLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 93!")
			GetFiremakingLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 94!")
			GetFiremakingLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 95!")
			GetFiremakingLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 96!")
			GetFiremakingLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 97!")
			GetFiremakingLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 98!")
			GetFiremakingLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundFiremaking_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Firemaking level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Firemaking. Why not visit Ignatius, south of Seers' Village? He has something special that is only available to true masters of the Firemaking skill!")
			GetFiremakingLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Fishing)
Function rsLevelCheck_Fishing() Global
	Float xp  = GetFishingXP().GetValue()
	Float level = GetFishingLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetFishingLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 2!")
			GetFishingLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 3!")
			GetFishingLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 4!")
			GetFishingLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 5!")
			Debug.MessageBox("You can now catch Sardine using a fishing rod and bait!")
			Debug.MessageBox("You can now catch Karambwanji using a small fishing net!")			
			GetFishingLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 6!")
			GetFishingLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 7!")
			GetFishingLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 8!")
			GetFishingLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 9!")
			GetFishingLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 10!")
			Debug.MessageBox("You can now catch Herring using a fishing rod and bait!")
			GetFishingLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 11!")
			GetFishingLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 12!")
			GetFishingLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 13!")
			GetFishingLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 14!")
			GetFishingLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 15!")
			Debug.MessageBox("You can now catch Anchovies using a small fishing net!")
			GetFishingLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 16!")
			Debug.MessageBox("You can now catch Mackerel using a big fishing net!")
			Debug.MessageBox("You can now catch inedible items using a big fishing net!")
			GetFishingLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 17!")
			GetFishingLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 18!")
			GetFishingLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 19!")
			GetFishingLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 20!")
			Debug.MessageBox("You can now catch Trout using a fly-fishing rod and feathers!")
			GetFishingLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 21!")
			GetFishingLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 22!")
			GetFishingLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 23!")
			Debug.MessageBox("You can now catch Cod using a big fishing net!")
			GetFishingLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 24!")
			GetFishingLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 25!")
			Debug.MessageBox("You can now catch Pike using a fishing rod and bait!")
			GetFishingLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 26!")
			GetFishingLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 27!")
			GetFishingLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 28!")
			Debug.MessageBox("You can now catch Slimy Eel using a fishing rod and bait!")
			GetFishingLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 29!")
			GetFishingLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 30!")
			Debug.MessageBox("You can now catch Salmon using a fly-fishing rod and feathers!")
			GetFishingLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 31!")
			GetFishingLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 32!")
			GetFishingLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 33!")
			Debug.MessageBox("You can now catch Giant Frogspawn using a small fishing net!")
			GetFishingLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 34!")
			GetFishingLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 35!")
			Debug.MessageBox("You can now catch Tuna using a harpoon!")
			GetFishingLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 36!")
			GetFishingLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 37!")
			GetFishingLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 38!")
			Debug.MessageBox("You can now catch Rainbow Fish using a fishing rod and stripy feathers!")
			Debug.MessageBox("You can now catch Cave Eel using a fishing rod and bait!")
			GetFishingLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 39!")
			GetFishingLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 40!")
			Debug.MessageBox("You can now catch Lobster using a lobster pot!")
			GetFishingLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 41!")
			GetFishingLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 42!")
			GetFishingLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 43!")
			GetFishingLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 44!")
			GetFishingLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 45!")
			GetFishingLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 46!")
			Debug.MessageBox("You can now catch Bass using a big fishing net!")
			GetFishingLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 47!")
			GetFishingLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 48!")
			GetFishingLVL().SetValue(48)
			
			Float AgilityLVL = (GetAgilityLVL()).GetValue()
			Float StrengthLVL = (GetStrengthLVL()).GetValue()
			If AgilityLVL >= 15 && StrengthLVL >= 15
				Debug.MessageBox("You can now catch Leaping Trout using your bare hands!")
			EndIf
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 49!")
			GetFishingLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 50!")
			Debug.MessageBox("You can now catch Swordfish using a harpoon!")
			GetFishingLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 51!")
			GetFishingLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 52!")
			GetFishingLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 53!")
			Debug.MessageBox("You can now catch Lava Eel using an oily-fishing rod and bait!")
			GetFishingLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 54!")
			GetFishingLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 55!")
			GetFishingLVL().SetValue(55)
			
			Float AgilityLVL = (GetAgilityLVL()).GetValue()
			Float StrengthLVL = (GetStrengthLVL()).GetValue()
			If AgilityLVL >= 1 && StrengthLVL >= 35
				Debug.MessageBox("You can now catch Tuna using your bare hands!")
			EndIf
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 56!")
			GetFishingLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 57!")
			GetFishingLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 58!")
			GetFishingLVL().SetValue(58)
			
			Float AgilityLVL = (GetAgilityLVL()).GetValue()
			Float StrengthLVL = (GetStrengthLVL()).GetValue()
			If AgilityLVL >= 30 && StrengthLVL >= 30
				Debug.MessageBox("You can now catch Leaping Salmon using your bare hands!")
			EndIf
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 59!")
			GetFishingLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 60!")
			GetFishingLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 61!")
			GetFishingLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 62!")
			Debug.MessageBox("You can now catch Monkfish using a small fishing net!")
			GetFishingLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 63!")
			GetFishingLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 64!")
			GetFishingLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 65!")
			Debug.MessageBox("You can now catch Karaambwan using a karambwan vessel!")			
			GetFishingLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 66!")
			GetFishingLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 67!")
			GetFishingLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 68!")
			GetFishingLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 69!")
			GetFishingLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 70!")
			GetFishingLVL().SetValue(70)
			
			Float AgilityLVL = (GetAgilityLVL()).GetValue()
			Float StrengthLVL = (GetStrengthLVL()).GetValue()
			If AgilityLVL >= 56 && StrengthLVL >= 45
				Debug.MessageBox("You can now catch Leaping Sturgeon using your bare hands!")
			EndIf
			If AgilityLVL >= 1 && StrengthLVL >= 50
				Debug.MessageBox("You can now catch Swordfish using your bare hands!")
			EndIf
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 71!")
			GetFishingLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 72!")
			GetFishingLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 73!")
			GetFishingLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 74!")
			GetFishingLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 75!")
			GetFishingLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 76!")
			Debug.MessageBox("You can now catch Shark using a harpoon!")
			GetFishingLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 77!")
			GetFishingLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 78!")
			GetFishingLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 79!")
			Debug.MessageBox("You can now catch Sea Turtle using the fishing trawler mini-game!")
			GetFishingLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 80!")
			GetFishingLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 81!")
			Debug.MessageBox("You can now catch Manta Ray using the fishing trawler mini-game!")
			GetFishingLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 82!")
			GetFishingLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 83!")
			GetFishingLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 84!")
			GetFishingLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 85!")
			Debug.MessageBox("You can now catch Cavefish using a fishing rod and bait!")
			GetFishingLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 86!")
			GetFishingLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 87!")
			GetFishingLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 88!")
			GetFishingLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 89!")
			GetFishingLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 90!")
			Debug.MessageBox("You can now catch Rocktail using a fishing rod and living minerals!")
			GetFishingLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 91!")
			GetFishingLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 92!")
			GetFishingLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 93!")
			GetFishingLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 94!")
			GetFishingLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 95!")
			GetFishingLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 96!")
			GetFishingLVL().SetValue(96)
			
			Float AgilityLVL = (GetAgilityLVL()).GetValue()
			Float StrengthLVL = (GetStrengthLVL()).GetValue()
			If AgilityLVL >= 1 && StrengthLVL >= 76
				Debug.MessageBox("You can now catch Sharks using your bare hands!")
			EndIf
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 97!")
			GetFishingLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 98!")
			GetFishingLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundFishing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fishing level!")
			Debug.Notification("You have now reached level 99!")
			GetFishingLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Fletching)
Function rsLevelCheck_Fletching() Global
	Float xp  = GetFletchingXP().GetValue()
	Float level = GetFletchingLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetFletchingLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 2!")
			GetFletchingLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 3!")
			GetFletchingLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 4!")
			GetFletchingLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 5!")
			GetFletchingLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 6!")
			GetFletchingLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 7!")
			GetFletchingLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 8!")
			GetFletchingLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 9!")
			GetFletchingLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 10!")
			GetFletchingLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 11!")
			GetFletchingLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 12!")
			GetFletchingLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 13!")
			GetFletchingLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 14!")
			GetFletchingLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 15!")
			GetFletchingLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 16!")
			GetFletchingLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 17!")
			GetFletchingLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 18!")
			GetFletchingLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 19!")
			GetFletchingLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 20!")
			GetFletchingLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 21!")
			GetFletchingLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 22!")
			GetFletchingLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 23!")
			GetFletchingLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 24!")
			GetFletchingLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 25!")
			GetFletchingLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 26!")
			GetFletchingLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 27!")
			GetFletchingLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 28!")
			GetFletchingLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 29!")
			GetFletchingLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 30!")
			GetFletchingLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 31!")
			GetFletchingLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 32!")
			GetFletchingLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 33!")
			GetFletchingLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 34!")
			GetFletchingLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 35!")
			GetFletchingLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 36!")
			GetFletchingLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 37!")
			GetFletchingLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 38!")
			GetFletchingLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 39!")
			GetFletchingLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 40!")
			GetFletchingLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 41!")
			GetFletchingLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 42!")
			GetFletchingLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 43!")
			GetFletchingLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 44!")
			GetFletchingLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 45!")
			GetFletchingLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 46!")
			GetFletchingLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 47!")
			GetFletchingLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 48!")
			GetFletchingLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 49!")
			GetFletchingLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 50!")
			GetFletchingLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 51!")
			GetFletchingLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 52!")
			GetFletchingLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 53!")
			GetFletchingLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 54!")
			GetFletchingLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 55!")
			GetFletchingLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 56!")
			GetFletchingLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 57!")
			GetFletchingLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 58!")
			GetFletchingLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 59!")
			GetFletchingLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 60!")
			GetFletchingLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 61!")
			GetFletchingLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 62!")
			GetFletchingLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 63!")
			GetFletchingLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 64!")
			GetFletchingLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 65!")
			GetFletchingLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 66!")
			GetFletchingLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 67!")
			GetFletchingLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 68!")
			GetFletchingLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 69!")
			GetFletchingLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 70!")
			GetFletchingLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 71!")
			GetFletchingLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 72!")
			GetFletchingLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 73!")
			GetFletchingLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 74!")
			GetFletchingLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 75!")
			GetFletchingLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 76!")
			GetFletchingLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 77!")
			GetFletchingLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 78!")
			GetFletchingLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 79!")
			GetFletchingLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 80!")
			GetFletchingLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 81!")
			GetFletchingLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 82!")
			GetFletchingLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 83!")
			GetFletchingLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 84!")
			GetFletchingLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 85!")
			GetFletchingLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 86!")
			GetFletchingLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 87!")
			GetFletchingLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 88!")
			GetFletchingLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 89!")
			GetFletchingLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 90!")
			GetFletchingLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 91!")
			GetFletchingLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 92!")
			GetFletchingLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 93!")
			GetFletchingLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 94!")
			GetFletchingLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 95!")
			GetFletchingLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 96!")
			GetFletchingLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 97!")
			GetFletchingLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 98!")
			GetFletchingLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundFletching_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Fletching level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Fletching. Why not visit Hickton in the Catherby fletching store? He has something special that is only available to true masters of the Fletching skill!")
			GetFletchingLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Herblore)
Function rsLevelCheck_Herblore() Global
	Float xp  = GetHerbloreXP().GetValue()
	Float level = GetHerbloreLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetHerbloreLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 2!")
			GetHerbloreLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 3!")
			GetHerbloreLVL().SetValue(3)
			Debug.MessageBox("You can now make Ranging Potions!")		
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 4!")
			GetHerbloreLVL().SetValue(4)
			Debug.MessageBox("You can now make Attack Mix!")
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 5!")			
			GetHerbloreLVL().SetValue(5)
			Debug.MessageBox("You can now make Magic Potions and Ranging Mix!")
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 6!")
			GetHerbloreLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 7!")
			GetHerbloreLVL().SetValue(7)
			Debug.MessageBox("You can now make Strength Potions and Magic Mix!")
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 8!")
			GetHerbloreLVL().SetValue(8)
			Debug.MessageBox("You can now make Relicym's Balm!")
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 9!")
			GetHerbloreLVL().SetValue(9)
			Debug.MessageBox("You can now make Magic Potions, Strength Mix and Relicym's Mix!")
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 10!")
			GetHerbloreLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 11!")
			GetHerbloreLVL().SetValue(11)
			Debug.MessageBox("You can now make Magic Mix!")
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 12!")
			GetHerbloreLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 13!")
			GetHerbloreLVL().SetValue(13)
			Debug.MessageBox("You can now make Strength!")
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 14!")
			GetHerbloreLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 15!")
			GetHerbloreLVL().SetValue(15)
			Debug.MessageBox("You can now make Serum 207 and Strength mix!")
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 16!")
			GetHerbloreLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 17!")
			GetHerbloreLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 18!")
			GetHerbloreLVL().SetValue(18)
			Debug.MessageBox("You can now make Guthix Rest!")
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 19!")
			GetHerbloreLVL().SetValue(19)
			Debug.MessageBox("You can now make Guam Tar!")
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 20!")
			GetHerbloreLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 21!")
			GetHerbloreLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 22!")
			GetHerbloreLVL().SetValue(22)
			Debug.MessageBox("You can now make Restore Potions and Guthix Balance!")
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 23!")
			GetHerbloreLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 24!")
			GetHerbloreLVL().SetValue(24)
			Debug.MessageBox("You can now make Restore Mix!")
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 25!")
			GetHerbloreLVL().SetValue(25)
			Debug.MessageBox("You can now make Blamish Oil!")
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 26!")
			GetHerbloreLVL().SetValue(26)
			Debug.MessageBox("You can now make Energy Potions!")
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 27!")
			GetHerbloreLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 28!")
			GetHerbloreLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 29!")
			GetHerbloreLVL().SetValue(29)
			Debug.MessageBox("You can now make Energy Mix!")
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 30!")
			GetHerbloreLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 31!")
			GetHerbloreLVL().SetValue(31)
			Debug.MessageBox("You can now make Marrentil Tar and Super Fishing Explosives!")
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 32!")
			GetHerbloreLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 33!")
			GetHerbloreLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 34!")
			GetHerbloreLVL().SetValue(34)
			Debug.MessageBox("You can now make Agility Potions!")
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 35!")
			GetHerbloreLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 36!")
			GetHerbloreLVL().SetValue(36)
			Debug.MessageBox("You can now make Combat Potions!")
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 37!")
			GetHerbloreLVL().SetValue(37)
			Debug.MessageBox("You can now make Goblin Potions and Agility Mix!")
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 38!")
			GetHerbloreLVL().SetValue(38)
			Debug.MessageBox("You can now make Prayer Potions!")
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 39!")
			GetHerbloreLVL().SetValue(39)
			Debug.MessageBox("You can now make Tarromin Tar!")
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 40!")
			GetHerbloreLVL().SetValue(40)
			Debug.MessageBox("You can now make Summoning Potions and Combat Mix!")
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 41!")
			GetHerbloreLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 42!")
			GetHerbloreLVL().SetValue(42)
			Debug.MessageBox("You can now make Crafting Potions and Prayer Mix!")
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 43!")
			GetHerbloreLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 44!")
			GetHerbloreLVL().SetValue(44)
			Debug.MessageBox("You can now make Harralander Tar!")
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 45!")
			GetHerbloreLVL().SetValue(45)
			Debug.MessageBox("You can now make Super Attack Potions!")
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 46!")
			GetHerbloreLVL().SetValue(46)
			Debug.MessageBox("You can now make Vials of Stench!")
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 47!")
			GetHerbloreLVL().SetValue(47)
			Debug.MessageBox("You can now make Super Attack Mix!")
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 48!")
			GetHerbloreLVL().SetValue(48)
			Debug.MessageBox("You can now make Super Strength!")
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 49!")
			GetHerbloreLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 50!")
			GetHerbloreLVL().SetValue(50)
			Debug.MessageBox("You can now make Fishing Potions!")
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 51!")
			GetHerbloreLVL().SetValue(51)
			Debug.MessageBox("You can now make Super Strength Mix!")
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 52!")
			GetHerbloreLVL().SetValue(52)
			Debug.MessageBox("You can now make Super Energy Potions and Shrink-Me-Quick!")
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 53!")
			GetHerbloreLVL().SetValue(53)
			Debug.MessageBox("You can now make Hunter Potions and Fishing Mix!")
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 54!")
			GetHerbloreLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 55!")
			GetHerbloreLVL().SetValue(55)
			Debug.MessageBox("You can now make Super Strength Potions!")
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 56!")
			GetHerbloreLVL().SetValue(56)
			Debug.MessageBox("You can now make Super Energy Mix!")
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 57!")
			GetHerbloreLVL().SetValue(57)
			Debug.MessageBox("You can now make Magic Essence Potions!")
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 58!")
			GetHerbloreLVL().SetValue(58)
			Debug.MessageBox("You can now make Fletching Potions and Hunter Mix!")
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 59!")
			GetHerbloreLVL().SetValue(59)
			Debug.MessageBox("You can now make Super Strength Mix!")
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 60!")
			GetHerbloreLVL().SetValue(60)
			Debug.MessageBox("You can now make Weapon Poison!")
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 61!")
			GetHerbloreLVL().SetValue(61)
			Debug.MessageBox("You can now make Magic Essence Mix!")
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 62!")
			GetHerbloreLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 63!")
			GetHerbloreLVL().SetValue(63)
			Debug.MessageBox("You can now make Super Restore Potions!")
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 64!")
			GetHerbloreLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 65!")			
			GetHerbloreLVL().SetValue(65)
			Debug.MessageBox("You can now make Sanfew Serum!")
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 66!")
			GetHerbloreLVL().SetValue(66)
			Debug.MessageBox("You can now make Super Magic Potions!")
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 67!")
			GetHerbloreLVL().SetValue(67)
			Debug.MessageBox("You can now make Super Restore Mix!")
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 68!")
			GetHerbloreLVL().SetValue(68)
			Debug.MessageBox("You can now make Strength+!")
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 69!")
			GetHerbloreLVL().SetValue(69)
			Debug.MessageBox("You can now make Antifire Potions!")
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 70!")
			GetHerbloreLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 71!")
			GetHerbloreLVL().SetValue(71)
			Debug.MessageBox("You can now make Super Magic Mix!")
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 72!")
			GetHerbloreLVL().SetValue(72)
			Debug.MessageBox("You can now make Super Ranging Potions!")
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 73!")
			GetHerbloreLVL().SetValue(73)
			Debug.MessageBox("You can now make Weapon Poison+!")
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 74!")
			GetHerbloreLVL().SetValue(74)
			Debug.MessageBox("You can now make Antidote+ Mix!")
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 75!")
			GetHerbloreLVL().SetValue(75)
			Debug.MessageBox("You can now make Super Magic Potion, Antifire Mix, and Grand Strength Potions!")
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 76!")
			GetHerbloreLVL().SetValue(76)
			Debug.MessageBox("You can now make Grand Ranging Potions!")
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 77!")
			GetHerbloreLVL().SetValue(77)
			Debug.MessageBox("You can now make Grand Magic Potions!")
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 78!")
			GetHerbloreLVL().SetValue(78)
			Debug.MessageBox("You can now make Zamorak Brew and Grand Attack Potions!")
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 79!")
			GetHerbloreLVL().SetValue(79)
			Debug.MessageBox("You can now make Strength++ and Grand Magic Potions!")
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 80!")
			GetHerbloreLVL().SetValue(80)
			Debug.MessageBox("You can now make Super Ranging Mix!")
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 81!")
			GetHerbloreLVL().SetValue(81)
			Debug.MessageBox("You can now make Saradomin Brew and Super Melee Potions!")
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 82!")
			GetHerbloreLVL().SetValue(82)
			Debug.MessageBox("You can now make Weapon Poison++!")
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 83!")
			GetHerbloreLVL().SetValue(83)
			Debug.MessageBox("You can now make Super Magic Mix!")
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 84!")
			GetHerbloreLVL().SetValue(84)
			Debug.MessageBox("You can now make Adrenaline Potions!")
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 85!")
			GetHerbloreLVL().SetValue(85)
			Debug.MessageBox("You can now make Super Antifire Potions, Zamorak Mix and Super Warmaster's Potions!")
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 86!")
			GetHerbloreLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 87!")
			GetHerbloreLVL().SetValue(87)
			Debug.MessageBox("You can now make Replenishment Potions!")
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 88!")
			GetHerbloreLVL().SetValue(88)
			Debug.MessageBox("You can now make Extreme Attack Potions!")
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 89!")
			GetHerbloreLVL().SetValue(89)
			Debug.MessageBox("You can now make Extreme Strength Potions and Wyrmfire Potions!")
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 90!")
			GetHerbloreLVL().SetValue(90)
			Debug.MessageBox("You can now make Extreme Magic Potions!")
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 91!")
			GetHerbloreLVL().SetValue(91)
			Debug.MessageBox("You can now make Extreme Magic Potions, Extreme Brawler's Potions, Extreme Battlemage's Potions and Extreme Sharpshooter's Potions!")
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 92!")
			GetHerbloreLVL().SetValue(92)
			Debug.MessageBox("You can now make Extreme Ranging Potions!")
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 93!")
			GetHerbloreLVL().SetValue(93)
			Debug.MessageBox("You can now make Super Saradomin Brew, Super Zamorak Brew, Super Guthix Rest Potions, Extreme Warmaster's Potions, Supreme Strength Potions, Supreme Attack Potions, Supreme Magic Potions, Supreme Magic Potions and Supreme Ranging Potions!")
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 94!")
			GetHerbloreLVL().SetValue(94)
			Debug.MessageBox("You can now make Super Prayer Potions, Prayer Renewal Potions and Brightfire Potions!")
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 95!")
			GetHerbloreLVL().SetValue(95)
			Debug.MessageBox("You can now make Overload Potions!")
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 96!")
			GetHerbloreLVL().SetValue(96)
			Debug.MessageBox("You can now make Super Prayer Renewal Potions!")
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 97!")
			GetHerbloreLVL().SetValue(97)
			Debug.MessageBox("You can now make Holy Overload Potions, Searing Overload Potions and Overload Salves!")
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 98!")
			GetHerbloreLVL().SetValue(98)
			Debug.MessageBox("You can now make Supreme Overload Potion!")
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundHerblore_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Herblore level!")
			Debug.Notification("You have now reached level 99!")
			GetHerbloreLVL().SetValue(99)
			Debug.MessageBox("You can now make Supreme Overload Salves and Perfect Plus Potions!")
			Debug.MessageBox("Congratulations! You are now a master of Herblore. Why not visit Kaqemeex in Taverly. He has something special that is only available to true masters of the Herblore skill!")
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Hunter)
Function rsLevelCheck_Hunter() Global
	Float xp  = GetHunterXP().GetValue()
	Float level = GetHunterLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetHunterLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 2!")
			GetHunterLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 3!")
			GetHunterLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 4!")
			GetHunterLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 5!")
			GetHunterLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 6!")
			GetHunterLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 7!")
			GetHunterLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 8!")
			GetHunterLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 9!")
			GetHunterLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 10!")
			GetHunterLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 11!")
			GetHunterLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 12!")
			GetHunterLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 13!")
			GetHunterLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 14!")
			GetHunterLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 15!")
			GetHunterLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 16!")
			GetHunterLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 17!")
			GetHunterLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 18!")
			GetHunterLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 19!")
			GetHunterLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 20!")
			GetHunterLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 21!")
			GetHunterLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 22!")
			GetHunterLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 23!")
			GetHunterLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 24!")
			GetHunterLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 25!")
			GetHunterLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 26!")
			GetHunterLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 27!")
			GetHunterLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 28!")
			GetHunterLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 29!")
			GetHunterLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 30!")
			GetHunterLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 31!")
			GetHunterLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 32!")
			GetHunterLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 33!")
			GetHunterLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 34!")
			GetHunterLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 35!")
			GetHunterLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 36!")
			GetHunterLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 37!")
			GetHunterLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 38!")
			GetHunterLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 39!")
			GetHunterLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 40!")
			GetHunterLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 41!")
			GetHunterLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 42!")
			GetHunterLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 43!")
			GetHunterLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 44!")
			GetHunterLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 45!")
			GetHunterLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 46!")
			GetHunterLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 47!")
			GetHunterLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 48!")
			GetHunterLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 49!")
			GetHunterLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 50!")
			GetHunterLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 51!")
			GetHunterLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 52!")
			GetHunterLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 53!")
			GetHunterLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 54!")
			GetHunterLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 55!")
			GetHunterLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 56!")
			GetHunterLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 57!")
			GetHunterLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 58!")
			GetHunterLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 59!")
			GetHunterLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 60!")
			GetHunterLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 61!")
			GetHunterLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 62!")
			GetHunterLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 63!")
			GetHunterLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 64!")
			GetHunterLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 65!")
			GetHunterLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 66!")
			GetHunterLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 67!")
			GetHunterLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 68!")
			GetHunterLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 69!")
			GetHunterLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 70!")
			GetHunterLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 71!")
			GetHunterLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 72!")
			GetHunterLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 73!")
			GetHunterLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 74!")
			GetHunterLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 75!")
			GetHunterLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 76!")
			GetHunterLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 77!")
			GetHunterLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 78!")
			GetHunterLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 79!")
			GetHunterLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 80!")
			GetHunterLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 81!")
			GetHunterLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 82!")
			GetHunterLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 83!")
			GetHunterLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 84!")
			GetHunterLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 85!")
			GetHunterLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 86!")
			GetHunterLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 87!")
			GetHunterLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 88!")
			GetHunterLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 89!")
			GetHunterLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 90!")
			GetHunterLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 91!")
			GetHunterLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 92!")
			GetHunterLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 93!")
			GetHunterLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 94!")
			GetHunterLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 95!")
			GetHunterLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 96!")
			GetHunterLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 97!")
			GetHunterLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 98!")
			GetHunterLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundHunter_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Hunter level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Hunter. Why not visit the hunting expert in Feldip Hills? She has something special that is only available to true masters of the Hunter skill!")
			GetHunterLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Invention)
Function rsLevelCheck_Invention() Global
	Float xp  = GetInventionXP().GetValue()
	Float level = GetInventionLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetInventionLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 2!")
			GetInventionLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 3!")
			GetInventionLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 4!")
			GetInventionLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 5!")
			GetInventionLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 6!")
			GetInventionLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 7!")
			GetInventionLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 8!")
			GetInventionLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 9!")
			GetInventionLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 10!")
			GetInventionLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 11!")
			GetInventionLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 12!")
			GetInventionLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 13!")
			GetInventionLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 14!")
			GetInventionLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 15!")
			GetInventionLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 16!")
			GetInventionLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 17!")
			GetInventionLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 18!")
			GetInventionLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 19!")
			GetInventionLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 20!")
			GetInventionLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 21!")
			GetInventionLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 22!")
			GetInventionLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 23!")
			GetInventionLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 24!")
			GetInventionLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 25!")
			GetInventionLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 26!")
			GetInventionLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 27!")
			GetInventionLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 28!")
			GetInventionLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 29!")
			GetInventionLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 30!")
			GetInventionLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 31!")
			GetInventionLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 32!")
			GetInventionLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 33!")
			GetInventionLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 34!")
			GetInventionLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 35!")
			GetInventionLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 36!")
			GetInventionLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 37!")
			GetInventionLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 38!")
			GetInventionLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 39!")
			GetInventionLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 40!")
			GetInventionLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 41!")
			GetInventionLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 42!")
			GetInventionLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 43!")
			GetInventionLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 44!")
			GetInventionLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 45!")
			GetInventionLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 46!")
			GetInventionLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 47!")
			GetInventionLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 48!")
			GetInventionLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 49!")
			GetInventionLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 50!")
			GetInventionLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 51!")
			GetInventionLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 52!")
			GetInventionLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 53!")
			GetInventionLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 54!")
			GetInventionLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 55!")
			GetInventionLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 56!")
			GetInventionLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 57!")
			GetInventionLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 58!")
			GetInventionLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 59!")
			GetInventionLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 60!")
			GetInventionLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 61!")
			GetInventionLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 62!")
			GetInventionLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 63!")
			GetInventionLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 64!")
			GetInventionLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 65!")
			GetInventionLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 66!")
			GetInventionLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 67!")
			GetInventionLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 68!")
			GetInventionLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 69!")
			GetInventionLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 70!")
			GetInventionLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 71!")
			GetInventionLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 72!")
			GetInventionLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 73!")
			GetInventionLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 74!")
			GetInventionLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 75!")
			GetInventionLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 76!")
			GetInventionLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 77!")
			GetInventionLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 78!")
			GetInventionLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 79!")
			GetInventionLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 80!")
			GetInventionLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 81!")
			GetInventionLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 82!")
			GetInventionLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 83!")
			GetInventionLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 84!")
			GetInventionLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 85!")
			GetInventionLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 86!")
			GetInventionLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 87!")
			GetInventionLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 88!")
			GetInventionLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 89!")
			GetInventionLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 90!")
			GetInventionLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 91!")
			GetInventionLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 92!")
			GetInventionLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 93!")
			GetInventionLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 94!")
			GetInventionLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 95!")
			GetInventionLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 96!")
			GetInventionLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 97!")
			GetInventionLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 98!")
			GetInventionLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundInvention_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Invention level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Invention. Why not visit Doc in the Invention Guild. He has something special that is only available to true masters of the Invention skill!")
			GetInventionLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Magic)
Function rsLevelCheck_Magic() Global
	Float xp  = GetMagicXP().GetValue()
	Float level = GetMagicLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetMagicLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 2!")
			GetMagicLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 3!")
			GetMagicLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 4!")
			GetMagicLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 5!")
			GetMagicLVL().SetValue(5)
			Game.GetPlayer().AddSpell((GetRS_Spell_WaterStrike()))
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 6!")
			GetMagicLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 7!")
			GetMagicLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 8!")
			GetMagicLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 9!")
			GetMagicLVL().SetValue(9)
			Game.GetPlayer().AddSpell((GetRS_Spell_EarthStrike()))
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 10!")
			GetMagicLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 11!")
			GetMagicLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 12!")
			GetMagicLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 13!")
			GetMagicLVL().SetValue(13)
			Game.GetPlayer().AddSpell((GetRS_Spell_FireStrike()))
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 14!")
			GetMagicLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 15!")
			GetMagicLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 16!")
			GetMagicLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 17!")
			GetMagicLVL().SetValue(17)
			Game.GetPlayer().AddSpell((GetRS_Spell_WindBolt()))
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 18!")
			GetMagicLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 19!")
			GetMagicLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 20!")
			GetMagicLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 21!")
			GetMagicLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 22!")
			GetMagicLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 23!")
			GetMagicLVL().SetValue(23)
			Game.GetPlayer().AddSpell((GetRS_Spell_WaterBolt()))
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 24!")
			GetMagicLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 25!")
			GetMagicLVL().SetValue(25)
			Game.GetPlayer().AddSpell((GetRS_Spell_VarrockTele()))
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 26!")
			GetMagicLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 27!")
			GetMagicLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 28!")
			GetMagicLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 29!")
			GetMagicLVL().SetValue(29)
			Game.GetPlayer().AddSpell((GetRS_Spell_EarthBolt()))
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 30!")
			GetMagicLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 31!")
			GetMagicLVL().SetValue(31)
			Game.GetPlayer().AddSpell((GetRS_Spell_LumbridgeTele()))
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 32!")
			GetMagicLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 33!")
			GetMagicLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 34!")
			GetMagicLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 35!")
			GetMagicLVL().SetValue(35)
			Game.GetPlayer().AddSpell((GetRS_Spell_FireBolt()))
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 36!")
			GetMagicLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 37!")
			GetMagicLVL().SetValue(37)
			Game.GetPlayer().AddSpell((GetRS_Spell_FaladorTele()))
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 38!")
			GetMagicLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 39!")
			GetMagicLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 40!")
			GetMagicLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 41!")
			GetMagicLVL().SetValue(41)
			Game.GetPlayer().AddSpell((GetRS_Spell_WindBlast()))
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 42!")
			GetMagicLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 43!")
			GetMagicLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 44!")
			GetMagicLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 45!")
			GetMagicLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 46!")
			GetMagicLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 47!")
			GetMagicLVL().SetValue(47)
			Game.GetPlayer().AddSpell((GetRS_Spell_Water_Blast()))
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 48!")
			GetMagicLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 49!")
			GetMagicLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 50!")
			GetMagicLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 51!")
			GetMagicLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 52!")
			GetMagicLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 53!")
			GetMagicLVL().SetValue(53)
			Game.GetPlayer().AddSpell((GetRS_Spell_EarthBlast()))
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 54!")
			GetMagicLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 55!")
			GetMagicLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 56!")
			GetMagicLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 57!")
			GetMagicLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 58!")
			GetMagicLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 59!")
			GetMagicLVL().SetValue(59)
			Game.GetPlayer().AddSPell((GetRS_Spell_FireBlast()))
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 60!")
			GetMagicLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 61!")
			GetMagicLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 62!")
			GetMagicLVL().SetValue(62)
			Game.GetPlayer().AddSPell((GetRS_Spell_WindWave()))
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 63!")
			GetMagicLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 64!")
			GetMagicLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 65!")
			GetMagicLVL().SetValue(65)
			Game.GetPlayer().AddSpell((GetRS_Spell_WaterWave()))
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 66!")
			GetMagicLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 67!")
			GetMagicLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 68!")
			GetMagicLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 69!")
			GetMagicLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 70!")
			GetMagicLVL().SetValue(70)
			Game.GetPlayer().AddSPell((GetRS_Spell_EarthWave()))
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 71!")
			GetMagicLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 72!")
			GetMagicLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 73!")
			GetMagicLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 74!")
			GetMagicLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 75!")
			GetMagicLVL().SetValue(75)
			Game.GetPlayer().AddSpell((GetRS_Spell_FireWave()))
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 76!")
			GetMagicLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 77!")
			GetMagicLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 78!")
			GetMagicLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 79!")
			GetMagicLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 80!")
			GetMagicLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 81!")
			GetMagicLVL().SetValue(81)
			Game.GetPlayer().AddSpell((GetRS_Spell_WindSurge()))
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 82!")
			GetMagicLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 83!")
			GetMagicLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 84!")
			GetMagicLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 85!")
			GetMagicLVL().SetValue(85)
			Game.GetPlayer().AddSpell((GetRS_Spell_WaterSurge()))
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 86!")
			GetMagicLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 87!")
			GetMagicLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 88!")
			GetMagicLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 89!")
			GetMagicLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 90!")
			GetMagicLVL().SetValue(90)
			Game.GetPlayer().AddSpell((GetRS_Spell_EarthSurge()))
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 91!")
			GetMagicLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 92!")
			GetMagicLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 93!")
			GetMagicLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 94!")
			GetMagicLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 95!")
			GetMagicLVL().SetValue(95)
			Game.GetPlayer().AddSpell((GetRS_Spell_FireSurge()))
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 96!")
			GetMagicLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 97!")
			GetMagicLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 98!")
			GetMagicLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundMagic_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Magic level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Magic. Why not visit the robe store owner in the Magic Guild? He has something special that is only available to true masters of the Magic skill!")
			GetMagicLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Mining)
Function rsLevelCheck_Mining() Global
	Float xp  = GetMiningXP().GetValue()
	Float level = GetMiningLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetMiningLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 2!")
			GetMiningLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 3!")
			GetMiningLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 4!")
			GetMiningLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 5!")
			GetMiningLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 6!")
			Debug.MessageBox("You can now use Steel Pickaxes for mining!")
			GetMiningLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 7!")
			GetMiningLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 8!")
			GetMiningLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 9!")
			GetMiningLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 10!")
			Debug.MessageBox("You can now harvest Blurite ore!")
			GetMiningLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 11!")
			GetMiningLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 12!")
			GetMiningLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 13!")
			GetMiningLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 14!")
			GetMiningLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 15!")
			Debug.MessageBox("You can now harvest Iron ore!")
			GetMiningLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 16!")
			GetMiningLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 17!")
			GetMiningLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 18!")
			GetMiningLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 19!")
			GetMiningLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 20!")
			Debug.MessageBox("You can now harvest Silver, Daeyalt and Elemental ore!")
			GetMiningLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 21!")
			Debug.MessageBox("You can now use Mithril Pickaxes for mining!")
			GetMiningLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 22!")
			GetMiningLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 23!")
			GetMiningLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 24!")
			GetMiningLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 25!")
			GetMiningLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 26!")
			GetMiningLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 27!")
			GetMiningLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 28!")
			GetMiningLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 29!")
			GetMiningLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 30!")
			Debug.MessageBox("You can now harvest Coal ore and Pure Rune Essence!")
			GetMiningLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 31!")
			Debug.MessageBox("You can now use Adamant Pickaxes for mining!")
			GetMiningLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 32!")
			GetMiningLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 33!")
			GetMiningLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 34!")
			GetMiningLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 35!")
			Debug.MessageBox("You can now harvest Sandstone!")
			GetMiningLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 36!")
			GetMiningLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 37!")
			GetMiningLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 38!")
			GetMiningLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 39!")
			GetMiningLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 40!")
			Debug.MessageBox("You can now use Sacred Clay and Volatile Clay Pickaxes for mining!")
			Debug.MessageBox("You can now harvest Gold ore and Gems from Gem Rocks!")
			GetMiningLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 41!")
			Debug.MessageBox("You can now use Rune Pickaxes and the Inferno Adze for mining!")
			Debug.MessageBox("You can now harvest Obsidian ore!")
			GetMiningLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 42!")
			GetMiningLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 43!")
			GetMiningLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 44!")
			GetMiningLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 45!")
			Debug.MessageBox("You can now harvest Granite!")
			GetMiningLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 46!")
			Debug.MessageBox("You can now harvest Rubium ore!")
			GetMiningLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 47!")
			GetMiningLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 48!")
			GetMiningLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 49!")
			GetMiningLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 50!")
			GetMiningLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 51!")
			GetMiningLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 52!")
			GetMiningLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 53!")
			GetMiningLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 54!")
			GetMiningLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 55!")
			Debug.MessageBox("You can now harvest Mithril ore!")
			GetMiningLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 56!")
			GetMiningLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 57!")
			GetMiningLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 58!")
			GetMiningLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 59!")
			GetMiningLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 60!")
			Debug.MessageBox("You can now harvest Lunar ore!")
			GetMiningLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 61!")
			Debug.MessageBox("You can now use Dragon Pickaxes for mining!")
			GetMiningLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 62!")
			GetMiningLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 63!")
			GetMiningLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 64!")
			GetMiningLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 65!")
			GetMiningLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 66!")
			GetMiningLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 67!")
			GetMiningLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 68!")
			GetMiningLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 69!")
			GetMiningLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 70!")
			Debug.MessageBox("You can now harvest Adamantite ore!")
			GetMiningLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 71!")
			GetMiningLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 72!")
			GetMiningLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 73!")
			Debug.MessageBox("You can now harvest Living Minerals from the remains of Living Rocks!")
			GetMiningLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 74!")
			GetMiningLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 75!")
			GetMiningLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 76!")
			GetMiningLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 77!")
			Debug.MessageBox("You can now harvest Coal ore from Concentrated Coal Deposits!")
			GetMiningLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 78!")
			GetMiningLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 79!")
			GetMiningLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 80!")
			Debug.MessageBox("You can now harvest Gold ore from Concentrated Gold Deposits!")
			GetMiningLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 81!")
			GetMiningLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 82!")
			GetMiningLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 83!")
			GetMiningLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 84!")
			GetMiningLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 85!")
			Debug.MessageBox("You can now harvest Runite ore!")
			GetMiningLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 86!")
			GetMiningLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 87!")
			GetMiningLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 88!")
			GetMiningLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 89!")
			GetMiningLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 90!")
			GetMiningLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 91!")
			GetMiningLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 92!")
			GetMiningLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 93!")
			GetMiningLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 94!")
			GetMiningLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 95!")
			GetMiningLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 96!")
			GetMiningLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 97!")
			GetMiningLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 98!")
			GetMiningLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundMining_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Mining level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Mining. Why not visit Wilfred, near Lumbridge. He has something special that is only available to true masters of the Mining skill!")
			GetMiningLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Prayer)
Function rsLevelCheck_Prayer() Global
	Float xp  = GetPrayerXP().GetValue()
	Float level = GetPrayerLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetPrayerLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 2!")
			GetPrayerLVL().SetValue(2)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 3!")
			GetPrayerLVL().SetValue(3)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 4!")
			Debug.MessageBox("You can now use the 'Burst of Strength' prayer!")
			GetPrayerLVL().SetValue(4)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 5!")
			GetPrayerLVL().SetValue(5)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 6!")
			GetPrayerLVL().SetValue(6)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 7!")
			Debug.MessageBox("You can now use the 'Clairity of Thought' prayer!")
			GetPrayerLVL().SetValue(7)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 8!")
			Debug.MessageBox("You can now use the 'Sharp Eye' prayer!")
			GetPrayerLVL().SetValue(8)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 9!")
			Debug.MessageBox("You can now use the 'Mystic Will' prayer!")
			GetPrayerLVL().SetValue(9)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 10!")
			Debug.MessageBox("You can now use the 'Rock Skin' prayer!")
			GetPrayerLVL().SetValue(10)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 11!")
			GetPrayerLVL().SetValue(11)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 12!")
			GetPrayerLVL().SetValue(12)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 13!")
			Debug.MessageBox("You can now use the 'Superhuman Strength' prayer!")
			GetPrayerLVL().SetValue(13)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 14!")
			GetPrayerLVL().SetValue(14)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 15!")
			GetPrayerLVL().SetValue(15)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 16!")
			Debug.MessageBox("You can now use the 'Improved Reflexes' prayer!")
			GetPrayerLVL().SetValue(16)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 17!")
			GetPrayerLVL().SetValue(17)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 18!")
			GetPrayerLVL().SetValue(18)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 19!")
			Debug.MessageBox("You can now use the 'Rapid Restore' prayer!")
			GetPrayerLVL().SetValue(19)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 20!")
			GetPrayerLVL().SetValue(20)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 21!")
			GetPrayerLVL().SetValue(21)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 22!")
			Debug.MessageBox("You can now use the 'Rapid Heal' prayer!")
			GetPrayerLVL().SetValue(22)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 23!")
			GetPrayerLVL().SetValue(23)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 24!")
			GetPrayerLVL().SetValue(24)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 25!")
			Debug.MessageBox("You can now use the 'Protect Items' prayer!")
			GetPrayerLVL().SetValue(25)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 26!")
			Debug.MessageBox("You can now use the 'Hawk Eye' prayer!")
			GetPrayerLVL().SetValue(26)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 27!")
			Debug.MessageBox("You can now use the 'Mystic Lore' prayer!")
			GetPrayerLVL().SetValue(27)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 28!")
			Debug.MessageBox("You can now use the 'Steel Skin' prayer!")
			GetPrayerLVL().SetValue(28)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 29!")
			GetPrayerLVL().SetValue(29)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 30!")
			GetPrayerLVL().SetValue(30)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 31!")
			Debug.MessageBox("You can now use the 'Ultimate Strength' prayer!")
			GetPrayerLVL().SetValue(31)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 32!")
			GetPrayerLVL().SetValue(32)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 33!")
			GetPrayerLVL().SetValue(33)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 34!")
			Debug.MessageBox("You can now use the 'Incredible Reflexes' prayer!")
			GetPrayerLVL().SetValue(34)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 35!")
			Debug.MessageBox("You can now use the 'Protect from Summoning' prayer!")
			GetPrayerLVL().SetValue(35)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 36!")
			Debug.MessageBox("You can now use the 'Clairity of Thought' prayer!")
			GetPrayerLVL().SetValue(36)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 37!")
			Debug.MessageBox("You can now use the 'Protect from Magic' prayer!")
			GetPrayerLVL().SetValue(37)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 38!")
			GetPrayerLVL().SetValue(38)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 39!")
			GetPrayerLVL().SetValue(39)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 40!")
			Debug.MessageBox("You can now use the 'Protect from Missiles' prayer!")
			GetPrayerLVL().SetValue(40)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 41!")
			GetPrayerLVL().SetValue(41)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 42!")
			GetPrayerLVL().SetValue(42)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 43!")
			Debug.MessageBox("You can now use the 'Protect from Melee' prayer!")
			GetPrayerLVL().SetValue(43)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 44!")
			Debug.MessageBox("You can now use the 'Eagle Eye' prayer!")
			GetPrayerLVL().SetValue(44)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 45!")
			Debug.MessageBox("You can now use the 'Mystic Might' prayer!")
			GetPrayerLVL().SetValue(45)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 46!")
			Debug.MessageBox("You can now use the 'Retribution' prayer!")
			GetPrayerLVL().SetValue(46)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 47!")
			GetPrayerLVL().SetValue(47)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 48!")
			GetPrayerLVL().SetValue(48)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 49!")
			Debug.MessageBox("You can now use the 'Redemption' prayer!")
			GetPrayerLVL().SetValue(49)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 50!")
			GetPrayerLVL().SetValue(50)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 51!")
			GetPrayerLVL().SetValue(51)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 52!")
			Debug.MessageBox("You can now use the 'Smite' prayer!")
			GetPrayerLVL().SetValue(52)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 53!")
			GetPrayerLVL().SetValue(53)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 54!")
			GetPrayerLVL().SetValue(54)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 55!")
			GetPrayerLVL().SetValue(55)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 56!")
			GetPrayerLVL().SetValue(56)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 57!")
			GetPrayerLVL().SetValue(57)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 58!")
			GetPrayerLVL().SetValue(58)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 59!")
			GetPrayerLVL().SetValue(59)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 60!")
			Debug.MessageBox("You can now use the 'Chivalry' prayer!")
			GetPrayerLVL().SetValue(60)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 61!")
			GetPrayerLVL().SetValue(61)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 62!")
			GetPrayerLVL().SetValue(62)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 63!")
			GetPrayerLVL().SetValue(63)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 64!")
			GetPrayerLVL().SetValue(64)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 65!")
			GetPrayerLVL().SetValue(65)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 66!")
			GetPrayerLVL().SetValue(66)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 67!")
			GetPrayerLVL().SetValue(67)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 68!")
			GetPrayerLVL().SetValue(68)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 69!")
			GetPrayerLVL().SetValue(69)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 70!")
			Debug.MessageBox("You can now use the 'Piety' prayer!")
			GetPrayerLVL().SetValue(70)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 71!")
			GetPrayerLVL().SetValue(71)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 72!")
			GetPrayerLVL().SetValue(72)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 73!")
			GetPrayerLVL().SetValue(73)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 74!")
			GetPrayerLVL().SetValue(74)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 75!")
			GetPrayerLVL().SetValue(75)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 76!")
			GetPrayerLVL().SetValue(76)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 77!")
			GetPrayerLVL().SetValue(77)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 78!")
			GetPrayerLVL().SetValue(78)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 79!")
			GetPrayerLVL().SetValue(79)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 80!")
			GetPrayerLVL().SetValue(80)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 81!")
			GetPrayerLVL().SetValue(81)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 82!")
			GetPrayerLVL().SetValue(82)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 83!")
			GetPrayerLVL().SetValue(83)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 84!")
			GetPrayerLVL().SetValue(84)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 85!")
			GetPrayerLVL().SetValue(85)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 86!")
			GetPrayerLVL().SetValue(86)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 87!")
			GetPrayerLVL().SetValue(87)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 88!")
			GetPrayerLVL().SetValue(88)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 89!")
			GetPrayerLVL().SetValue(89)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 90!")
			GetPrayerLVL().SetValue(90)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 91!")
			GetPrayerLVL().SetValue(91)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 92!")
			GetPrayerLVL().SetValue(92)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 93!")
			GetPrayerLVL().SetValue(93)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 94!")
			GetPrayerLVL().SetValue(94)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 95!")
			GetPrayerLVL().SetValue(95)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 96!")
			GetPrayerLVL().SetValue(96)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 97!")
			GetPrayerLVL().SetValue(97)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 98!")
			GetPrayerLVL().SetValue(98)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundPrayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Prayer level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Prayer. Why not visit Brother Jered upstairs at the Monastery. He has something special that is only available to true masters of the Prayer skill!")
			GetPrayerLVL().SetValue(99)
			Game.GetPlayer().RestoreActorValue("magicka", 9999)
			Game.GetPlayer().SetAV("magicka", (GetPrayerLVL().GetValue()))
		EndIf
	EndIf
	SpellCheck_Prayers()
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Ranged)
Function rsLevelCheck_Ranged() Global
	Float xp  = GetRangedXP().GetValue()
	Float level = GetRangedLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetRangedLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 2!")
			GetRangedLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 3!")
			GetRangedLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 4!")
			GetRangedLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 5!")
			GetRangedLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 6!")
			GetRangedLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 7!")
			GetRangedLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 8!")
			GetRangedLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 9!")
			GetRangedLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 10!")
			GetRangedLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 11!")
			GetRangedLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 12!")
			GetRangedLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 13!")
			GetRangedLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 14!")
			GetRangedLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 15!")
			GetRangedLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 16!")
			GetRangedLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 17!")
			GetRangedLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 18!")
			GetRangedLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 19!")
			GetRangedLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 20!")
			GetRangedLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 21!")
			GetRangedLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 22!")
			GetRangedLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 23!")
			GetRangedLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 24!")
			GetRangedLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 25!")
			GetRangedLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 26!")
			GetRangedLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 27!")
			GetRangedLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 28!")
			GetRangedLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 29!")
			GetRangedLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 30!")
			GetRangedLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 31!")
			GetRangedLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 32!")
			GetRangedLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 33!")
			GetRangedLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 34!")
			GetRangedLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 35!")
			GetRangedLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 36!")
			GetRangedLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 37!")
			GetRangedLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 38!")
			GetRangedLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 39!")
			GetRangedLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 40!")
			GetRangedLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 41!")
			GetRangedLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 42!")
			GetRangedLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 43!")
			GetRangedLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 44!")
			GetRangedLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 45!")
			GetRangedLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 46!")
			GetRangedLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 47!")
			GetRangedLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 48!")
			GetRangedLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 49!")
			GetRangedLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 50!")
			GetRangedLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 51!")
			GetRangedLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 52!")
			GetRangedLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 53!")
			GetRangedLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 54!")
			GetRangedLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 55!")
			GetRangedLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 56!")
			GetRangedLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 57!")
			GetRangedLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 58!")
			GetRangedLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 59!")
			GetRangedLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 60!")
			GetRangedLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 61!")
			GetRangedLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 62!")
			GetRangedLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 63!")
			GetRangedLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 64!")
			GetRangedLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 65!")
			GetRangedLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 66!")
			GetRangedLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 67!")
			GetRangedLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 68!")
			GetRangedLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 69!")
			GetRangedLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 70!")
			GetRangedLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 71!")
			GetRangedLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 72!")
			GetRangedLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 73!")
			GetRangedLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 74!")
			GetRangedLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 75!")
			GetRangedLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 76!")
			GetRangedLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 77!")
			GetRangedLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 78!")
			GetRangedLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 79!")
			GetRangedLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 80!")
			GetRangedLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 81!")
			GetRangedLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 82!")
			GetRangedLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 83!")
			GetRangedLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 84!")
			GetRangedLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 85!")
			GetRangedLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 86!")
			GetRangedLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 87!")
			GetRangedLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 88!")
			GetRangedLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 89!")
			GetRangedLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 90!")
			GetRangedLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 91!")
			GetRangedLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 92!")
			GetRangedLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 93!")
			GetRangedLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 94!")
			GetRangedLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 95!")
			GetRangedLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 96!")
			GetRangedLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 97!")
			GetRangedLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 98!")
			GetRangedLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundRanged_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Ranged level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Ranged. Why not visit Aaron the armor salesman in the Ranging Guild? He has something special that is only available to true masters of the Ranged skill!")
			GetRangedLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Runecrafting)
Function rsLevelCheck_Runecrafting() Global
	Float xp  = GetRunecraftingXP().GetValue()
	Float level = GetRunecraftingLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetRunecraftingLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 2!")
			GetRunecraftingLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 3!")
			GetRunecraftingLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 4!")
			GetRunecraftingLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 5!")
			GetRunecraftingLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 6!")
			GetRunecraftingLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 7!")
			GetRunecraftingLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 8!")
			GetRunecraftingLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 9!")
			GetRunecraftingLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 10!")
			GetRunecraftingLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 11!")
			GetRunecraftingLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 12!")
			GetRunecraftingLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 13!")
			GetRunecraftingLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 14!")
			GetRunecraftingLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 15!")
			GetRunecraftingLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 16!")
			GetRunecraftingLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 17!")
			GetRunecraftingLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 18!")
			GetRunecraftingLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 19!")
			GetRunecraftingLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 20!")
			GetRunecraftingLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 21!")
			GetRunecraftingLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 22!")
			GetRunecraftingLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 23!")
			GetRunecraftingLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 24!")
			GetRunecraftingLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 25!")
			GetRunecraftingLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 26!")
			GetRunecraftingLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 27!")
			GetRunecraftingLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 28!")
			GetRunecraftingLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 29!")
			GetRunecraftingLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 30!")
			GetRunecraftingLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 31!")
			GetRunecraftingLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 32!")
			GetRunecraftingLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 33!")
			GetRunecraftingLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 34!")
			GetRunecraftingLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 35!")
			GetRunecraftingLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 36!")
			GetRunecraftingLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 37!")
			GetRunecraftingLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 38!")
			GetRunecraftingLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 39!")
			GetRunecraftingLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 40!")
			GetRunecraftingLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 41!")
			GetRunecraftingLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 42!")
			GetRunecraftingLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 43!")
			GetRunecraftingLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 44!")
			GetRunecraftingLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 45!")
			GetRunecraftingLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 46!")
			GetRunecraftingLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 47!")
			GetRunecraftingLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 48!")
			GetRunecraftingLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 49!")
			GetRunecraftingLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 50!")
			GetRunecraftingLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 51!")
			GetRunecraftingLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 52!")
			GetRunecraftingLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 53!")
			GetRunecraftingLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 54!")
			GetRunecraftingLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 55!")
			GetRunecraftingLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 56!")
			GetRunecraftingLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 57!")
			GetRunecraftingLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 58!")
			GetRunecraftingLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 59!")
			GetRunecraftingLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 60!")
			GetRunecraftingLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 61!")
			GetRunecraftingLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 62!")
			GetRunecraftingLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 63!")
			GetRunecraftingLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 64!")
			GetRunecraftingLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 65!")
			GetRunecraftingLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 66!")
			GetRunecraftingLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 67!")
			GetRunecraftingLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 68!")
			GetRunecraftingLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 69!")
			GetRunecraftingLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 70!")
			GetRunecraftingLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 71!")
			GetRunecraftingLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 72!")
			GetRunecraftingLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 73!")
			GetRunecraftingLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 74!")
			GetRunecraftingLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 75!")
			GetRunecraftingLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 76!")
			GetRunecraftingLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 77!")
			GetRunecraftingLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 78!")
			GetRunecraftingLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 79!")
			GetRunecraftingLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 80!")
			GetRunecraftingLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 81!")
			GetRunecraftingLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 82!")
			GetRunecraftingLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 83!")
			GetRunecraftingLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 84!")
			GetRunecraftingLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 85!")
			GetRunecraftingLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 86!")
			GetRunecraftingLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 87!")
			GetRunecraftingLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 88!")
			GetRunecraftingLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 89!")
			GetRunecraftingLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 90!")
			GetRunecraftingLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 91!")
			GetRunecraftingLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 92!")
			GetRunecraftingLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 93!")
			GetRunecraftingLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 94!")
			GetRunecraftingLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 95!")
			GetRunecraftingLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 96!")
			GetRunecraftingLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 97!")
			GetRunecraftingLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 98!")
			GetRunecraftingLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundRunecrafting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Runecrafting level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Runecrafting. Why not visit Larrier in the Runecrafting Guild. She has something special that is only available to true masters of the Runecrafting skill!")
			GetRunecraftingLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Slayer)
Function rsLevelCheck_Slayer() Global
	Float xp  = GetSlayerXP().GetValue()
	Float level = GetSlayerLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetSlayerLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 2!")
			GetSlayerLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 3!")
			GetSlayerLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 4!")
			GetSlayerLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 5!")
			GetSlayerLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 6!")
			GetSlayerLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 7!")
			GetSlayerLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 8!")
			GetSlayerLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 9!")
			GetSlayerLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 10!")
			GetSlayerLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 11!")
			GetSlayerLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 12!")
			GetSlayerLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 13!")
			GetSlayerLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 14!")
			GetSlayerLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 15!")
			GetSlayerLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 16!")
			GetSlayerLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 17!")
			GetSlayerLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 18!")
			GetSlayerLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 19!")
			GetSlayerLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 20!")
			GetSlayerLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 21!")
			GetSlayerLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 22!")
			GetSlayerLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 23!")
			GetSlayerLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 24!")
			GetSlayerLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 25!")
			GetSlayerLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 26!")
			GetSlayerLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 27!")
			GetSlayerLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 28!")
			GetSlayerLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 29!")
			GetSlayerLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 30!")
			GetSlayerLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 31!")
			GetSlayerLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 32!")
			GetSlayerLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 33!")
			GetSlayerLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 34!")
			GetSlayerLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 35!")
			GetSlayerLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 36!")
			GetSlayerLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 37!")
			GetSlayerLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 38!")
			GetSlayerLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 39!")
			GetSlayerLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 40!")
			GetSlayerLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 41!")
			GetSlayerLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 42!")
			GetSlayerLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 43!")
			GetSlayerLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 44!")
			GetSlayerLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 45!")
			GetSlayerLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 46!")
			GetSlayerLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 47!")
			GetSlayerLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 48!")
			GetSlayerLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 49!")
			GetSlayerLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 50!")
			GetSlayerLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 51!")
			GetSlayerLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 52!")
			GetSlayerLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 53!")
			GetSlayerLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 54!")
			GetSlayerLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 55!")
			GetSlayerLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 56!")
			GetSlayerLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 57!")
			GetSlayerLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 58!")
			GetSlayerLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 59!")
			GetSlayerLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 60!")
			GetSlayerLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 61!")
			GetSlayerLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 62!")
			GetSlayerLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 63!")
			GetSlayerLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 64!")
			GetSlayerLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 65!")
			GetSlayerLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 66!")
			GetSlayerLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 67!")
			GetSlayerLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 68!")
			GetSlayerLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 69!")
			GetSlayerLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 70!")
			GetSlayerLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 71!")
			GetSlayerLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 72!")
			GetSlayerLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 73!")
			GetSlayerLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 74!")
			GetSlayerLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 75!")
			GetSlayerLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 76!")
			GetSlayerLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 77!")
			GetSlayerLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 78!")
			GetSlayerLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 79!")
			GetSlayerLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 80!")
			GetSlayerLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 81!")
			GetSlayerLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 82!")
			GetSlayerLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 83!")
			GetSlayerLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 84!")
			GetSlayerLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 85!")
			GetSlayerLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 86!")
			GetSlayerLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 87!")
			GetSlayerLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 88!")
			GetSlayerLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 89!")
			GetSlayerLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 90!")
			GetSlayerLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 91!")
			GetSlayerLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 92!")
			GetSlayerLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 93!")
			GetSlayerLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 94!")
			GetSlayerLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 95!")
			GetSlayerLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 96!")
			GetSlayerLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 97!")
			GetSlayerLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 98!")
			GetSlayerLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundSlayer_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Slayer level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Slayer. Why not visit Kuradal in the Ancient Caverns. She has something special that is only available to true masters of the Slayer skill!")
			GetSlayerLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Smithing)
Function rsLevelCheck_Smithing() Global
	Float xp  = GetSmithingXP().GetValue()
	Float level = GetSmithingLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetSmithingLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 2!")
			Debug.MessageBox("You can now create Bronze Maces!")
			GetSmithingLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 3!")
			Debug.MessageBox("You can now create Bronze Medium Helmets and Bronze Bolts!")
			GetSmithingLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 4!")
			Debug.MessageBox("You can now create Bronze Swords, Bronze Nails, Bronze Wire and Bronze Dart Tips!")
			GetSmithingLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 5!")
			Debug.MessageBox("You can now create Bronze Arrowtips, Bronze Scimitar, Bronze Pickaxes!")
			GetSmithingLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 6!")
			Debug.MessageBox("You can now create Bronze Longswords and Bronze Crossbow Limbs!")
			GetSmithingLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 7!")
			Debug.MessageBox("You can now create Bronze Full Helmets and Bronze Throwing Knives!")
			GetSmithingLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 8!")
			Debug.MessageBox("You can now smelt Blurite Bars and create Blurite Bolts and Bronze Square Shields!")
			GetSmithingLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 9!")
			Debug.MessageBox("You can now create Bronze Warhammers!")
			GetSmithingLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 10!")
			Debug.MessageBox("You can now create Bronze Battleaxes!")
			GetSmithingLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 11!")
			Debug.MessageBox("You can now create Bronze Chainbodies!")
			GetSmithingLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 12!")
			Debug.MessageBox("You can now create Bronze Kiteshields!")
			GetSmithingLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 13!")
			Debug.MessageBox("You can now create Blurite Crossbow Limbs and Bronze Claws!")
			GetSmithingLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 14!")
			Debug.MessageBox("You can now create Bronze Two-Handed Swords!")
			GetSmithingLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 15!")
			Debug.MessageBox("You can now smelt Iron Bars and Iron Daggers!")
			GetSmithingLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 16!")
			Debug.MessageBox("You can now create Bronze Plateskirts, Bronze Platelegs and Iron Hatchets!")
			GetSmithingLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 17!")
			Debug.MessageBox("You can now create Iron Maces and Iron Spits!")
			GetSmithingLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 18!")
			Debug.MessageBox("You can now create Bronze Platebodies, Iron Medium Helmets and Iron Bolts!")
			GetSmithingLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 19!")
			Debug.MessageBox("You can now create Iron Swords, Iron Nails and Iron Dart Tips!")
			GetSmithingLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 20!")
			Debug.MessageBox("You can now smelt Silver Bars and Elemental Bars, and create Iron Arrowtips, Iron Scimitars, Iron Pickaxes, Elemental Shields and Elemental Helmets!")
			GetSmithingLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 21!")
			Debug.MessageBox("You can now create Iron Longswords!")
			GetSmithingLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 22!")
			Debug.MessageBox("You can now create Iron Full Helmets and Iron Throwing Knives!")
			GetSmithingLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 23!")
			Debug.MessageBox("You can now create Iron Square Shield and Iron Crossbow Limbs!")
			GetSmithingLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 24!")
			Debug.MessageBox("You can now create Iron Warhammer!")
			GetSmithingLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 25!")
			Debug.MessageBox("You can now create Iron Battleaxes!")
			GetSmithingLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 26!")
			Debug.MessageBox("You can now create Iron Chainbodies and Oil Lantern Frames!")
			GetSmithingLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 27!")
			Debug.MessageBox("You can now create Iron Kiteshields!")
			GetSmithingLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 28!")
			Debug.MessageBox("You can now create Iron Claws!")
			GetSmithingLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 29!")
			Debug.MessageBox("You can now create Iron Two-Handed Swords!")
			GetSmithingLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 30!")
			Debug.MessageBox("You can now smelt Steel Bars, and create Steel Daggers, Mind Shields and Mind Helmets!")
			GetSmithingLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 31!")
			Debug.MessageBox("You can now create Iron Plateskirts, Iron Platelegs and Steel Hatchets!")
			GetSmithingLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 32!")
			Debug.MessageBox("You can now create Steel Maces!")
			GetSmithingLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 33!")
			Debug.MessageBox("You can now create Iron Platebodies, Steel Medium Helmets and Steel Bolts!")
			GetSmithingLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 34!")
			Debug.MessageBox("You can now create Steel Nails, Steel Swords and Steel Dart Tips!")
			GetSmithingLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 35!")
			Debug.MessageBox("You can now create Steel Arrowtips, Cannonballs, Steel Scimitars and Steel Pickaxes!")
			GetSmithingLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 36!")
			Debug.MessageBox("You can now create Steel Longswords, Studs and Steel Crossbow Limbs!")
			GetSmithingLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 37!")
			Debug.MessageBox("You can now create Steel Full Helmets and Steel Throwing Knives!")
			GetSmithingLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 38!")
			Debug.MessageBox("You can now create Steel Square Shield!")
			GetSmithingLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 39!")
			Debug.MessageBox("You can now create Steel Warhammers!")
			GetSmithingLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 40!")
			Debug.MessageBox("You can now smelt Gold Bars, and create Steel Battleaxes!")
			GetSmithingLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 41!")
			Debug.MessageBox("You can now create Steel Chainbodies!")
			GetSmithingLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 42!")
			Debug.MessageBox("You can now create Steel Kiteshields!")
			GetSmithingLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 43!")
			Debug.MessageBox("You can now create Steel Claws!")
			GetSmithingLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 44!")
			Debug.MessageBox("You can now create Steel Two-Handed Swords!")
			GetSmithingLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 45!")
			GetSmithingLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 46!")
			Debug.MessageBox("You can now create Steel Plateskirts and Steel Platelegs!")
			GetSmithingLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 47!")
			GetSmithingLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 48!")
			Debug.MessageBox("You can now create Steel Platebodies!")
			GetSmithingLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 49!")
			Debug.MessageBox("You can now create Bullseye Lanterns!")
			GetSmithingLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 50!")
			Debug.MessageBox("You can now smelt Mithril Bars, and create Golden Bowls, Golden Cannonballs, Golden Helmets and Mithril Daggers!")
			GetSmithingLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 51!")
			Debug.MessageBox("You can now create Mithril Hatchets!")
			GetSmithingLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 52!")
			Debug.MessageBox("You can now create Mithril Maces!")
			GetSmithingLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 53!")
			Debug.MessageBox("You can now create Mithril Medium Helmets and Mithril Bolts!")
			GetSmithingLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 54!")
			Debug.MessageBox("You can now create Mithril Swords, Mithril Nails and Mithril Dart Tips!")
			GetSmithingLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 55!")
			Debug.MessageBox("You can now create Mithril Arrowtips, Mithril Scimitars and Mithril Pickaxes!")
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 56!")
			Debug.MessageBox("You can now create Mithril Longswords and Mithril Crossbow Limbs!")
			GetSmithingLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 57!")
			Debug.MessageBox("You can now create Mithril Full Helmets and Mithril Throwing Knives!")
			GetSmithingLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 58!")
			Debug.MessageBox("You can now create Mithril Square Shields!")
			GetSmithingLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 59!")
			Debug.MessageBox("You can now create Mithril Warhammers and Mithril Grapple Tips!")
			GetSmithingLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 60!")
			Debug.MessageBox("You can now create Mithril Battleaxes and Dragon Square Shields!")
			GetSmithingLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 61!")
			Debug.MessageBox("You can now create Mithril Chainbodies!")
			GetSmithingLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 62!")
			Debug.MessageBox("You can now create Mithril Kiteshields!")
			GetSmithingLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 63!")
			Debug.MessageBox("You can now create Mithril Claws!")
			GetSmithingLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 64!")
			Debug.MessageBox("You can now create Mithril Two-Handed Sword!")
			GetSmithingLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 65!")	
			GetSmithingLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 66!")
			Debug.MessageBox("You can now create Mithril Plateskirts and Mithril Platelegs!")
			GetSmithingLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 67!")
			GetSmithingLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 68!")
			Debug.MessageBox("You can now create Mithril Platebodies!")
			GetSmithingLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 69!")
			GetSmithingLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 70!")
			Debug.MessageBox("You can now smelt Adamantite Bars, and create Adamant Daggers!")
			GetSmithingLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 71!")
			Debug.MessageBox("You can now create Adamant Hatchets!")
			GetSmithingLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 72!")
			Debug.MessageBox("You can now create Adamant Maces!")
			GetSmithingLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 73!")
			Debug.MessageBox("You can now create Adamant Medium Helmets and Adamant Bolts!")
			GetSmithingLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 74!")
			Debug.MessageBox("You can now create Adamant Swords, Adamant Nails and Adamant Dart Tips!")
			GetSmithingLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 75!")
			Debug.MessageBox("You can now create Adamant Arrowtips, Adamant Scimitars and Adamant Pickaxes!")
			GetSmithingLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 76!")
			Debug.MessageBox("You can now create Adamant Longswords and Adamant Crossbow Limbs!")
			GetSmithingLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 77!")
			Debug.MessageBox("You can now create Adamant Full Helm and Adamant Throwing Knives!")
			GetSmithingLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 78!")
			Debug.MessageBox("You can now create Adamant Square Shields!")
			GetSmithingLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 79!")
			Debug.MessageBox("You can now create Adamant Warhammers!")
			GetSmithingLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 80!")
			Debug.MessageBox("You can now create Adamant Battleaxes and Godsword Blades!")
			GetSmithingLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 81!")
			Debug.MessageBox("You can now create Adamant Chainbodies!")
			GetSmithingLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 82!")
			Debug.MessageBox("You can now create Adamant Kiteshields!")
			GetSmithingLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 83!")
			Debug.MessageBox("You can now create Adamant Claws!")
			GetSmithingLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 84!")
			Debug.MessageBox("You can now create Adamant Two-Handed Swords!")
			GetSmithingLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 85!")
			Debug.MessageBox("You can now smelt Runite Bars, and create Rune Daggers, Arcane Spirit Shields, Divine Spirit Shields, Elysian Spirit Shields and Spectral Spirit Shields!")
			GetSmithingLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 86!")
			Debug.MessageBox("You can now create Adamant Plateskirts, Adamant Platelegs and Rune Hatchets!")
			GetSmithingLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 87!")
			Debug.MessageBox("You can now create Rune Maces!")
			GetSmithingLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 88!")
			Debug.MessageBox("You can now create Adamant Platebodies, Rune Medium Helmets and Rune Bolts!")
			GetSmithingLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 89!")
			Debug.MessageBox("You can now create Rune Swords, Rune Nails and Rune Dart Tips!")
			GetSmithingLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 90!")
			Debug.MessageBox("You can now create Rune Arrowtips, Rune Scimitars, Rune Pickaxes and Dragonfire Shields!")
			GetSmithingLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 91!")
			Debug.MessageBox("You can now create Rune Longswords and Crossbow Limbs!")
			GetSmithingLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 92!")
			Debug.MessageBox("You can now create Rune Full Helmets, Rune Throwing Knives and Dragon Platebodies!")
			GetSmithingLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 93!")
			Debug.MessageBox("You can now create Rune Square Shields!")
			GetSmithingLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 94!")
			Debug.MessageBox("You can now create Rune Warhammers!")
			GetSmithingLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 95!")
			Debug.MessageBox("You can now create Rune Battleaxes!")
			GetSmithingLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 96!")
			Debug.MessageBox("You can now create Rune Chainbodies!")
			GetSmithingLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 97!")
			Debug.MessageBox("You can now create Rune Kiteshields!")
			GetSmithingLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 98!")
			Debug.MessageBox("You can now create Rune Claws!")
			GetSmithingLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundSmithing_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Smithing level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("You can now create Rune Two-Handed Swords, Rune Plateskirts, Rune Platelegs and Rune Platebodies!")
			GetSmithingLVL().SetValue(99)
			Debug.MessageBox("Congratulations! You are now a master smith. Why not visit Thurgo, who lives near Mudskipper Point? He has something special that is only available to true masters of the Smithing skill!")
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Strength)
Function rsLevelCheck_Strength() Global
	Float xp  = GetStrengthXP().GetValue()
	Float level = GetStrengthLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetStrengthLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 2!")
			GetStrengthLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 3!")
			GetStrengthLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 4!")
			GetStrengthLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 5!")
			GetStrengthLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 6!")
			GetStrengthLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 7!")
			GetStrengthLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 8!")
			GetStrengthLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 9!")
			GetStrengthLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 10!")
			GetStrengthLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 11!")
			GetStrengthLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 12!")
			GetStrengthLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 13!")
			GetStrengthLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 14!")
			GetStrengthLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 15!")
			GetStrengthLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 16!")
			GetStrengthLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 17!")
			GetStrengthLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 18!")
			GetStrengthLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 19!")
			GetStrengthLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 20!")
			GetStrengthLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 21!")
			GetStrengthLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 22!")
			GetStrengthLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 23!")
			GetStrengthLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 24!")
			GetStrengthLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 25!")
			GetStrengthLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 26!")
			GetStrengthLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 27!")
			GetStrengthLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 28!")
			GetStrengthLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 29!")
			GetStrengthLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 30!")
			GetStrengthLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 31!")
			GetStrengthLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 32!")
			GetStrengthLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 33!")
			GetStrengthLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 34!")
			GetStrengthLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 35!")
			GetStrengthLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 36!")
			GetStrengthLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 37!")
			GetStrengthLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 38!")
			GetStrengthLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 39!")
			GetStrengthLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 40!")
			GetStrengthLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 41!")
			GetStrengthLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 42!")
			GetStrengthLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 43!")
			GetStrengthLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 44!")
			GetStrengthLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 45!")
			GetStrengthLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 46!")
			GetStrengthLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 47!")
			GetStrengthLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 48!")
			GetStrengthLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 49!")
			GetStrengthLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 50!")
			GetStrengthLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 51!")
			GetStrengthLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 52!")
			GetStrengthLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 53!")
			GetStrengthLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 54!")
			GetStrengthLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 55!")
			GetStrengthLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 56!")
			GetStrengthLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 57!")
			GetStrengthLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 58!")
			GetStrengthLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 59!")
			GetStrengthLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 60!")
			GetStrengthLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 61!")
			GetStrengthLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 62!")
			GetStrengthLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 63!")
			GetStrengthLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 64!")
			GetStrengthLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 65!")
			GetStrengthLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 66!")
			GetStrengthLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 67!")
			GetStrengthLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 68!")
			GetStrengthLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 69!")
			GetStrengthLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 70!")
			GetStrengthLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 71!")
			GetStrengthLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 72!")
			GetStrengthLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 73!")
			GetStrengthLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 74!")
			GetStrengthLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 75!")
			GetStrengthLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 76!")
			GetStrengthLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 77!")
			GetStrengthLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 78!")
			GetStrengthLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 79!")
			GetStrengthLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 80!")
			GetStrengthLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 81!")
			GetStrengthLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 82!")
			GetStrengthLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 83!")
			GetStrengthLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 84!")
			GetStrengthLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 85!")
			GetStrengthLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 86!")
			GetStrengthLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 87!")
			GetStrengthLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 88!")
			GetStrengthLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 89!")
			GetStrengthLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 90!")
			GetStrengthLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 91!")
			GetStrengthLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 92!")
			GetStrengthLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 93!")
			GetStrengthLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 94!")
			GetStrengthLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 95!")
			GetStrengthLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 96!")
			GetStrengthLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 97!")
			GetStrengthLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 98!")
			GetStrengthLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundStrength_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Strength level!")
			Debug.Notification("You have now reached level 99!")
				If ((GetQuest_WhileGuthixSleeps()).IsCompleted()) == false
					Debug.MessageBox("Congratulations! You are now a master of Strength. Why not visit Sloane in the Warriors' Guild. He has something special that is only available to true masters of the Strength skill!")
				else
					Debug.MessageBox("Congratulations! You are now a master of Strength. Why not visit Yadech Strongarm in the Warriors' Guild. He has something special that is only available to true masters of the Strength skill!")
				Endif
			GetStrengthLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Strength)
Function rsLevelCheck_Summoning() Global
	Float xp  = GetSummoningXP().GetValue()
	Float level = GetSummoningLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetSummoningLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 2!")
			GetSummoningLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 3!")
			GetSummoningLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 4!")
			GetSummoningLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 5!")
			GetSummoningLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 6!")
			GetSummoningLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 7!")
			GetSummoningLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 8!")
			GetSummoningLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 9!")
			GetSummoningLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 10!")
			GetSummoningLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 11!")
			GetSummoningLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 12!")
			GetSummoningLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 13!")
			GetSummoningLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 14!")
			GetSummoningLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 15!")
			GetSummoningLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 16!")
			GetSummoningLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 17!")
			GetSummoningLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 18!")
			GetSummoningLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 19!")
			GetSummoningLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 20!")
			GetSummoningLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 21!")
			GetSummoningLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 22!")
			GetSummoningLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 23!")
			GetSummoningLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 24!")
			GetSummoningLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 25!")
			GetSummoningLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 26!")
			GetSummoningLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 27!")
			GetSummoningLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 28!")
			GetSummoningLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 29!")
			GetSummoningLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 30!")
			GetSummoningLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 31!")
			GetSummoningLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 32!")
			GetSummoningLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 33!")
			GetSummoningLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 34!")
			GetSummoningLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 35!")
			GetSummoningLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 36!")
			GetSummoningLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 37!")
			GetSummoningLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 38!")
			GetSummoningLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 39!")
			GetSummoningLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 40!")
			GetSummoningLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 41!")
			GetSummoningLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 42!")
			GetSummoningLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 43!")
			GetSummoningLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 44!")
			GetSummoningLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 45!")
			GetSummoningLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 46!")
			GetSummoningLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 47!")
			GetSummoningLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 48!")
			GetSummoningLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 49!")
			GetSummoningLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 50!")
			GetSummoningLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 51!")
			GetSummoningLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 52!")
			GetSummoningLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 53!")
			GetSummoningLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 54!")
			GetSummoningLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 55!")
			GetSummoningLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 56!")
			GetSummoningLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 57!")
			GetSummoningLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 58!")
			GetSummoningLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 59!")
			GetSummoningLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 60!")
			GetSummoningLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 61!")
			GetSummoningLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 62!")
			GetSummoningLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 63!")
			GetSummoningLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 64!")
			GetSummoningLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 65!")
			GetSummoningLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 66!")
			GetSummoningLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 67!")
			GetSummoningLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 68!")
			GetSummoningLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 69!")
			GetSummoningLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 70!")
			GetSummoningLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 71!")
			GetSummoningLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 72!")
			GetSummoningLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 73!")
			GetSummoningLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 74!")
			GetSummoningLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 75!")
			GetSummoningLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 76!")
			GetSummoningLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 77!")
			GetSummoningLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 78!")
			GetSummoningLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 79!")
			GetSummoningLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 80!")
			GetSummoningLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 81!")
			GetSummoningLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 82!")
			GetSummoningLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 83!")
			GetSummoningLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 84!")
			GetSummoningLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 85!")
			GetSummoningLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 86!")
			GetSummoningLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 87!")
			GetSummoningLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 88!")
			GetSummoningLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 89!")
			GetSummoningLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 90!")
			GetSummoningLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 91!")
			GetSummoningLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 92!")
			GetSummoningLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 93!")
			GetSummoningLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 94!")
			GetSummoningLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 95!")
			GetSummoningLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 96!")
			GetSummoningLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 97!")
			GetSummoningLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 98!")
			GetSummoningLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundSummoning_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Summoning level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Summoning. Why not visit Pikkupstix in Taverly. He has something special that is only available to true masters of the Summoning skill!")
			GetSummoningLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Thieving)
Function rsLevelCheck_Thieving() Global
	Float xp  = GetThievingXP().GetValue()
	Float level = GetThievingLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetThievingLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 2!")
			GetThievingLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 3!")
			GetThievingLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 4!")
			GetThievingLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 5!")
			GetThievingLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 6!")
			GetThievingLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 7!")
			GetThievingLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 8!")
			GetThievingLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 9!")
			GetThievingLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 10!")
			GetThievingLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 11!")
			GetThievingLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 12!")
			GetThievingLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 13!")
			GetThievingLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 14!")
			GetThievingLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 15!")
			GetThievingLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 16!")
			GetThievingLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 17!")
			GetThievingLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 18!")
			GetThievingLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 19!")
			GetThievingLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 20!")
			GetThievingLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 21!")
			GetThievingLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 22!")
			GetThievingLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 23!")
			GetThievingLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 24!")
			GetThievingLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 25!")
			GetThievingLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 26!")
			GetThievingLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 27!")
			GetThievingLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 28!")
			GetThievingLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 29!")
			GetThievingLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 30!")
			GetThievingLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 31!")
			GetThievingLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 32!")
			GetThievingLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 33!")
			GetThievingLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 34!")
			GetThievingLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 35!")
			GetThievingLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 36!")
			GetThievingLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 37!")
			GetThievingLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 38!")
			GetThievingLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 39!")
			GetThievingLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 40!")
			GetThievingLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 41!")
			GetThievingLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 42!")
			GetThievingLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 43!")
			GetThievingLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 44!")
			GetThievingLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 45!")
			GetThievingLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 46!")
			GetThievingLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 47!")
			GetThievingLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 48!")
			GetThievingLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 49!")
			GetThievingLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 50!")
			GetThievingLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 51!")
			GetThievingLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 52!")
			GetThievingLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 53!")
			GetThievingLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 54!")
			GetThievingLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 55!")
			GetThievingLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 56!")
			GetThievingLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 57!")
			GetThievingLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 58!")
			GetThievingLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 59!")
			GetThievingLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 60!")
			GetThievingLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 61!")
			GetThievingLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 62!")
			GetThievingLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 63!")
			GetThievingLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 64!")
			GetThievingLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 65!")
			GetThievingLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 66!")
			GetThievingLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 67!")
			GetThievingLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 68!")
			GetThievingLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 69!")
			GetThievingLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 70!")
			GetThievingLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 71!")
			GetThievingLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 72!")
			GetThievingLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 73!")
			GetThievingLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 74!")
			GetThievingLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 75!")
			GetThievingLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 76!")
			GetThievingLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 77!")
			GetThievingLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 78!")
			GetThievingLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 79!")
			GetThievingLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 80!")
			GetThievingLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 81!")
			GetThievingLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 82!")
			GetThievingLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 83!")
			GetThievingLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 84!")
			GetThievingLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 85!")
			GetThievingLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 86!")
			GetThievingLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 87!")
			GetThievingLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 88!")
			GetThievingLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 89!")
			GetThievingLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 90!")
			GetThievingLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 91!")
			GetThievingLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 92!")
			GetThievingLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 93!")
			GetThievingLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 94!")
			GetThievingLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 95!")
			GetThievingLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 96!")
			GetThievingLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 97!")
			GetThievingLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 98!")
			GetThievingLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundThieving_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Thieving level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Thieving. Why not visit Martin Thwait in the Rogue's Den. He has something special that is only available to true masters of the Thieving skill!")
			GetThievingLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Checks current XP, levels up where applicable. Child script... Use parent function rsCheckForLevelUp(Woodcutting)
Function rsLevelCheck_Woodcutting() Global
	Float xp  = GetWoodcuttingXP().GetValue()
	Float level = GetWoodcuttingLVL().GetValue()
	
	If xp >= 0 && xp < 83;1
		GetWoodcuttingLVL().SetValue(1)
	ElseIf xp >= 83 && xp < 174;2
		If level < 2
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 2!")
			GetWoodcuttingLVL().SetValue(2)
		EndIf
	ElseIf xp >= 174 && xp < 276;3
		If level < 3
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 3!")
			GetWoodcuttingLVL().SetValue(3)
		EndIf		
	ElseIf xp >= 276 && xp < 388;4
		If level < 4
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 4!")
			GetWoodcuttingLVL().SetValue(4)
		EndIf
	ElseIf xp >= 388 && xp < 512;5
		If level < 5
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 5!")
			GetWoodcuttingLVL().SetValue(5)
		EndIf
	ElseIf xp >= 512 && xp < 650;6
		If level < 6
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 6!")
			Debug.MessageBox("You can now use Steel and Black Hatchets for woodcutting!")
			GetWoodcuttingLVL().SetValue(6)
		EndIf
	ElseIf xp >= 650 && xp < 801;7
		If level < 7
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 7!")
			GetWoodcuttingLVL().SetValue(7)
		EndIf
	ElseIf xp >= 801 && xp < 969;8
		If level < 8
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 8!")
			GetWoodcuttingLVL().SetValue(8)
		EndIf
	ElseIf xp >= 969 && xp < 1154;9
		If level < 9
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 9!")
			GetWoodcuttingLVL().SetValue(9)
		EndIf
	ElseIf xp >= 1154 && xp < 1358;10
		If level < 10
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 10!")
			Debug.MessageBox("You can now cut down Light Jungle!")
			GetWoodcuttingLVL().SetValue(10)
		EndIf
	ElseIf xp >= 1358 && xp < 1584;11
		If level < 11
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 11!")
			GetWoodcuttingLVL().SetValue(11)
		EndIf
	ElseIf xp >= 1584 && xp < 1833;12
		If level < 12
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 12!")
			Debug.MessageBox("You can now create Log Canoes!")
			GetWoodcuttingLVL().SetValue(12)
		EndIf
	ElseIf xp >= 1833 && xp < 2107;13
		If level < 13
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 13!")
			GetWoodcuttingLVL().SetValue(13)
		EndIf
	ElseIf xp >= 2107 && xp < 2411;14
		If level < 14
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 14!")
			GetWoodcuttingLVL().SetValue(14)
		EndIf
	ElseIf xp >= 2411 && xp < 2746;15
		If level < 15
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 15!")
			Debug.MessageBox("You can now cut down Oak trees!")
			GetWoodcuttingLVL().SetValue(15)
		EndIf
	ElseIf xp >= 2746 && xp < 3115;16
		If level < 16
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 16!")
			GetWoodcuttingLVL().SetValue(16)
		EndIf
	ElseIf xp >= 3115 && xp < 3523;17
		If level < 17
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 17!")
			GetWoodcuttingLVL().SetValue(17)
		EndIf
	ElseIf xp >= 3523 && xp < 3973;18
		If level < 18
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 18!")
			GetWoodcuttingLVL().SetValue(18)
		EndIf
	ElseIf xp >= 3973 && xp < 4470;19
		If level < 19
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 19!")
			GetWoodcuttingLVL().SetValue(19)
		EndIf
	ElseIf xp >= 4470 && xp < 5018;20
		If level < 20
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 20!")
			Debug.MessageBox("You can now cut down Medium Jungle!")
			GetWoodcuttingLVL().SetValue(20)
		EndIf
	ElseIf xp >= 5018 && xp < 5624;21
		If level < 21
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 21!")
			Debug.MessageBox("You can now use Mithril Hatchets for woodcutting!")
			GetWoodcuttingLVL().SetValue(21)
		EndIf
	ElseIf xp >= 5624 && xp < 6291;22
		If level < 22
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 22!")
			GetWoodcuttingLVL().SetValue(22)
		EndIf
	ElseIf xp >= 6291 && xp < 7028;23
		If level < 23
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 23!")
			GetWoodcuttingLVL().SetValue(23)
		EndIf
	ElseIf xp >= 7028 && xp < 7842;24
		If level < 24
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 24!")
			GetWoodcuttingLVL().SetValue(24)
		EndIf
	ElseIf xp >= 7842 && xp < 8740;25
		If level < 25
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 25!")
			GetWoodcuttingLVL().SetValue(25)
		EndIf
	ElseIf xp >= 8740 && xp < 9730;26
		If level < 26
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 26!")
			GetWoodcuttingLVL().SetValue(26)
		EndIf
	ElseIf xp >= 9730 && xp < 10824;27
		If level < 27
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 27!")
			Debug.MessageBox("You can now create Dugout Canoes!")
			GetWoodcuttingLVL().SetValue(27)
		EndIf
	ElseIf xp >= 10824 && xp < 12031;28
		If level < 28
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 28!")
			GetWoodcuttingLVL().SetValue(28)
		EndIf
	ElseIf xp >= 12031 && xp < 13363;29
		If level < 29
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 29!")
			GetWoodcuttingLVL().SetValue(29)
		EndIf
	ElseIf xp >= 13363 && xp < 14833;30
		If level < 30
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 30!")
			Debug.MessageBox("You can now cut down Willow trees!")
			GetWoodcuttingLVL().SetValue(30)
		EndIf
	ElseIf xp >= 14833 && xp < 16456;31
		If level < 31
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 31!")
			Debug.MessageBox("You can now use Adamant Hatchets for woodcutting!")
			GetWoodcuttingLVL().SetValue(31)
		EndIf
	ElseIf xp >= 16456 && xp < 18247;32
		If level < 32
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 32!")
			GetWoodcuttingLVL().SetValue(32)
		EndIf
	ElseIf xp >= 18247 && xp < 20224;33
		If level < 33
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 33!")
			GetWoodcuttingLVL().SetValue(33)
		EndIf
	ElseIf xp >= 20224 && xp < 22406;34
		If level < 34
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 34!")
			GetWoodcuttingLVL().SetValue(34)
		EndIf
	ElseIf xp >= 22406 && xp < 24815;35
		If level < 35
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 35!")
			Debug.MessageBox("You can now cut down Teak trees and Dense Jungle!")
			GetWoodcuttingLVL().SetValue(35)
		EndIf
	ElseIf xp >= 24815 && xp < 27473;36
		If level < 36
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 36!")
			Debug.MessageBox("You can now cut down Dramen trees!")
			GetWoodcuttingLVL().SetValue(36)
		EndIf
	ElseIf xp >= 27473 && xp < 30408;37
		If level < 37
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 37!")
			GetWoodcuttingLVL().SetValue(37)
		EndIf
	ElseIf xp >= 30408 && xp < 33648;38
		If level < 38
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 38!")
			GetWoodcuttingLVL().SetValue(38)
		EndIf
	ElseIf xp >= 33648 && xp < 37224;39
		If level < 39
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 39!")
			GetWoodcuttingLVL().SetValue(39)
		EndIf
	ElseIf xp >= 37224 && xp < 41171;40
		If level < 40
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 40!")
			Debug.MessageBox("You can now cut down Swaying trees!")
			GetWoodcuttingLVL().SetValue(40)
		EndIf
	ElseIf xp >= 41171 && xp < 45529;41
		If level < 41
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 41!")
			Debug.MessageBox("You can now use Rune Hatchets for woodcutting!")
			GetWoodcuttingLVL().SetValue(41)
		EndIf
	ElseIf xp >= 45529 && xp < 50339;42
		If level < 42
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 42!")
			Debug.MessageBox("You can now create Stable Dugout Canoes!")
			GetWoodcuttingLVL().SetValue(42)
		EndIf
	ElseIf xp >= 50339 && xp < 55649;43
		If level < 43
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 43!")
			GetWoodcuttingLVL().SetValue(43)
		EndIf
	ElseIf xp >= 55649 && xp < 61512;44
		If level < 44
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 44!")
			GetWoodcuttingLVL().SetValue(44)
		EndIf
	ElseIf xp >= 61512 && xp < 67983;45
		If level < 45
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 45!")
			Debug.MessageBox("You can now cut down Maple trees and Hollow trees!")
			GetWoodcuttingLVL().SetValue(45)
		EndIf
	ElseIf xp >= 67983 && xp < 75127;46
		If level < 46
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 46!")
			GetWoodcuttingLVL().SetValue(46)
		EndIf
	ElseIf xp >= 75127 && xp < 83014;47
		If level < 47
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 47!")
			GetWoodcuttingLVL().SetValue(47)
		EndIf
	ElseIf xp >= 83014 && xp < 91721;48
		If level < 48
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 48!")
			GetWoodcuttingLVL().SetValue(48)
		EndIf
	ElseIf xp >= 91721 && xp < 101333;49
		If level < 49
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 49!")
			GetWoodcuttingLVL().SetValue(49)
		EndIf
	ElseIf xp >= 101333 && xp < 111945;50
		If level < 50
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 50!")
			Debug.MessageBox("You can now cut down Mahogany trees!")
			GetWoodcuttingLVL().SetValue(50)
		EndIf
	ElseIf xp >= 111945 && xp < 123660;51
		If level < 51
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 51!")
			GetWoodcuttingLVL().SetValue(51)
		EndIf
	ElseIf xp >= 123660 && xp < 136594;52
		If level < 52
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 52!")
			GetWoodcuttingLVL().SetValue(52)
		EndIf
	ElseIf xp >= 136594 && xp < 150872;53
		If level < 53
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 53!")
			GetWoodcuttingLVL().SetValue(53)
		EndIf
	ElseIf xp >= 150872 && xp < 166636;54
		If level < 54
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 54!")
			Debug.MessageBox("You can now cut down Arctic Pine trees!")
			GetWoodcuttingLVL().SetValue(54)
		EndIf
	ElseIf xp >= 166636 && xp < 184040;55
		If level < 55
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 55!")
			Debug.MessageBox("You can now cut down Dream trees!")
			GetWoodcuttingLVL().SetValue(55)
		EndIf
	ElseIf xp >= 184040 && xp < 203254;56
		If level < 56
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 56!")
			GetWoodcuttingLVL().SetValue(56)
		EndIf
	ElseIf xp >= 203254 && xp < 224466;57
		If level < 57
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 57!")
			Debug.MessageBox("You can now create Waka Canoes!")
			GetWoodcuttingLVL().SetValue(57)
		EndIf
	ElseIf xp >= 224466 && xp < 247886;58
		If level < 58
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 58!")
			Debug.MessageBox("You can now cut down Eucalyptus trees!")
			GetWoodcuttingLVL().SetValue(58)
		EndIf
	ElseIf xp >= 247886 && xp < 273742;59
		If level < 59
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 59!")
			GetWoodcuttingLVL().SetValue(59)
		EndIf
	ElseIf xp >= 273742 && xp < 302288;60
		If level < 60
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 60!")
			Debug.MessageBox("You can now cut down Yew trees!")
			GetWoodcuttingLVL().SetValue(60)
		EndIf
	ElseIf xp >= 302288 && xp < 333804;61
		If level < 61
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 61!")
			Debug.MessageBox("You can now use Dragon Hatchets and the Inferno Adze for woodcutting!")
			GetWoodcuttingLVL().SetValue(61)
		EndIf
	ElseIf xp >= 333804 && xp < 368599;62
		If level < 62
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 62!")
			GetWoodcuttingLVL().SetValue(62)
		EndIf
	ElseIf xp >= 368599 && xp < 407015;63
		If level < 63
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 63!")
			GetWoodcuttingLVL().SetValue(63)
		EndIf
	ElseIf xp >= 407015 && xp < 449428;64
		If level < 64
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 64!")
			GetWoodcuttingLVL().SetValue(64)
		EndIf
	ElseIf xp >= 449428 && xp < 496254;65
		If level < 65
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 65!")
			GetWoodcuttingLVL().SetValue(65)
		EndIf
	ElseIf xp >= 496254 && xp < 547953;66
		If level < 66
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 66!")
			GetWoodcuttingLVL().SetValue(66)
		EndIf
	ElseIf xp >= 547953 && xp < 605032;67
		If level < 67
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 67!")
			GetWoodcuttingLVL().SetValue(67)
		EndIf
	ElseIf xp >= 605032 && xp < 668051;68
		If level < 68
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 68!")
			Debug.MessageBox("You can now cut down Ivy!")
			GetWoodcuttingLVL().SetValue(68)
		EndIf
	ElseIf xp >= 668051 && xp < 737627;69
		If level < 69
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 69!")
			GetWoodcuttingLVL().SetValue(69)
		EndIf
	ElseIf xp >= 737627 && xp < 814445;70
		If level < 70
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 70!")
			GetWoodcuttingLVL().SetValue(70)
		EndIf
	ElseIf xp >= 814445 && xp < 899257;71
		If level < 71
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 71!")
			GetWoodcuttingLVL().SetValue(71)
		EndIf
	ElseIf xp >= 899257 && xp < 992895;72
		If level < 72
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 72!")
			GetWoodcuttingLVL().SetValue(72)
		EndIf
	ElseIf xp >= 992895 && xp < 1096278;73
		If level < 73
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 73!")
			GetWoodcuttingLVL().SetValue(73)
		EndIf
	ElseIf xp >= 1096278 && xp < 1210421;74
		If level < 74
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 74!")
			GetWoodcuttingLVL().SetValue(74)
		EndIf
	ElseIf xp >= 1210421 && xp < 1336443;75
		If level < 75
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 75!")
			Debug.MessageBox("You can now cut down Magic trees!")
			GetWoodcuttingLVL().SetValue(75)
		EndIf
	ElseIf xp >= 1336443 && xp < 1475581;76
		If level < 76
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 76!")
			GetWoodcuttingLVL().SetValue(76)
		EndIf
	ElseIf xp >= 1475581 && xp < 1629200;77
		If level < 77
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 77!")
			GetWoodcuttingLVL().SetValue(77)
		EndIf
	ElseIf xp >= 1629200 && xp < 1798808;78
		If level < 78
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 78!")
			GetWoodcuttingLVL().SetValue(78)
		EndIf
	ElseIf xp >= 1798808 && xp < 1986068;79
		If level < 79
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 79!")
			GetWoodcuttingLVL().SetValue(79)
		EndIf
	ElseIf xp >= 1986068 && xp < 2192818;80
		If level < 80
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 80!")
			GetWoodcuttingLVL().SetValue(80)
		EndIf
	ElseIf xp >= 2192818 && xp < 2421087;81
		If level < 81
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 81!")
			GetWoodcuttingLVL().SetValue(81)
		EndIf
	ElseIf xp >= 2421087 && xp < 2673114;82
		If level < 82
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 82!")
			Debug.MessageBox("You can now cut down Cursed Magic trees!")
			GetWoodcuttingLVL().SetValue(82)
		EndIf
	ElseIf xp >= 2673114 && xp < 2951373;83
		If level < 83
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 83!")
			GetWoodcuttingLVL().SetValue(83)
		EndIf
	ElseIf xp >= 2951373 && xp < 3258594;84
		If level < 84
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 84!")
			GetWoodcuttingLVL().SetValue(84)
		EndIf
	ElseIf xp >= 3258594 && xp < 3597792;85
		If level < 85
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 85!")
			GetWoodcuttingLVL().SetValue(85)
		EndIf
	ElseIf xp >= 3597792 && xp < 3972294;86
		If level < 86
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 86!")
			GetWoodcuttingLVL().SetValue(86)
		EndIf
	ElseIf xp >= 3972294 && xp < 4385776;87
		If level < 87
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 87!")
			GetWoodcuttingLVL().SetValue(87)
		EndIf
	ElseIf xp >= 4385776 && xp < 4842295;88
		If level < 88
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 88!")
			GetWoodcuttingLVL().SetValue(88)
		EndIf
	ElseIf xp >= 4842295 && xp < 5346332;89
		If level < 89
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 89!")
			GetWoodcuttingLVL().SetValue(89)
		EndIf
	ElseIf xp >= 5346332 && xp < 5902831;90
		If level < 90
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 90!")
			GetWoodcuttingLVL().SetValue(90)
		EndIf
	ElseIf xp >= 5902831 && xp < 6517253;91
		If level < 91
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 91!")
			GetWoodcuttingLVL().SetValue(91)
		EndIf
	ElseIf xp >= 6517253 && xp < 7195629;92
		If level < 92
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 92!")
			GetWoodcuttingLVL().SetValue(92)
		EndIf
	ElseIf xp >= 7195629 && xp < 7944614;93
		If level < 93
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 93!")
			GetWoodcuttingLVL().SetValue(93)
		EndIf
	ElseIf xp >= 7944614 && xp < 8771558;94
		If level < 94
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 94!")
			GetWoodcuttingLVL().SetValue(94)
		EndIf
	ElseIf xp >= 8771558 && xp < 9684577;95
		If level < 95
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 95!")
			GetWoodcuttingLVL().SetValue(95)
		EndIf
	ElseIf xp >= 9684577 && xp < 10692629;96
		If level < 96
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 96!")
			GetWoodcuttingLVL().SetValue(96)
		EndIf
	ElseIf xp >= 10692629 && xp < 11805606;97
		If level < 97
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 97!")
			GetWoodcuttingLVL().SetValue(97)
		EndIf
	ElseIf xp >= 11805606 && xp < 13034431;98
		If level < 98
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 98!")
			GetWoodcuttingLVL().SetValue(98)
		EndIf
	ElseIf xp >= 13034431;99
		If level < 99
			GetSoundWoodcutting_LevelUp().Play(Game.GetPlayer())
			Debug.Notification("Congratulations! you just advanced a Woodcutting level!")
			Debug.Notification("You have now reached level 99!")
			Debug.MessageBox("Congratulations! You are now a master of Woodcutting. Why not visit Wilfred, near Lumbridge. He has something special that is only available to true masters of the Woodcutting skill!")
			GetWoodcuttingLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

;Remove extra Runecrafting Pouches... cheater...
Function RemoveSparePouches() Global
	if (game.getplayer().GetItemCount(GetItem_RCpouch_Small())) >= 1
		game.getplayer().RemoveItem(GetItem_RCpouch_Small(), ((game.getplayer().GetItemCount(GetItem_RCpouch_Small())) - 1))
		GetBankReference().RemoveItem(GetItem_RCpouch_Small(), (GetBankReference().GetItemCount(GetItem_RCpouch_Small())))
	endif
	if (game.getplayer().GetItemCount(GetItem_RCpouch_Medium())) >= 1
		game.getplayer().RemoveItem(GetItem_RCpouch_Medium(), ((game.getplayer().GetItemCount(GetItem_RCpouch_Medium())) - 1))
		GetBankReference().RemoveItem(GetItem_RCpouch_Medium(), (GetBankReference().GetItemCount(GetItem_RCpouch_Medium())))
	endif
	if (game.getplayer().GetItemCount(GetItem_RCpouch_Large())) >= 1
		game.getplayer().RemoveItem(GetItem_RCpouch_Large(), ((game.getplayer().GetItemCount(GetItem_RCpouch_Large())) - 1))
		GetBankReference().RemoveItem(GetItem_RCpouch_Large(), (GetBankReference().GetItemCount(GetItem_RCpouch_Large())))
	endif
	if (game.getplayer().GetItemCount(GetItem_RCpouch_Giant())) >= 1
		game.getplayer().RemoveItem(GetItem_RCpouch_Giant(), ((game.getplayer().GetItemCount(GetItem_RCpouch_Giant())) - 1))
		GetBankReference().RemoveItem(GetItem_RCpouch_Giant(), (GetBankReference().GetItemCount(GetItem_RCpouch_Giant())))
	endif
EndFunction

;>
;< Misc. functions - can be used on their own

int Function RollLoss50Percent(int original) Global
	bool rolling = true
	int result = 0
	while(rolling)
		if (original == 0)
			rolling = false
		else
			int roll = Utility.RandomInt(0,1)
			if roll == 0;win
				result = result + 1
				original = original - 1
			else;lose
				original = original - 1
			endif
		endif
	endwhile
	return result
EndFunction

;;Check these against the armor-addon screen
;int Property kSlotMask30 = 0x00000001 AutoReadOnly ; HEAD
;int Property kSlotMask32 = 0x00000004 AutoReadOnly ; BODY
;int Property kSlotMask33 = 0x00000008 AutoReadOnly ; Hands
;int Property kSlotMask34 = 0x00000010 AutoReadOnly ; Forearms
;int Property kSlotMask37 = 0x00000080 AutoReadOnly ; Feet
;int Property kSlotMask38 = 0x00000100 AutoReadOnly ; Calves
;int Property kSlotMask42 = 0x00001000 AutoReadOnly ; Circlet
;
;;Get Worn Shield
;Armor Function GetWornShield(Actor suspect) Global
;	return suspect.GetWornForm(0x000000200) as Armor
;EndFunction
;
;;Get Worn Ring
;Armor Function GetWornRing(Actor suspect) Global
;	return suspect.GetWornForm(0x000000040) as Armor
;EndFunction
;
;;Get Worn Amulet
;Armor Function GetWornAmulet(Actor suspect) Global
;	return suspect.GetWornForm(0x000000020) as Armor
;EndFunction

;This function needs to get put into the new API, it sorts int arrays into ascending values (i.e. {1,5,17,19,20,25})
Function SortArray(int[] array) Global
  bool sorting = true
  int index = 0
  int temp = 0
  while(sorting)
	  if (index >= array.Length - 1)
	  	index = 0
	  else
	  	if (IsSorted(array) == true)
	  		sorting = false
	  	elseif (array[index] <= array[index + 1])
	  		index = index + 1
	  	elseif (array[index] > array[index + 1])
	  		temp = array[index]
	   		array[index] = array[index + 1]
	  		array[index + 1] = temp
	  		index = index + 1
	  	endif
	  endif
  endwhile
endfunction

;Checks if the SortArray function has successfully sorted the passed-in array -USED BY SORTARRAY FUNCTION-
Bool Function IsSorted(int[] array) Global
	bool sorted = true
	int index = 0
	while ((index < array.Length - 1) && (sorted == true))
		if (array[index] <= array[index + 1])
			index = index + 1
		else
			sorted = false
		endif
	EndWhile
	return sorted
EndFunction

;Used to update Prayers the player has based on level. Rewrite this one someday, it doesn't remove weaker prayers when the stronger version is learned, and it just looks ugly AF
Function SpellCheck_Prayers() Global
	int level = (GetPrayerLVL()).GetValue() as int
	bool bEscape = false
	If ((GetPrayerCheck()).GetValue()) == 1
		bEscape = true
	EndIf	
	while(bEscape == false)
		If level < 4
			bEscape = 1
		Else
			If Game.GetPlayer().HasSpell((GetPrayer_BurstStrength())) == false
				Game.GetPlayer().AddSpell((GetPrayer_BurstStrength()))
			Else
				If level < 7
					bEscape = 1
				Else
					If Game.GetPlayer().HasSpell((GetPrayer_ClarityThought())) == false
						Game.GetPlayer().AddSpell((GetPrayer_ClarityThought()))
					Else
						If level < 8
							bEscape = 1
						Else
							If Game.GetPlayer().HasSpell((GetPrayer_SharpEye())) == false
								Game.GetPlayer().AddSpell((GetPrayer_SharpEye()))
								Game.GetPlayer().AddSpell((GetPrayer_UnstoppableForce()))
							Else
								If level < 9
									bEscape = 1
								Else
									If Game.GetPlayer().HasSpell((GetPrayer_MysticWill())) == false
										Game.GetPlayer().AddSpell((GetPrayer_MysticWill()))
										Game.GetPlayer().AddSpell((GetPrayer_Charge()))
									Else
										If level < 10
											bEscape = 1
										Else
											If Game.GetPlayer().HasSpell((GetPrayer_RockSkin())) == false
												Game.GetPlayer().AddSpell((GetPrayer_RockSkin()))
												Game.GetPlayer().RemoveSpell((GetPrayer_ThickSkin()))
											Else
												If level < 13
													bEscape = 1
												Else
													If Game.GetPlayer().HasSpell((GetPrayer_SuperStrength())) == false
														Game.GetPlayer().AddSpell((GetPrayer_SuperStrength()))
														Game.GetPlayer().RemoveSpell((GetPrayer_BurstStrength()))
													Else
														If level < 16
															bEscape = 1
														Else
															If Game.GetPlayer().HasSpell((GetPrayer_ImprovedReflexes())) == false
																Game.GetPlayer().AddSpell((GetPrayer_ImprovedReflexes()))
																Game.GetPlayer().RemoveSpell((GetPrayer_ClarityThought()))
															Else
																If level < 19
																	bEscape = 1
																Else
																	If Game.GetPlayer().HasSpell((GetPrayer_RapidRestore())) == false
																		Game.GetPlayer().AddSpell((GetPrayer_RapidRestore()))
																	Else
																		If level < 22
																			bEscape = 1
																		Else
																			If Game.GetPlayer().HasSpell((GetPrayer_RapidHeal())) == false
																				Game.GetPlayer().AddSpell((GetPrayer_RapidHeal()))
																			Else
																				If level < 25
																					bEscape = 1
																				Else
																					If Game.GetPlayer().HasSpell((GetPrayer_ProtectItem())) == false
																						Game.GetPlayer().AddSpell((GetPrayer_ProtectItem()))
																					Else
																						If level < 26
																							bEscape = 1
																						Else
																							If Game.GetPlayer().HasSpell((GetPrayer_HawkEye())) == false
																								Game.GetPlayer().AddSpell((GetPrayer_HawkEye()))
																								Game.GetPlayer().AddSpell((GetPrayer_UnrelentingForce()))
																								Game.GetPlayer().RemoveSpell((GetPrayer_SharpEye()))
																								Game.GetPlayer().RemoveSpell((GetPrayer_UnstoppableForce()))
																							Else
																								If level < 27
																									bEscape = 1
																								Else
																									If Game.GetPlayer().HasSpell((GetPrayer_MysticLore())) == false
																										Game.GetPlayer().AddSpell((GetPrayer_MysticLore()))
																										Game.GetPlayer().AddSpell((GetPrayer_SuperCharge()))
																										Game.GetPlayer().RemoveSpell((GetPrayer_MysticWill()))
																										Game.GetPlayer().RemoveSpell((GetPrayer_Charge()))
																									Else
																										If level < 28
																											bEscape = 1
																										Else
																											If Game.GetPlayer().HasSpell((GetPrayer_SteelSkin())) == false
																												Game.GetPlayer().AddSpell((GetPrayer_SteelSkin()))
																												Game.GetPlayer().RemoveSpell((GetPrayer_RockSkin()))
																												Game.GetPlayer().RemoveSpell((GetPrayer_ThickSkin()))
																											Else
																												If level < 31
																													;	do nothing
																												Else
																													If Game.GetPlayer().HasSpell((GetPrayer_UltimateStrength())) == false
																														Game.GetPlayer().AddSpell((GetPrayer_UltimateStrength()))
																														Game.GetPlayer().RemoveSpell((GetPrayer_SuperStrength()))
																													Else
																														If level < 34
																															bEscape = 1
																														Else
																															If Game.GetPlayer().HasSpell((GetPrayer_IncredibleReflexes())) == false
																																Game.GetPlayer().AddSpell((GetPrayer_IncredibleReflexes()))
																																Game.GetPlayer().RemoveSpell((GetPrayer_ImprovedReflexes()))
																															Else
																																If level < 35
																																	bEscape = 1
																																Else
																																	If Game.GetPlayer().HasSpell((GetPrayer_ProtectSummoning())) == false
																																		Game.GetPlayer().RemoveSpell((GetPrayer_ProtectSummoning()))
																																	Else	
																																		If level < 37
																																			bEscape = 1
																																		Else
																																			If Game.GetPlayer().HasSpell((GetPrayer_ProtectMagic())) == false
																																				Game.GetPlayer().AddSpell((GetPrayer_ProtectMagic()))
																																			Else
																																				If level < 40
																																					bEscape = 1
																																				Else
																																					If Game.GetPlayer().HasSpell((GetPrayer_ProtectMissiles())) == false
																																						Game.GetPlayer().AddSpell((GetPrayer_ProtectMissiles()))
																																					Else
																																						If level < 43
																																							bEscape = 1
																																						Else
																																							If Game.GetPlayer().HasSpell((GetPrayer_ProtectMelee())) == false
																																								Game.GetPlayer().AddSpell((GetPrayer_ProtectMelee()))
																																							Else
																																								If level < 44
																																									bEscape = 1
																																								Else
																																									If Game.GetPlayer().HasSpell((GetPrayer_EagleEye())) == false
																																										Game.GetPlayer().AddSpell((GetPrayer_EagleEye()))
																																										Game.GetPlayer().AddSpell((GetPrayer_OverpoweringForce()))
																																										Game.GetPlayer().RemoveSpell((GetPrayer_HawkEye()))
																																										Game.GetPlayer().RemoveSpell((GetPrayer_UnrelentingForce()))
																																									Else
																																										If level < 45
																																											bEscape = 1
																																										Else
																																											If Game.GetPlayer().HasSpell((GetPrayer_MysticMight())) == false
																																												Game.GetPlayer().AddSpell((GetPrayer_MysticMight()))
																																												Game.GetPlayer().AddSpell((GetPrayer_Overcharge()))
																																												Game.GetPlayer().RemoveSpell((GetPrayer_MysticLore()))
																																												Game.GetPlayer().RemoveSpell((GetPrayer_SuperCharge()))
																																											Else
																																												If level < 46
																																													bEscape = 1
																																												Else
																																													If Game.GetPlayer().HasSpell((GetPrayer_Retribution())) == false
																																														Game.GetPlayer().AddSpell((GetPrayer_Retribution()))
																																													Else
																																														If level < 49
																																															bEscape = 1
																																														Else
																																															If Game.GetPlayer().HasSpell((GetPrayer_Redemption())) == false
																																																Game.GetPlayer().AddSpell((GetPrayer_Redemption()))
																																															Else
																																																If level < 52
																																																	bEscape = 1
																																																Else
																																																	If Game.GetPlayer().HasSpell((GetPrayer_Smite())) == false
																																																		Game.GetPlayer().AddSpell((GetPrayer_Smite()))
																																																	Else
																																																		If level < 60
																																																			bEscape = 1
																																																		Else
																																																			If Game.GetPlayer().HasSpell((GetPrayer_Chivalry())) == false
																																																				Game.GetPlayer().AddSpell((GetPrayer_Chivalry()))
																																																			Else
																																																				If level < 65
																																																				Else
																																																					If (Game.GetPlayer().HasSpell((GetPrayer_RapidRenewal())) == false && (GetGlobalCheck_Dungeoneering_PurchaseRapidRenewal()).GetValue() == 1)
																																																						Game.GetPlayer().AddSpell((GetPrayer_RapidRenewal()))
																																																					Else
																																																						If level < 70
																																																						Else
																																																							If (Game.GetPlayer().HasSpell((GetPrayer_Piety())) == false && (GetQuest_KnightWaveTrainingGrounds()).IsCompleted() == true)
																																																								Game.GetPlayer().AddSpell((GetPrayer_Piety()))
																																																								Game.GetPlayer().AddSpell((GetPrayer_Rigour()))
																																																								Game.GetPlayer().AddSpell((GetPrayer_Augury()))
																																																							Else
																																																								(GetPrayerCheck()).SetValue(1)
																																																							EndIf
																																																						EndIf
																																																					EndIf
																																																				EndIf
																																																			EndIf
																																																		EndIf
																																																	EndIf
																																																EndIf
																																															EndIf
																																														EndIf
																																													EndIf
																																												EndIf
																																											EndIf
																																										EndIf
																																									EndIf
																																								EndIf
																																							EndIf
																																						EndIf
																																					EndIf
																																				EndIf
																																			EndIf
																																		EndIf
																																	EndIf
																																EndIf
																															EndIf
																														EndIf
																													EndIf
																												EndIf
																											EndIf
																										EndIf
																									EndIf
																								EndIf
																							EndIf
																						EndIf
																					EndIf
																				EndIf
																			EndIf
																		EndIf
																	EndIf
																EndIf
															EndIf
														EndIf
													EndIf
												EndIf
											EndIf
										EndIf
									EndIf
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndWhile
EndFunction

;< Testing Toolbox

;>
;>
;< Low-Level Framework
;< Get Skill Properties
;< Agility

;Gets property from rsFrameworkData
GlobalVariable Function GetAgilityLVL() Global
	return GetFrameworkData().RS_GV_AgilityLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetAgilityXP() Global
	return GetFrameworkData().RS_GV_AgilityXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundAgility_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpAgility
EndFunction
;>
;< Attack

;Gets property from rsFrameworkData
GlobalVariable Function GetAttackLVL() Global
	return GetFrameworkData().RS_GV_AttackLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetAttackXP() Global
	return GetFrameworkData().RS_GV_AttackXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundAttack_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpAttack
EndFunction
;>
;< Constitution

;Gets property from rsFrameworkData
GlobalVariable Function GetConstitutionLVL() Global
	return GetFrameworkData().RS_GV_ConstitutionLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetConstitutionXP() Global
	return GetFrameworkData().RS_GV_ConstitutionXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundConstitution_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpConstitution
EndFunction
;>
;< Construction

;Gets property from rsFrameworkData
GlobalVariable Function GetConstructionLVL() Global
	return GetFrameworkData().RS_GV_ConstructionLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetConstructionXP() Global
	return GetFrameworkData().RS_GV_ConstructionXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundConstruction_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpConstruction
EndFunction
;>
;< Cooking

;Gets property from rsFrameworkData
GlobalVariable Function GetCookingLVL() Global
	return GetFrameworkData().RS_GV_CookingLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetCookingXP() Global
	return GetFrameworkData().RS_GV_CookingXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundCooking_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpCooking
EndFunction
;>
;< Crafting

;Gets property from rsFrameworkData
GlobalVariable Function GetCraftingLVL() Global
	return GetFrameworkData().RS_GV_CraftingLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetCraftingXP() Global
	return GetFrameworkData().RS_GV_CraftingXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundCrafting_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpCrafting
EndFunction
;>
;< Defence

;Gets property from rsFrameworkData
GlobalVariable Function GetDefenceLVL() Global
	return GetFrameworkData().RS_GV_DefenceLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetDefenceXP() Global
	return GetFrameworkData().RS_GV_DefenceXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundDefence_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpDefence
EndFunction
;>
;< Divination

;Gets property from rsFrameworkData
GlobalVariable Function GetDivinationLVL() Global
	return GetFrameworkData().RS_GV_DivinationLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetDivinationXP() Global
	return GetFrameworkData().RS_GV_DivinationXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundDivination_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpDivination
EndFunction
;>
;< Dungeoneering

;Gets property from rsFrameworkData
GlobalVariable Function GetDungeoneeringLVL() Global
	return GetFrameworkData().RS_GV_DungeoneeringLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetDungeoneeringXP() Global
	return GetFrameworkData().RS_GV_DungeoneeringXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundDungeoneering_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpDungeoneering
EndFunction
;>
;< Farming

;Gets property from rsFrameworkData
GlobalVariable Function GetFarmingLVL() Global
	return GetFrameworkData().RS_GV_FarmingLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetFarmingXP() Global
	return GetFrameworkData().RS_GV_FarmingXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundFarming_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpFarming
EndFunction
;>
;< Firemaking

;Gets property from rsFrameworkData
GlobalVariable Function GetFiremakingLVL() Global
	return GetFrameworkData().RS_GV_FiremakingLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetFiremakingXP() Global
	return GetFrameworkData().RS_GV_FiremakingXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundFiremaking_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpFiremaking
EndFunction
;>
;< Fishing

;Gets property from rsFrameworkData
GlobalVariable Function GetFishingLVL() Global
	return GetFrameworkData().RS_GV_FishingLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetFishingXP() Global
	return GetFrameworkData().RS_GV_FishingXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundFishing_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpFishing
EndFunction
;>
;< Fletching

;Gets property from rsFrameworkData
GlobalVariable Function GetFletchingLVL() Global
	return GetFrameworkData().RS_GV_FletchingLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetFletchingXP() Global
	return GetFrameworkData().RS_GV_FletchingXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundFletching_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpFletching
EndFunction
;>
;< Herblore

;Gets property from rsFrameworkData
GlobalVariable Function GetHerbloreLVL() Global
	return GetFrameworkData().RS_GV_HerbloreLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetHerbloreXP() Global
	return GetFrameworkData().RS_GV_HerbloreXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundHerblore_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpHerblore
EndFunction
;>
;< Hunter

;Gets property from rsFrameworkData
GlobalVariable Function GetHunterLVL() Global
	return GetFrameworkData().RS_GV_HunterLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetHunterXP() Global
	return GetFrameworkData().RS_GV_HunterXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundHunter_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpHunter
EndFunction
;>
;< Invention
;Gets property from rsFrameworkData
GlobalVariable Function GetInventionLVL() Global
	return GetFrameworkData().RS_GV_InventionLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetInventionXP() Global
	return GetFrameworkData().RS_GV_InventionXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundInvention_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpInvention
EndFunction
;>
;< Magic

;Gets property from rsFrameworkData
GlobalVariable Function GetMagicLVL() Global
	return GetFrameworkData().RS_GV_MagicLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetMagicXP() Global
	return GetFrameworkData().RS_GV_MagicXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundMagic_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpMagic
EndFunction
;>
;< Mining

;Gets property from rsFrameworkData
GlobalVariable Function GetMiningLVL() Global
	return GetFrameworkData().RS_GV_MiningLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetMiningXP() Global
	return GetFrameworkData().RS_GV_MiningXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundMining_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpMining
EndFunction
;>
;< Prayer

;Gets property from rsFrameworkData
GlobalVariable Function GetPrayerLVL() Global
	return GetFrameworkData().RS_GV_PrayerLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetPrayerXP() Global
	return GetFrameworkData().RS_GV_PrayerXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundPrayer_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpPrayer
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetPrayerCheck() Global
	return GetFrameworkData().RS_GV_PrayerEndCheck
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetMagicCheck() Global
	Return GetFrameworkData().RS_GV_MagicEndCheck
EndFunction

;< Get Prayer Spells

;Gets property from rsFrameworkData
Spell Function GetPrayer_ThickSkin() Global
	return GetFrameworkData().RS_sPrayer_ThickSkin
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_BurstStrength() Global
	return GetFrameworkData().RS_sPrayer_BurstStrength
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_ClarityThought() Global
	return GetFrameworkData().RS_sPrayer_ClarityThought
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_SharpEye() Global
	return GetFrameworkData().RS_sPrayer_SharpEye
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_UnstoppableForce() Global
	return GetFrameworkData().RS_sPrayer_UnstoppableForce
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_MysticWill() Global
	return GetFrameworkData().RS_sPrayer_MysticWill
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_Charge() Global
	return GetFrameworkData().RS_sPrayer_Charge
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_RockSkin() Global
	return GetFrameworkData().RS_sPrayer_RockSkin
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_SuperStrength() Global
	return GetFrameworkData().RS_sPrayer_SuperStrength
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_ImprovedReflexes() Global
	return GetFrameworkData().RS_sPrayer_ImprovedReflexes
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_RapidRestore() Global
	return GetFrameworkData().RS_sPrayer_RapidRestore
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_RapidHeal() Global
	return GetFrameworkData().RS_sPrayer_RapidHeal
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_ProtectItem() Global
	return GetFrameworkData().RS_sPrayer_ProtectItem
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_HawkEye() Global
	return GetFrameworkData().RS_sPrayer_HawkEye
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_UnrelentingForce() Global
	return GetFrameworkData().RS_sPrayer_UnrelentingForce
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_MysticLore() Global
	return GetFrameworkData().RS_sPrayer_MysticLore
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_SuperCharge() Global
	return GetFrameworkData().RS_sPrayer_SuperCharge
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_SteelSkin() Global
	return GetFrameworkData().RS_sPrayer_SteelSkin
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_UltimateStrength() Global
	return GetFrameworkData().RS_sPrayer_UltimateStrength
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_IncredibleReflexes() Global
	return GetFrameworkData().RS_sPrayer_IncredibleReflexes
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_ProtectSummoning() Global
	return GetFrameworkData().RS_sPrayer_ProtectSummoning
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_ProtectMagic() Global
	return GetFrameworkData().RS_sPrayer_ProtectMagic
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_ProtectMissiles() Global
	return GetFrameworkData().RS_sPrayer_ProtectMissiles
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_ProtectMelee() Global
	return GetFrameworkData().RS_sPrayer_ProtectMelee
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_EagleEye() Global
	return GetFrameworkData().RS_sPrayer_EagleEye
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_OverpoweringForce() Global
	return GetFrameworkData().RS_sPrayer_OverpoweringForce
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_MysticMight() Global
	return GetFrameworkData().RS_sPrayer_MysticMight
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_Overcharge() Global
	return GetFrameworkData().RS_sPrayer_Overcharge
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_Retribution() Global
	return GetFrameworkData().RS_sPrayer_Retribution
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_Redemption() Global
	return GetFrameworkData().RS_sPrayer_Redemption
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_Smite() Global
	return GetFrameworkData().RS_sPrayer_Smite
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_Chivalry() Global
	return GetFrameworkData().RS_sPrayer_Chivalry
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_RapidRenewal() Global
	return GetFrameworkData().RS_sPrayer_RapidRenewal
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_Piety() Global
	return GetFrameworkData().RS_sPrayer_Piety
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_Rigour() Global
	return GetFrameworkData().RS_sPrayer_Rigour
EndFunction

;Gets property from rsFrameworkData
Spell Function GetPrayer_Augury() Global
	return GetFrameworkData().RS_sPrayer_Augury
EndFunction

;>

;>
;< Ranged

;Gets property from rsFrameworkData
GlobalVariable Function GetRangedLVL() Global
	return GetFrameworkData().RS_GV_RangedLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetRangedXP() Global
	return GetFrameworkData().RS_GV_RangedXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundRanged_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpRanged
EndFunction
;>
;< Runecrafting

;Gets property from rsFrameworkData
GlobalVariable Function GetRunecraftingLVL() Global
	return GetFrameworkData().RS_GV_RunecraftingLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetRunecraftingXP() Global
	return GetFrameworkData().RS_GV_RunecraftingXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundRunecrafting_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpRunecrafting
EndFunction
;>
;< Slayer

;Gets property from rsFrameworkData
GlobalVariable Function GetSlayerLVL() Global
	return GetFrameworkData().RS_GV_SlayerLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetSlayerXP() Global
	return GetFrameworkData().RS_GV_SlayerXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundSlayer_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpSlayer
EndFunction
;>
;< Smithing

;Gets property from rsFrameworkData
GlobalVariable Function GetSmithingLVL() Global
	return GetFrameworkData().RS_GV_SmithingLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetSmithingXP() Global
	return GetFrameworkData().RS_GV_SmithingXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundSmithing_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpSmithing
EndFunction
;>
;< Strength

;Gets property from rsFrameworkData
GlobalVariable Function GetStrengthLVL() Global
	return GetFrameworkData().RS_GV_StrengthLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetStrengthXP() Global
	return GetFrameworkData().RS_GV_StrengthXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundStrength_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpStrength
EndFunction
;>
;< Summoning

;Gets property from rsFrameworkData
GlobalVariable Function GetSummoningLVL() Global
	return GetFrameworkData().RS_GV_SummoningLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetSummoningXP() Global
	return GetFrameworkData().RS_GV_SummoningXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundSummoning_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpSummoning
EndFunction
;>
;< Thieving

;Gets property from rsFrameworkData
GlobalVariable Function GetThievingLVL() Global
	return GetFrameworkData().RS_GV_ThievingLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetThievingXP() Global
	return GetFrameworkData().RS_GV_ThievingXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundThieving_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpThieving
EndFunction
;>
;< Woodcutting

;Gets property from rsFrameworkData
GlobalVariable Function GetWoodcuttingLVL() Global
	return GetFrameworkData().RS_GV_WoodcuttingLVL
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetWoodcuttingXP() Global
	return GetFrameworkData().RS_GV_WoodcuttingXP
EndFunction

;Gets property from rsFrameworkData
Sound Function GetSoundWoodcutting_LevelUp() Global
	return GetFrameworkData().RS_SM_LevelUpWoodcutting
EndFunction
;>
;>
;< Get Checks

;Gets property from rsFrameworkData
GlobalVariable Function GetGlobalCheck_RandomEvents() Global
	return GetFrameworkData().RS_GV_RandomEvents
EndFunction

;Gets property from rsFrameworkData
GlobalVariable Function GetGlobalCheck_Dungeoneering_PurchaseRapidRenewal() Global
	return GetFrameworkData().RS_Check_Dungeoneering_PurchaseRapidRenewal
EndFunction

GlobalVariable Function GetGlobalConfig_Runecrafting_UnpackPouch() Global
	return GetFrameworkData().RS_Config_Runecrafting_UnpackPouch
EndFunction

;>
;< Get Quest Properties

;Gets property from rsFrameworkData
Quest Function GetQuest_WhileGuthixSleeps() Global
	return GetFrameworkData().RS_Quest_WhileGuthixSleeps
EndFunction

;Gets property from rsFrameworkData
Quest Function GetQuest_KnightWaveTrainingGrounds() Global
	return GetFrameworkData().RS_Quest_KnightWaveTrainingGrounds
EndFunction

;>
;< Get Actor Properties
;< Random Events

;Gets property from rsFrameworkData
Actorbase Function GetActorBase_RandomEvent_RiverTroll() Global
	Int clvl = (GetCombatLVL())
	If clvl == 1 && clvl <= 10
		return GetFrameworkData().RS_Monster_RiverTroll_re_014
	ElseIf clvl == 11 && clvl <= 20
		return GetFrameworkData().RS_Monster_RiverTroll_re_029
	ElseIf clvl == 21 && clvl <= 40
		return GetFrameworkData().RS_Monster_RiverTroll_re_049
	ElseIf clvl == 41 && clvl <= 60
		return GetFrameworkData().RS_Monster_RiverTroll_re_079
	ElseIf clvl == 61 && clvl <= 90
		return GetFrameworkData().RS_Monster_RiverTroll_re_120
	ElseIf clvl >= 91
		return GetFrameworkData().RS_Monster_RiverTroll_re_159
	EndIf
EndFunction

;Gets property from rsFrameworkData
Actorbase Function GetActorBase_RandomEvent_RockGolem() Global
	Int clvl = (GetCombatLVL())
	If clvl == 1 && clvl <= 10
		return GetFrameworkData().RS_Monster_RockGolem_re_014
	ElseIf clvl == 11 && clvl <= 20
		return GetFrameworkData().RS_Monster_RockGolem_re_029
	ElseIf clvl == 21 && clvl <= 40
		return GetFrameworkData().RS_Monster_RockGolem_re_049
	ElseIf clvl == 41 && clvl <= 60
		return GetFrameworkData().RS_Monster_RockGolem_re_079
	ElseIf clvl == 61 && clvl <= 90
		return GetFrameworkData().RS_Monster_RockGolem_re_120
	ElseIf clvl >= 91
		return GetFrameworkData().RS_Monster_RockGolem_re_159
	EndIf
EndFunction

;Gets property from rsFrameworkData
Actorbase Function GetActorBase_RandomEvent_TreeSpirit() Global
	Int clvl = (GetCombatLVL())
	If clvl == 1 && clvl <= 10
		return GetFrameworkData().RS_Monster_TreeSpirit_re_014
	ElseIf clvl == 11 && clvl <= 20
		return GetFrameworkData().RS_Monster_TreeSpirit_re_029
	ElseIf clvl == 21 && clvl <= 40
		return GetFrameworkData().RS_Monster_TreeSpirit_re_049
	ElseIf clvl == 41 && clvl <= 60
		return GetFrameworkData().RS_Monster_TreeSpirit_re_079
	ElseIf clvl == 61 && clvl <= 90
		return GetFrameworkData().RS_Monster_TreeSpirit_re_120
	ElseIf clvl >= 91
		return GetFrameworkData().RS_Monster_TreeSpirit_re_159
	EndIf
EndFunction

;Gets property from rsFrameworkData
Actorbase Function GetActorBase_RandomEvent_Watchman() Global
	Int clvl = (GetCombatLVL())
	If clvl == 1 && clvl <= 10
		return GetFrameworkData().RS_Monster_Watchman_re_014
	ElseIf clvl == 11 && clvl <= 20
		return GetFrameworkData().RS_Monster_Watchman_re_029
	ElseIf clvl == 21 && clvl <= 40
		return GetFrameworkData().RS_Monster_Watchman_re_049
	ElseIf clvl == 41 && clvl <= 60
		return GetFrameworkData().RS_Monster_Watchman_re_079
	ElseIf clvl == 61 && clvl <= 90
		return GetFrameworkData().RS_Monster_Watchman_re_120
	ElseIf clvl >= 91
		return GetFrameworkData().RS_Monster_Watchman_re_159
	EndIf
EndFunction

;>
;>
;< Get FormList Properties

FormList Function GetFormList_WeaponBronze() Global
	return GetFrameworkData().RS_FormList_WeaponBronze
EndFunction
FormList Function GetFormList_WeaponIron() Global
	return GetFrameworkData().RS_FormList_WeaponIron
EndFunction
FormList Function GetFormList_WeaponSteel() Global
	return GetFrameworkData().RS_FormList_WeaponSteel
EndFunction
FormList Function GetFormList_WeaponBlack() Global
	return GetFrameworkData().RS_FormList_WeaponBlack
EndFunction
FormList Function GetFormList_WeaponWhite() Global
	return GetFrameworkData().RS_FormList_WeaponWhite
EndFunction
FormList Function GetFormList_WeaponMithril() Global
	return GetFrameworkData().RS_FormList_WeaponMithril
EndFunction
FormList Function GetFormList_WeaponAdamant() Global
	return GetFrameworkData().RS_FormList_WeaponAdamant
EndFunction
FormList Function GetFormList_WeaponRune() Global
	return GetFrameworkData().RS_FormList_WeaponRune
EndFunction
FormList Function GetFormList_WeaponDragon() Global
	return GetFrameworkData().RS_FormList_WeaponDragon
EndFunction
FormList Function GetFormList_WeaponSacredClay() Global
	return GetFrameworkData().RS_FormList_WeaponSacredClay
EndFunction
FormList Function GetFormList_WeaponVolatileClay() Global
	return GetFrameworkData().RS_FormList_WeaponVolatileClay
EndFunction
;>
;< Get Variables
Float Function GetVariable_HoursToHour() Global
	return GetFrameworkData().HoursToHour
EndFunction

Float Function GetVariable_HoursToDay() Global
	return GetFrameworkData().HoursToDay
EndFunction

Float Function GetVariable_HoursToWeek() Global
	return GetFrameworkData().HoursToWeek
EndFunction

Float Function GetVariable_HoursToMonth() Global
	return GetFrameworkData().HoursToMonth
EndFunction

;>
;< Get Weapon Properties
Weapon Function GetWeapon_Special_InfernoAdze() Global
	return GetFrameworkData().RS_Item_Weapon_Special_InfernoAdze
EndFunction

;< Runecrafting Staves
Weapon Function GetWeapon_Staff_Talisman() Global
	return GetFrameworkData().RS_Weapon_Staff_Talisman
EndFunction

Weapon Function GetWeapon_Staff_Talisman_Air() Global
	return GetFrameworkData().RS_Weapon_Staff_Talisman_Air
EndFunction

Weapon Function GetWeapon_Staff_Talisman_Mind() Global
	return GetFrameworkData().RS_Weapon_Staff_Talisman_Mind
EndFunction

Weapon Function GetWeapon_Staff_Talisman_Water() Global
	return GetFrameworkData().RS_Weapon_Staff_Talisman_Water
EndFunction

Weapon Function GetWeapon_Staff_Talisman_Earth() Global
	return GetFrameworkData().RS_Weapon_Staff_Talisman_Earth
EndFunction

Weapon Function GetWeapon_Staff_Talisman_Fire() Global
	return GetFrameworkData().RS_Weapon_Staff_Talisman_Fire
EndFunction

Weapon Function GetWeapon_Staff_Talisman_Body() Global
	return GetFrameworkData().RS_Weapon_Staff_Talisman_Body
EndFunction

Weapon Function GetWeapon_Staff_Talisman_Cosmic() Global
	return GetFrameworkData().RS_Weapon_Staff_Talisman_Cosmic
EndFunction

Weapon Function GetWeapon_Staff_Talisman_Chaos() Global
	return GetFrameworkData().RS_Weapon_Staff_Talisman_Chaos
EndFunction

Weapon Function GetWeapon_Staff_Talisman_Nature() Global
	return GetFrameworkData().RS_Weapon_Staff_Talisman_Nature
EndFunction

Weapon Function GetWeapon_Staff_Talisman_Law() Global
	return GetFrameworkData().RS_Weapon_Staff_Talisman_Law
EndFunction

Weapon Function GetWeapon_Staff_Talisman_Death() Global
	return GetFrameworkData().RS_Weapon_Staff_Talisman_Death
EndFunction

;>
;>
;< Get Count Variables
;< Runecrafting Counts
;Gets pure essence count from pouch
GlobalVariable Function GetCount_Runecrafting_EssPure_Small() Global
	return GetFrameworkData().RS_Count_Runecrafting_EssPure_Small
EndFunction

;Gets pure essence count from pouch
GlobalVariable Function GetCount_Runecrafting_EssPure_Medium() Global
	return GetFrameworkData().RS_Count_Runecrafting_EssPure_Medium
EndFunction

;Gets pure essence count from pouch
GlobalVariable Function GetCount_Runecrafting_EssPure_Large() Global
	return GetFrameworkData().RS_Count_Runecrafting_EssPure_Large
EndFunction

;Gets pure essence count from pouch
GlobalVariable Function GetCount_Runecrafting_EssPure_Giant() Global
	return GetFrameworkData().RS_Count_Runecrafting_EssPure_Giant
EndFunction

;Gets reg essence count from pouch
GlobalVariable Function GetCount_Runecrafting_Ess_Small() Global
	return GetFrameworkData().RS_Count_Runecrafting_Ess_Small
EndFunction

;Gets reg essence count from pouch
GlobalVariable Function GetCount_Runecrafting_Ess_Medium() Global
	return GetFrameworkData().RS_Count_Runecrafting_Ess_Medium
EndFunction

;Gets reg essence count from pouch
GlobalVariable Function GetCount_Runecrafting_Ess_Large() Global
	return GetFrameworkData().RS_Count_Runecrafting_Ess_Large
EndFunction

;Gets reg essence count from pouch
GlobalVariable Function GetCount_Runecrafting_Ess_Giant() Global
	return GetFrameworkData().RS_Count_Runecrafting_Ess_Giant
EndFunction

GlobalVariable Function GetCount_Charges_BindingNecklace() Global
	return GetFrameworkData().RS_Count_Charges_BindingNecklace
EndFunction
;>
;>
;< Get Container Properties

;Gets objectreference of the bank
ObjectReference Function GetBankReference() Global
	return GetFrameworkData().RS_Bank
EndFunction
;>
;< Get Item

;< Runecrafting

MiscObject Function GetItem_Runecrafting_Rune_Air() Global
	return GetFrameworkData().RS_Item_Rune_Air
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Mind() Global
	return GetFrameworkData().RS_Item_Rune_Mind
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Water() Global
	return GetFrameworkData().RS_Item_Rune_Water
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Earth() Global
	return GetFrameworkData().RS_Item_Rune_Earth
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Fire() Global
	return GetFrameworkData().RS_Item_Rune_Fire
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Body() Global
	return GetFrameworkData().RS_Item_Rune_Body
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Cosmic() Global
	return GetFrameworkData().RS_Item_Rune_Cosmic
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Chaos() Global
	return GetFrameworkData().RS_Item_Rune_Chaos
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Astral() Global
	return GetFrameworkData().RS_Item_Rune_Astral
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Nature() Global
	return GetFrameworkData().RS_Item_Rune_Nature
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Law() Global
	return GetFrameworkData().RS_Item_Rune_Law
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Death() Global
	return GetFrameworkData().RS_Item_Rune_Death
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Dust() Global
	return GetFrameworkData().RS_Item_Rune_Dust
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Mud() Global
	return GetFrameworkData().RS_Item_Rune_Mud
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Smoke() Global
	return GetFrameworkData().RS_Item_Rune_Smoke
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Mist() Global
	return GetFrameworkData().RS_Item_Rune_Mist
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Lava() Global
	return GetFrameworkData().RS_Item_Rune_Lava
EndFunction

MiscObject Function GetItem_Runecrafting_Rune_Steam() Global
	return GetFrameworkData().RS_Item_Rune_Steam
EndFunction

MiscObject Function GetItem_Runecrafting_RuneEssence() Global
	return GetFrameworkData().RS_Item_Runecrafting_RuneEssence
EndFunction

MiscObject Function GetItem_Runecrafting_RuneEssencePure() Global
	return GetFrameworkData().RS_Item_Runecrafting_RuneEssencePure
EndFunction

MiscObject Function GetItem_RCpouch_Small() Global
	return GetFrameworkData().RS_Item_RunecraftingPouch_Small
EndFunction

;Gets runecraft pouch reference
MiscObject Function GetItem_RCpouch_Medium() Global
	return GetFrameworkData().RS_Item_RunecraftingPouch_Medium
EndFunction

;Gets runecraft pouch reference
MiscObject Function GetItem_RCpouch_Large() Global
	return GetFrameworkData().RS_Item_RunecraftingPouch_Large
EndFunction

;Gets runecraft pouch reference
MiscObject Function GetItem_RCpouch_Giant() Global
	return GetFrameworkData().RS_Item_RunecraftingPouch_Giant
EndFunction

MiscObject Function GetItem_Talisman_Air() Global
	return GetFrameworkData().RS_Item_Talisman_Air
EndFunction

MiscObject Function GetItem_Talisman_Mind() Global
	return GetFrameworkData().RS_Item_Talisman_Mind
EndFunction

MiscObject Function GetItem_Talisman_Water() Global
	return GetFrameworkData().RS_Item_Talisman_Water
EndFunction

MiscObject Function GetItem_Talisman_Earth() Global
	return GetFrameworkData().RS_Item_Talisman_Earth
EndFunction

MiscObject Function GetItem_Talisman_Fire() Global
	return GetFrameworkData().RS_Item_Talisman_Fire
EndFunction

MiscObject Function GetItem_Talisman_Body() Global
	return GetFrameworkData().RS_Item_Talisman_Body
EndFunction

MiscObject Function GetItem_Talisman_Cosmic() Global
	return GetFrameworkData().RS_Item_Talisman_Cosmic
EndFunction

MiscObject Function GetItem_Talisman_Chaos() Global
	return GetFrameworkData().RS_Item_Talisman_Chaos
EndFunction

MiscObject Function GetItem_Talisman_Nature() Global
	return GetFrameworkData().RS_Item_Talisman_Nature
EndFunction

MiscObject Function GetItem_Talisman_Law() Global
	return GetFrameworkData().RS_Item_Talisman_Law
EndFunction

MiscObject Function GetItem_Talisman_Death() Global
	return GetFrameworkData().RS_Item_Talisman_Death
EndFunction

;>

;< Get Armor
Armor Function GetArmor_Head_Tiara() Global
	return GetFrameworkData().RS_Armor_Head_Tiara
EndFunction

Armor Function GetArmor_Head_Tiara_Air() Global
	return GetFrameworkData().RS_Armor_Head_Tiara_Air
EndFunction

Armor Function GetArmor_Head_Tiara_Mind() Global
	return GetFrameworkData().RS_Armor_Head_Tiara_Mind
EndFunction

Armor Function GetArmor_Head_Tiara_Water() Global
	return GetFrameworkData().RS_Armor_Head_Tiara_Water
EndFunction

Armor Function GetArmor_Head_Tiara_Earth() Global
	return GetFrameworkData().RS_Armor_Head_Tiara_Earth
EndFunction

Armor Function GetArmor_Head_Tiara_Fire() Global
	return GetFrameworkData().RS_Armor_Head_Tiara_Fire
EndFunction

Armor Function GetArmor_Head_Tiara_Body() Global
	return GetFrameworkData().RS_Armor_Head_Tiara_Body
EndFunction

Armor Function GetArmor_Head_Tiara_Cosmic() Global
	return GetFrameworkData().RS_Armor_Head_Tiara_Cosmic
EndFunction

Armor Function GetArmor_Head_Tiara_Chaos() Global
	return GetFrameworkData().RS_Armor_Head_Tiara_Chaos
EndFunction

Armor Function GetArmor_Head_Tiara_Nature() Global
	return GetFrameworkData().RS_Armor_Head_Tiara_Nature
EndFunction

Armor Function GetArmor_Head_Tiara_Law() Global
	return GetFrameworkData().RS_Armor_Head_Tiara_Law
EndFunction

Armor Function GetArmor_Head_Tiara_Death() Global
	return GetFrameworkData().RS_Armor_Head_Tiara_Death
EndFunction

Armor Function GetArmor_Neck_Necklace_Binding() Global
	return GetFrameworkData().RS_Armor_Neck_Necklace_Binding
EndFunction
;>
;>
;< Get Sound

Sound Function GetSound_UI_Runecrafting() Global
	return GetFrameworkData().RS_Sound_UI_Runecraft
EndFunction

;>
;< Get Magic Effect
MagicEffect Function GetEffect_Spell_MagicImbue() Global
	return GetFrameworkData().RS_MagicEffect_Spell_MagicImbue
EndFunction
;>
;<Get Spells damage
Spell Function GetRS_Spell_WaterStrike() Global
	return GetFrameworkData().RS_Spell_WaterStrike
EndFunction

Spell Function GetRS_Spell_EarthStrike() Global
	return GetFrameworkData().RS_Spell_EarthStrike
EndFunction

Spell Function GetRS_Spell_FireStrike() Global
	return GetFrameworkData().RS_Spell_FireStrike
EndFunction

Spell Function GetRS_Spell_WindBolt() Global
	Return GetFrameworkData().RS_Spell_WindBolt
EndFunction

Spell Function GetRS_Spell_WaterBolt() Global
	Return GetFrameworkData().RS_Spell_WaterBolt
EndFunction

Spell Function GetRS_Spell_EarthBolt() Global
	Return GetFrameworkData().RS_Spell_EarthBolt
EndFunction

Spell Function GetRS_Spell_FireBolt() Global
	Return GetFrameworkData().RS_Spell_FireBolt
EndFunction

Spell Function GETRS_Spell_WindBlast() Global
	Return GetFrameworkData().RS_Spell_WindBlast
EndFunction

Spell Function GetRS_Spell_WindSurge() Global
	Return GetFrameworkData().RS_Spell_WindSurge
EndFunction

Spell Function GetRS_Spell_Water_Blast() Global
	Return GetFrameworkData().RS_Spell_Water_Blast
EndFunction

Spell Function GetRS_Spell_WaterSurge() Global
	Return GetFrameworkData().RS_Spell_WaterSurge
EndFunction

Spell Function GetRS_Spell_EarthBlast() Global
	Return GetFrameworkData().RS_Spell_EarthBlast
EndFunction

Spell Function GetRS_Spell_EarthSurge() Global
	Return GetFrameworkData().RS_Spell_EarthSurge
EndFunction

Spell Function GetRS_Spell_FireBlast() Global
	Return GetFrameworkData().RS_Spell_FireBlast
EndFunction

Spell Function GetRS_Spell_FireSurge() Global
	Return GetFrameworkData().RS_Spell_FireSurge
EndFunction

Spell Function GetRS_Spell_WindWave() Global
	Return GetFrameworkData().RS_Spell_WindWave
EndFunction

Spell Function GetRS_Spell_WaterWave() Global
	Return GetFrameworkData().RS_Spell_WaterWave
EndFunction

Spell Function GetRS_Spell_EarthWave() Global
	Return GetFrameworkData().RS_Spell_EarthWave
EndFunction

Spell Function GetRS_Spell_FireWave() Global
	Return GetFrameworkData().RS_Spell_FireWave
EndFunction
;>

;< Teleport Spells
Spell Function GetRS_Spell_VarrockTele() Global
	Return GetFrameworkData().RS_Spell_VarrockTele
EndFunction

Spell Function GetRS_Spell_LumbridgeTele() Global
	Return GetFrameworkData().RS_Spell_LumbridgeTele
EndFunction

Spell Function GetRS_Spell_FaladorTele() Global
	Return GetFrameworkData().RS_Spell_FaladorTele
EndFunction
;>
;< Magic spell check, add if missing
Function SpellCheck_Magic() Global
	Int level = (GetMagicLVL()).GetValue() as Int
	bool bEscape = False
	If ((GetMagicCheck()).GetValue()) == 1
		bEscape = True
	EndIf
	While (bEscape == False)
		If level < 5
			bEscape = 1
		Else
			If Game.GetPlayer().HasSpell((GetRS_Spell_WaterStrike())) == False
				Game.GetPlayer().AddSpell((GetRS_Spell_WaterStrike()))
			Else
				If level < 9
					bEscape = 1
				Else
					If Game.GetPlayer().HasSpell((GetRS_Spell_EarthStrike())) == False
						Game.GetPlayer().AddSpell((GetRS_Spell_EarthStrike()))
					Else
						If Level < 13
							bEscape = 1
						Else
							If Game.GetPlayer().HasSpell((GetRS_Spell_FireStrike())) == False
								Game.GetPlayer().AddSpell((GetRS_Spell_FireStrike())) 
							Else
								If level < 17
									bEscape = 1
								Else
									If Game.GetPlayer().HasSpell((GetRS_Spell_WindBolt())) == False
										Game.GetPlayer().AddSPell((GetRS_Spell_WindBolt()))
									Else
										If level < 23
											bEscape = 1
										Else
											If Game.GetPlayer().HasSpell((GetRS_Spell_WaterBolt())) == False
												Game.GetPlayer().AddSpell((GetRS_Spell_WaterBolt()))
											Else
												If level < 25
													bEscape = 1
												Else
													If Game.GetPlayer().HasSpell((GetRS_Spell_VarrockTele())) == False
														Game.getplayer().AddSPell((GetRS_Spell_VarrockTele()))
													Else
														If level < 29
															bEscape = 1
														Else
															If Game.GetPlayer().HasSpell((GetRS_Spell_EarthBolt())) == False
																Game.GetPlayer().AddSPell((GetRS_Spell_EarthBolt())) 
															Else
																If level < 31
																	bEscape = 1
																Else
																	If Game.GetPlayer().HasSpell((GetRS_Spell_LumbridgeTele())) == False
																		Game.GetPlayer().AddSpell((GetRS_Spell_LumbridgeTele()))
																	Else	
																		If level < 35 
																			bEscape = 1
																		Else
																			If Game.GetPlayer().HasSpell((GetRS_Spell_FireBolt())) == false
																				Game.GetPlayer().AddSpell((GetRS_Spell_FireBolt()))
																			Else
																				If level < 37
																					bEscape = 1
																				Else
																					If Game.GetPlayer().HasSpell((GetRS_Spell_FaladorTele())) == False
																						Game.GetPlayer().AddSPell((GetRS_Spell_FaladorTele()))
																					Else
																						If level < 41
																							bEscape
																						Else
																							If Game.GetPlayer().HasSpell((GetRS_Spell_WindBlast())) == False
																								Game.GetPlayer().AddSpell((GetRS_Spell_WindBlast())) 
																							Else
																								If level < 47
																									bEscape = 1
																								Else
																									If Game.GetPlayer().HasSpell((GetRS_Spell_Water_Blast())) == False
																										Game.GetPlayer().AddSpell((GetRS_Spell_Water_Blast()))
																									Else
																										If level < 53
																											bEscape = 1
																										Else
																											If Game.GetPlayer().HasSpell((GetRS_Spell_EarthBlast())) == False
																												Game.GetPlayer().AddSpell((GetRS_Spell_EarthBlast()))
																											Else
																												If level < 59
																													bEscape = 1
																												Else
																													If game.GetPlayer().HasSpell((GetRS_Spell_FireBlast())) == False
																														Game.GetPlayer().AddSpell((GetRS_Spell_FireBlast()))
																													Else
																														If level < 62
																															bEscape = 1
																														Else
																															If Game.GetPlayer().HasSpell((GetRS_Spell_WindWave())) == False
																																Game.GetPlayer().AddSPell((GetRS_Spell_WindWave()))
																															Else
																																If level < 65
																																	bEscape = 1
																																Else
																																	If Game.GetPlayer().HasSpell((GetRS_Spell_WaterWave())) == False
																																		Game.GetPlayer().AddSpell((GetRS_Spell_WaterWave()))
																																	Else
																																		If level < 70
																																			bEscape = 1
																																		Else
																																			If Game.GetPlayer().HasSpell((GetRS_Spell_EarthWave())) == False
																																				Game.GetPlayer().AddSpell((GetRS_Spell_EarthWave())) 
																																			Else
																																				If level < 75
																																					bEscape = 1
																																				Else
																																					If Game.GetPlayer().HasSpell((GetRS_Spell_FireWave())) == False
																																						Game.GetPlayer().AddSpell((GetRS_Spell_FireWave()))
																																					Else
																																						If level < 81
																																							bEscape =1 
																																						Else
																																							If Game.getplayer().HasSpell((GetRS_Spell_WindSurge())) == False
																																								Game.GetPlayer().AddSPell((GetRS_Spell_WindSurge()))
																																							Else
																																								If level < 85
																																									bEscape = 1
																																								Else
																																									If game.GetPlayer().HasSpell((GetRS_Spell_WaterSurge())) == False
																																										Game.GetPlayer().AddSpell((GetRS_Spell_WaterSurge()))
																																									Else
																																										If level < 90
																																											bEscape = 1
																																										Else
																																											If Game.GetPlayer().HasSpell((GetRS_Spell_EarthSurge())) == False
																																												Game.GetPlayer().AddSpell((GetRS_Spell_EarthSurge())) 
																																											Else
																																												If level < 95
																																													bEscape = 1
																																												Else
																																													If Game.GetPlayer().HasSpell((GetRS_Spell_FireSurge())) == False
																																														Game.GetPlayer().AddSpell((GetRS_Spell_FireSurge())) 
																																													Else
																																														(GetMagicCheck()).SetValue(1)
																																													Endif
																																												Endif
																																											Endif
																																										Endif
																																									EndIf
																																								Endif
																																							EndIf
																																						Endif
																																					Endif
																																				EndIf
																																			Endif
																																		Endif
																																	Endif
																																Endif
																															Endif
																														Endif
																													Endif
																												Endif
																											Endif
																										Endif
																									EndIf
																								Endif
																							Endif
																						Endif
																					Endif
																				Endif
																			Endif
																		Endif
																	Endif
																Endif
															Endif
														Endif
													Endif
												Endif
											Endif
										Endif
									Endif
								Endif
							Endif
						Endif
					Endif
				Endif
			Endif
		Endif
	EndWhile
EndFunction
;>
;< Notes:
;The original goal of this script is to provide the necessary functions to other scripts that use a repeated element that appears in each script.
;At this time, I have not tested it, so it is not ready to be put into action, and I am not sure if everything that is here will be here when it gets put in use.
;To add additional requirements for level up unlocks, refer to agility level 53
;>
