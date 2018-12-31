Scriptname RS_Spell_WindBolt_Script extends activemagiceffect  
{Wind bolt script}

GlobalVariable Property RS_GV_MagicXP Auto

Spell Property WindBolt Auto

MiscObject Property AirRune Auto
MiscObject Property ChaosRune Auto


Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
	Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
	Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
		If AirRuneCt < 2 && ChaosRuneCt < 1
			Game.GetPlayer().UnequipSpell(WindBolt, 0)
			Game.GetPlayer().UnequipSpell(WindBolt, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 2)
			Game.GetPlayer().RemoveItem(ChaosRune, 1)
			
			Int damage = Utility.RandomInt(1,9)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float Magic = RS_GV_MagicXP.GetValue()
			Float BaseXP = 13.5
			Float ModMagicXP = ((BaseXP) + damage)
			
			rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
			rsFrameworkMenu.SpellCheck_Magic() 
			
		EndIf
	EndIf

EndEvent
