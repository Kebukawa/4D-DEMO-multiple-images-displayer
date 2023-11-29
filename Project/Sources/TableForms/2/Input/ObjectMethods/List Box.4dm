
Case of 
	: (Form event code:C388=On Selection Change:K2:29) & (Form:C1466.ListboxSelectRows.length#0)
		
		//クリックされたとき
		var $image : Picture
		$image:=Form:C1466.ListboxSelectRows[0].Image
		PICTURE TO BLOB:C692(Form:C1466.ListboxSelectRows[0].Image; $blob; ".png")
		BASE64 ENCODE:C895($blob; $base64)
		
		$html:=File:C1566("/RESOURCES/html/viewer.html").getText()
		PROCESS 4D TAGS:C816($html; $html; $base64)
		
		WA SET PAGE CONTENT:C1037(*; "Web Area"; $html; "")
		
	: (Form event code:C388=On Clicked:K2:4)
		
		GET MOUSE:C468($MouseX; $MouseY; $MouseButton)
		If (Macintosh control down:C544 | ($MouseButton=2))
			
			var $image : Picture
			GET PICTURE FROM PASTEBOARD:C522($image)
			
			$menu:=Create menu:C408
			APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
			SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; ak select all:K76:57)
			APPEND MENU ITEM:C411($menu; "-")
			APPEND MENU ITEM:C411($menu; Choose:C955(Form:C1466.ListboxSelectRows.length#0; ""; "(")+"イメージの削除")
			SET MENU ITEM PARAMETER:C1004($menu; -1; "delete")
			APPEND MENU ITEM:C411($menu; "-")
			APPEND MENU ITEM:C411($menu; Choose:C955(Picture size:C356($image)#0; ""; "(")+"クリップボードのイメージを追加")
			SET MENU ITEM PARAMETER:C1004($menu; -1; "add")
			APPEND MENU ITEM:C411($menu; Choose:C955(((Picture size:C356($image)#0) & (Form:C1466.ListboxSelectRows.length=1)); ""; "(")+"クリップボードからイメージをペースト")
			SET MENU ITEM PARAMETER:C1004($menu; -1; "paste")
			APPEND MENU ITEM:C411($menu; Choose:C955(Form:C1466.ListboxSelectRows.length#0; ""; "(")+"クリップボードにコピー")
			SET MENU ITEM PARAMETER:C1004($menu; -1; "copy")
			$select:=Dynamic pop up menu:C1006($menu)
			
			Case of 
				: ($select="add")  //クリップボードのイメージを追加
					If (Picture size:C356($image)#0)
						$entity:=ds:C1482.Image.new()
						$entity.ID_Main:=[Main:2]ID:1
						$entity.Image:=$image
						$entity.save()
						Form:C1466.list:=ds:C1482.Image.query("ID_Main = :1"; [Main:2]ID:1)
					End if 
					
				: ($select="copy")  //クリップボードにコピー
					If (Form:C1466.ListboxSelectRows.length#0)
						SET PICTURE TO PASTEBOARD:C521(Form:C1466.ListboxSelectRows[0].Image)
					End if 
					
				: ($select="paste")  //クリップボードからペースト
					If (Picture size:C356($image)#0) & (Form:C1466.ListboxSelectRows.length#0)
						$entity:=Form:C1466.ListboxSelectRows[0]
						$entity.Image:=$image
						$entity.save()
						Form:C1466.list:=ds:C1482.Image.query("ID_Main = :1"; [Main:2]ID:1)
					End if 
					
				: ($select="delete")  //イメージの削除
					If (Form:C1466.ListboxSelectRows.length#0)
						CONFIRM:C162(String:C10(Form:C1466.ListboxSelectRows.length)+"個の画像を削除しますか?"; "削除")
						If (OK=1)
							Form:C1466.ListboxSelectRows.drop()
							Form:C1466.list:=ds:C1482.Image.query("ID_Main = :1"; [Main:2]ID:1)
						End if 
					End if 
					
					
			End case 
			
		End if 
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		
		OBJECT SET TITLE:C194(*; "Help text"; "リスト上で右クリックしてメニューを表示できます")
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		OBJECT SET TITLE:C194(*; "Help text"; "")
		
End case 
