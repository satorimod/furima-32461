# テーブル設計

## usersテーブル

| column                  | Type   | Option      |
| ----------------------- | ------ | ----------- |
| last_name               | string | null: false |
| first_name              | string | null: false |
| furigana_last_name      | string | null: false |
| furigana_first_name     | string | null: false | 
| email                   | string | null: false |
| password                | string | null: false |
| password_confirmation   | string | null: false |
| encrypted_password      | string | null: false |
| dob                     | date   | null: false |

### Association

- has_many :items
- has_many :purchase
- has_one :address

## itemsテーブル

| Column           | Type        | Option                         |
| ---------------- | ----------- | ------------------------------ |
| seller_name      | string      | null: false                    |
| price            | string      | null: false
| category_id      | integer     | null: false                    |
| item_state       | string      | null: false                    |
| shipping_charges | string      | null: false                    |
| shipping_area    | string      | null: false                    |
| shipping_date    | string      | null: false                    |
| user             | references  | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :addresses_items
- has_one :address, through: :addresses_items


## addressesテーブル

| Column         | Type    | Option      |
| -------------- | ------- | ----------- |
| postal         | string  | null: false |
| prefecture_id  | integer | null: false |
| municipality   | string  | null: false |
| address        | string  | null: false |
| building       | string  |             |
| phone          | string  | null: false |

### Association

- belongs_to :user
- has_many :addresses_items
- belongs_to :item, through: :addresses_items

## addresses_itemsテーブル

| Column  | Type    | option                         |
| ------- | ------- | ------------------------------ |
| user    | integer | null: false, foreign_key: true |
| item    | integer | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :address