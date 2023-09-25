# README

## users テーブル

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| email              | string  | null: false  |
|                    |         | unique: true |
| encrypted_password | string  | null: false  | 6字以上半角英と半角数使用
| nickname           | string  | null: false  |
| last_name          | string  | null: false  | 名前 全角
| first_name         | string  | null: false  | 苗字 全角
| last_name_kana     | string  | null: false  | 名前 全角カナ
| first_name_kana    | string  | null: false  | 苗字 全角カナ
| birthday           | date    | null: false  | ActiveHash

### Association

- has_many :items
- has_many :sold_items



## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   | 商品名40字まで
| explanation        | text       | null: false                   | 商品の説明1000字まで
| category_id        | integer    | null: false                   | カテゴリ ActiveHash
| situation_id       | integer    | null: false                   | 状態 ActiveHash
| delivery_charge_id | integer    | null: false                   | 配送料負担 ActiveHash
| region_id          | integer    | null: false                   | 発送元地域 ActiveHash
| shipping_day_id    | integer    | null: false                   | 発送までの日数 ActiveHash
| price              | string     | null: false                   |
| user               | references | foreign_key: true,null: false |

### Association

- belongs_to :user
- has_one :sold_item



## shipping_addresses テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| post_code      | string     | null: false                   | 郵便番号
| region_id      | integer    | null: false                   | 都道府県 ActiveHash
| city           | string     | null: false                   | 市区町村
| street_address | string     | null: false                   | 番地
| building_name  | string     |                               | 建物名
| telephone      | string     | null: false                   |
| sold_item      | references | foreign_key: true,null: false |

### Association

- belongs_to :sold_item



## sold_items テーブル

| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| user                  | references | foreign_key: true,null: false |
| item                  | references | foreign_key: true,null: false |

### Association

- belongs_to :item
- has_one :shipping_address
- belongs_to :user