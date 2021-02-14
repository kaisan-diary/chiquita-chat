アプリケーション名
  chiquita-chat

アプリケーション概要
 アプリケーション「chiquita-chat」は卓球愛好者内で大会や用具、ニュースなどの情報発信や共有ができるwebアプリケーションです。
 https://gyazo.com/2b1a9c88a405e057d3ae1204e90cde8a

アプリケーション情報
 URL

テストアカウント 
 ・E-mail: test@example
 ・Password: saboten10

アプリ機能
 1.ユーザー管理機能
  ヘッダーの「ログイン」をクリックします。(アカウント登録していない場合は「新規登録」をクリックして新規アカウント作成ページへ進んでください。ここでは割愛します。)
  https://gyazo.com/96ef99b7c4be88a0899e6f8646ddb183

  必要な情報を入力して「Log in」をクリックするとチャット画面に遷移します。
  https://gyazo.com/b4da0c6307b4cd5df1abed2b8b6aa9fb

 2.チャットルーム管理機能
   画面左上の「チャットを作成する」をクリックします。
   https://gyazo.com/a1affc42fb2a9298cd1df537343612d5

   必要な情報を入力し、チャットしたいユーザーを選択して「作成」をクリックするとチャット画面に遷移します。そして作成したルーム名をクリックするとメッセージ投稿画面に遷移します。
   https://gyazo.com/0ed1ead52419574c655d02238ba2eec2

 3.メッセージ投稿機能
   送信したいメッセージを記述し、「送信」ボタンをクリックすると画面にメッセージが表示されます。
   https://gyazo.com/9772f6f5240cb4ca3d3aba90425818aa
 4.画像投稿機能
   「画像」ボタンをクリックすると送信したい画像を選択できます。

今後実装したい機能
 ルームの参加、退出機能
 画像複数投稿
 アクセス制限、roomの権限 
 レスポンシブ対応

 # テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
- has_many :categories
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## categories テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

### Association

- belongs_to :user
- has_many :rooms
- has_many :messages


## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| room_name         | string | null: false |
| room_description  | text | 
| user              | references | null: false, foreign_key :true|

### Association
- belongs_to :category
- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user