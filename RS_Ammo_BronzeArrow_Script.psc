Scriptname RS_Ammo_BronzeArrow_Script extends ActiveMagicEffect
{Bronze arrow script}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Attach this script to an Enchanment ;;
;; then attach the Enchanment to       ;;
;; all of the RS_Weapon_Bow_xx         ;;
;; weapons in the CK                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Actor Property PlayerRef Auto

Ammo Property RS_Ammo_Arrow_Bronze Auto
Ammo Property RS_Ammo_Arrow_Iron Auto
Ammo Property RS_Ammo_Arrow_Steel Auto
Ammo Property RS_Ammo_Arrow_Mithril Auto
Ammo Property RS_Ammo_Arrow_Adamant Auto
Ammo Property RS_Ammo_Arrow_Rune Auto

rsFrameworkMenu Function GetFrameworkMenu() Global
	Return (Game.GetFormFromFile(0x294A97, "Skyscape.esm") as Quest) as rsFrameworkMenu
EndFunction

Function OnEffectStart(Actor akTarget, Actor akCaster)

		StartArrowCheck()

EndFunction 

Int XPMultiplier = 1

Function StartArrowCheck()
	
	If Game.GetPlayer().IsEquipped(RS_Ammo_Arrow_Bronze) == True
		StartBronze()
	ElseIf Game.GetPlayer().IsEquipped(RS_Ammo_Arrow_Iron) == True
		StartIron()
	ElseIf Game.GetPlayer().IsEquipped(RS_Ammo_Arrow_Steel) == True
		StartSteel()
	ElseIf Game.GetPlayer().IsEquipped(RS_Ammo_Arrow_Mithril) == True
		StartMithril()
	ElseIf Game.GetPlayer().IsEquipped(RS_Ammo_Arrow_Adamant) == True
		StartAdamant()
	ElseIf Game.GetPlayer().IsEquipped(RS_Ammo_Arrow_Rune) == True
		StartRune()
	EndIf
	
EndFunction 

Function StartBronze()

	Actor akTarget = self.GetTargetActor()
	
	akTarget.StartCombat(PlayerRef)
	
	Int Damage = Utility.RandomInt(0,2)
	
	akTarget.DamageAV("Health", Damage)
	
	Float XP = Damage * 4 * XPMultiplier
	rsFrameworkMenu.rsXPGain("ranged", XP)
	rsFrameworkMenu.rsXPGain("constitution", XP / 4)
	
EndFunction 

Function StartIron()

	Actor akTarget = self.GetTargetActor()
	
	akTarget.StartCombat(PlayerRef)
	
	Int Damage = Utility.RandomInt(0,4)
	
	akTarget.DamageAV("Health", Damage)
	
	Float XP = Damage * 4 * XPMultiplier
	rsFrameworkMenu.rsXPGain("ranged", XP)
	rsFrameworkMenu.rsXPGain("constitution", XP / 4)
	
EndFunction 

Function StartSteel()

	Actor akTarget = self.GetTargetActor()
	
	akTarget.StartCombat(PlayerRef)
	
	Int Damage = Utility.RandomInt(0,6)
	
	akTarget.DamageAV("Health", Damage)
	
	Float XP = Damage * 4 * XPMultiplier
	rsFrameworkMenu.rsXPGain("ranged", XP)
	rsFrameworkMenu.rsXPGain("constitution", XP / 4)
	
EndFunction 

Function StartMithril()

	Actor akTarget = self.GetTargetActor()
	
	akTarget.StartCombat(PlayerRef)
	
	Int Damage = Utility.RandomInt(0,8)
	
	akTarget.DamageAV("Health", Damage)
	
	Float XP = Damage * 4 * XPMultiplier
	rsFrameworkMenu.rsXPGain("ranged", XP)
	rsFrameworkMenu.rsXPGain("constitution", XP / 4)
	
EndFunction 

Function StartAdamant()

	Actor akTarget = self.GetTargetActor()
	
	akTarget.StartCombat(PlayerRef)
	
	Int Damage = Utility.RandomInt(0,10)
	
	akTarget.DamageAV("Health", Damage)
	
	Float XP = Damage * 4 * XPMultiplier
	rsFrameworkMenu.rsXPGain("ranged", XP)
	rsFrameworkMenu.rsXPGain("constitution", XP / 4)
	
EndFunction

Function StartRune()

	Actor akTarget = self.GetTargetActor()
	
	akTarget.StartCombat(PlayerRef)
	
	Int Damage = Utility.RandomInt(0,12)
	
	akTarget.DamageAV("Health", Damage)
	
	Float XP = Damage * 4 * XPMultiplier
	rsFrameworkMenu.rsXPGain("ranged", XP)
	rsFrameworkMenu.rsXPGain("constitution", XP / 4)
	
EndFunction 