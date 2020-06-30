  // Manage the document export.
  //  The object created with this class can be passed in parameter to VP EXPORT DOCUMENT
Class constructor
	C_TEXT:C284($1)
	C_OBJECT:C1216($2)
	C_TEXT:C284($3)
	C_REAL:C285($4)
	C_OBJECT:C1216($this)
	
	This:C1470.area:=$1
	This:C1470.selectedDoc:=$2
	This:C1470.folder:=$3
	This:C1470.format:=vk MS Excel format:K89:2
	This:C1470.winRef:=$4
	
	$this:=This:C1470
	  // Define the method called at the end of each export
	This:C1470.formula:=Formula:C1597($this.next())
	
	  // Export the first document selected
Function start
	  // Update progress bar
	CALL FORM:C1391(This:C1470.winRef;"UpdateThermometer";This:C1470.selectedDoc.progression())
	  // Verify if document available
	If (Not:C34(This:C1470.selectedDoc.isEmpty()))
		This:C1470.exportDocument(This:C1470.selectedDoc.first())
	Else 
		  // Close the 4D View Pro offscreen area if no document
		ACCEPT:C269
	End if 
	
	  // Callback method called at the end of each export
	  // Start the export of the next document if present
Function next
	  // Update progress bar
	CALL FORM:C1391(This:C1470.winRef;"UpdateThermometer";This:C1470.selectedDoc.progression())
	
	  // Test if last document or not
	If (Not:C34(This:C1470.selectedDoc.isLast()))
		  // Start next export if not the last
		This:C1470.exportDocument(This:C1470.selectedDoc.next())
	Else 
		  // Close the 4D View Pro offscreen area if last document reached
		ACCEPT:C269
	End if 
	
	  // Method to export current document
Function exportDocument
	C_OBJECT:C1216($1;$doc)
	C_OBJECT:C1216($vp)
	C_OBJECT:C1216($path;$param)
	C_OBJECT:C1216($printInfo)
	
	$doc:=$1
	
	  // search document in the database
	$vp:=ds:C1482.Documents.get($doc.id)
	
	  // Import the document in the 4D View Pro offscreen area
	VP IMPORT FROM OBJECT (This:C1470.area;$vp.ViewPro)
	
	  // Create the print info object to specify print options
	$printInfo:=New object:C1471
	$printInfo.orientation:=vk print page orientation landscape:K89:89
	$printInfo.fitPagesTall:=1
	$printInfo.fitPagesWide:=1
	VP SET PRINT INFO (This:C1470.area;$printInfo)
	
	  // Document Export
	$path:=New object:C1471
	$path.parentFolder:=This:C1470.folder
	$path.name:=$vp.Title
	This:C1470.valuesOnly:=True:C214
	VP EXPORT DOCUMENT (This:C1470.area;Object to path:C1548($path);This:C1470)
	