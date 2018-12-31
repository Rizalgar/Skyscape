Scriptname RS_Spell_Earth_Strike extends activemagiceffect  
{Earth Strike script}


MiscObject Property AirRune Auto
MiscObject Property MindRune Auto
MiscObject Property EarthRune Auto

Spell Property EarthStrike Auto

GlobalVariable Property RS_GV_MagicXP Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int MindRuneCt = Game.GetPlayer().GetItemCount(MindRune)
		Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
		If AirRuneCt < 1 && MindRuneCt < 1 && EarthRuneCt < 1
			Game.GetPlayer().UnequipSpell(EarthStrike, 0)
			Game.GetPlayer().UnequipSpell(EarthStrike, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 1)
			Game.GetPlayer().RemoveItem(MindRune, 1)
			Game.GetPlayer().RemoveItem(EarthRune, 1)
			
			Int damage = Utility.RandomInt(1,6)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float Magic = RS_GV_MagicXP.GetValue()
			Float BaseXP = 9.5
			Float ModMagicXP = ((BaseXP) + damage)
			
			rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf
	
EndEvent
