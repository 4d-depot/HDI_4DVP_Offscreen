  // Manage the offscreen event.
  // The object created with this class can be passed in parameter to VP Run offscreen area
Class constructor
	C_OBJECT:C1216($1)
	C_TEXT:C284($2)
	
	This:C1470.selectedDoc:=$1  // collection with all the documents selected
	This:C1470.folder:=$2
	This:C1470.winRef:=Current form window:C827
	
	This:C1470.autoQuit:=False:C215  // Closing of the offscreen area is manage by developer
	This:C1470.timeout:=30
	This:C1470.result:=True:C214
	
	  // Call back method
	  // Manage actions to do in order to the events 
Function onEvent
	Case of 
		: (FORM Event:C1606.code=On VP Ready:K2:59)
			
			  // Start document export
			cs:C1710.ExportDocument.new(This:C1470.area;This:C1470.selectedDoc;This:C1470.folder;This:C1470.winRef).start()
			
		: (FORM Event:C1606.code=On URL Loading Error:K2:48)
			
			CANCEL:C270  // Close the 4D View Pro offscreen area if an error occured
			This:C1470.result:=False:C215
			
		: (FORM Event:C1606.code=On Unload:K2:2)
			
			If (Bool:C1537(This:C1470.timeoutReached))
				This:C1470.result:=False:C215
			End if 
			
	End case 