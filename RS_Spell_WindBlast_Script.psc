Scriptname RS_Spell_WindBlast_Script extends activemagiceffect  
{Wind Blast script}

Spell Property WindBlast Auto

MiscObject Property AirRune Auto
MiscObject Property DeathRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int DeathRuneCt = Game.GetPlayer().GetItemCount(DeathRune)
		If AirRuneCt < 3 && DeathRuneCt < 1
			Game.GetPlayer().UnequipSpell(WindBlast, 0)
			Game.GetPlayer().UnequipSpell(WindBlast, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 3)
			Game.GetPlayer().RemoveItem(DeathRune, 1)
			
			Int damage = Utility.RandomInt(1,13)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float BaseXp = 25.5
			Float MMXP = ((BaseXp) + damage)
			
			rsFrameworkMenu.rsXPGain("magic", MMXP)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf

EndEvent 