# アプリケーション名
  chiquita-chat(チキータチャット)

# アプリケーション概要
 アプリケーション「chiquita-chat」は卓球愛好者内で大会や用具、ニュースなどの情報発信や共有ができるwebアプリケーションです。
[![Image from Gyazo](https://i.gyazo.com/2cce97b05170880a0b7126864fa48a3a.jpg)](https://gyazo.com/2cce97b05170880a0b7126864fa48a3a)

# アプリケーション情報
## URL http://35.72.47.119/

## テストアカウント 
 ・E-mail: test@example
 ・Password: saboten10

# 主なアプリ機能
 ## 1.ユーザー管理機能
  ヘッダーの「ログイン」をクリックします。(アカウント登録していない場合は「新規登録」をクリックして新規アカウント作成ページへ進んでください。ここでは割愛します。)

  必要な情報を入力して「Log in」をクリックするとチャット画面に遷移します。
   ![258a22a154f7b5fd22c4250eebcab8e2](https://user-images.githubusercontent.com/75722248/108200650-1819a680-7162-11eb-8074-b285f528763e.gif)


## 2.チャットルーム管理機能
   画面左上の「チャットを作成する」をクリックします。

   必要な情報を入力し、チャットしたいユーザーを選択して「作成」をクリックするとチャット画面に遷移します。そして作成したルーム名をクリックするとメッセージ投稿画面に遷移します。
   ![ce9d6eecfa99bd19aa08d08259237831](https://user-images.githubusercontent.com/75722248/108200246-84e07100-7161-11eb-970a-1129f4e9e1d5.gif)

## 3.メッセージ投稿機能
   送信したいメッセージを記述し、「送信」ボタンをクリックすると画面にメッセージが表示されます。
   [![Image from Gyazo](https://i.gyazo.com/47e37b95c35f7ebf8827568c4918ab8e.gif)](https://gyazo.com/47e37b95c35f7ebf8827568c4918ab8e)

## 4.画像投稿機能
   「画像」ボタンをクリックすると送信したい画像を選択できます。
[![Image from Gyazo](https://i.gyazo.com/158613c445b1b33b9874d4269f4204a0.jpg)](https://gyazo.com/158613c445b1b33b9874d4269f4204a0)

# 今後実装したい機能
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