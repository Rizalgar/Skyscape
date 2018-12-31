Scriptname RS_Spell_WaterWave_Script extends activemagiceffect  
{Water Wave script}

Spell Property WaterWave Auto

MiscObject Property AirRune Auto
MiscObject Property BloodRune Auto
MiscObject Property WaterRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
		Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
		If AirRuneCt < 5 && WaterRuneCt < 7 && BloodRuneCt < 1
			Game.GetPlayer().UnequipSpell(WaterWave, 0)
			Game.GetPlayer().UnequipSpell(WaterWave, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 5)
			Game.GetPlayer().RemoveItem(BloodRune, 1)
			Game.GetPlayer().RemoveItem(WaterRune, 7)
			
			Int damage = Utility.RandomInt(1,18)
			
			Float BaseXP = 37.5
			Float MMXP = ((BaseXP) + damage)
			
			rsFrameworkMenu.rsXPGain("magic", damage)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf
	
EndEvent
