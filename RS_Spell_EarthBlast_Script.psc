Scriptname RS_Spell_EarthBlast_Script extends activemagiceffect  
{Earth Blast Script}

Spell Property EarthBlast Auto

MiscObject Property AirRune Auto
MiscObject Property DeathRune Auto
MiscObject Property EarthRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
		Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
		If AirRuneCt < 3 && DeathRuneCt < 1 && EarthRuneCt < 4
			Game.GetPlayer().UnequipSpell(EarthBlast, 0)
			Game.GetPlayer().UnequipSpell(EarthBlast, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 3)
			Game.GetPlayer().RemoveItem(DeathRune, 1)
			Game.GetPlayer().RemoveItem(EarthRune, 4)
			
			Int damage = Utility.RandomInt(1,15)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float BaseXP = 31.5
			Float ModMagicXP = ((BaseXP) + damage)
			rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf
	
EndEvent
