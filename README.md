アプリケーション名
  chiquita-chat

アプリケーション概要
 アプリケーション「chiquita-chat」は卓球愛好者内で大会や用具などの情報発信や共有ができるwebアプリケーションです。

機能実装
 ルームの参加、退出機能
 アクセス制限、roomの権限 

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
| room_description  | text | null: false |
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