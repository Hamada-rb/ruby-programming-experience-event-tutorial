# 簡単な掲示板を作ってみよう

[Sinatra](https://github.com/sinatra/sinatra/)を使った非常に簡単な掲示板アプリのチュートリアルです。

![bbs demo](./bbs-demo.gif)

## チュートリアル

まずは今回ライブラリとして使用する`sinatra`をインストールします。

```shell
gem install sinatra sinatra-contrib
```

インストールが終了したら、`bbs`というディレクトリ(フォルダのことです)を作り、そこへ`cd`コマンドを使って移動します。

```bash
mkdir bbs
cd bbs
```

`bbs`内に`bbs.rb`を以下のように作成します

```ruby:bbs.rb
require 'sinatra'
require 'sinatra/reloader'

get '/' do
    'Hello World!'
end 
```

`bbs.rb`作成後、ターミナルで`ruby bbs.rb`を実行します

```shell
ruby bbs.rb
```

その後、ブラウザのアドレスバーに`localhost:4567`を入力します 
`Hello World!`と表示されていればOKです！

`sinatra`では`erb`などのテンプレートを使うことができます 
今回は`erb`を使って`Hello World!`と表示してみます 

まずは`views`ディレクトリを`bbs`内に作成します

その後、`views`ディレクトリ内に`index.erb`を作成し、以下のようにします

```erb:views/index.erb
<html>
    <body>
        Hello World!
    </body>
</html> 
```

あとは、`bbs.rb`を以下のように修正して`ruby bbs.rb`を実行します

```diff
require 'sinatra'
require 'sinatra/reloader'

get '/' do
-    'Hello World!'
+    erb :index
end 
```

```shell
ruby bbs.rb
```

`localhost:4567`へと再度アクセスして、`Hello World!`と表示されていればOKです！

次に、掲示板のコメント機能を作っていきます。
　
まずは、`bbs.rb`を以下のように変更します。

```diff
require 'sinatra'
require 'sinatra/reloader'

+ comments = []
+
get '/' do
+    @comments = comments
    erb :index
end
```

そして、`views/index.erb`を以下の変更します

```diff
<html>
+    <head>
+        <title>掲示板</title>
+    </head>
    <body>
-        Hello World!
+        <h1>掲示板</h1>
+        <ul>
+            <% @comments.each do |comment| %>
+                <li>
+                    <%= comment %>
+                </li>
+            <% end %>
+        </ul>
    </body>
</html>
```

ここまでの変更で作成済みのコメントを一覧として表示することができます。

最後に、コメントを作成するフォームを実装ていきます。

フォームから送信されたコメントを取得して保存する処理を実装します。

```diff
require 'sinatra'
require 'sinatra/reloader'

comments = []

get '/' do
    @comments = comments
    erb :index
end 
+ 
+ post '/new' do
+     comments.push(params[:body])
+     redirect '/'
+ end
```

最後に、`views/index.erb`にコメントを作成するフォームを実装します。

`views/index.erb`を以下のようにします。

```diff
<html>
    <head>
        <title>掲示板</title>
    </head>
    <body>
        <h1>掲示板</h1>
        <ul>
            <% @comments.each do |comment| %>
                <li>
                    <%= comment %>
                </li>
            <% end %>
        </ul>
+        <h2>コメントする</h2>
+        <form method="post" action="/new">
+            <input type="text" name="body">
+            <input type="submit" value="post">
+        </form>
    </body>
</html>
```

後は、ターミナルで`ruby bbs.rb`を実行します

```shell
ruby bbs.rb
```

`localhost:4567`にアクセスし、フォームからコメントを送信できていればOKです！

## 課題

余裕のある人向けの課題です。

現在の掲示板プログラムはデザインなどは良くないです。

そこで、Bootstrapを使ってデザインを整えてみましょう。

## 参考

[Sinatra 入門](https://qiita.com/kimioka0/items/751e460cbb59c70379c6)

