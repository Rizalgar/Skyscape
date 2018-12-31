Scriptname RS_Spell_EarthBolt_Script extends activemagiceffect  
{Earth Bolt Script}

GlobalVariable Property RS_GV_MagicXP Auto

Spell Property EarthBolt Auto

MiscObject Property AirRune Auto
MiscObject Property ChaosRune Auto
MiscObject Property EarthRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
		Int EarthRuneCt = Game.GetPlayer().GetItemCount(EarthRune)
		If AirRuneCt < 2 && ChaosRuneCt < 1 && EarthRuneCt < 3 
			Game.GetPlayer().UnequipSpell(EarthBolt, 0)
			Game.GetPlayer().UnequipSpell(EarthBolt, 1)
		Else
			Game.GetPlayer().RemoveItem(AirRune, 2)
			Game.GetPlayer().RemoveItem(ChaosRune, 1)
			Game.GetPlayer().RemoveItem(EarthRune, 3)
			
			Int damage = Utility.RandomInt(1,11)
			
			akTarget.DamageActorValue("Health", damage)
			
			Float Magic = RS_GV_MagicXP.GetValue()
			Float BaseXP = 19.5
			Float ModMagicXP = ((BaseXP) + damage)
			
			rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
			rsFrameworkMenu.SpellCheck_Magic()
			
		EndIf
	EndIf
	
EndEvent
