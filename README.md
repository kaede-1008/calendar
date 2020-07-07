# calendar
カレンダでのToDo管理用アプリ

# 環境構築
## database.ymlの作成
database.ymlをREADME.mdと同じ階層に作成し、以下のコードを記述する
```ruby:
development:
  adapter: mysql2
  database: dbname  # database名に変更
  host: localhost
  username: username # mysqlのユーザ名に変更
  password: password # mysqlのパスワードに変更
  encoding: utf8
```
## 初回のみgemのインストールとDBのマイグレーションを行う
bundle install
bundle exec rake db:migrate

## 起動コマンド
bundle exec rackup config.ru

