  // Information to display in the listbox
Class constructor
	C_OBJECT:C1216($1)
	This:C1470.id:=0
	This:C1470.title:=""
	This:C1470.isSelected:=True:C214
	
	If (Count parameters:C259>=1)
		This:C1470.id:=$1.ID
		This:C1470.title:=$1.Title
	End if 