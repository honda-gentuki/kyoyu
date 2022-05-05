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

## posts テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| subject            | string     | null: false                    |
| course             | string     | null: false                    |
| unit               | string     | null: false                    |
| introduction       | string     | null: false                    |
| introduction_time  | integer    | null: false                    |
| development        | string     | null: false                    |
| development_time   | integer    | null: false                    |
| summary            | string     | null: false                    |
| summary_time       | integer    | null: false                    |
| teaching_materials | string     | null: false                    |
| teaching_materials | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| post      | references | null: false, foreign_key: true |
| content   | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :post