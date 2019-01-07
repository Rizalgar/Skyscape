Scriptname RS_Craft_Leather_Script extends ObjectReference  
{WIP Crafting Script for Leather}

rsFrameworkMenu Function GetFrameworkMenu() Global
	Return (Game.GetFormFromFile(0x294A97, "Skyscape.esm") as Quest) as rsFrameworkMenu
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Incomplete, needs a lot more work ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;
;; Global Variables ;;
;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;
;;;
;;
;
GlobalVariable Property RS_GV_CraftingXP Auto
GlobalVariable Property RS_GV_CraftingLVL Auto
;;
MiscObject Property LeatherHide Auto
MiscObject Property GreenHide Auto
MiscObject Property BlueHide Auto
MiscObject Property RedHide Auto
MiscObject Property BlackHide Auto
;;
MiscObject Property Needle Auto
MiscObject Property Thread Auto
;;
Armor Property LeatherBoots Auto
Armor Property LeatherVam Auto
Armor Property LeatherCoif Auto
Armor Property LeatherBody Auto
;;
Armor Property GreenBoots Auto
Armor Property GreenVam Auto 
Armor Property GreenCoif Auto
Armor Property GreenBody Auto
;;
Armor Property BlueBoots Auto
Armor Property BlueVam Auto
Armor Property BlueCoif Auto
Armor Property BlueBody Auto
;;
Armor Property RedBoots Auto
Armor Property RedVam Auto
Armor Property RedCoif Auto
Armor Property RedBody Auto
;;
Armor Property BlackBoots Auto
Armor Property BlackVam Auto
Armor Property BlackCoif Auto
Armor Property BlackBody Auto
;;
Message Property RS_Message_Crafting_Leather_LeatherType Auto
Message Property RS_Message_Crafting_Leather_Leather Auto
Message Property RS_Message_Crafting_Leather_HardLeather Auto
Message Property RS_Message_Crafting_Leather_Green Auto
Message Property RS_Message_Crafting_Leather_Blue Auto
Message Property RS_Message_Crafting_Leather_Red Auto
Message Property RS_Message_Crafting_Leather_Black Auto
Message Property RS_Message_Crafting_Leather_GreenVamsMulti Auto
Message Property RS_Message_Crafting_Leather_GreenBootsMulti Auto
Message Property RS_Message_Crafting_Leather_GreenCoifMulti Auto
Message Property RS_Message_Crafting_Leather_GreenBodyMulti Auto
Message Property RS_Message_Crafting_Leather_LeatherVamsMulti Auto
Message Property RS_Message_Crafting_Leather_LeatherBootsMulti Auto
Message Property RS_Message_Crafting_Leather_LeatherCowlMulti Auto
Message Property RS_Message_Crafting_Leather_LeatherBodyMulti Auto
;
;;
;;;
;;;;
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Integers, Strings and Floats ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;
;;;
;;
;
Int LeatherType
Int Leather
Int LeatherVamMulti
Int LeatherBootsMulti
Int LeatherCowlMulti
Int LeatherBodyMultu
Int HardLeather
Int Green
Int GreenVamMulti
Int GreenBootsMulti
Int GreenCoifMulti
Int GreenBodyMulti
Int Blue
Int Red
Int Black
Actor PlayerRef
;
;;
;;;
;;;;
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Experience Gains and Multiplier ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;
;;;
;;
;
Int XPMultiplier = 1
;;
Float LVams = 13.8
Float LBoots = 16.3
Float LCowl = 18.5
Float LBody = 25.0
;;
Float HLVams = 32.0
Float HLBoots = 34.0
Float HLCowl = 35.0
Float HLBody = 35.0
;;
Float GDHVams = 62.0
Float GDHBoots = 62.0 
Float GDHCowl =  124.0
Float GDHBody = 186.0
;;
Float BDHVams = 70.0
Float BDHBoots = 70.0
Float BDHCowl = 140.0
Float BDHBody = 210.0
;;
Float RDHVams = 78.0
Float RDHBoots = 78.0
Float RDHCowl = 156.0
Float RDHBody = 234.0
;;
Float BlDHVams = 86.0
Float BlDHBoots = 86.0
Float BlDHCowl = 172.0
Float BlDHBody = 258.0
;;;;;
;;;;
;;;
;;
;
;;;;;;;;;;;;;;;;;;;;;;;;
;; Level Requirements ;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;
;;;
;;
;
Int LVamsLVL = 1
Int LBootsLVL = 7
Int LCowlLVL = 10
Int LBodyLVL = 14
;;
Int HLVamsLVL = 25
Int HLBootsLVL = 27
Int HLCowlLVL = 27
Int HLBodyLVL = 28
;;
Int GDHVamsLVL = 57
Int GDHBootsLVL = 60
Int GDHCowlLVL = 61
Int GDHBodyLVL = 63
;;
Int BDHVamsLVL = 66
Int BDHBootsLVL = 68
Int BDHCowlLVL = 69
Int BDHBodyLVL = 71
;;
Int RDHVamsLVL = 73
Int RDHBootsLVL = 75
Int RDHCowlLVL = 76
Int RDHBodyLVL = 77
;;
Int BlDHVamsLVL = 79
Int BlDHBootsLVL = 82
Int BlDHCowlLVL = 83
Int BlDHBodyLVL = 83
;
;;
;;;
;;;;
;;;;;
;;;;;;;;;;;;;;;;;;
;; Begin Events ;;
;;;;;;;;;;;;;;;;;;
;;;;;
;;;;
;;;
;;
;
Event OnEquipped(Actor akActor)
	If akActor == Game.GetPlayer()
		PlayerRef = Game.GetPlayer()
		ExitMenu()
		Float clvl = RS_GV_CraftingLVL.GetValue()
		Int Needleloss = Utility.RandomInt(0,1)
		Int Threadloss = Utility.RandomInt(0,1)
		Int LeatherHideCt = Game.GetPlayer().GetItemCount(LeatherHide)
		Int ThreadCt = Game.GetPlayer().GetItemCount(Thread)
		Int NeedleCt = Game.GetPlayer().GetItemCount(Needle)
		Int GreenHideCt = Game.GetPlayer().GetItemCount(GreenHide)
		Int BlueHideCt = Game.GetPlayer().GetItemCount(BlueHide)
		Int RedHideCt = Game.GetPlayer().GetItemCount(RedHide)
		Int BlackHideCt = Game.GetPlayer().GetItemCount(BlackHide)
		leatherType == RS_Message_Crafting_Leather_LeatherType.Show()
			If leatherType == 0 ;; Leather Armor
				leather = RS_Message_Crafting_Leather_Leather.Show()
				If leather == 0 ;; vambraces
					LeatherVamMulti = RS_Message_Crafting_Leather_LeatherVamsMulti.Show()
					If LeatherVamMulti == 0 ;; x1
						If LeatherHideCt >= 1 && NeedleCt >= 1 && ThreadCt >= 1
							Game.GetPlayer().RemoveItem(LeatherHide, 1)
							Game.GetPlayer().AddItem(LeatherVam, 1)
							rsFrameworkMenu.rsXPGain("crafting", LVams)
							If Needleloss == 1
								Game.GetPlayer().RemoveItem(Needle, 1)
							Endif
							If Threadloss == 1
								Game.GetPlayer().RemoveItem(Thread, 1)
							Endif
						Else
							Debug.MessageBox("You lack the required items to craft this")
						Endif
					ElseIf LeatherVamMulti == 1 ;;x2
						If LeatherHideCt >= 2 && ThreadCt >= 1 &&  NeedleCt >= 1
							Game.GetPlayer().RemoveItem(LeatherHide, 2)
							Game.GetPlayer().AddItem(LeatherVam, 2)
							Float XP = LVams * 2
							rsFrameworkMenu.rsXPGain("crafting", XP)
							If Needleloss == 1
								Game.GetPlayer().RemoveItem(Needle, 1)
							Endif
							If Threadloss == 1
								Game.GetPlayer().RemoveItem(Thread, 1)
							Endif
						Else
							Debug.MessageBox("You lack the required items to craft this")
						Endif
					Elseif LeatherVamMulti == 2 ;; x3
						If LeatherHideCt >= 3 && ThreadCt >= 1 && NeedleCt >= 1
							Game.GetPlayer().RemoveItem(LeatherHide, 3)
							Game.GetPlayer().AddItem(LeatherVam, 3)
							Float XP = LVams * 3
							rsFrameworkMenu.rsXPGain("crafting", XP)
							If Needleloss == 1
								Game.GetPlayer().RemoveItem(Needle, 1)
							Endif
							If Threadloss == 1
								Game.GetPlayer().RemoveItem(Thread, 1)
							Endif
						Else
							Debug.MessageBox("You lack the required items")
						Endif
					Elseif LeatherVamMulti == 3 ;; x4
						If LeatherHideCt >= 4 && NeedleCt >= 1 && ThreadCt >= 1
							Game.GetPlayer().RemoveItem(LeatherHide, 4)
							Game.GetPlayer().AddItem(LeatherVam, 4)
							Float XP =  LVams * 4
							rsFrameworkMenu.rsXPGain("crafting", XP)
							If Needleloss == 1
								Game.GetPlayer().RemoveItem(Needle, 1)
							Endif
							If Threadloss == 1
								Game.GetPlayer().RemoveItem(Thread, 1)
							Endif
							;; EAT MORE CHEETOS PUFFCORN AND DRINK MORE MONSTER
						Else
							Debug.MessageBox("You lack the required items to craft this")
						Endif
					ElseIf LeatherVamMulti == 4 ;; x5
						If LeatherHideCt >= 5 && ThreadCt >= 1 && NeedleCt >= 1
							Game.GetPlayer().RemoveItem(LeatherHide, 5)
							Game.GetPlayer().AddItem(LeatherVam, 5)
							Float XP = LVams * 5
							rsFrameworkMenu.rsXPGain("crafting", XP)
							If Needleloss == 1
								Game.GetPlayer().RemoveItem(Needle, 1)
							Endif
							If Threadloss == 1
								Game.GetPlayer().RemoveItem(Thread, 1)
							Endif
						Else
							Debug.MessageBox("You lack the required items to craft this")
						Endif
					Endif
				ElseIf leather == 1 ;;boots
					LeatherBootsMulti = RS_Message_Crafting_Leather_LeatherBootsMulti.Show()
					If LeatherBootsMulti == 0 ;;x1
						If clvl > 6
							If LeatherHideCt >= 1 && ThreadCt >= 1 && NeedleCt >= 1
								Game.GetPlayer().RemoveItem(LeatherHide, 1)
								Game.GetPlayer().AddItem(LeatherBoots, 1)
								rsFrameworkMenu.rsXPGain("crafting", LBoots)
								If Needleloss == 1
									Game.GetPlayer().RemoveItem(Needle, 1)
								Endif
								If Threadloss == 1
									Game.GetPlayer().RemoveItem(Thread, 1)
								Endif
							Else
								Debug.MessageBox("You lack the required items to craft this")
							Endif
						Else
							Debug.MessageBox("This item requires level 7 crafting")
						EndIf
					If LeatherBootsMulti == 1 ;; x2
						if clvl > 6
							If LeatherHideCt >= 2 && ThreadCt >= 1 && NeedleCt >= 1
								Game.GetPlayer().RemoveItem(LeatherHide, 2)
								Game.GetPlayer().AddItem(LeatherBoots, 2)
								Float XP = LBoots * 2 * XPMultiplier
								rsFrameworkMenu.rsXPGain("crafting", LBoots)
								If Needleloss == 1
									Game.GetPlayer().RemoveItem(Needle, 1)
								EndIf
								If Threadloss == 1
									Game.GetPlayer().RemoveItem(Thread, 1)
								EndIf
							Else
								Debug.MessageBox("You lack the required items to craft this")
							EndIf
						Else
							Debug.MessageBox("This item requires level 7 crafting")
						EndIf
					ElseIf LeatherBootsMulti == 2 ;; x3
						if clvl > 6
							If LeatherHideCt >= 3 && ThreadCt >= 1 && NeedleCt >= 1
								Game.GetPlayer().RemoveItem(LeatherHide, 3)
								Game.GetPlayer().Additem(LeatherBoots, 3)
								Float XP = LBoots * 3 * XPMultiplier
								If Needleloss == 1
									Game.GetPlayer().RemoveItem(Needle, 1)
								EndIf
								If Threadloss == 1
									Game.GetPlayer().RemoveItem(Thread, 1)
								EndIf
							Else
								Debug.MessageBox("You lack the required items to craft this")
							EndIf
						Else
							Debug.MessageBox("This item requires level 7 crafting")
						EndIf
					ElseIf LeatherBootsMulti == 3 ;; x4
						if clvl > 6
							If LeatherHideCt >= 4 && ThreadCt >= 1 && NeedleCt >= 1
								Game.GetPlayer().RemoveItem(LeatherHide, 4)
								Game.GetPlayer().AddItem(LeatherBoots, 4)
								Float XP = LBoots * 4 * XPMultiplier
								If Needleloss == 1
									Game.GetPlayer().RemoveItem(Needle, 1)
								EndIf
								If Threadloss == 1
									Game.GetPlayer().RemoveItem(Thread, 1)
								EndIf
							Else
								Debug.MessageBox("You lack the required items to craft this")
							Endif
						Else
							Debug.MessageBox("This item requires level 7 crafting")
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	
EndEvent
							
Function ExitMenu()
Game.DisablePlayerControls(false, false, false, false, false, true, false)
utility.wait(0.1)
Game.EnablePlayerControls(false, false, false, false, false, true, false)
EndFunction 