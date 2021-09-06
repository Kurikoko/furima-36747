# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many  :items
- has_many  :orders

## itemsテーブル

| Column                 | Type      | Options           |
| ---------------------- | --------- | ----------------- |
| name                   | string    | null: false       |
| information            | text      | null: false       |
| price                  | integer   | null: false       |
| category_id            | integer   | null: false       |
| state_id               | integer   | null: false       |
| shipping_fee_id        | integer   | null: false       |
| shipping_prefecture_id | integer   | null: false       |
| scheduled_delivery_id  | integer   | null: false       |
| user                   | reference | foreign_key: true |

### Association

- belongs_to  :user
- has_one     :order

## ordersテーブル
| Column | Type      | Options           |
| ------ | --------- | ----------------- |
| user   | reference | foreign_key: true |
| item   | reference | foreign_key: true |

### Association

- belongs_to  :user
- belongs_to  :item
- has_one     :destination

## destinationsテーブル
| Column        | Type      | Options           |
| ------------- | --------- | ----------------- |
| postal_code   | integer   | null: false       |
| prefecture_id | integer   | null: false       |
| city          | string    | null: false       |
| address       | string    | null: false       |
| building_name | string    |                   |
| phone_number  | integer   | null: false       |
| order         | reference | foreign_key: true |

### Association
- belongs_to  :order