# アプリケーション名
ExamApp

# アプリケーション概要
試験問題の過去問を学習するアプリケーションです。学習内容を記録し、効率的な学習を支援します。
今回は作成者の経歴にちなんで看護師国家試験の過去問をサンプルデータとして登録しています。
今後、他の問題形式にも対応出来るよう機能を拡張していきたいです。

# 作成の目的・動機

携帯等の端末で

# URL
http://exam-28713.herokuapp.com/

## テスト用アカウント
USER:admin@example.com
PASSWORD:1qazxs

利用方法
上記URLにアクセス、右上のログインボタンからテスト用アカウントでログイン後、各種機能をお試し下さい。
（新規アカウントの作成も可能です。）



ユーザー登録機能

検索機能
学習済みチェック機能
コメント機能
ユーザー編集機能




実装した機能についてのGIFと説明

# 今後の拡張予定
- 学習機能の非同期化
- 学習内容を検索結果に反映
- コメント編集機能
- コメントいいね機能
- タグ付け機能

# データベース設計

ER図
https://app.lucidchart.com/invitations/accept/48a520d9-d914-4bb5-9864-35a003d7be8c

## users テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| nickname        | string     | null: false                    |
| email           | string     | null: false                    |
| password        | string     | null: false                    |

### Association
- has_many :tests
- has_many :studies, dependent: :destroy
- has_many :study_tests, through: :studies, source: :test
- has_many :comments, dependent: :destroy


## tests テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| exam_id         | integer    | null: false                    |
| zone_id         | integer    | null: false                    |
| number          | integer    | null: false                    |
| question        | text       | null: false                    |
| choice          | text       | null: false                    |
| answer          | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to_active_hash :exam
- belongs_to_active_hash :zone
- belongs_to_active_hash :category
- has_one_attached :image
- belongs_to :user
- has_many :studies, dependent: :destroy
- has_many :study_users, through: :studies, source: :user
- has_many :comments, dependent: :destroy

## studies テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | foreign_key: true              |
| test            | references | foreign_key: true              |
index [:user_id, :test_id], unique: true

### Association
- belongs_to :user
- belongs_to :test

## comments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | text       | null: false                    |
| user            | references | foreign_key: true              |
| test            | references | foreign_key: true              |

### Association
- belongs_to :user
- belongs_to :test


# ローカルでの動作方法
% git clone https://github.com/raikouo/nurse_app.git
% cd nurse_app
% bundle install
% yarn install
% rails db:create
% rails db:migrate
