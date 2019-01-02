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
Spell Property IceRushFreeze Auto
Spell Property IceBurstFreeze Auto
Spell Property IceBlitzFreeze Auto
Spell Property IceBarrageFreeze Auto
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
;; Smoke Calculations ;;
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
			Game.GetPlayer().UnequipSpell(SmokeBurst, 0)
			Game.GetPlayer().UnequipSpell(SmokeBurst, 1)
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
			Game.GetPlayer().UnequipSpell(SmokeBlitz, 0)
			Game.GetPlayer().UnequipSpell(SmokeBlitz, 1)
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
			Game.GetPlayer().UnequipSpell(SmokeBarrage, 0)
			Game.GetPlayer().UnequipSpell(SmokeBarrage, 1)
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
;;;;;
;;;;
;;;
;;
;
;;
;;;
;;;;
;;;;;
;;;;;;;;;;;;;;;;;;;;;;
;; Ice Calculations ;;
;;;;;;;;;;;;;;;;;;;;;;
Function BloodRushFunc(Actor akTarget)

	Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
	Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
	Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
	If ChaosRuneCt < 2 || DeathRuneCt < 2 || BloodRuneCt < 1
		Game.GetPlayer().UnequipSpell(BloodRush, 0)
		Game.GetPlayer().UnequipSpell(BloodRush, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(ChaosRune, 2)
		Game.GetPlayer().RemoveItem(DeathRune, 2)
		Game.GetPlayer().RemoveItem(BloodRune, 1)
		
		Int dam = Utility.RandomInt(1,15)
		
		akTarget.DamageAV("Health", dam)
		Game.GetPlayer().RestoreActorValue("Health", dam / 4)
		
		Float BaseXP = 33
		Float MMXP = ((BaseXP) + dam)
		
		rsFrameworkMenu.rsXPGain("magic", MMXP)
		rsFrameworkMenu.rsXPGain("constitution", MMXP)
	EndIf

EndFunction
		
Function BloodBurstFunc(Actor akTarget)

	Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
	Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
	Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
	If ChaosRuneCt < 4 || DeathRuneCt < 2 || BloodRuneCt < 2
		Game.GetPlayer().UnequipSpell(BloodBurst, 0)
		Game.GetPlayer().UnequipSpell(BloodBurst, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(ChaosRune, 4)
		Game.GetPlayer().RemoveItem(DeathRune, 2)
		Game.GetPlayer().RemoveItem(BloodRune, 2)
		
		Int dam = Utility.RandomInt(1,21)
		
		akTarget.DamageAV("Health", dam)
		Game.GetPlayer().RestoreActorValue("Health", dam / 4)
		
		Float BaseXP = 39
		Float MMXP = ((BaseXP) + dam)
		
		rsFrameworkMenu.rsXPGain("magic", MMXP)
		rsFrameworkMenu.rsXPGain("constitution", MMXP)
	EndIf

EndFunction	

Function BloodBlitzFunc(Actor akTarget)

	Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
	Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
	If DeathRuneCt < 2 || BloodRuneCt < 4
		Game.GetPlayer().UnequipSpell(BloodBlitz, 0)
		Game.GetPlayer().UnequipSpell(BloodBlitz, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(DeathRune, 2)
		Game.GetPlayer().RemoveItem(BloodRune, 4)
		
		Int dam = Utility.RandomInt(1,25)
		
		akTarget.DamageAV("Health", dam)
		Game.GetPlayer().RestoreActorValue("Health", dam / 4)
		
		Float BaseXP = 45
		Float MMXP = ((BaseXP) + dam)
		
		rsFrameworkMenu.rsXPGain("magic", MMXP)
		rsFrameworkMenu.rsXPGain("constitution", MMXP)
	EndIf

EndFunction	

Function BloodBarrageFunc(Actor akTarget)

	Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
	Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
	Int SoulRuneCt = Game.GetPlayer().GetItemCount(SoulRune)
	If DeathRuneCt < 2 || BloodRuneCt < 4 || SoulRuneCt < 1
		Game.GetPlayer().UnequipSpell(BloodBarrage, 0)
		Game.GetPlayer().UnequipSpell(BloodBarrage, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(DeathRune, 4)
		Game.GetPlayer().RemoveItem(BloodRune, 4)
		Game.GetPlayer().RemoveItem(SoulRune, 1)
		
		Int dam = Utility.RandomInt(1,29)
		
		akTarget.DamageAV("Health", dam)
		Game.GetPlayer().RestoreActorValue("Health", dam / 4)
		
		Float BaseXP = 51
		Float MMXP = ((BaseXP) + dam)
		
		rsFrameworkMenu.rsXPGain("magic", MMXP)
		rsFrameworkMenu.rsXPGain("constitution", MMXP)
	EndIf

EndFunction	
;;;;;;;;;;;;;;;;;;;;;;
;;                  ;;
;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;
;;;
;;
;
;;
;;;
;;;;
;;;;;
;;;;;;;;;;;;;;;;;;;;;;
;; Ice Calculations ;;
;;;;;;;;;;;;;;;;;;;;;;
Function IceRushFunc(Actor akTarget)
	Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
	Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
	Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
	If WaterRuneCt < 2 || ChaosRuneCt < 2 || DeathRuneCt < 2
		Game.GetPlayer().UnequipSpell(IceRush, 0)
		Game.GetPlayer().UnequipSpell(IceRush, 1)
		Debug.Notification("You lack the required runes")
	Else
		
		Int Freeze = Utility.RandomInt(1,20)
		
			If Freeze > 15
				Game.GetPlayer().RemoveItem(WaterRune, 2)
				Game.GetPlayer().RemoveItem(ChaosRune, 2)
				Game.GetPlayer().RemoveItem(DeathRune, 2)
				
				Int dam = Utility.RandomInt(1,16)
				
				akTarget.DamageAV("Health", dam)
				akTarget.AddSpell(IceRushFreeze)
				
				Float BaseXP = 34
				Float MMXP = ((BaseXP) + dam)
				
				rsFrameworkMenu.rsXPGain("magic", MMXP)
				rsFrameworkMenu.rsXPGain("constitution", MMXP / 4)
				
				Debug.Notification("Your target is frozen")
			Else
				Game.GetPlayer().RemoveItem(WaterRune, 2)
				Game.GetPlayer().RemoveItem(ChaosRune, 2)
				Game.GetPlayer().RemoveItem(DeathRune, 2)
				
				Int dam = Utility.RandomInt(1,16)
				
				akTarget.DamageAV("Health", dam)
				
				Float BaseXP = 34
				Float MMXP = ((BaseXP) + dam)
				
				rsFrameworkMenu.rsXPGain("magic", MMXP)
				rsFrameworkMenu.rsXPGain("constitution", MMXP / 4)
			EndIf
	EndIf
	
EndFunction

Function IceBurstFunc(Actor akTarget)
	Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
	Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
	Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
	If WaterRuneCt < 4 || ChaosRuneCt < 4 || DeathRuneCt < 2
		Game.GetPlayer().UnequipSpell(IceBurst, 0)
		Game.GetPlayer().UnequipSpell(IceBurst, 1)
		Debug.Notification("You lack the required runes")
	Else

		Int Freeze = Utility.RandomInt(1,20)
		
			If Freeze > 15
				Game.GetPlayer().RemoveItem(WaterRune, 4)
				Game.GetPlayer().RemoveItem(ChaosRune, 4)
				Game.GetPlayer().RemoveItem(DeathRune, 2)
				
				Int dam = Utility.RandomInt(1,22)
				
				akTarget.DamageAV("Health", dam)
				akTarget.AddSpell(IceBurstFreeze)
				
				Float BaseXP = 40
				Float MMXP = ((BaseXP) + dam)
				
				rsFrameworkMenu.rsXPGain("magic", MMXP)
				rsFrameworkMenu.rsXPGain("constitution", MMXP / 4)
				
				Debug.Notification("Your target is frozen")
			Else
				Game.GetPlayer().RemoveItem(WaterRune, 4)
				Game.GetPlayer().RemoveItem(ChaosRune, 4)
				Game.GetPlayer().RemoveItem(DeathRune, 2)
				
				Int dam = Utility.RandomInt(1,22)
				
				akTarget.DamageAV("Health", dam)
				
				Float BaseXP = 40
				Float MMXP = ((BaseXP) + dam)
				
				rsFrameworkMenu.rsXPGain("magic", MMXP)
				rsFrameworkMenu.rsXPGain("constitution", MMXP / 4)
			EndIf
	EndIf
	
EndFunction

Function IceBlitzFunc(Actor akTarget)
	Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
	Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
	Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
	If WaterRuneCt < 3 || BloodRuneCt < 2 || DeathRuneCt < 2
		Game.GetPlayer().UnequipSpell(IceBlitz, 0)
		Game.GetPlayer().UnequipSpell(IceBlitz, 1)
		Debug.Notification("You lack the required runes")
	Else
		
		Int Freeze = Utility.RandomInt(1,20)
		
		If Freeze > 15
			Game.GetPlayer().RemoveItem(WaterRune, 3)
			Game.GetPlayer().RemoveItem(BloodRune, 2)
			Game.GetPlayer().RemoveItem(DeathRune, 2)
		
			Int dam = Utility.RandomInt(1,26)
			
			akTarget.DamageAV("Health", dam)
			akTarget.AddSpell(IceBlitzFreeze)
			
			Float BaseXP = 46
			Float MMXP = ((BaseXP) + dam)
			
			rsFrameworkMenu.rsXPGain("magic", MMXP)
			rsFrameworkMenu.rsXPGain("constitution", MMXP / 4)
			
			Debug.Notification("Your target is frozen")
		Else
			Game.GetPlayer().RemoveItem(WaterRune, 3)
			Game.GetPlayer().RemoveItem(BloodRune, 2)
			Game.GetPlayer().RemoveItem(DeathRune, 2)
			Int dam = Utility.RandomInt(1,26)
			
			akTarget.DamageAV("Health", dam)
			
			Float BaseXP = 46
			Float MMXP = ((BaseXP) + dam)
			
			rsFrameworkMenu.rsXPGain("magic", MMXP)
			rsFrameworkMenu.rsXPGain("constitution", MMXP / 4)
		EndIf
	EndIf
	
EndFunction

Function IceBarrageFunc(Actor akTarget)
	Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
	Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
	Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
	If WaterRuneCt < 6 || BloodRuneCt < 2 || DeathRuneCt < 4
		Game.GetPlayer().UnequipSpell(IceBarrage, 0)
		Game.GetPlayer().UnequipSpell(IceBarrage, 1)
		Debug.Notification("You lack the required runes")
	Else
		
		Int Freeze = Utility.RandomInt(1,20)
		
		If Freeze > 15
			Game.GetPlayer().RemoveItem(WaterRune, 6)
			Game.GetPlayer().RemoveItem(BloodRune, 2)
			Game.GetPlayer().RemoveItem(DeathRune, 4)
			Int dam = Utility.RandomInt(1,30)
			
			akTarget.DamageAV("Health", dam)
			akTarget.AddSpell(IceBarrageFreeze)
			
			Float BaseXP = 52
			Float MMXP = ((BaseXP) + dam)
			
			rsFrameworkMenu.rsXPGain("magic", MMXP)
			rsFrameworkMenu.rsXPGain("constitution", MMXP / 4)
			
			Debug.Notification("Your target is frozen")
		Else
			Game.GetPlayer().RemoveItem(WaterRune, 6)
			Game.GetPlayer().RemoveItem(BloodRune, 2)
			Game.GetPlayer().RemoveItem(DeathRune, 4)
			Int dam = Utility.RandomInt(1,30)
			
			akTarget.DamageAV("Health", dam)
			
			Float BaseXP = 52
			Float MMXP = ((BaseXP) + dam)
			
			rsFrameworkMenu.rsXPGain("magic", MMXP)
			rsFrameworkMenu.rsXPGain("constitution", MMXP / 4)
		EndIf
	EndIf
	
EndFunction
;;;;;;;;;;;;;;;;;;;;;;
;;                  ;;
;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;
;;;
;;
;
;;
;;;
;;;;
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shadow Calculations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;;                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;