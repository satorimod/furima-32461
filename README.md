# テーブル設計

## usersテーブル

| column                  | Type   | Option      |
| ----------------------- | ------ | ----------- |
| buyer_name              | string | null: false |
| email                   | string | null: false |
| password                | string | null: false |
| password_confirmation   | string | null: false |
| chinese_characters_name | string | null: false |
| katakana_name           | string | null: false |
| dob                     | date   | null: false |

### Association

- has_many :items
- has_many :purchase
- has_one :address

## itemsテーブル

| Column           | Type    | Option                         |
| ---------------- | ------- | ------------------------------ |
| seller_name      | string  | null: false                    |
| category         | string  | null: false                    |
| item_state       | string  | null: false                    |
| shipping_charges | string  | null: false                    |
| shipping_area    | string  | null: false                    |
| shipping_date    | string  | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :purchase_items
- has_one :purchase, through: :purchase_items

## purchasesテーブル

| Column          | Type   | Option      |
| --------------- | ------ | ----------- |
| cregit_card     | string | null: false |
| expiration_date | date   | null: false |
| seculity        | string | null: false |
 
 ### Association

 - has_many :purchase_items
 - belongs_to :item
 - has_many :addresses

## purchase_itemsテーブル

| Column  | Type    | option                         |
| ------- | ------- | ------------------------------ |
| price   | string  | null: false                    |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :purchase

## addressesテーブル

| Column       | Type   | Option
| ------------ | ------ | ---------
| postal       | string | null: false
| prefectures  | string | null: false
| municipality | string | null: false
| address      | string | null: false
| building     | string |  
| phone        | string | null: false

### Association

- belongs_to :puchase
- belongs_to :user