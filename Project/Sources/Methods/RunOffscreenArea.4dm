//%attributes = {}
  // Runs the VP offscreen area
C_OBJECT:C1216($1;$param)
C_BOOLEAN:C305($2;$trace)
C_BOOLEAN:C305($result)

$param:=$1

$trace:=$2

If ($trace)
	TRACE:C157
End if 

  // Show progress bar
CALL FORM:C1391($param.winRef;"UpdateThermometer";0;True:C214)

  // Create the offscreen area with the options passed in parameter
$result:=VP Run offscreen area ($param)

  // Dislay a message in order to the ACCEPT or CANCEL response
If (Bool:C1537($result))
	ALERT:C41("Export finished")
	SHOW ON DISK:C922($param.folder;*)
Else 
	ALERT:C41("An error is occured")
End if 

  // Hide progress bar
CALL FORM:C1391($param.winRef;"UpdateThermometer";0;False:C215)