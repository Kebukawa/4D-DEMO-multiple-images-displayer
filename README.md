# 本サンプルについて

## 概要

４Ｄのデータベースで、フィールドに収められた画像を表示するとき、マウス操作で画像の一部を拡大したり、拡大したままスクロールしたり、表示されている部分をドラッグして表示位置を移動したりする方法について、ライ代としてまとめました。

## 使い方

+ 起動後に表示されるメニューからDEMOを選択して、サンプルの動作を確認できます。
+ イメージの表示はWebエリアで行われ、拡大縮小の操作はマウスホイールを使います。トラックパッドでも同様の操作を行うことは可能です。
+ イメージを選択したとき、Webエリアに隙間ができないようにイメージの大きさは合わせられて表示されます。イメージは、縮小時にはWebエリアに隙間ができないように縮小されます。そのため、イメージ表示直後は拡大から操作できることになります。
+  Webエリア上でマウス左ボタンを押して、イメージをドラッグできます。イメージ表示直後は、イメージの最小の大きさでの表示なので、ドラッグできる方向が限られることがあります。
+ マウス操作のプログラムはすべてJavascriptで書かれています。
+ Javascriptは、Resources/html/viewer.html ファイルに集約されています。Webエリアには、viewer.htmlを表示して動作を実現しています。
+  Javascriptは、下記URLの記事を参考にしていますが、同じものではありません。
> https://kano.arkoak.com/2020/06/04/zoom/

## ライセンス

MIT Licenseに準拠しますが…

+ 自由に利用して構いません
+ 商用利用も問題ありません

コード内に、この例題を参考にしたと表明してもらえると、ちょっと嬉しいです。
