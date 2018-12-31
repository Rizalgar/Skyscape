Scriptname RS_Spell_WindSurge_Script extends activemagiceffect  
{Wind Surge Script}

Spell Property WindSurge Auto

MiscObject Property AirRune Auto
MiscObject Property WrathRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int WrathRuneCt = Game.GetPlayer().GetItemCount(WrathRune)
		If AirRuneCt < 7 || WrathRuneCt < 1
			Game.GetPlayer().UnequipSpell(WindSurge, 0)
			Game.GetPlayer().UnequipSpell(WindSurge, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 7)
			Game.GetPlayer().RemoveItem(WrathRune, 1)
			
			Int damage = Utility.RandomInt(1,21)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float BaseXP = 44.5
			Float MMXP = ((BaseXP) + damage)
			
			rsFrameworkMenu.rsXPGain("magic", MMXP)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf

EndEvent
