# アプリケーション名
教YOU
# アプリケーション概要
学校の業務を共有することで、授業や部活動の指導案作成時間を削減し、教員のブラック労働を解決する。
# URL

# テスト用アカウント
- Basic認証パスワード : 
- Basic認証ID :
- メールアドレス :
- パスワード :

# 利用方法
## 授業を投稿
1.トップページからユーザー新規登録を行う。
2.新規投稿ボタンからフォームを入力し投稿する。
## いいねで授業を保存
1.投稿カードのいいね（ハート）ボタンを押す。
2.自身のユーザーアイコンをクリックしマイページに移動し、授業が保存（自身がいいねした投稿一覧に表示）されていることを確認。
3.投稿詳細ページに遷移し投稿を確認（共有）。
## 先生と繋がる
1.他のユーザーの写真クリックし、クリックしたユーザーのマイページへ遷移する
2.チャットボタンをクリックし、チャットページに移動。
3.フォームを入力し、送信ボタンでチャットを送信。
## 投稿にコメント
1.気になる投稿の写真または、タイトルをクリックし、投稿詳細ページに遷移する。
2.フォームを入力し、送信するボタンをクリックし、コメントを送信。

# アプリケーションを作成した背景
現在、過労死基準と言われる月100時間以上の時間外労働勤務をする教員の割合は小学校で55.1%、中学校で79.8%、高校で46.4％とされている。※〈【出典】「とりもどせ！教職員の『生活時間』ー日本における教職員の働き方・労働時間の実態に関する調査研究所報告書ー」（連合総研）〉より
また、授業の準備をする時間が足りないと考える教員は小中高で85.5%を超え、部活動・クラブ活動の指導が負担と考える教員は小中高で平均54.9%と多数いるのが現状だ。※ベネッセ教育総合研究所より
私自身も高校教員時代には過労死ラインを優に超え、上記の不安を抱えていた。
授業や部活動の指導案作成が十分でない状態でこどもたちに指導することは、日本の未来に直結する大きな問題であり、解決しなければならない課題である。
解決のためには教員の負担を少しでも減らすことが第一に挙げられ、教員の業務を簡略化するアプリケーションを作り、少しでも教員の負担を減らしたいと考えたのが作成の背景である。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1b6814JCJIuvnKq6KRbZvg5LibT7nCLALY6fM73xk3aQ/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明※


# 実装予定の機能
今後実装していく機能・修正箇所
- テストコード
- AWS
- Docker
- CircleCI
- レスポンシブ対応
- 通知ページに写真を追加
- スライドショー機能（投稿された画像）
- チャットボタンアイコン追加
- ファイルのアップロード
- ハンバーガー
- 学校を選ぶ欄を追記
- タグ検索機能
- コードの可読性向上

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/a16269f0a6c58d31419752591445daa2.png)](https://gyazo.com/a16269f0a6c58d31419752591445daa2)
# 画面遷移図

# 開発環境
- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理

# ローカルでの動作方法※

# 工夫したポイント※


# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| age                | string |                           |
| sex                | string |                           |
| school             | string |                           |
| subject            | string |                           |
| club               | string |                           |
| introduce          | text   |                           |
| image              | string |                           |

### Association

- has_many :posts
- has_many :comments
- has_many :likes
- has_many :follower
- has_many :following
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :chats
- has_many :reads
- has_many :visiter
- has_many :visited


## posts テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| subject            | string     | null: false                    |
| course             | string     | null: false                    |
| unit               | string     | null: false                    |
| teaching_materials | string     | null: false                    |
| introduction       | string     |                                |
| text               | string     |                                |
| introduction_time  | integer    |                                |
| development        | text       |                                |
| development_time   | integer    |                                |
| summary            | text       |                                |
| summary_time       | integer    |                                |
| user               | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_many :likes
- has_many :post_tags
- has_many :tags, through: :post_tags
- has_many :notifications
- has_many :reads
- belongs_to :user


## comments テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |
| content | text       | null: false                    |

### Association

- has_many :notifications
- belongs_to :user
- belongs_to :post


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

- belongs_to :user
- belongs_to :room

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
| action      | string     | null: false                    |
| checked     | boolean    | null: false                    |

### Association

- belongs_to :post
- belongs_to :comment
- belongs_to :visiter
- belongs_to :visited

## reads テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| chat     | references | null: false, foreign_key: true |
| complete | boolean    |                                |

### Association

- belongs_to :user
- belongs_to :chat