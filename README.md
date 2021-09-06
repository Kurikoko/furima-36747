# テーブル設計

## usersテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many  :items
- has_many  :orders

## itemsテーブル

| Column              | Type        | Options           |
| ------------------- | ----------- | ----------------- |
| name                | string      | null: false       |
| information         | text        | null: false       |
| category            | string      | null: false       |
| price               | integer     | null: false       |
| status              | string      | null: false       |
| shipping_fee        | integer     | null: false       |
| shipping_prefecture | string      | null: false       |
| scheduled_delivery  | string      | null: false       |
| user_id             | preference  | foreign_key: true |

### Association

- belongs_to  :user
- has_one     :order

## ordersテーブル
| Column        | Type        | Options            |
| ------------- | ----------- | ------------------ |
| postal_code   | string      | null: false        |
| prefecture    | string      | null: false        |
| city          | string      | null: false        |
| address       | string      | null: false        |
| building_name | string      |                    |
| phone_number  | integer     | null: false        |
| user_id       | preference  | foreign_key: true  |
| item_id       | preference  | foreign_key: true  |

### Association

- belongs_to  :user
- belongs_to  :item
