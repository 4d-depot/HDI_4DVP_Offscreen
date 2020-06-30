//%attributes = {}
  // Updates the thermometer value and visible state
C_LONGINT:C283($1;$percent)
C_BOOLEAN:C305($2;$visible)

$percent:=$1

Form:C1466.thermometer:=$1

If (Count parameters:C259>1)
	$visible:=$2
	
	OBJECT SET VISIBLE:C603(*;"Thermometer";$visible)
	
End if 