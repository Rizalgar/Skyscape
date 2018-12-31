Scriptname RS_Spell_WaterBolt_Script extends activemagiceffect  
{Water Bolt Script}

GlobalVariable Property RS_GV_MagicXP Auto

Spell Property WaterBolt Auto

MiscObject Property AirRune Auto
MiscObject Property ChaosRune Auto
MiscObject Property WaterRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
		Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
			If AirRuneCt < 2 && ChaosRuneCt < 2 && WaterRuneCt < 2
				Game.GetPlayer().UnequipSpell(WaterBolt, 0)
				Game.GetPlayer().UnequipSpell(WaterBolt, 1)
			Else
				Game.GetPlayer().RemoveItem(AirRune, 2)
				Game.GetPlayer().RemoveItem(ChaosRune, 1)
				Game.GetPlayer().RemoveItem(WaterRune, 2)
				
				Int damage = Utility.RandomInt(1,10)
				
				akTarget.DamageActorValue("Health", damage)
				
				Float Magic = RS_GV_MagicXP.GetValue()
				Float BaseXP = 16.5
				Float ModMagicXP = ((BaseXP) + damage)
				
				rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
				rsFrameworkMenu.SpellCheck_Magic()
				
			EndIf
		EndIf
EndEvent
