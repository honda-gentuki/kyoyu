# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| age                | string |                           |
| school             | string |                           |
| subject            | string |                           |
| club               | string |                           |
| a_word             | text   |                           |

### Association

- has_many :posts
- has_many :comments
- has_many :likes
- has_many :follower
- has_many :followed
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :chats

## posts テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| subject            | string     | null: false                    |
| course             | string     | null: false                    |
| unit               | string     | null: false                    |
| teaching_materials | string     | null: false                    |
| introduction       | text       |                                |
| introduction_time  | integer    |                                |
| development        | text       |                                |
| development_time   | integer    |                                |
| summary            | text       |                                |
| summary_time       | integer    |                                |
| user               | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_many :likes
- belongs_to :user
- has_many :post_tags
- has_many :tags, through: :post_tags
- has_many :notifications


## comments テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |
| content | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :post
- has_many :notifications

## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## relationships テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| follower  | references | null: false, foreign_key: true |
| following | references | null: false, foreign_key: true |

### Association

- belongs_to :follower
- belongs_to :following

## rooms テーブル

| Column | Type   | Options |
| ------ | ------ | ------- |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :chats

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## chats テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |
| message | text       |                                |

### Association

- belongs_to :user
- belongs_to :room

##  post_tagsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post    | references | null: false, foreign_key: true |
| tag     | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :tag

##  tagsテーブル

| Column      | Type       | Options |
| ----------- | ---------- | ------- |
| tag_name    | string     |         |

### Association

- has_many :post_tags
- has_many :pots, through: :post_tags

##  notificationsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| visiter     | integer    | null: false, foreign_key: true |
| visited     | integer    | null: false, foreign_key: true |
| post_id     | integer    |                                |
| comment_id  | integer    |                                |
| comment_id  | integer    |                                |
| action      | string     | null: false                    |
| checked     | boolean    | null: false                    |

### Association

- belongs_to :post
- belongs_to :comment
- belongs_to :visiter
- belongs_to :visited