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
Spell Property RS_Spell_SmokeRush_Poison Auto
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
Float XPM = 1.0
;;;;;;;;;;;;;;;;;;;
;;               ;; 
;;;;;;;;;;;;;;;;;;;
;
;;
;;;
;;;;
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;; Spell Calculations ;;
;;;;;;;;;;;;;;;;;;;;;;;;
Function SmokeRush(Actor akCaster, Actor akTarget, Spell akSpell)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
		Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
		Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
		If AirRuneCt < 1 || FireRuneCt < 1 || ChaosRuneCt < 2 || DeathRuneCt < 2
			Game.GetPlayer().UnequipSpell(SmokeRush, 0)
			Game.GetPlayer().UnequipSpell(SmokeRush, 1)
		Else
			Int Poison = Utility.RandomInt(0,1)
				If Poison == 1
					Game.GetPlayer().RemoveItem(AirRune, 1)
					Game.GetPlayer().RemoveItem(FireRune, 1)
					Game.GetPlayer().RemoveItem(ChaosRune, 2)
					Game.GetPlayer().RemoveItem(DeathRune, 2)
					
					Int dam = Utility.RandomInt(1,13)
					
					akTarget.DamageAV("Health", dam)
					akTarget.AddSpell(RS_Spell_SmokeRush_Poison)
					
					Float BaseXP = 30
					Float MMXP = ((BaseXP) + dam * XPM)
				Else
					Game.GetPlayer().RemoveItem(AirRune, 1)
					Game.GetPlayer().RemoveItem(FireRune, 1)
					Game.GetPlayer().RemoveItem(ChaosRune, 2)
					Game.GetPlayer().RemoveItem(DeathRune, 2)
					
					Int dam = Utility.RandomInt(1,13)
					
					akTarget.DamageAV("Health", dam)
					
					Float BaseXP = 30
					Float MMXP = ((BaseXP) + dam * XPM)
			EndIf
		EndIf
	EndIf

EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;
;;                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;