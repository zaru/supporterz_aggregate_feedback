# サポーターズ企業プレゼン学生フィードバック集計

## Usage

```
$ env SUPPORTERZ_ID=1234hogepiyo USER=hoge PASSWORD=password
$ ruby ./aggregate.rb [comment | point]
```

環境変数 `SUPPORTERZ_ID` にフィードバック URL の ID をセットしてください。
例えば `https://viewer.kintoneapp.com/public/1234hogepiyo#/` の URL の場合は `SUPPORTERZ_ID=1234hogepiyo` です。

また、Digest 認証の ID/Password も合わせて環境変数でセットしてください。

コメントを集計したい場合は `comment` ポジティブポイントを集計したい場合は `point` を引数で渡してください。

あとは出力結果を Google スプレッドシートなどに入れれば OK です。
