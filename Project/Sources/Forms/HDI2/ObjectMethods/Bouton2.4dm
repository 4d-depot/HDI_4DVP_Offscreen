C_OBJECT:C1216($offscreen)
C_TEXT:C284($format)

  // Creates an offscreen object from the Offscreen class. This object will be pass in parameter to VP Run offscreen area command 
$offscreen:=cs:C1710.Offscreen.new(cs:C1710.Collection.new(Form:C1466.docs.query("isSelected=:1";True:C214));Form:C1466.folder)

If (Not:C34($offscreen.selectedDoc.isEmpty()))
	  // Opens a new process and executes the RunOffscreenArea method
	CALL WORKER:C1389("myWorker";"RunOffscreenArea";$offscreen;Form:C1466.trace)
Else 
	ALERT:C41("No document selected!")
End if 