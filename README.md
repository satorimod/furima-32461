# テーブル設計

## usersテーブル

| column                  | Type   | Option                    |
| ----------------------- | ------ | ------------------------- |
| last_name               | string | null: false               |
| first_name              | string | null: false               |
| furigana_last_name      | string | null: false               |
| furigana_first_name     | string | null: false               | 
| email                   | string | null: false, unique: true |
| encrypted_password      | string | null: false               |
| dob                     | date   | null: false               |
| nickname                | string | null: false               |

### Association

- has_many :items

## itemsテーブル

| Column           | Type        | Option                         |
| ---------------- | ----------- | ------------------------------ |
| item_name        | integer     | null: false                    |
| item_explanation | text        | null: false                    |
| price            | integer     | null: false                    |
| category_id      | integer     | null: false                    |
| item_state       | string      | null: false                    |
| shipping_charges | string      | null: false                    |
| shipping_area    | string      | null: false                    |
| shipping_date    | string      | null: false                    |
| user             | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address_item


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
- belongs_to :addresses_item

## address_itemsテーブル

| Column     | Type    | option                         |
| ---------- | ------- | ------------------------------ |
| user_id    | integer | null: false, foreign_key: true |
| item_id    | integer | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :address
- has_one :user