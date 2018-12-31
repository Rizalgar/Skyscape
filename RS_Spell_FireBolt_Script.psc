Scriptname RS_Spell_FireBolt_Script extends activemagiceffect  
{Fire Bolt script}

Spell Property FireBolt Auto

MiscObject Property AirRune Auto
MiscObject Property ChaosRune Auto
MiscObject Property FireRune Auto

Event OnSpellCast(Form akSpell)

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == Game.GetPlayer()
		Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
		Int ChaosRuneCt = Game.GetPlayer().GetItemCount(ChaosRune)
		Int FireRuneCt = Game.GetPlayer().GetItemCount(FireRune)
			If AirRuneCt < 3 && ChaosRuneCt < 1 && FireRuneCt < 4
				Game.GetPlayer().UnequipSpell(FireBolt, 0)
				Game.GetPlayer().UnequipSpell(FireBolt, 1)
			Else
				Game.GetPlayer().RemoveItem(AirRune, 3)
				Game.GetPlayer().RemoveItem(ChaosRune, 1)
				Game.GetPlayer().RemoveItem(FireRune, 4)
				
				Int damage = Utility.RandomInt(1,12)
				
				akTarget.DamageActorValue("Health", damage)
				
				Float BaseXP = 22.5
				Float ModMagicXP = ((BaseXP) + damage)
				
				rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
				rsFrameworkMenu.SpellCheck_Magic()
			EndIf
	EndIf

EndEvent
