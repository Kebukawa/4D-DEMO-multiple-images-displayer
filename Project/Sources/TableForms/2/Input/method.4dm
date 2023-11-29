

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		
		Form:C1466.list:=ds:C1482.Image.query("ID_Main = :1"; [Main:2]ID:1)
		
		WA SET PREFERENCE:C1041(*; "Web Area"; WA enable contextual menu:K62:6; True:C214)
		WA SET PREFERENCE:C1041(*; "Web Area"; WA enable Web inspector:K62:7; True:C214)
		
		OBJECT SET TITLE:C194(*; "Help text"; "")
		
End case 
