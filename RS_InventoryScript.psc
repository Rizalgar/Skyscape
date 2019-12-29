Scriptname RS_InventoryScript Extends ReferenceAlias
{Main inventory handler}

Actor Property PlayerRef Auto

GlobalVariable Property RS_Inventory_Max Auto
GlobalVariable Property RS_Inventory_Current Auto
GlobalVariable Property RS_Bank_Max Auto
GlobalVariable Property RS_Bank_Current Auto
GlobalVariable Property RS_Check_ModStatus Auto

Formlist Property RS_FL_Inventory Auto
Formlist Property RS_FL_Bank Auto
Formlist Property RS_FL_Stackable Auto

Event OnItemAdded(Form Base, Int Count, ObjectReference Ref, ObjectReference Con)

	Ammo AmmoBase = Base as Ammo
	Armor ArmorBase = Base as Armor
	Book BookBase = Base as Book
	Key KeyBase = Base as Key
	MiscObject MiscBase = Base as MiscObject
	Potion PotionBase = Base as Potion
	Weapon WeaponBase = Base as Weapon
	
	If RS_Check_ModStatus.GetValue() == 1
		If !Con
			If RS_FL_Stackable.HasForm(AmmoBase)
				;AddItem
			ElseIf RS_FL_Stackable.HasForm(MiscBase)
				;AddItem
			ElseIf ((RS_Inventory_Max.GetValue()) - RS_Inventory_Current.GetValue()) < Count ;Determines if the amount picked up is more than available inventory space
				PlayerRef.RemoveItem(ArmorBase, Count, True)
				PlayerRef.PlaceAtMe(ArmorBase)
				PlayerRef.RemoveItem(BookBase, Count, True)
				PlayerRef.PlaceAtMe(BookBase)
				PlayerRef.RemoveItem(KeyBase, Count, True)
				PlayerRef.PlaceAtMe(KeyBase)
				PlayerRef.RemoveItem(MiscBase, Count, True)
				PlayerRef.PlaceAtMe(MiscBase)
				PlayerRef.RemoveItem(PotionBase, Count, True)
				PlayerRef.PlaceAtMe(PotionBase)
				PlayerRef.RemoveItem(WeaponBase,  Count, True)
				PlayerRef.PlaceAtMe(WeaponBase)
				Debug.Notification("You cannot pick up that many.")
			Else
				If RS_Inventory_Current.GetValue() >= 28
					PlayerRef.RemoveItem(ArmorBase, Count, True)
					PlayerRef.PlaceAtMe(ArmorBase)
					PlayerRef.RemoveItem(BookBase, Count, True)
					PlayerRef.PlaceAtMe(BookBase)
					PlayerRef.RemoveItem(KeyBase, Count, True)
					PlayerRef.PlaceAtMe(KeyBase)
					PlayerRef.RemoveItem(MiscBase, Count, True)
					PlayerRef.PlaceAtMe(MiscBase)
					PlayerRef.RemoveItem(PotionBase, Count, True)
					PlayerRef.PlaceAtMe(PotionBase)
					PlayerRef.RemoveItem(WeaponBase,  Count, True)
					PlayerRef.PlaceAtMe(WeaponBase)
					Debug.Notification("You are out of inventory space")
				Else
					RS_Inventory_Current.SetValue((RS_Inventory_Current.GetValue()) + Count)
				EndIf
			EndIf
		Else
			If RS_FL_Stackable.HasForm(AmmoBase)
				;AddItem
			ElseIf RS_FL_Stackable.HasForm(MiscBase)
				;AddItem
			Else
				If RS_Inventory_Current.GetValue() >= RS_Inventory_Max.GetValue()
					PlayerRef.RemoveItem(ArmorBase, Count, True)
					PlayerRef.PlaceAtMe(ArmorBase)
					PlayerRef.RemoveItem(BookBase, Count, True)
					PlayerRef.PlaceAtMe(BookBase)
					PlayerRef.RemoveItem(KeyBase, Count, True)
					PlayerRef.PlaceAtMe(KeyBase)
					PlayerRef.RemoveItem(MiscBase, Count, True)
					PlayerRef.PlaceAtMe(MiscBase)
					PlayerRef.RemoveItem(PotionBase, Count, True)
					PlayerRef.PlaceAtMe(PotionBase)
					PlayerRef.RemoveItem(WeaponBase,  Count, True)
					PlayerRef.PlaceAtMe(WeaponBase)
					Debug.Notification("You are out of inventory space")
				Else
					RS_Inventory_Current.SetValue((RS_Inventory_Current.GetValue()) + Count)
				EndIf
			EndIf
		EndIf
		
		If RS_Inventory_Current.GetValue() >= RS_Inventory_Max.GetValue()
			If RS_FL_Stackable.HasForm(AmmoBase)
				;Nothing
			ElseIf RS_FL_Stackable.HasForm(MiscBase)
				;Nothing
			Else 
				RS_Inventory_Current.SetValue(29)
			EndIf
		EndIf
	EndIf
	
EndEvent

Event OnItemRemoved(Form Base, Int Count, ObjectReference Ref, ObjectReference Con)

	Utility.Wait(1.0)
	
	Ammo AmmoBase = Base as Ammo
	Armor ArmorBase = Base as Armor
	Book BookBase = Base as Book
	Key KeyBase = Base as Key
	MiscObject MiscBase = Base as MiscObject
	Potion PotionBase = Base as Potion
	Weapon WeaponBase = Base as Weapon
	
	If RS_Check_ModStatus.GetValue() == 1
		If !Con
			If RS_FL_Stackable.HasForm(AmmoBase)
				;Don't remove
			ElseIf RS_FL_Stackable.HasForm(MiscBase)
				;Don't remove
			Else 
				RS_Inventory_Current.SetValue((RS_Inventory_Current.GetValue()) - Count)
			EndIf
		EndIf
	EndIf
	
EndEvent