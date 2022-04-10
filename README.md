get-ytvideos-from-ch
=======

## これは何？

WindowsのPowerShellを使って特定のYouTubeチャンネルからアップロード動画の情報を取得するシェルスクリプトです。

This is an Windows PowerShell script that obtaines meta data of upload videos from a specific YouTube channel.

## 何が必要？

GoogleがアプリやWebの開発者向けに無料で公開しているYouTube Data API v3を利用しています。これを利用するにはいくつかの規約に同意した上で自分のAPIキーを取得する必要があります。

Google Cloud PlatformのAPIライブラリから「YouTube Data API」を有効にしたら、認証情報にAPIキーを追加します。この時に割り当てられたAPIキーを使います。詳しくは他のサイトを参考にして下さい。

## 使い方

ps1ファイルをテキストエディターで開いて、以下の部分を書き換えます。

~~~
$api_key = '取得したAPIキー'
$channel_id = '動画情報を取得するYouTubeチャンネル'
$get_videonum = (新しい順で数えて)取得する動画数
~~~

編集したファイルを保存します。出力結果を整形したい場合は`***This is an example. REPLACE IT WITH YOUR CODE***`より下のコードを書き換えて下さい。

PowerShellで`(ps1ファイルへのパス)`を実行します。結果がコンソールに出力されます。動画数が50以上ある場合は1秒ごとに順次取得します。

PowerShellで`(ps1ファイルへのパス)>aiue.txt`を実行します。結果がaiue.txtに出力されます。

`notepad aiue.txt`を実行すると、メモ帳で出力ファイルを開きます。

おしまい。
