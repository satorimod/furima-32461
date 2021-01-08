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
- has_many :address_items

## itemsテーブル

| Column              | Type        | Option                         |
| ------------------- | ----------- | ------------------------------ |
| name                | string      | null: false                    |
| explanation         | text        | null: false                    |
| price               | integer     | null: false                    |
| category_id         | integer     | null: false                    |
| item_state_id       | integer     | null: false                    |
| shipping_charges_id | integer     | null: false                    |
| shipping_area_id    | integer     | null: false                    |
| shipping_date_id    | integer     | null: false                    |
| user                | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address_item

## addressesテーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| postal         | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |   
| addresses_item | references | null: false, foreign_key: true |

### Association

- belongs_to :addresses_item

## address_itemsテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address
- belongs_to :user
