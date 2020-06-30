//%attributes = {}
ARRAY TEXT:C222(_TabTitles;0)
C_COLLECTION:C1488(Infos)

Infos:=ds:C1482.INFO.all().orderBy("PageNumber").toCollection()
COLLECTION TO ARRAY:C1562(Infos.query("PageNumber<=2");_TabTitles;"TabTitle")