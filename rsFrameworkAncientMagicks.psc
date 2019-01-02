Scriptname rsFrameworkAncientMagicks extends Quest 
{Main framework for Ancient Magicks
handling XP, Damage and Damage effects}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Call to main RsFrameworkMenu ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rsFrameworkMenu Function GetFrameworkMenu() Global
	Return (Game.GetFormFromFile(0x294A97, "Skyscape.esm") as Quest) as rsFrameworkMenu
EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;
;;;
;;
;
;;
;;;
;;;;
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MiscObject Variables ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
MiscObject Property AirRune Auto
MiscObject Property WaterRune Auto
MiscObject Property EarthRune Auto
MiscObject Property FireRune Auto
MiscObject Property ChaosRune Auto
MiscObject Property DeathRune Auto
MiscObject Property BloodRune Auto
MiscObject Property SoulRune Auto
;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;
;;;
;;
;
;;
;;;
;;;;
;;;;;
;;;;;;;;;;;;;;;;;;;;;
;; Spell Variables ;;
;;;;;;;;;;;;;;;;;;;;;
Spell Property SmokeRush Auto
Spell Property SmokeBurst Auto
Spell Property SmokeBlitz Auto
Spell Property SmokeBarrage Auto
Spell Property ShadowRush Auto
Spell Property ShadowBurst Auto
Spell Property ShadowBlitz Auto
Spell Property ShadowBarrage Auto
Spell Property BloodRush Auto
Spell Property BloodBurst Auto
Spell Property BloodBlitz Auto
Spell Property BloodBarrage Auto
Spell Property IceRush Auto
Spell Property IceBurst Auto
Spell Property IceBlitz Auto
Spell Property IceBarrage Auto
Spell Property SmokeRushPoison Auto
Spell Property SmokeBlitzPoison Auto
;;;;;;;;;;;;;;;;;;;;;
;;                 ;;
;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;
;;;
;;
;
;;
;;;
;;;;
;;;;;
;;;;;;;;;;;;;;;;;;;
;; XP Multiplier ;;
;;;;;;;;;;;;;;;;;;;
Float XPM = 100.0
;;;;;;;;;;;;;;;;;;;
;;               ;; 
;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;
;;;
;;
;
;;
;;;
;;;;
;;;;;          
;;;;;;;;;;;;;;;;;;;;;;;;
;; Spell Calculations ;;
;;;;;;;;;;;;;;;;;;;;;;;;
Function SmokeRushFunc(Actor akTarget)

		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
		Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
		Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
		If AirRuneCt < 1 || FireRuneCt < 1 || ChaosRuneCt < 2 || DeathRuneCt < 2
			Game.GetPlayer().UnequipSpell(SmokeRush, 0)
			Game.GetPlayer().UnequipSpell(SmokeRush, 1)
			Debug.Notification("You lack the required runes")
		Else
			Int Poison = Utility.RandomInt(0,1)
				If Poison == 1
					Game.GetPlayer().RemoveItem(AirRune, 1)
					Game.GetPlayer().RemoveItem(FireRune, 1)
					Game.GetPlayer().RemoveItem(ChaosRune, 2)
					Game.GetPlayer().RemoveItem(DeathRune, 2)
					
					Int dam = Utility.RandomInt(1,13)
					
					akTarget.DamageAV("Health", dam)
					akTarget.AddSpell(SmokeRushPoison)
					
					Debug.Notification("The enemy is poisoned")
					
					Float BaseXP = 30
					Float MMXP = (((BaseXP) + dam) * XPM)
					rsFrameworkMenu.rsXPGain("magic", MMXP)
					rsFrameworkMenu.rsXPGain("constitution", mmxp / 4)
				Else
					Game.GetPlayer().RemoveItem(AirRune, 1)
					Game.GetPlayer().RemoveItem(FireRune, 1)
					Game.GetPlayer().RemoveItem(ChaosRune, 2)
					Game.GetPlayer().RemoveItem(DeathRune, 2)
					
					Int dam = Utility.RandomInt(1,13)
					
					akTarget.DamageAV("Health", dam)
					
					Float BaseXP = 30
					Float MMXP = (((BaseXP) + dam) * XPM)
					rsFrameworkMenu.rsXPGain("magic", MMXP)
					rsFrameworkMenu.rsXPGain("constitution", mmxp / 4)
			EndIf
		EndIf


EndFunction

Function SmokeBurstFunc(Actor akTarget)

		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
		Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
		Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
		If AirRuneCt < 2 || FireRuneCt < 2|| ChaosRuneCt < 4 || DeathRuneCt < 2
			Game.GetPlayer().UnequipSpell(SmokeRush, 0)
			Game.GetPlayer().UnequipSpell(SmokeRush, 1)
			Debug.Notification("You lack the required runes")
		Else
			Int Poison = Utility.RandomInt(0,1)
				If Poison == 1
					Game.GetPlayer().RemoveItem(AirRune, 2)
					Game.GetPlayer().RemoveItem(FireRune, 2)
					Game.GetPlayer().RemoveItem(ChaosRune, 4)
					Game.GetPlayer().RemoveItem(DeathRune, 2)
					
					Int dam = Utility.RandomInt(1,17)
					
					akTarget.DamageAV("Health", dam)
					akTarget.AddSpell(SmokeRushPoison)
					
					Debug.Notification("The enemy is poisoned")
					
					Float BaseXP = 42
					Float MMXP = ((BaseXP) + dam * XPM)
					rsFrameworkMenu.rsXPGain("magic", MMXP)
					rsFrameworkMenu.rsXPGain("constitution", mmxp / 4)
				Else
					Game.GetPlayer().RemoveItem(AirRune, 2)
					Game.GetPlayer().RemoveItem(FireRune, 2)
					Game.GetPlayer().RemoveItem(ChaosRune, 4)
					Game.GetPlayer().RemoveItem(DeathRune, 2)
					
					Int dam = Utility.RandomInt(1,17)
					
					akTarget.DamageAV("Health", dam)
					
					Float BaseXP = 42
					Float MMXP = ((BaseXP) + dam * XPM)
					rsFrameworkMenu.rsXPGain("magic", MMXP)
					rsFrameworkMenu.rsXPGain("constitution", mmxp / 4)
			EndIf
		EndIf


EndFunction

Function SmokeBlitzFunc(Actor akTarget)

		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
		Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
		Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
		If AirRuneCt < 2 || FireRuneCt < 2|| BloodRuneCt < 4 || DeathRuneCt < 2
			Game.GetPlayer().UnequipSpell(SmokeRush, 0)
			Game.GetPlayer().UnequipSpell(SmokeRush, 1)
			Debug.Notification("You lack the required runes")
		Else
			Int Poison = Utility.RandomInt(0,1)
				If Poison == 1
					Game.GetPlayer().RemoveItem(AirRune, 2)
					Game.GetPlayer().RemoveItem(FireRune, 2)
					Game.GetPlayer().RemoveItem(BloodRune, 2)
					Game.GetPlayer().RemoveItem(DeathRune, 2)
					
					Int dam = Utility.RandomInt(1,23)
					
					akTarget.DamageAV("Health", dam)
					akTarget.AddSpell(SmokeBlitzPoison)
					
					Debug.Notification("The enemy is poisoned")
					
					Float BaseXP = 36
					Float MMXP = ((BaseXP) + dam * XPM)
					rsFrameworkMenu.rsXPGain("magic", MMXP)
					rsFrameworkMenu.rsXPGain("constitution", mmxp / 4)
				Else
					Game.GetPlayer().RemoveItem(AirRune, 2)
					Game.GetPlayer().RemoveItem(FireRune, 2)
					Game.GetPlayer().RemoveItem(BloodRune, 2)
					Game.GetPlayer().RemoveItem(DeathRune, 2)
					
					Int dam = Utility.RandomInt(1,23)
					
					akTarget.DamageAV("Health", dam)
					
					Float BaseXP = 36
					Float MMXP = ((BaseXP) + dam * XPM)
					rsFrameworkMenu.rsXPGain("magic", MMXP)
					rsFrameworkMenu.rsXPGain("constitution", mmxp / 4)
			EndIf
		EndIf


EndFunction

Function SmokeBarrageFunc(Actor akTarget)

		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
		Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
		Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
		If AirRuneCt < 4 || FireRuneCt < 4|| BloodRuneCt < 4 || DeathRuneCt < 4
			Game.GetPlayer().UnequipSpell(SmokeRush, 0)
			Game.GetPlayer().UnequipSpell(SmokeRush, 1)
			Debug.Notification("You lack the required runes")
		Else
			Int Poison = Utility.RandomInt(0,1)
				If Poison == 1
					Game.GetPlayer().RemoveItem(AirRune, 4)
					Game.GetPlayer().RemoveItem(FireRune, 4)
					Game.GetPlayer().RemoveItem(BloodRune, 2)
					Game.GetPlayer().RemoveItem(DeathRune, 4)
					
					Int dam = Utility.RandomInt(1,27)
					
					akTarget.DamageAV("Health", dam)
					akTarget.AddSpell(SmokeBlitzPoison)
					
					Debug.Notification("The enemy is poisoned")
					
					Float BaseXP = 48
					Float MMXP = ((BaseXP) + dam * XPM)
					rsFrameworkMenu.rsXPGain("magic", MMXP)
					rsFrameworkMenu.rsXPGain("constitution", mmxp / 4)
				Else
					Game.GetPlayer().RemoveItem(AirRune, 4)
					Game.GetPlayer().RemoveItem(FireRune, 4)
					Game.GetPlayer().RemoveItem(BloodRune, 2)
					Game.GetPlayer().RemoveItem(DeathRune, 4)
					
					Int dam = Utility.RandomInt(1,27)
					
					akTarget.DamageAV("Health", dam)
					
					Float BaseXP = 48
					Float MMXP = ((BaseXP) + dam * XPM)
					rsFrameworkMenu.rsXPGain("magic", MMXP)
					rsFrameworkMenu.rsXPGain("constitution", mmxp / 4)
			EndIf
		EndIf


EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;
;;                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;