# README


#テーブル設計

## users　テーブル

| Column                |  Type   |  Options    |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| family_name           | string  | null: false |
| first_name            | string  | null: false |
| family_name_kana      | string  | null: false |
| first_name_kana       | string  | null: false |
| birth_day             | date    | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |


### Association

- has many : items
- has many : purchases




## items　テーブル

| Column           |  Type   | Options     |
| ---------------- |-------- | ------------|
| image            | string  | null: false |
| name             | string  | null: false |
| product          | text    | null: false |
| category         | string  | null: false |
| status           | string  | null: false |
| price            | string  | null: false |

### Association

- belongs_to :users
- has_ one : orders, through: :purchases



## purchases テーブル

| Column        |  Type      |  Options                       |
|-------------- | ---------- | ------------------------------ |
| id            | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| product_id    | references | null: false, foreign_key: true |
| address       | references | null: false, foreign_key: true |
| building_name | string     |                                |
| phone_number  | string     | null: false, foreign_key: true |

### Asociation

- belongs_to: users
- has_one: items



## Orders　テーブル

| Column        |  Type      |  Options                       |
|-------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| postal_code   | integer    | null: false                    |
| province      | string     | null: false                    |
| region        | string     | null: false                    |
| address       | references | null: false, foreign_key: true |
| building_name | string     |                                | 
| phone_number  | string     | null: false, foreign_key: true |

### Association

- belongs_to :purchases
