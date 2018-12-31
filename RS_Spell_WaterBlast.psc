Scriptname RS_Spell_WaterBlast extends activemagiceffect  
{Water Blast Script}

Spell Property WaterBlast Auto

MiscObject Property AirRune Auto
MiscObject Property DeathRune Auto
MiscObject Property WaterRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akCaster, Actor akTarget)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
		Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
		If AirRuneCt < 3 && DeathRuneCt < 1 && WaterRuneCt < 3
			Game.GetPlayer().UnequipSpell(WaterBlast, 0)
			Game.GetPlayer().UnequipSpell(WaterBlast, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 3)
			Game.GetPlayer().RemoveItem(DeathRune, 1)
			Game.GetPlayer().RemoveItem(WaterRune, 3)
			
			Int damage = Utility.RandomInt(1,14)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float BaseXp = 28.5
			Float MMXP = ((BaseXp) + damage)
			
			rsFrameworkMenu.rsXPGain("magic", MMXP)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf
	
EndEvent
