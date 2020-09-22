## アプリケーション名
ExamApp

## アプリケーション概要
試験問題の過去問を学習するアプリケーションです。学習内容を記録し、効率的な学習を支援します。<br>
今回は作成者の経歴にちなんで看護師国家試験の過去問をサンプルデータとして登録しています。<br>
今後、他の問題形式にも対応出来るよう機能を拡張していきたいです。

## 作成の目的・動機

携帯等の端末で

## URL
http://exam-28713.herokuapp.com/

### テスト用アカウント
USER: admin@example.com<br>
PASSWORD: 1qazxs

### 利用方法
上記URLにアクセスし、右上のログインボタンからテスト用アカウントでログイン後、各種機能をお試し下さい。<br>
（新規アカウントの作成も可能です。）

- ユーザー登録機能
ログインユーザーに応じた画面表示や、機能の追加を行う為に必要な機能です。<br>
deviseのgemを使用して実装しています。

- 検索機能
アプリケーションの肝となる機能です。<br>
ransackのgemを使用して実装しています。複数条件を指定しての検索を行う事が出来ます。

- 学習済みチェック機能
学習状況を把握し、効率的な学習を支援する為の機能です。<br>

- コメント機能
コメントによる解説やユーザー同士の交流を図る為の機能です。<br>
ログインユーザーは問題詳細画面でコメントを投稿する事が出来ます。

- ユーザー編集機能
ユーザーの利便性を向上する為の機能です。<br>
ログイン後、右上のユーザー名をクリックする事でマイページにとべます。<br>
学習状況の把握や、メールアドレス、パスワードの変更が行えます。

## 今後の拡張予定
- 学習機能の非同期化
- 学習内容を検索結果に反映
- コメント編集機能
- コメントいいね機能
- タグ付け機能

## データベース設計

ER図：<br>
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


## ローカルでの動作方法
% git clone https://github.com/raikouo/nurse_app.git<br>
% cd nurse_app<br>
% bundle install<br>
% yarn install<br>
% rails db:create<br>
% rails db:migrate<br>
