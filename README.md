# README

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false | 6字以上半角英と半角数使用
| nickname           | string  | null: false |
| last_name          | string  | null: false | 名前 全角
| first_name         | string  | null: false | 苗字 全角
| birthday_year_id   | integer | null: false | ActiveHash
| birthday_month_id  | integer | null: false | ActiveHash
| birthday_day_id    | integer | null: false | ActiveHash

### Association

- has_many :items
- has_many :shipping_addresses
- has_many :sold_items



## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | text       | null: false |
| explanation        | text       | null: false | 商品の説明
| category_id        | integer    | null: false | カテゴリ ActiveHash
| situation_id       | integer    | null: false | 状態 ActiveHash
| delivery_charge_id | integer    | null: false | 配送料負担 ActiveHash
| region_id          | integer    | null: false | 発送元地域 ActiveHash
| shipping_days_id   | integer    | null: false | 発送までの日数 ActiveHash
| price              | string     | null: false |
| sold_status        | integer    |             | 販売済みか
| user_id            | references | null: false |

### Association

- belongs_to :user
- has_one :sold_item



## shipping_addresses テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| post_code      | string     | null: false | 郵便番号
| prefectures_id | integer    | null: false | 都道府県 ActiveHash
| city           | string     | null: false | 市区町村
| street_address | string     | null: false | 番地
| building_name  | string     |             | 建物名
| telephone      | string     | null: false |
| user_id        | references | null: false |

### Association

- belongs_to :user
- has_one :sold_item


## sold_items テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| user_id               | references | null: false |
| item_id               | references | null: false |
| shipping_addresses_id | references | null: false |

### Association

- belongs_to:items
- belongs_to:shipping_addresses
- belongs_to:user