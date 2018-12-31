Scriptname RS_Spell_FireBlast_Script extends activemagiceffect  
{Fire Blast script}

Spell Property FireBlast Auto

MiscObject Property AirRune Auto
MiscObject Property DeathRune Auto
MiscObject Property FireRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
		Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
		If AirRuneCt < 4 && DeathRuneCt < 1 && FireRuneCt < 5 
			Game.GetPlayer().UnequipSpell(FireBlast, 0)
			Game.GetPlayer().UnequipSpell(FireBlast, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 4)
			Game.GetPlayer().RemoveItem(DeathRune, 1)
			Game.GetPlayer().RemoveItem(FireRune, 5)
			
			Int damage = Utility.RandomInt(1,16)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float BaseXP = 34.5
			Float ModMagicXP = ((BaseXP) + damage)
			
			rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf
	
EndEvent 