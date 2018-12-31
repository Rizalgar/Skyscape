Scriptname RS_Spell_AirStrike Extends ActiveMagicEffect
{Script for Air Strike}

MiscObject Property AirRune Auto
MiscObject Property MindRune Auto

Spell Property AirStrike Auto

Event OnSpellCast(Form akSpell)
	;Do Stuff
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	
		If akCaster == Game.GetPlayer()
			Int AirRuneCt = Game.GetPlayer().GetItemCount(AirRune)
			Int MindRuneCt = Game.GetPlayer().GetItemCount(MindRune)
			If AirRuneCt < 1 || MindRuneCt < 1 
				Game.GetPlayer().UnequipSpell(AirStrike, 0)
				Game.GetPlayer().UnequipSpell(AirStrike, 1)
			Else
				Game.GetPlayer().RemoveItem(AirRune, 1)
				Game.GetPlayer().RemoveItem(MindRune, 1)
				
				Int damage = Utility.RandomInt(1,2)
				
				akTarget.DamageActorValue("Health", damage)
			
				Float Xp = 5.5
				Float BonusXp = Utility.RandomInt(1,2)
				Float ModMagicXP = ((Xp) + BonusXp)
				rsFrameworkMenu.rsXPGain("magic", ModMagicXP)
				rsFrameworkMenu.SpellCheck_Magic()
			endif
		endif
				
EndEvent 