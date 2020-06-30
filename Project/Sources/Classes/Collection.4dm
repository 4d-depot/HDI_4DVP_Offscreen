Class constructor
	C_COLLECTION:C1488($1)
	
	This:C1470._num:=0
	This:C1470._count:=1
	If (Count parameters:C259=1)
		This:C1470._collection:=$1
	Else 
		This:C1470._collection:=New collection:C1472
	End if 
	
	  // returns the current item
Function current
	C_VARIANT:C1683($0)
	$0:=This:C1470._collection[This:C1470._num]
	
	  // Inits the counter to 0 and returns the first item
Function first
	C_VARIANT:C1683($0)
	This:C1470._num:=0
	$0:=This:C1470._collection[This:C1470._num]
	
	  // Returns next item
Function next
	C_VARIANT:C1683($0)
	If (Not:C34(This:C1470.isLast()))
		This:C1470._num:=This:C1470._num+1
	End if 
	$0:=This:C1470._collection[This:C1470._num]
	
	  // Verifies if the current item is the last
Function isLast
	C_BOOLEAN:C305($0)
	$0:=This:C1470._num+1=This:C1470._collection.length
	
	  // Verifies if the collection is emtpy
Function isEmpty
	C_BOOLEAN:C305($0)
	$0:=This:C1470._collection.length=0
	
	  // calculates a percentage of progression
Function progression
	C_REAL:C285($0)
	If (This:C1470._collection.length>0)
		$0:=(This:C1470._count/(This:C1470._collection.length+1))*100
		This:C1470._count:=This:C1470._count+1
	Else 
		$0:=0
	End if 