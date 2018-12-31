Scriptname RS_Spell_Water_Strike extends activemagiceffect  
{Water Strike requirements and damage}

MiscObject Property AirRune Auto
MiscObject Property MindRune Auto
MiscObject Property WaterRune Auto

Spell Property WaterStrike Auto

GlobalVariable Property RS_GV_MagicXP Auto

Event OnSpelLCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int MindRuneCt = Game.GetPlayer().GetItemCount(MindRune)
		Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
		If AirRuneCt < 1 && MindRuneCt < 1 && WaterRuneCt < 1
			Game.GetPlayer().UnequipSpell(WaterStrike, 0)
			Game.GetPlayer().UnequipSpell(WaterStrike, 1)
		Else
			Game.GetPlayer().RemoveItem(WaterRune, 1)
			Game.GetPlayer().RemoveItem(MindRune, 1)
			Game.GetPlayer().RemoveItem(AirRune, 1)
			
			Int damage = Utility.RandomInt(1,4)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float Magic = RS_GV_MagicXP.GetValue()
			Float BaseXP = 7.5
			Float ModMagicXP = ((BaseXP) + damage)
			rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf
EndEvent
			