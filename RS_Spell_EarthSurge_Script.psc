Scriptname RS_Spell_EarthSurge_Script extends activemagiceffect  
{Earth Surge script}

Spell Property EarthSurge Auto

MiscObject Property AirRune Auto
MiscObject Property EarthRune Auto
MiscObject Property WrathRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
		Int WrathRuneCt = Game.GetPlayer().GetItemCount(WrathRune)
		If AirRuneCt < 7 && EarthRuneCt < 10 && WrathRuneCt < 1
			Game.GetPlayer().UnequipSpell(EarthSurge, 0)
			Game.GetPlayer().UnequipSpell(EarthSurge, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 7)
			Game.GetPlayer().RemoveItem(EarthRune, 10)
			Game.GetPlayer().RemoveItem(WrathRune, 1)
			
			Int damage = Utility.RandomInt(1,23)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float Basexp = 48.5 
			Float ModMagicXP = ((Basexp) + damage)
			
			rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf
	
EndEvent 