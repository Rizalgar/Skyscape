Scriptname rsFrameworkMagicXP extends Quest  
{Framework handling magic xp gains constitution xp gains and damage also checks for missing spells}

rsFrameworkMenu Function GetFrameworkMenu() Global
	Return (Game.GetFormFromFile(0x294A97, "Skyscape.esm") as Quest) as rsFrameworkMenu
EndFunction

;;;;;;;;;;;;;;;;;;;;;;
;; Global Variables ;;
;;;;;;;;;;;;;;;;;;;;;;
;;
ObjectReference Property FalMarker Auto
ObjectReference Property VarMarker Auto
ObjectReference Property LumMarker Auto
;;
MiscObject Property AirRune Auto
MiscObject Property WaterRune Auto
MiscObject Property EarthRune Auto
MiscObject Property FireRune Auto
MiscObject Property MindRune Auto
MiscObject Property ChaosRune Auto
MiscObject Property DeathRune Auto
MiscObject Property BloodRune Auto
MiscObject Property WrathRune Auto
MiscObject Property BodyRune Auto
MiscObject Property NatureRune Auto
MiscObject Property LawRune Auto
MiscObject Property SoulRune Auto
;;
MiscObject Property Bones Auto
;;
Potion Property Peach Auto
Potion Property Banana Auto
;;
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
;; Weapon Variables ;;
;;;;;;;;;;;;;;;;;;;;;;
Weapon Property SaraStaff Auto
Weapon Property ZamStaff Auto
Weapon Property GuthStaff Auto
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
;;;;;;;;;;;;;;;;;;;;;
;; Spell Variables ;;
;;;;;;;;;;;;;;;;;;;;;
;;Wind Spells
Spell Property WindStrike Auto
Spell Property WindBolt Auto
Spell Property WindBlast Auto
Spell Property WindWave Auto
Spell Property WindSurge Auto
;;Water Spells
Spell Property WaterStrike Auto
Spell Property WaterBolt Auto
Spell Property WaterBlast Auto
Spell Property WaterWave Auto
Spell Property WaterSurge Auto
;;Earth Spells
Spell Property EarthStrike Auto
Spell Property EarthBolt Auto
Spell Property EarthBlast Auto
Spell Property EarthWave Auto
Spell Property EarthSurge Auto
;;Fire Spells
Spell Property FireStrike Auto
Spell Property FireBolt Auto
Spell Property FireBlast Auto
Spell Property FireWave Auto
Spell Property FireSurge Auto
;;Teleport Spells
Spell Property Varrock Auto
Spell Property Lumbridge Auto
Spell Property Falador Auto
Spell Property House Auto
Spell Property Camelot Auto
Spell Property Ardougne Auto
Spell Property Watchtower Auto
Spell Property Trollheim Auto
Spell Property ApeAtoll Auto
Spell Property GreatKourend Auto
;;Stat and Snare Spells
Spell Property Confuse Auto
Spell Property Weaken Auto
Spell Property Curse Auto
Spell Property Bind Auto
Spell Property Snare Auto
Spell Property Vulnerability Auto
Spell Property Enfeeble Auto
Spell Property Entangle Auto
Spell Property Stun Auto
;;Jewelry Enchant Spells
Spell Property SapphireEnchant Auto
Spell Property EmeraldEnchant Auto
Spell Property RubyEnchant Auto
Spell Property DiamondEnchant Auto
Spell Property DragonstoneEnchant Auto
Spell Property OnyxEnchant Auto
Spell Property ZenyteEnchant Auto
;;Bolt Enchant Spells
Spell Property OpalBolt Auto
Spell Property SapphireBolt Auto
Spell Property JadeBolt Auto
Spell Property PearlBolt Auto
Spell Property EmeraldBolt Auto
Spell Property RedTopazBolt Auto
Spell Property RubyBolt Auto
Spell Property DiamondBolt Auto
Spell Property DragonstoneBolt Auto
Spell Property OnyxBolt Auto
;;Orb Charge Spells
Spell Property ChargeWater Auto
Spell Property ChargeEarth Auto
Spell Property ChargeFire Auto
Spell Property ChargeAir Auto
;;Self explanatory
Spell Property LowAlch Auto
Spell Property HighAlch Auto
Spell Property SuperHeat Auto
;;Bones to x Spells
Spell Property Bananas Auto
Spell Property Peaches Auto
;;God Spells and Charge
Spell Property Saradomin Auto
Spell Property Zamorak Auto
Spell Property Guthix Auto
Spell Property Charge Auto
;;Lunar Skill Spells
Spell Property BakePie Auto
Spell Property CurePlant Auto
Spell Property TanLeather Auto
Spell Property StringJewelry Auto
Spell Property PlankMake Auto
Spell Property Recharge Auto
Spell Property SpinFlax Auto
;;
Spell Property AcquireSpells Auto
;; Smoke Spells
Spell Property SmokeRush Auto
Spell Property SmokeBurst Auto
Spell Property SmokeBlitz Auto
Spell Property SmokeBarrage Auto
;; Shadow Spells
Spell Property ShadowRush Auto
Spell Property ShadowBurst Auto
Spell Property ShadowBlitz Auto
Spell Property ShadowBarrage Auto
;; Blood Spells
Spell Property BloodRush Auto
Spell Property BloodBurst Auto
Spell Property BloodBlitz Auto
Spell Property BloodBarrage Auto
;; Ice Spells
Spell Property IceRush Auto
Spell Property IceBurst Auto
Spell Property IceBlitz Auto
Spell Property IceBarrage Auto
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
;;;;;;;;;;;;;;;;;;;;;;;
;; Experience Values ;;
;;;;;;;;;;;;;;;;;;;;;;;
;;Global Experience Multiplier - Affects all spells
Int XPMultiplier = 1
;;Air Spells
Float AStrikeXP = 5.5
Float ABoltXP = 13.5
Float ABlastXP = 25.5
Float AWaveXP = 36.0
Float ASurgeXP = 44.5
;;Water Spells
Float WStrikeXP = 7.5
Float WBoltXP = 16.5
Float WBlastXP = 28.5
Float WWaveXP = 37.5
Float WSurgeXP = 46.5
;;Earth Spells
Float EStrikeXP = 9.5
Float EBoltXP = 19.5
Float EBlastXP = 31.5
Float EWaveXP = 40.0
Float ESurgeXP = 48.5
;;Fire Spells
Float FStrikeXP = 11.5
Float FBoltXP = 22.5
Float FBlastXP = 34.5
Float FWaveXP = 42.5
Float FSurgeXP = 50.5
;;God Spells
Float Sara = 35.0
Float Zam = 35.0
Float Guth = 35.0
;;;;;;;;;;;;;;;;;;;;;;;
;;                   ;;
;;;;;;;;;;;;;;;;;;;;;;;
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
;; Wind Damage Spells ;;
;;;;;;;;;;;;;;;;;;;;;;;;
Function WindStrike(Actor akTarget)
	
	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int MindRuneCt = Game.GetPlayer().GetItemCount(MindRune)
	
	If AirRuneCt < 1 || MindRuneCt < 1
		Game.GetPlayer().UnequipSpell(WindStrike, 0)
		Game.GetPlayer().UnequipSpell(WindStrike, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 1)
		Game.GetPlayer().RemoveItem(MindRune, 1)
		
		Int Damage = Utility.RandomInt(0,2)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = AStrikeXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP / 4)
	EndIf
	
EndFunction

Function WindBolt(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
	
	If AirRuneCt < 2 || ChaosRuneCt < 1
		Game.GetPlayer().UnequipSpell(WindBolt, 0)
		Game.GetPlayer().UnequipSpell(WindBolt, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 2)
		Game.GetPlayer().RemoveItem(ChaosRune, 1)
		
		Int Damage = Utility.RandomInt(0,9)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = ABoltXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function WindBlast(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
	
	If AirRuneCt < 3 || DeathRuneCt < 1
		Game.GetPlayer().UnequipSpell(WindBlast, 0)
		Game.GetPlayer().UnequipSpell(WindBlast, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 3)
		Game.GetPlayer().RemoveItem(DeathRune, 1)
		
		Int Damage = Utility.RandomInt(0,13)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = WBlastXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function WindWave(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
	
	If AirRuneCt < 5 || BloodRuneCt < 1
		Game.GetPlayer().UnequipSpell(WindWave, 0)
		Game.GetPlayer().UnequipSpell(WindWave, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 5)
		Game.GetPlayer().RemoveItem(BloodRune, 1)
		
		Int Damage = Utility.RandomInt(0,17)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = WWaveXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function WindSurge(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int WrathRuneCt = Game.GetPlayer().GetItemCount(WrathRune)
	
	If AirRuneCt < 5 || WrathRuneCt < 1
		Game.GetPlayer().UnequipSpell(WindSurge, 0)
		Game.GetPlayer().UnequipSpell(WindStrike, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 5)
		Game.GetPlayer().RemoveItem(WrathRune, 1)
		
		Int Damage = Utility.RandomInt(0,21)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = WSurgeXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;
;; Water Damge Spells ;;
;;;;;;;;;;;;;;;;;;;;;;;;
Function WaterStrike(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
	Int MindRuneCt = Game.GetPlayer().GetItemCount(MindRune)
	
	If AirRuneCt < 1 || WaterRuneCt < 1 || MindRuneCt < 1
		Game.GetPlayer().UnequipSpell(WaterStrike, 0)
		Game.GetPlayer().UnequipSpell(WaterStrike, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 1)
		Game.GetPlayer().RemoveItem(WaterRune, 1)
		Game.GetPlayer().RemoveItem(MindRune, 1)
		
		Int Damage = Utility.RandomInt(0,4)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = WStrikeXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function WaterBolt(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
	Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
	
	If AirRuneCt < 2 || WaterRuneCt < 2 || ChaosRuneCt < 1
		Game.GetPlayer().UnequipSpell(WaterBolt, 0)
		Game.GetPlayer().UnequipSpell(WaterBolt, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 2)
		Game.GetPlayer().RemoveItem(WaterRune, 2)
		Game.GetPlayer().RemoveItem(ChaosRune, 1)
		
		Int Damage = Utility.RandomInt(0,10)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = WBoltXP + Damage * 4 * XPMultiplier 
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf

EndFunction

Function WaterBlast(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
	Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
	
	If AirRuneCt < 3 || WaterRuneCt < 3 || DeathRuneCt < 1
		Game.GetPlayer().UnequipSpell(WaterBlast, 0)
		Game.GetPlayer().UnequipSpell(WaterBlast, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 3)
		Game.GetPlayer().RemoveItem(WaterRune, 3)
		Game.GetPlayer().RemoveItem(DeathRune, 1)
		
		Int Damage = Utility.RandomInt(0,14)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = WBlastXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function WaterWave(Actor akTarget)
	
	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
	Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
	
	If AirRuneCt < 5 || WaterRuneCt < 7 || BloodRuneCt < 1
		Game.GetPlayer().UnequipSpell(WaterWave, 0)
		Game.GetPlayer().UnequipSpell(WaterWave, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 5)
		Game.GetPlayer().RemoveItem(WaterRune, 7)
		Game.GetPlayer().RemoveItem(BloodRune, 1)
		
		Int Damage = Utility.RandomInt(0,18)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = WWaveXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function WaterSurge(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
	Int WrathRuneCt = Game.GetPlayer().GetItemCount(WrathRune)
	
	If AirRuneCt < 7 || WaterRuneCt < 10 || WrathRuneCt < 1
		Game.GetPlayer().UnequipSpell(WaterSurge, 0)
		Game.GetPlayer().UnequipSpell(WaterSurge, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 7)
		Game.GetPlayer().RemoveItem(WaterRune, 10)
		Game.GetPlayer().RemoveItem(WrathRune, 1)
		
		Int Damage = Utility.RandomInt(0,22)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = WSurgeXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf

EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;;
;; Earth Damage Spells ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
Function EarthStrike(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
	Int MindRuneCt = Game.GetPlayer().GetItemCount(MindRune)
	
	If AirRuneCt < 1 || EarthRuneCt < 2 || MindRuneCt < 1
		Game.GetPlayer().UnequipSpell(EarthStrike, 0)
		Game.GetPlayer().UnequipSpell(EarthStrike, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 1)
		Game.GetPlayer().RemoveItem(EarthRune, 2)
		Game.GetPlayer().RemoveItem(MindRune, 1)
		
		Int Damage = Utility.RandomInt(0,6)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = EStrikeXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function EarthBolt(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
	Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
	
	If AirRuneCt <  2 || EarthRuneCt < 3 || ChaosRuneCt < 1
		Game.GetPlayer().UnequipSpell(EarthBolt, 0)
		Game.GetPlayer().UnequipSpell(EarthBolt, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 2)
		Game.GetPlayer().RemoveItem(EarthRune, 3)
		Game.GetPlayer().RemoveItem(ChaosRune, 1)
		
		Int Damage = Utility.RandomInt(0,11)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = EBoltXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function EarthBlast(Actor akTarget)
	
	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
	Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
	
	If AirRuneCt < 3 || EarthRuneCt < 4 || DeathRuneCt < 1
		Game.GetPlayer().UnequipSpell(EarthBlast, 0)
		Game.GetPlayer().UnequipSpell(EarthBlast, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 3)
		Game.GetPlayer().RemoveItem(EarthRune, 4)
		Game.GetPlayer().RemoveItem(DeathRune, 1)
		
		Int Damage = Utility.RandomInt(0,15)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = EBlastXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function EarthWave(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
	Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
	
	If AirRuneCt < 5 || EarthRuneCt < 7 || BloodRuneCt < 1
		Game.GetPlayer().UnequipSpell(EarthWave, 0)
		Game.GetPlayer().UnequipSpell(EarthWave, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 5)
		Game.GetPlayer().RemoveItem(EarthRune, 7)
		Game.GetPlayer().RemoveItem(BloodRune, 1)
		
		Int Damage = Utility.RandomInt(0,19)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = EWaveXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function EarthSurge(Actor akTarget)
	
	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
	Int WrathRuneCt = Game.GetPlayer().GetItemCount(WrathRune)
	
	If AirRuneCt < 7 || EarthRuneCt < 10 || WrathRuneCt < 1
		Game.GetPlayer().UnequipSpell(EarthSurge, 0)
		Game.GetPlayer().UnequipSpell(EarthSurge, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 7)
		Game.GetPlayer().RemoveItem(EarthRune, 10)
		Game.GetPlayer().RemoveItem(WrathRune, 1)
		
		Int Damage = Utility.RandomInt(0,23)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = ESurgeXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction 
;;;;;;;;;;;;;;;;;;;;;;;;
;; Fire Damage Spells ;;
;;;;;;;;;;;;;;;;;;;;;;;;
Function FireStrike(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
	Int MindRuneCt = Game.GetPlayer().GetItemCount(MindRune)
	
	If AirRuneCt < 2 || FireRuneCt < 3 || MindRuneCt < 1
		Game.GetPlayer().UnequipSpell(FireStrike, 0)
		Game.GetPlayer().UnequipSpell(FireStrike, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 2)
		Game.GetPlayer().RemoveItem(FireRune, 3)
		Game.GetPlayer().RemoveItem(MindRune, 1)
		
		Int Damage = Utility.RandomInt(0,8)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = FStrikeXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function FireBolt(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
	Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
	
	If AirRuneCt < 3 || FireRuneCt < 4 || ChaosRuneCt < 1
		Game.GetPlayer().UnequipSpell(FireBolt, 0)
		Game.GetPlayer().UnequipSpell(FireBolt, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 3)
		Game.GetPlayer().RemoveItem(FireRune, 4)
		Game.GetPlayer().RemoveItem(ChaosRune, 1)
		
		Int Damage = Utility.RandomInt(0,12)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = FBoltXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function FireBlast(Actor akTarget)
	
	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
	Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
	
	If AirRuneCt < 4 || FireRuneCt < 5 || DeathRuneCt < 1
		Game.GetPlayer().UnequipSpell(FireBlast, 0)
		Game.GetPlayer().UnequipSpell(FireBlast, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 4)
		Game.GetPlayer().RemoveItem(FireRune, 5)
		Game.GetPlayer().RemoveItem(DeathRune, 1)
		
		Int Damage = Utility.RandomInt(0,16)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = FBlastXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function FireWave(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
	Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
	
	If AirRuneCt < 5 || FireRuneCt < 7 || BloodRuneCt < 1
		Game.GetPlayer().UnequipSpell(FireWave, 0)
		Game.GetPlayer().UnequipSpell(FireWave, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 5)
		Game.GetPlayer().RemoveItem(FireRune, 7)
		Game.GetPlayer().RemoveItem(BloodRune, 1)
		
		Int Damage = Utility.RandomInt(0,20)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = FWaveXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction

Function FireSurge(Actor akTarget)
	
	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
	Int WrathRuneCt = Game.GetPlayer().GetItemCount(WrathRune)
	
	If AirRuneCt < 7 || FireRuneCt < 10 || WrathRuneCt < 1
		Game.GetPlayer().UnequipSpell(FireSurge, 0)
		Game.GetPlayer().UnequipSpell(FireSurge, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().RemoveItem(AirRune, 7)
		Game.GetPlayer().RemoveItem(FireRune, 10)
		Game.GetPlayer().RemoveItem(WrathRune, 1)
		
		Int Damage = Utility.RandomInt(0,24)
		
		akTarget.DamageAV("Health", Damage)
		
		Float MXP = FSurgeXP + Damage * 4 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
		rsFrameworkMenu.rsXPGain("constitution", MXP)
	EndIf
	
EndFunction 
;;;;;;;;;;;;;;;;
;; God Spells ;;
;;;;;;;;;;;;;;;;
;;Reserved for Guthix

;;Reserved for Zamorak

Function Saradomin(Actor akTarget)

	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
	Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
	
	If Game.GetPlayer().IsEquipped(SaraStaff) == False
		Debug.Notification ("You need to equip your Saradomin Staff to use this spell")
	Else
		If AirRuneCt < 4 || FireRuneCt < 2 || BloodRuneCt < 2
			Game.GetPlayer().UnequipSpell(Saradomin, 0)
			Game.GetPlayer().UnequipSpell(Saradomin, 1)
			Debug.Notification("You lack the required runes")
		Else
			Game.GetPlayer().RemoveItem(AirRune, 4)
			Game.GetPlayer().RemoveItem(FireRune, 2)
			Game.GetPlayer().RemoveItem(BloodRune, 2)
			
			Int Damage = Utility.RandomInt(0,20)
			
			akTarget.DamageAV("Health", Damage)
			akTarget.DamageAV("Magicka", 1)
		
			Float MXP = Sara + Damage * 4 * XPMultiplier
		
			rsFrameworkMenu.rsXPGain("magic", MXP)
			rsFrameworkMenu.rsXPGain("constitution", MXP)
		EndIf
	EndIf
	
EndFunction 
;;;;;;;;;;;;;;;;;;;;;
;; Teleport Spells ;;
;;;;;;;;;;;;;;;;;;;;;
Function FalTele(Actor akTarget)
	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int LawRuneCt = Game.GetPlayer().GetItemCount(LawRune)
	Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
	If AirRuneCt < 3 || LawRuneCt < 1 || WaterRuneCt < 1
		Game.GetPlayer().UnequipSpell(Falador, 0)
		Game.GetPlayer().UnequipSpell(Falador, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().MoveTo(FalMarker)
		
		Float MXP = 48 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
	EndIf
EndFunction

Function VarTele(Actor akTarget)
	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
	Int LawRuneCt = Game.GetPlayer().GetItemCount(LawRune)
	If AirRuneCt < 3 || LawRuneCt < 1 || FireRuneCt < 1
		Game.GetPlayer().UnequipSpell(Varrock, 0)
		Game.GetPlayer().UnequipSpell(Varrock, 1)
		Debug.Notification("You lack the required runes")
	Else
		Game.GetPlayer().MoveTo(VarMarker)
		
		Float MXP = 35 * XPMultiplier
		
		rsFrameworkMenu.rsXPGain("magic", MXP)
	EndIf
EndFunction
;;;;;;;;;;;;;;;;;;;;;;;
;; Bones to x Spells ;;
;;;;;;;;;;;;;;;;;;;;;;;
Function BTP(Actor akTarget)

	Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
	Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
	Int NatureRuneCt = Game.GetPlayer().GetItemCount(NatureRune)
	
	If Game.GetPlayer().GetItemCount(Bones) == 0
		Debug.Notification("You have no bones")
	Else
		If EarthRuneCt < 4 || WaterRuneCt < 4 || NatureRuneCt < 2
			Game.GetPlayer().UnequipSpell(Peaches, 0)
			Game.GetPlayer().UnequipSpell(Peaches, 1)
			Debug.Notification("You lack the required runes")
		Else
			Game.GetPlayer().RemoveItem(EarthRune, 4)
			Game.GetPlayer().RemoveItem(WaterRune, 4)
			Game.GetPlayer().RemoveItem(NatureRune, 2)
			Game.GetPlayer().RemoveItem(Bones, 1)
			Game.GetPlayer().AddItem(Peach, 1)
			
			Float MXP = 35.5 * XPMultiplier
			
			rsFrameworkMenu.rsXPGain("magic", MXP)
		EndIf
	EndIf
	
EndFunction 

Function BTB(Actor akTarget)

	Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
	Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
	Int NatureRuneCt = Game.GetPlayer().GetItemCount(NatureRune)
	
	If Game.GetPlayer().GetItemCount(Bones) == 0 
		Debug.Notification("You have no bones")
	Else
		If EarthRuneCt < 2 || WaterRuneCt < 2 || NatureRuneCt < 1
			Game.GetPlayer().UnequipSpell(Bananas, 0)
			Game.GetPlayer().UnequipSpell(Bananas, 1)
			Debug.Notification("You lack the required runes")
		Else	
			Game.GetPlayer().RemoveItem(EarthRune, 2)
			Game.GetPlayer().RemoveItem(WaterRune, 2)
			Game.GetPlayer().RemoveItem(NatureRune, 1)
			Game.GetPlayer().RemoveItem(Bones, 1)
			Game.GetPlayer().AddItem(Banana, 1)
			
			Float MXP = 25 * XPMultiplier
			
			rsFrameworkMenu.rsXPGain("magic", MXP)
		EndIf
	EndIf
	
EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Level Check Spell Function ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function Acquire(Actor akTarget)

	Float lvl = rsFrameworkMenu.GetMagicLvl().GetValue()
	
	If lvl > 4
		Game.GetPlayer().HasSpell(WaterStrike) == False
		Game.GetPlayer().AddSpell(WaterStrike)
	EndIf
	If lvl > 8 
		Game.GetPlayer().HasSpell(EarthStrike) == False
		Game.GetPlayer().AddSpell(EarthStrike)
	EndIf
	If lvl > 12
		Game.GetPlayer().HasSpell(FireStrike) == False
		Game.GetPlayer().AddSpell(FireStrike)
	EndIf
	If lvl > 16 
		Game.GetPlayer().HasSpell(WindBolt) == False
		Game.GetPlayer().AddSpell(WindBolt)
	EndIf
	If lvl > 22
		Game.GetPlayer().HasSpell(WaterBolt) == False
		Game.GetPlayer().AddSpell(WaterBolt)
	EndIf
	If lvl > 24
		Game.GetPlayer().HasSpell(Varrock) == False
		Game.GetPlayer().AddSpell(Varrock)
	EndIf
	If lvl > 28
		Game.GetPlayer().HasSpell(EarthBolt) == False
		Game.GetPlayer().AddSpell(EarthBolt)
	EndIf
	If lvl > 30
		Game.GetPlayer().HasSpell(Lumbridge) == False
		Game.GetPlayer().AddSpell(Lumbridge)
	EndIf
	If lvl > 34
		Game.GetPlayer().HasSpell(FireBolt) == False
		Game.GetPlayer().AddSpell(FireBolt)
	EndIf
	If lvl > 36
		Game.GetPlayer().HasSpell(Falador) == False
		Game.GetPlayer().AddSpell(Falador)
	EndIf
	If lvl > 40
		Game.GetPlayer().HasSpell(WindBlast) == False
		Game.GetPlayer().AddSpell(WindBlast)
	EndIf
	If lvl < 42
		Game.GetPlayer().HasSpell(SuperHeat) == False
		Game.GetPlayer().AddSpell(SuperHeat)
	EndIf
	If lvl > 46
		Game.GetPlayer().HasSpell(WaterBlast) == False
		Game.GetPlayer().AddSpell(WaterBlast)
	EndIf
	If lvl > 49
		Game.GetPlayer().HasSpell(SmokeRush) == False
		Game.GetPlayer().AddSpell(SmokeRush)
	EndIf
	If lvl > 51
		Game.GetPlayer().HasSpell(ShadowRush) == False
		Game.GetPlayer().AddSpell(ShadowRush)
	EndIf
	If lvl > 52 
		Game.GetPlayer().HasSpell(EarthBlast) == False
		Game.GetPlayer().AddSpell(EarthBlast)
	EndIf
	If lvl > 55
		Game.GetPlayer().HasSpell(BloodRush) == False
		Game.GetPlayer().AddSpell(BloodRush)
	EndIf
	If lvl > 57
		Game.GetPlayer().HasSpell(IceRush) == False
		Game.GetPlayer().AddSpell(IceRush)
	EndIf
	If lvl > 58
		Game.GetPlayer().HasSpell(FireBlast) == False
		Game.GetPlayer().AddSpell(FireBlast)
	EndIf
	If lvl > 59
		Game.GetPlayer().HasSpell(Peaches) == False
		Game.GetPlayer().AddSpell(Peaches)
	EndIf
	If lvl > 59
		Game.GetPlayer().HasSpell(Saradomin) == False
		Game.GetPlayer().AddSpell(Saradomin)
	EndIf
	If lvl > 61
		Game.GetPlayer().HasSpell(SmokeBurst) == False
		Game.GetPlayer().AddSpell(SmokeBurst)
		Game.GetPlayer().HasSpell(WindWave) == False
		Game.GetPlayer().AddSpell(WindWave)
	EndIf
	If lvl > 63 
		Game.GetPlayer().HasSpell(ShadowBurst) == False
		Game.GetPlayer().AddSpell(ShadowBurst)
	EndIf
	If lvl > 64
		Game.GetPlayer().HasSpell(BakePie) == False
		Game.GetPlayer().AddSpell(BakePie)
	EndIf
	If lvl > 64
		Game.GetPlayer().HasSpell(WaterWave) == False
		Game.GetPlayer().AddSpell(WaterWave)
	EndIf
	If lvl > 67
		Game.GetPlayer().HasSpell(BloodBurst) == False
		Game.GetPlayer().AddSpell(BloodBurst)
	EndIf
	If lvl > 69
		Game.GetPlayer().HasSpell(EarthWave) == False
		Game.GetPlayer().AddSpell(EarthWave)
	EndIf
	If lvl > 69
		Game.GetPlayer().HasSpell(IceBurst) == False
		Game.GetPlayer().AddSpell(IceBurst)
	EndIf
	If lvl > 73
		Game.GetPlayer().HasSpell(SmokeBlitz) == False
		Game.GetPlayer().AddSpell(SmokeBlitz)
	EndIf
	If lvl > 74
		Game.GetPlayer().HasSpell(FireWave) == False
		Game.GetPlayer().AddSpell(FireWave)
	EndIf
	If lvl > 75
		Game.GetPlayer().HasSpell(SpinFlax) == False
		Game.GetPlayer().AddSpell(SpinFlax)
	EndIf
	If lvl > 77
		Game.GetPlayer().HasSpell(TanLeather) == False
		Game.GetPlayer().AddSpell(TanLeather)
	EndIf
	If lvl > 79
		Game.GetPlayer().HasSpell(BloodBlitz) == False
		Game.GetPlayer().AddSpell(BloodBlitz)
	EndIf
	If lvl > 79
		Game.GetPlayer().HasSpell(StringJewelry) == False
		Game.GetPlayer().AddSpell(StringJewelry)
	EndIf
	If lvl > 80
		Game.GetPlayer().HasSpell(WindSurge) == False
		Game.GetPlayer().AddSpell(WindSurge)
	EndIf
	If lvl > 81
		Game.GetPlayer().HasSpell(IceBlitz) == False
		Game.GetPlayer().AddSpell(IceBlitz)
	EndIf
	If lvl > 84
		Game.GetPlayer().HasSpell(WaterSurge) == False
		Game.GetPlayer().AddSpell(WaterSurge)
	EndIf
	If lvl > 85
		Game.GetPlayer().HasSpell(SmokeBarrage) == False
		Game.GetPlayer().AddSpell(SmokeBarrage)
	EndIf
	If lvl > 85
		Game.GetPlayer().HasSpell(PlankMake) == False
		Game.GetPlayer().AddSpell(PlankMake)
	EndIf
	If lvl > 89 
		Game.GetPlayer().HasSpell(EarthSurge) == False
		Game.GetPlayer().AddSpell(EarthSurge)
	EndIf
	If lvl > 91
		Game.GetPlayer().HasSpell(BloodBarrage) == False
		Game.GetPlayer().AddSpell(BloodBarrage)
	EndIf
	If lvl > 93
		Game.GetPlayer().HasSpell(IceBarrage) == False
		Game.GetPlayer().HasSpell(IceBarrage)
	EndIf
	If lvl > 94
		Game.GetPlayer().HasSpell(FireSurge) == False
		Game.GetPlayer().AddSpell(FireSurge)
	EndIf
EndFunction 