Scriptname RS_Spell_FaladorTele_Script extends activemagiceffect  
{Falador Teleport script}

ObjectReference Property Marker Auto

Spell Property Fally Auto

MiscObject Property AirRune Auto
MiscObject Property LawRune Auto
MiscObject Property WaterRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int LawRuneCt = Game.GetPlayer().GetItemCount(LawRune)
		Int WaterRuneCt = Game.GetPlayer().GetItemCount(WaterRune)
			If AirRuneCt < 3 && LawRuneCt < 1 && WaterRuneCt < 1
				Game.GetPlayer().UnequipSpell(Fally, 0)
				Game.GetPlayer().UnequipSpell(Fally, 1)
			Else
				Game.GetPlayer().RemoveItem(AirRune, 3)
				Game.GetPlayer().RemoveItem(LawRune, 1)
				Game.GetPlayer().RemoveItem(WaterRune, 1)
				Game.GetPlayer().MoveTo(Marker)
				
				Float BaseXP = 48
				
				rsFrameworkMenu.rsXPGain("magic", BaseXP)
			EndIf
		EndIf
EndEvent
