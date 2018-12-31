Scriptname RS_Spell_VarrockTele_Script extends activemagiceffect  
{Varrock Teleport Script}

ObjectReference Property varrockTeleport001 Auto

Spell Property VarrockTele Auto

MiscObject Property AirRune Auto
MiscObject Property LawRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int LawRuneCt = Game.GetPlayer().GetItemCount(LawRune)
		If AirRuneCt < 5 && LawRuneCt < 1
			Game.GetPlayer().UnequipSpell(VarrockTele, 0)
			Game.GetPlayer().UnequipSpell(VarrockTele, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 5)
			Game.GetPlayer().RemoveItem(LawRune, 1)
			Game.GetPlayer().MoveTo(varrockTeleport001)
			
			Float BaseXP = 35
			
			rsFrameworkMenu.rsXPGain("magic", BaseXP)
			
		EndIf
	EndIf

EndEvent
