Scriptname RS_Spell_FireSurge_Script extends activemagiceffect  
{Fire Surge script}

Spell Property FireSurge Auto

MiscObject Property AirRune Auto
MiscObject Property FireRune Auto
MiscObject Property WrathRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
		Int WrathRuneCt = Game.GetPlayer().GetItemCount (WrathRune)
		If AirRuneCt < 7 && FireRuneCt < 10 && WrathRuneCt < 1
			Game.GetPlayer().UnequipSpell(FireSurge, 0)
			Game.GetPlayer().UnequipSpell(FireSurge, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 7)
			Game.GetPlayer().RemoveItem(FireRune, 10)
			Game.GetPlayer().RemoveItem(WrathRune, 1)
			
			Int damage = Utility.RandomInt(1,24)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float BaseXP = 50.5
			Float ModMagicXP = ((BaseXP) + damage)
			rsFrameworkMenu.rsXPGain("magic", damage)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf

EndEvent 