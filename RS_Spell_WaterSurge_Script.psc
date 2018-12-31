Scriptname RS_Spell_WaterSurge_Script extends activemagiceffect  
{Water Surge script}

Spell Property WaterSurge Auto

MiscObject Property AirRune Auto
MiscObject Property WaterRune Auto
MiscObject Property WrathRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
		Int WrathRuneCt = Game.GetPlayer().GetItemCount(WrathRune)
		If AirRuneCt < 7 && WaterRuneCt < 10 && WrathRuneCt < 1
			Game.GetPlayer().UnequipSpell(WaterSurge, 0)
			Game.GetPlayer().UnequipSpell(WaterSurge, 1)
		Else
			Game.GetPlayer().RemoveItem(WaterRune, 10)
			Game.GetPlayer().RemoveItem(AirRune, 7)
			Game.GetPlayer().RemoveItem(WrathRune, 1)
			
			Int damage = Utility.RandomInt(1,22)
			
			Float BaseXP = 46.5
			Float MMXP = ((BaseXP) + damage)
			
			rsFrameworkMenu.rsXPGain("magic", damage)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf
	
EndEvent
