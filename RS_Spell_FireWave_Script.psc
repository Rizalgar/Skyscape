Scriptname RS_Spell_FireWave_Script extends activemagiceffect  
{Fire Wave Script}

Spell Property FireWave Auto

MiscObject Property AirRune Auto
MiscObject Property BloodRune Auto
MiscObject Property FireRune Auto

Event OnSpellCast(form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
		Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
		If AirRuneCt < 5 && BloodRuneCt < 1 && FireRuneCt < 7
			Game.GetPlayer().UnequipSpell(FireWave, 0)
			Game.GetPlayer().UnequipSpell(FireWave, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 5)
			Game.GetPlayer().RemoveItem(BloodRune, 1)
			Game.GetPlayer().RemoveItem(FireRune, 7)
			
			Int damage = Utility.RandomInt(1,20)
			
			Float BaseXp = 42.5
			Float ModMagicXP = ((BaseXp) + damage)
			rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf

EndEvent
