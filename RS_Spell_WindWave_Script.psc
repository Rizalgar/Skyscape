Scriptname RS_Spell_WindWave_Script extends activemagiceffect  
{Wind Wave script}

Spell Property WindWave Auto

MiscObject Property AirRune Auto
MiscObject Property BloodRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int BloodRuneCt = Game.GetPlayer().GetItemCount(BloodRune)
		If AirRuneCt < 5 || BloodRuneCt < 1
			Game.GetPlayer().UnequipSpell(WindWave, 0)
			Game.GetPlayer().UnequipSpell(WindWave, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 5)
			Game.GetPlayer().RemoveItem(BloodRune, 1)
			
			Int damage = Utility.RandomInt(1,17)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float BaseXp = 36
			Float MMXP = ((BaseXp) + damage)
			
			rsFrameworkMenu.rsXPGain("magic", damage)
			rsFrameworkMenu.SpellCheck_Magic()
		EndIf
	EndIf
	
EndEvent 