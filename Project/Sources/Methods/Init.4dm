//%attributes = {}
C_OBJECT:C1216($doc)

Form:C1466.docs:=New collection:C1472

For each ($doc;ds:C1482.Documents.all())
	Form:C1466.docs.push(cs:C1710.DisplayDocuments.new($doc))
End for each 

Form:C1466.folder:=System folder:C487(Documents folder:K41:18)
Form:C1466.excelType:=True:C214

Form:C1466.thermometer:=0
Form:C1466.trace:=False:C215
