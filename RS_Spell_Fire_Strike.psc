Scriptname RS_Spell_Fire_Strike extends activemagiceffect  
{Fire Strike script}

MiscObject Property FireRune Auto
MiscObject Property MindRune Auto
MiscObject Property AirRune Auto

Spell Property FireStrike Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
		Int MindRuneCt = Game.GetPlayer().GetItemCount(MindRune)
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		If AirRuneCt < 1 && FireRuneCt < 1 && MindRuneCt < 1
			Game.GetPlayer().UnequipSpell(FireStrike, 0)
			Game.GetPlayer().UnequipSpell(FireStrike, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 1)
			Game.GetPlayer().RemoveItem(MindRune, 1)
			Game.GetPlayer().RemoveItem(FireRune, 1)
			
			Int damage = Utility.RandomInt(1,8)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float BaseXP = 11.5
			Float ModMagicXP = ((BaseXP) + damage)
			rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
			rsFrameworkMenu.SpellCheck_Magic()
			
		EndIf
	EndIf

EndEvent
		