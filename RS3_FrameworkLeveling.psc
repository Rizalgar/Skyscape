Scriptname RS3_FrameworkLeveling extends Quest hidden
{Framework for leveling}

RS3_FrameworkData Function GetData() Global
	return (Game.GetFormFromFile(0x00593D, "Runesky.esp") as Quest) as RS3_FrameworkData
EndFunction


Function Experience(String Skill, Float XP) Global
	
	If Skill == "attack"
		(GetAttackXP()).SetValue(((GetAttackXP()).GetValue()) + xp)
		Debug.Notification("Got attack experience")
	ElseIf Skill == "strength"
		(GetStrengthXP()).SetValue(((GetStrengthXP()).GetValue()) + XP)
	ElseIf Skill == "defence"
		(GetDefenceXP()).SetValue(((GetDefenceXP()).GetValue()) + XP)
	ElseIf Skill == "constitution"
		(GetConstitutionXP()).SetValue(((GetConstitutionXP()).GetValue()) + XP)
	ElseIf Skill == "ranged"
		(GetRangedXP()).SetValue(((GetRangedXP()).GetValue()) + XP)
	ElseIf Skill == "prayer"
		(GetPrayerXP()).SetValue(((GetPrayerXP()).GetValue()) + XP)
	ElseIf Skill == "magic"
		(GetMagicXP()).SetValue(((GetPrayerXP()).GetValue()) + XP)
	ElseIf Skill == "cooking"
		(GetCookingXP()).SetValue(((GetCookingXP()).GetValue()) + XP)
	ElseIf Skill == "woodcutting"
		(GetWoodcuttingXP()).SetValue(((GetWoodcuttingXP()).GetValue()) + XP)
	ElseIf Skill == "fletching"
		(GetFletchingXP()).SetValue(((GetFletchingXP()).GetValue()) + XP)
	ElseIf Skill == "fishing"
		(GetFishingXP()).SetValue(((GetFishingXP()).GetValue()) + XP)
	ElseIf Skill == "firemaking"
		(GetFiremakingXP()).SetValue(((GetFiremakingXP()).GetValue()) + XP)
	ElseIf Skill == "crafting"
		(GetCraftingXP()).SetValue(((GetCraftingXP()).GetValue()) + XP)
	ElseIf Skill == "smithing"
		(GetSmithingXP()).SetValue(((GetSmithingXP()).GetValue()) + XP)
	ElseIf Skill == "mining"
		(GetMiningXP()).SetValue(((GetMiningXP()).GetValue()) + XP)
	ElseIf Skill == "herblore"
		(GetHerbloreXP()).SetValue(((GetHerbloreXP()).GetValue()) + XP)
	ElseIf Skill == "agility"
		(GetAgilityXP()).SetValue(((GetAgilityXP()).GetValue()) + XP)
	ElseIf Skill == "thieving"
		(GetThievingXP()).SetValue(((GetThievingXP()).GetValue()) + XP)
	ElseIf Skill == "slayer"
		(GetSlayerXP()).SetValue(((GetSlayerXP()).GetValue()) + XP)
	ElseIf Skill == "farming"
		(GetFarmingXP()).SetValue(((GetFarmingXP()).GetValue()) + XP)
	ElseIf Skill == "runecrafting"
		(GetRunecraftingXP()).SetValue(((GetRunecraftingXP()).GetValue()) + XP)
	ElseIf Skill == "hunter"
		(GetHunterXP()).SetValue(((GetHunterXP()).GetValue()) + XP)
	ElseIf Skill == "construction"
		(GetConstructionXP()).SetValue(((GetConstructionXP()).GetValue()) + XP)
	ElseIf Skill == "summoning"
		(GetSummoningXP()).SetValue(((GetSummoningXP()).GetValue()) + XP)
	ElseIf Skill == "dungeoneering"
		(GetDungeoneeringXP()).SetValue(((GetDungeoneeringXP()).GetValue()) + XP)
	ElseIf Skill == "divination"
		(GetDivinationXP()).SetValue(((GetDivinationXP()).GetValue()) + XP)
	ElseIf Skill == "invention"
		(GetInventionXP()).SetValue(((GetInventionXP()).GetValue()) + XP)
	EndIf
	
	CheckForLevel(Skill)
	
EndFunction 

Function CheckForLevel(String Skill) Global

	If Skill == "attack"
		LevelCheckAttack()
		Debug.Notification("Start level chec")
	ElseIf Skill == "strength"
		LevelCheckStrength()
	ElseIf Skill == "defence"
		LevelCheckDefence()
	ElseIf Skill == "constitution"
		LevelCheckConstitution()
	ElseIf Skill == "ranged"
		LevelCheckRanged()
	ElseIf Skill == "prayer"
		LevelCheckPrayer()
	ElseIf Skill == "magic"
		LevelCheckMagic()
	ElseIf Skill == "cooking"
		LevelCheckCooking()
	ElseIf Skill == "woodcutting"
		LevelCheckWoodcutting()
	ElseIf Skill == "fletching"
		LevelCheckFletching()
	ElseIf Skill == "fishing"
		LevelCheckFishing()
	ElseIf Skill == "firemaking"
		LevelCheckFiremaking()
	ElseIf Skill == "crafting"
		LevelCheckCrafting()
	ElseIf Skill == "smithing"
		LevelCheckSmithing()
	ElseIf Skill == "mining"
		LevelCheckMining()
	ElseIf Skill == "herblore"
		LevelCheckHerblore()
	ElseIf Skill == "agility"
		LevelCheckAgility()
	ElseIf Skill == "thieving"
		LevelCheckThieving()
	ElseIf Skill == "slayer"
		LevelCheckSlayer()
	ElseIf Skill == "farming"
		LevelCheckFarming()
	ElseIf Skill == "runecrafting"
		LevelCheckRunecrafting()
	ElseIf Skill == "hunter"
		LevelCheckHunter()
	ElseIf Skill == "construction"
		LevelCheckConstruction()
	ElseIf Skill == "summoning"
		LevelCheckSummoning()
	ElseIf Skill == "dungeoneering"
		LevelCheckDungeoneering()
	ElseIf Skill == "divination"
		LevelCheckDivination()
	ElseIf Skill == "invention"
		LevelCheckInvention()
	EndIf

EndFunction 

GlobalVariable Function GetGlobalSkillLVLFromString(String SkillName) Global
	If SkillName == "attack"
		return Game.GetFormFromFile(0x005900, "Runesky.esp") as GlobalVariable 
	ElseIf SkillName == "strength"
		return Game.GetFormFromFile(0x005902, "Runesky.esp") as GlobalVariable
	ElseIf SkillName == "defence"
		return Game.GetFormFromFile(0x005904, "Runesky.esp") as GlobalVariable
	ElseIf SkillName == "constitution"
		return Game.GetFormFromFile(0x005906, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "ranged"
		return Game.GetFormFromFile(0x005908, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "prayer"
		return Game.GetFormFromFile(0x00590A, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "magic"
		return Game.GetFormFromFile(0x00590C, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "cooking"
		return Game.GetFormFromFile(0x00590E, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "woodcutting"
		return Game.GetFormFromFile(0x005910, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "fletching"
		return Game.GetFormFromFile(0x005912, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "fishing"
		return Game.GetFormFromFile(0x005914, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "firemaking"
		return Game.GetFormFromFile(0x005916, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "crafting"
		return Game.GetFormFromFile(0x005918, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "smithing"
		return Game.GetFormFromFile(0x00591A, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "mining"
		return Game.GetFormFromFile(0x00591C, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "herblore"
		return Game.GetFormFromFile(0x00591E, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "agility"
		return Game.GetFormFromFile(0x005920, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "thieving"
		return Game.GetFormFromFile(0x005922, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "slayer"
		return Game.GetFormFromFile(0x005924, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "farming"
		return Game.GetFormFromFile(0x005926, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "runecrafting"
		return Game.GetFormFromFile(0x005928, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "hunter"
		return Game.GetFormFromFile(0x00592A, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "construction"
		return Game.GetFormFromFile(0x00592C, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "summoning"
		return Game.GetFormFromFile(0x00592E, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "divination"
		return Game.GetFormFromFile(0x005932, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "invention"
		return Game.GetFormFromFile(0x005934, "runesky.esp") as GlobalVariable
	EndIf
	
EndFunction

GlobalVariable Function GetGlobalSkillXPFromString(String SkillName) Global

	If SkillName == "attack"
		return Game.GetFormFromFile(0x005901, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "strength"
		return Game.GetFormFromFile(0x005903, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "defence"
		return Game.GetFormFromFile(0x005905, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "constitution"
		return Game.GetFormFromFile(0x005907, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "ranged"
		return Game.GetFormFromFile(0x005909, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "prayer"
		return Game.GetFormFromFile(0x00590B, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "magic"
		return Game.GetFormFromFile(0x00590D, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "cooking"
		return Game.GetFormFromFile(0x00590F, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "woodcutting"
		return Game.GetFormFromFile(0x005911, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "fletching"
		return Game.GetFormFromFile(0x005913, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "fishing"
		return Game.GetFormFromFile(0x005915, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "firemaking"
		return Game.GetFormFromFile(0x005917, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "crafting"
		return Game.GetFormFromFile(0x005919, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "smithing"
		return Game.GetFormFromFile(0x00591B, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "mining"
		return Game.GetFormFromFile(0x00591D, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "herblore"
		return Game.GetFormFromFile(0x00591F, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "agility"
		return Game.GetFormFromFile(0x005921, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "thieving"
		return Game.GetFormFromFile(0x005923, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "slayer"
		return Game.GetFormFromFile(0x005925, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "farming"
		return Game.GetFormFromFile(0x005927, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "runecrafting"
		return Game.GetFormFromFile(0x005929, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "hunter"
		return Game.GetFormFromFile(0x00592B, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "construction"
		return Game.GetFormFromFile(0x00592D, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "summoning"
		return Game.GetFormFromFile(0x00592F, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "divination"
		return Game.GetFormFromFile(0x005933, "runesky.esp") as GlobalVariable
	ElseIf SkillName == "invention"
		return Game.GetFormFromFile(0x005935, "runesky.esp") as GlobalVariable
	EndIf
	
EndFunction

GlobalVariable Function GetAttackLVL() Global
	Return GetData().RS3_GV_AttackLVL
EndFunction

GlobalVariable Function GetAttackXP() Global
	Return GetData().RS3_GV_AttackXP
EndFunction 

GlobalVariable Function GetStrengthLVL() Global
	Return GetData().RS3_GV_StrengthLVL
EndFunction

GlobalVariable Function GetStrengthXP() Global
	Return GetData().RS3_GV_StrengthXP
EndFunction 

GlobalVariable Function GetDefenceLVL() Global
	Return GetData().RS3_GV_DefenceLVL
EndFunction

GlobalVariable Function GetDefenceXP() Global
	Return GetData().RS3_GV_DefenceXP
EndFunction 

GlobalVariable Function GetConstitutionLVL() Global
	Return GetData().RS3_GV_ConstitutionLVL
EndFunction

GlobalVariable Function GetConstitutionXP() Global
	Return GetData().RS3_GV_ConstitutionXP
EndFunction 

GlobalVariable Function GetRangedLVL() Global
	Return GetData().RS3_GV_RangedLVL
EndFunction

GlobalVariable Function GetRangedXP() Global
	Return GetData().RS3_GV_RangedXP
EndFunction 

GlobalVariable Function GetPrayerLVL() Global
	Return GetData().RS3_GV_PrayerLVL
EndFunction

GlobalVariable Function GetPrayerXP() Global
	Return GetData().RS3_GV_PrayerXP
EndFunction 

GlobalVariable Function GetMagicLVL() Global
	Return GetData().RS3_GV_MagicLVL
EndFunction

GlobalVariable Function GetMagicXP() Global
	Return GetData().RS3_GV_MagicXP
EndFunction 

GlobalVariable Function GetCookingLVL() Global
	Return GetData().RS3_GV_CookingLVL
EndFunction

GlobalVariable Function GetCookingXP() Global
	Return GetData().RS3_GV_CookingXP
EndFunction 

GlobalVariable Function GetWoodcuttingLVL() Global
	Return GetData().RS3_GV_WoodcuttingLVL
EndFunction

GlobalVariable Function GetWoodcuttingXP() Global
	Return GetData().RS3_GV_WoodcuttingXP
EndFunction 

GlobalVariable Function GetFletchingLVL() Global
	Return GetData().RS3_GV_FletchingLVL
EndFunction

GlobalVariable Function GetFletchingXP() Global
	Return GetData().RS3_GV_FletchingXP
EndFunction 

GlobalVariable Function GetFishingLVL() Global
	Return GetData().RS3_GV_FishingLVL
EndFunction

GlobalVariable Function GetFishingXP() Global
	Return GetData().RS3_GV_FishingXP
EndFunction 

GlobalVariable Function GetFiremakingLVL() Global
	Return GetData().RS3_GV_FiremakingLVL
EndFunction

GlobalVariable Function GetFiremakingXP() Global
	Return GetData().RS3_GV_FiremakingXP
EndFunction 

GlobalVariable Function GetCraftingLVL() Global
	Return GetData().RS3_GV_CraftingLVL
EndFunction

GlobalVariable Function GetCraftingXP() Global
	Return GetData().RS3_GV_CraftingXP
EndFunction 

GlobalVariable Function GetSmithingLVL() Global
	Return GetData().RS3_GV_SmithingLVL
EndFunction

GlobalVariable Function GetSmithingXP() Global
	Return GetData().RS3_GV_SmithingXP
EndFunction 

GlobalVariable Function GetMiningLVL() Global
	Return GetData().RS3_GV_MiningLVL
EndFunction

GlobalVariable Function GetMiningXP() Global
	Return GetData().RS3_GV_MiningXP
EndFunction 

GlobalVariable Function GetHerbloreLVL() Global
	Return GetData().RS3_GV_HerbloreLVL
EndFunction

GlobalVariable Function GetHerbloreXP() Global
	Return GetData().RS3_GV_HerbloreXP
EndFunction 

GlobalVariable Function GetAgilityLVL() Global
	Return GetData().RS3_GV_AgilityLVL
EndFunction

GlobalVariable Function GetAgilityXP() Global
	Return GetData().RS3_GV_AgilityXP
EndFunction 

GlobalVariable Function GetThievingLVL() Global
	Return GetData().RS3_GV_ThievingLVL
EndFunction

GlobalVariable Function GetThievingXP() Global
	Return GetData().RS3_GV_ThievingXP
EndFunction 

GlobalVariable Function GetSlayerLVL() Global
	Return GetData().RS3_GV_SlayerLVL
EndFunction

GlobalVariable Function GetSlayerXP() Global
	Return GetData().RS3_GV_SlayerXP
EndFunction 

GlobalVariable Function GetFarmingLVL() Global
	Return GetData().RS3_GV_FarmingLVL
EndFunction

GlobalVariable Function GetFarmingXP() Global
	Return GetData().RS3_GV_FarmingXP
EndFunction 

GlobalVariable Function GetRunecraftingLVL() Global
	Return GetData().RS3_GV_RunecraftingLVL
EndFunction

GlobalVariable Function GetRunecraftingXP() Global
	Return GetData().RS3_GV_RunecraftingXP
EndFunction 

GlobalVariable Function GetHunterLVL() Global
	Return GetData().RS3_GV_HunterLVL
EndFunction

GlobalVariable Function GetHunterXP() Global
	Return GetData().RS3_GV_HunterXP
EndFunction 

GlobalVariable Function GetConstructionLVL() Global
	Return GetData().RS3_GV_ConstructionLVL
EndFunction

GlobalVariable Function GetConstructionXP() Global
	Return GetData().RS3_GV_ConstructionXP
EndFunction 

GlobalVariable Function GetSummoningLVL() Global
	Return GetData().RS3_GV_SummoningLVL
EndFunction

GlobalVariable Function GetSummoningXP() Global
	Return GetData().RS3_GV_SummoningXP
EndFunction 

GlobalVariable Function GetDungeoneeringLVL() Global
	Return GetData().RS3_GV_DungeoneeringLVL
EndFunction

GlobalVariable Function GetDungeoneeringXP() Global
	Return GetData().RS3_GV_DungeoneeringXP
EndFunction 

GlobalVariable Function GetDivinationLVL() Global
	Return GetData().RS3_GV_DivinationLVL
EndFunction

GlobalVariable Function GetDivinationXP() Global
	Return GetData().RS3_GV_DivinationXP
EndFunction 

GlobalVariable Function GetInventionLVL() Global
	Return GetData().RS3_GV_InventionLVL
EndFunction

GlobalVariable Function GetInventionXP() Global
	Return GetData().RS3_GV_InventionXP
EndFunction 

Function LevelCheckAttack() Global
	Debug.Notification("Started leveling")
	Float XP = GetAttackXP().GetValue()
	Float Level = GetAttackLVL().GetValue()
	
	If XP >= 0 && XP < 83
		GetAttackLVL().SetValue(1)
	ElseIf XP >= 83 && XP < 174
		If Level < 2
			Debug.Notification("You advanced an Attack level! You are now level 2")
			GetAttackLVL().SetValue(2)
		EndIf
	ElseIf XP >= 174 && XP < 276
		If Level < 3
			Debug.Notification("You advanced an Attack level! You are now level 3")
			GetAttackLVL().SetValue(3)
		EndIf
	ElseIf XP >= 276 && XP < 388
		If Level < 4
			Debug.Notification("You advanced an Attack level! You are now level 4")
			GetAttackLVL().SetValue(4)
		EndIf
	ElseIf XP >= 388 && XP < 512
		If Level < 5
			Debug.Notification("You advanced an Attack level! You are now level 5")
			GetAttackLVL().SetValue(5)
		EndIf
	ElseIf XP >= 512 && XP < 650
		If Level < 6
			Debug.Notification("You advanced an Attack level! You are now level 6")
			GetAttackLVL().SetValue(6)
		EndIf
	ElseIf XP >= 650 && XP < 801
		If Level < 7
			Debug.Notification("You advanced an Attack level! You are now level 7")
			GetAttackLVL().SetValue(7)
		EndIf
	ElseIf XP >= 801 && XP < 969
		If Level < 8 
			Debug.Notification("You advanced an Attack level! You are now level 8")
			GetAttackLVL().SetValue(8)
		EndIf
	ElseIf XP >= 969 && XP < 1154
		If level < 9
			Debug.Notification("You advanced an Attack level! You are now level 9")
			GetAttackLVL().SetValue(9)
		EndIf
	ElseIf XP >= 1154 && XP < 1358
		If level < 10
			Debug.Notification("You advanced an Attack level! You are now level 10")
			GetAttackLVL().SetValue(10)
		EndIf
	ElseIf XP >= 1358 && XP < 1584
		If level < 11
			Debug.Notification("You advanced an Attack level! You are now level 11")
			GetAttackLVL().SetValue(11)
		EndIf
	ElseIf XP >= 1584 && XP < 1833
		If Level < 12
			Debug.Notification("You advanced an Attack level! You are now level 12")
			GetAttackLVL().SetValue(12)
		EndIf
	ElseIf XP >= 1833 && XP < 2107
		If level < 13
			Debug.Notification("You advanced an Attack level! You are now level 13")
			GetAttackLVL().SetValue(13)
		EndIf
	ElseIf XP >= 2107 && XP < 2411
		If level < 14
			Debug.Notification("You advanced an Attack level! You are now level 14")
			GetAttackLVL().SetValue(14)
		EndIf
	ElseIf XP >= 2411 && XP < 2746
		If level < 15
			Debug.Notification("You advanced an Attack level! You are now level 15")
			GetAttackLVL().SetValue(15)
		EndIf
	ElseIf XP >= 2746 && XP < 3115
		If level < 16
			Debug.Notification("You advanced an Attack level! You are now level 16")
			GetAttackLVL().SetValue(16)
		EndIf
	ElseIf XP >= 3115 && XP < 3523
		If level < 17
			Debug.Notification("You advanced an Attack level! You are now level 17")
			GetAttackLVL().SetValue(17)
		EndIf
	ElseIf XP >= 3523 && XP < 3973
		If level < 18
			Debug.Notification("You advanced an Attack level! You are now level 18")
			GetAttackLVL().SetValue(18)
		EndIf
	ElseIf XP >= 3973 && XP < 4470
		If level < 19	
			Debug.Notification("You advanced an Attack level! You are now level 19")
			GetAttackLVL().SetValue(19)
		EndIf
	ElseIf XP >= 4470 && XP < 5018
		If level < 20
			Debug.Notification("You advanced an Attack level! You are now level 20")
			GetAttackLVL().SetValue(20)
		EndIf
	ElseIf XP >= 5018 && XP < 5624
		If level < 21
			Debug.Notification("You advanced an Attack level! You are now level 21")
			GetAttackLVL().SetValue(21)
		EndIf
	ElseIf XP >= 5624 && XP < 6291
		If level < 22
			Debug.Notification("You advanced an Attack level! You are now level 22")
			GetAttackLVL().SetValue(22)
		EndIf
	ElseIf XP >= 6291 && XP < 7028
		If level < 23
			Debug.Notification("You advanced an Attack level! You are now level 23")
			GetAttackLVL().SetValue(23)
		EndIf
	ElseIf XP >= 7028 && XP < 7842
		If level < 24
			Debug.Notification("You advanced an Attack level! You are now level 24")
			GetAttackLVL().SetValue(24)
		EndIf
	ElseIf XP >= 7842 && XP < 8740
		If level < 25
			Debug.Notification("You advanced an Attack level! You are now level 25")
			GetAttackLVL().SetValue(25)
		EndIf
	ElseIf XP >= 8740 && XP < 9730
		If level < 26
			Debug.Notification("You advanced an Attack level! You are now level 26")
			GetAttackLVL().SetValue(26)
		EndIf
	ElseIf	XP >= 9730 && XP < 10824
		If level < 27
			Debug.Notification("You advanced an Attack level! You are now level 27")
			GetAttackLVL().SetValue(27)
		EndIf
	ElseIf XP >= 10824 && XP < 12031
		If level < 28
			Debug.Notification("You advanced an Attack level! You are now level 28")
			GetAttackLVL().SetValue(28)
		EndIf
	ElseIf XP >= 12031 && XP < 13363
		If level < 29
			Debug.Notification("You advanced an Attack level! You are now level 29")
			GetAttackLVL().SetValue(29)
		EndIf
	ElseIf XP >= 13363 && XP < 14833
		If level < 30
			Debug.Notification("You advanced an Attack level! You are now level 30")
			GetAttackLVL().SetValue(30)
		EndIf
	ElseIf XP >= 14833 && XP < 16456
		If level < 31
			Debug.Notification("You advanced an Attack level! You are now level 31")
			GetAttackLVL().SetValue(31)
		EndIf
	ElseIf XP >= 16456 && XP < 18247
		If level < 32
			Debug.Notification("You advanced an Attack level! You are now level 32")
			GetAttackLVL().SetValue(32)
		EndIf
	ElseIf XP >= 18247 && XP < 20224
		If level < 33
			Debug.Notification("You advanced an Attack level! You are now level 33")
			GetAttackLVL().SetValue(33)
		EndIf
	ElseIf XP >= 20224 && XP < 22406
		If level < 34
			Debug.Notification("You advanced an Attack level! You are now level 34")
			GetAttackLVL().SetValue(34)
		EndIf
	ElseIf XP >= 22406 && XP < 24815
		If level < 35
			Debug.Notification("You advanced an Attack level! You are now level 35")
			GetAttackLVL().SetValue(35)
		EndIf
	ElseIf XP >= 24815 && XP < 27473
		If level < 36
			Debug.Notification("You advanced an Attack level! You are now level 36")
			GetAttackLVL().SetValue(36)
		EndIf
	ElseIf XP >= 27473 && XP < 30408
		If level < 37
			Debug.Notification("You advanced an Attack level! You are now level 37")
			GetAttackLVL().SetValue(37)
		EndIf
	ElseIf XP >= 30408 && XP < 33648
		If level < 38
			Debug.Notification("You advanced an Attack level! You are now level 38")
			GetAttackLVL().SetValue(38)
		EndIf
	ElseIf XP >= 33648 && XP < 37224
		If level < 39
			Debug.Notification("You advanced an Attack level! You are now level 39")
			GetAttackLVL().SetValue(39)
		EndIf
	ElseIf XP >= 37224 && XP < 41171
		If level < 40
			Debug.Notification("You advanced an Attack level! You are now level 40")
			GetAttackLVL().SetValue(40)
		EndIf
	ElseIf XP >= 41171 && XP < 45529
		If level < 41
			Debug.Notification("You advanced an Attack level! You are now level 41")
			GetAttackLVL().SetValue(41)
		EndIf
	ElseIf XP >= 45529 && XP < 50339
		If level < 42
			Debug.Notification("You advanced an Attack level! You are now level 42")
			GetAttackLVL().SetValue(42)
		EndIf
	ElseIf XP >= 50339 && XP < 55649
		If level < 43
			Debug.Notification("You advanced an Attack level! You are now level 43")
			GetAttackLVL().SetValue(43)
		EndIf
	ElseIf XP >= 55649 && XP < 61512 
		If level < 44
			Debug.Notification("You advanced an Attack level! You are now level 44")
			GetAttackLVL().SetValue(44)
		EndIf
	ElseIf XP >= 61512 && XP < 67983
		If level < 45
			Debug.Notification("You advanced an Attack level! You are now level 45")
			GetAttackLVL().SetValue(45)
		EndIf
	ElseIf XP >= 67983 && XP < 75127
		If level < 46
			Debug.Notification("You advanced an Attack level! You are now level 46")
			GetAttackLVL().SetValue(43)
		EndIf
	ElseIf XP >= 75127 && XP < 83014
		If level < 47
			Debug.Notification("You advanced an Attack level! You are now level 47")
			GetAttackLVL().SetValue(47)
		EndIf
	ElseIf XP >= 83014 && XP < 91721
		If level < 48 
			Debug.Notification("You advanced an Attack level! You are now level 48")
			GetAttackLVL().SetValue(48)
		EndIf
	ElseIf XP >= 91721 && XP < 101333
		If level < 49
			Debug.Notification("You advanced an Attack level! You are now level 49")
			GetAttackLVL().SetValue(49)
		EndIf
	ElseIf XP >= 101333 && XP < 111945
		If level < 50
			Debug.Notification("You advanced an Attack level! You are now level 50")
			GetAttackLVL().SetValue(50)
		EndIf
	ElseIf XP >= 111945 && XP < 123660
		If level < 51
			Debug.Notification("You advanced an Attack level! You are now level 51")
			GetAttackLVL().SetValue(51)
		EndIf
	ElseIf XP >= 123660 && XP < 136594
		If level < 52 
			Debug.Notification("You advanced an Attack level! You are now level 52")
			GetAttackLVL().SetValue(52)
		EndIf
	ElseIf XP >= 136594 && XP < 150872
		If level < 53
			Debug.Notification("You advanced an Attack level! You are now level 53")
			GetAttackLVL().SetValue(53)
		EndIf
	ElseIf XP >= 150872 && XP < 166636
		If level < 54
			Debug.Notification("You advanced an Attack level! You are now level 54")
			GetAttackLVL().SetValue(54)
		EndIf
	ElseIf XP >= 166636 && XP < 184040
		If level < 55
			Debug.Notification("You advanced an Attack level! You are now level 55")
			GetAttackLVL().SetValue(55)
		EndIf
	ElseIf XP >= 184040 && XP < 203254
		If level < 56
			Debug.Notification("You advanced an Attack level! You are now level 56")
			GetAttackLVL().SetValue(56)
		EndIf
	ElseIf XP >= 203254 && XP < 224466
		If level < 57
			Debug.Notification("You advanced an Attack level! You are now level 57")
			GetAttackLVL().SetValue(57)
		EndIf
	ElseIf XP >= 224466 && XP < 247886
		If level < 58
			Debug.Notification("You advanced an Attack level! You are now level 58")
			GetAttackLVL().SetValue(58)
		EndIf
	ElseIf XP >= 247886 && XP < 273742
		If level < 59
			Debug.Notification("You advanced an Attack level! You are now level 59")
			GetAttackLVL().SetValue(59)
		EndIf
	ElseIf XP >= 273742 && XP < 302288
		If level < 60
			Debug.Notification("You advanced an Attack level! You are now level 60")
			GetAttackLVL().SetValue(60)
		EndIf
	ElseIf	XP >= 302288 && XP < 333804 
		If level < 61
			Debug.Notification("You advanced an Attack level! You are now level 61")
			GetAttackLVL().SetValue(61)
		EndIf
	ElseIf XP >= 333804 && XP < 368599
		If level < 62
			Debug.Notification("You advanced an Attack level! You are now level 62")
			GetAttackLVL().SetValue(62)
		EndIf
	ElseIf XP >= 368599 && XP < 407015
		If level < 63
			Debug.Notification("You advanced an Attack level! You are now level 63")
			GetAttackLVL().SetValue(63)
		EndIf
	ElseIf XP >= 407015 && XP < 449428
		If level < 64
			Debug.Notification("You advanced an Attack level! You are now level 64")
			GetAttackLVL().SetValue(64)
		EndIf
	ElseIf XP >= 449428 && XP < 496254
		If level < 65
			Debug.Notification("You advanced an Attack level! You are now level 65")
			GetAttackLVL().SetValue(65)
		EndIf
	ElseIf XP >= 496254 && XP < 547953
		If level < 66
			Debug.Notification("You advanced an Attack level! You are now level 66")
			GetAttackLVL().SetValue(66)
		EndIf
	ElseIf XP >= 547953 && XP < 605032
		If level < 67
			Debug.Notification("You advanced an Attack level! You are now level 67")
			GetAttackLVL().SetValue(67)
		EndIf
	ElseIf XP >= 605032 && XP < 668051
		If level < 68
			Debug.Notification("You advanced an Attack level! You are now level 68")
			GetAttackLVL().SetValue(68)
		EndIf
	ElseIf XP >= 668051 && XP < 737627
		If level < 69
			Debug.Notification("You advanced an Attack level! You are now level 69")
			GetAttackLVL().SetValue(69)
		EndIf
	ElseIf XP >= 737627 && XP < 814445
		If level < 70
			Debug.Notification("You advanced an Attack level! You are now level 70")
			GetAttackLVL().SetValue(70)
		EndIf
	ElseIf XP >= 814445 && XP < 899257
		If level < 71
			Debug.Notification("You advanced an Attack level! You are now level 71")
			GetAttackLVL().SetValue(71)
		EndIf
	ElseIf XP >= 899257 && XP < 992895
		If level < 72 
			Debug.Notification("You advanced an Attack level! You are now level 72")
			GetAttackLVL().SetValue(72)
		EndIf
	ElseIf XP >= 992895 && XP < 1096278
		If level < 73
			Debug.Notification("You advanced an Attack level! You are now level 73")
			GetAttackLVL().SetValue(73)
		EndIf
	ElseIf XP >= 1096278 && XP < 1210421
		If level < 74
			Debug.Notification("You advanced an Attack level! You are now level 74")
			GetAttackLVL().SetValue(74)
		EndIf
	ElseIf XP >= 1210421 && XP < 1336443
		If level < 75
			Debug.Notification("You advanced an Attack level! You are now level 75")
			GetAttackLVL().SetValue(75)
		EndIf
	ElseIf XP >= 1336443 && XP < 1475581
		If level < 76
			Debug.Notification("You advanced an Attack level! You are now level 76")
			GetAttackLVL().SetValue(76)
		EndIf
	ElseIf XP >= 1475581 && XP < 1629200
		If level < 77
			Debug.Notification("You advanced an Attack level! You are now level 77")
			GetAttackLVL().SetValue(77)
		EndIf
	ElseIf XP >= 1629200 && XP < 1798808
		If level < 78
			Debug.Notification("You advanced an Attack level! You are now level 78")
			GetAttackLVL().SetValue(78)
		EndIf
	ElseIf XP >= 1798808 && XP < 1986068
		If level < 79
			Debug.Notification("You advanced an Attack level! You are now level 79")
			GetAttackLVL().SetValue(79)
		EndIf
	ElseIf XP >= 1986068 && XP < 2192818
		If level < 80
			Debug.Notification("You advanced an Attack level! You are now level 80")
			GetAttackLVL().SetValue(80)
		EndIf
	ElseIf XP >= 2192818 && XP < 2421087 
		If level < 81
			Debug.Notification("You advanced an Attack level! You are now level 81")
			GetAttackLVL().SetValue(81)
		EndIf
	ElseIf XP >= 2421087 && XP < 2673114
		If level < 82
			Debug.Notification("You advanced an Attack level! You are now level 82")
			GetAttackLVL().SetValue(82)
		EndIf
	ElseIf XP >= 2673114 && XP < 2951373
		If level < 83
			Debug.Notification("You advanced an Attack level! You are now level 83")
			GetAttackLVL().SetValue(83)
		EndIf
	ElseIf XP >= 2951373 && XP < 3258594
		If level < 84
			Debug.Notification("You advanced an Attack level! You are now level 84")
			GetAttackLVL().SetValue(84)
		EndIf
	ElseIf XP >= 3258594 && XP < 3597792
		If level < 85
			Debug.Notification("You advanced an Attack level! You are now level 85")
			GetAttackLVL().SetValue(85)
		EndIf
	ElseIf XP >= 3597792 && XP < 3972294
		If level < 86
			Debug.Notification("You advanced an Attack level! You are now level 86")
			GetAttackLVL().SetValue(86)
		EndIf
	ElseIf XP >= 3972294 && XP < 4385776
		If level < 87
			Debug.Notification("You advanced an Attack level! You are now level 87")
			GetAttackLVL().SetValue(87)
		EndIf
	ElseIf XP >= 4385776 && XP < 4842295
		If level < 88
			Debug.Notification("You advanced an Attack level! You are now level 88")
			GetAttackLVL().SetValue(88)
		EndIf
	ElseIf XP >= 4842295 && XP < 5346332
		If level < 89
			Debug.Notification("You advanced an Attack level! You are now level 89")
			GetAttackLVL().SetValue(89)
		EndIf
	ElseIf XP >= 5346332 && XP < 5902831
		If level < 90 
			Debug.Notification("You advanced an Attack level! You are now level 90")
			GetAttackLVL().SetValue(90)
		EndIf
	ElseIf XP >= 6902831 && XP < 6517253
		If level < 91
			Debug.Notification("You advanced an Attack level! You are now level 91")
			GetAttackLVL().SetValue(91)
		EndIf
	ElseIf XP >= 6517253 && XP < 7195629
		If level < 92
			Debug.Notification("You advanced an Attack level! You are now level 92")
			GetAttackLVL().SetValue(92)
		EndIf
	ElseIf XP >= 7195629 && XP < 7944614
		If level < 93
			Debug.Notification("You advanced an Attack level! You are now level 93")
			GetAttackLVL().SetValue(93)
		EndIf
	ElseIf XP >= 7944614 && XP < 8771558
		If level < 94
			Debug.Notification("You advanced an Attack level! You are now level 94")
			GetAttackLVL().SetValue(94)
		EndIf
	ElseIf XP >= 8771558 && XP < 9684577
		If level < 95
			Debug.Notification("You advanced an Attack level! You are now level 95")
			GetAttackLVL().SetValue(95)
		EndIf
	ElseIf XP >= 9684577 && XP < 10692629
		If level < 96 
			Debug.Notification("You advanced an Attack level! You are now level 96")
			GetAttackLVL().SetValue(96)
		EndIf
	ElseIf XP >= 10692629 && XP < 11805606
		If level < 97
			Debug.Notification("You advanced an Attack level! You are now level 97")
			GetAttackLVL().SetValue(97)
		EndIf
	ElseIf XP >= 11805606 && XP < 13034431
		If level < 98
			Debug.Notification("You advanced an Attack level! You are now level 98")
			GetAttackLVL().SetValue(98)
		EndIf
	ElseIf XP >= 13034431
		If level < 99
			Debug.Notification("You advanced an Attack level! You are now level 99!")
			GetAttackLVL().SetValue(99)
		EndIf
	EndIf
EndFunction

Function LevelCheckStrength() Global
EndFunction

Function LevelCheckDefence() Global
EndFunction

Function LevelCheckConstitution() Global
EndFunction

Function LevelCheckRanged() Global
EndFunction

Function LevelCheckPrayer() Global
EndFunction

Function LevelCheckMagic() Global
EndFunction

Function LevelCheckCooking() Global
EndFunction

Function LevelCheckWoodcutting() Global
EndFunction

Function LevelCheckFletching() Global
EndFunction

Function LevelCheckFishing() Global
EndFunction

Function LevelCheckFiremaking() Global
EndFunction

Function LevelCheckCrafting() Global
EndFunction

Function LevelCheckSmithing() Global
EndFunction

Function LevelCheckMining() Global
EndFunction

Function LevelCheckHerblore() Global
EndFunction

Function LevelCheckAgility() Global
EndFunction

Function LevelCheckThieving() Global
EndFunction

Function LevelCheckSlayer() Global
EndFunction

Function LevelCheckFarming() Global
EndFunction

Function LevelCheckRunecrafting() Global
EndFunction

Function LevelCheckHunter() Global
EndFunction

Function LevelCheckConstruction() Global
EndFunction

Function LevelCheckSummoning() Global
EndFunction

Function LevelCheckDungeoneering() Global
EndFunction

Function LevelCheckDivination() Global
EndFunction

Function LevelCheckInvention() Global
EndFunction

