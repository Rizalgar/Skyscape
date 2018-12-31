Scriptname RS_Spell_EarthWave_Script extends activemagiceffect  
{Earth Wave Script}

Spell Property EarthWave Auto

MiscObject Property AirRune Auto
MiscObject Property BloodRune Auto
MiscObject Property EarthRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
		Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
			If AirRuneCt < 5 && BloodRuneCt < 1 && EarthRuneCt < 7
				Game.GetPlayer().UnequipSpell(EarthWave, 0)
				Game.GetPlayer().UnequipSpell(EarthWave, 1)
			Else
				Game.GetPlayer().RemoveItem(AirRune, 5)
				Game.GetPlayer().RemoveItem(BloodRune, 1)
				Game.GetPlayer().RemoveItem(EarthRune, 7)
				
				Int damage = Utility.RandomInt(1,19)
				
				akTarget.DamageActorValue("Health", damage)
				
				Float BaseXp = 40
				Float ModMagicXP = ((BaseXp) + damage)
				
				rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
				rsFrameworkMenu.SpellCheck_Magic()
			EndIf
	EndIf
	
EndEvent
