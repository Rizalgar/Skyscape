Scriptname RS_Spell_LumbridgeTele_Script extends activemagiceffect  
{Lumbridge Teleport Script}

ObjectReference Property LumbyHomeTeleMarker Auto

Spell Property Lumbridge Auto

MiscObject Property AirRune Auto
MiscObject Property EarthRune Auto
MiscObject Property LawRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
		Int LawRuneCt = Game.GetPlayer().GetItemCount(LawRune)
		If AirRuneCt < 3 && EarthRuneCt < 1 && LawRuneCt < 1
			Game.GetPlayer().UnequipSpell(Lumbridge, 0)
			Game.GetPlayer().UnequipSpell(Lumbridge, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 3)
			Game.GetPlayer().RemoveItem(EarthRune, 1)
			Game.GetPlayer().RemoveItem(LawRune, 1)
			Game.GetPlayer().MoveTo(LumbyHomeTeleMarker)
			
			Float BaseXP = 41
			
			rsFrameworkMenu.rsXPGain("magic", BaseXP)
		EndIf
	EndIf
	
EndEvent
