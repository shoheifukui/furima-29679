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
| id               | integer | null: false |
| image            | string  | null: false |
| name             | string  | null: false |
| detail           | text    | null: false |
| category         | string  | null: false |
| status           | string  | null: false |
| price            | string  | null: false |
| delivery_fee     | string  | null: false |
| region           | string  | null: false |
| delivery_days    | string  | null: false |

### Association

- belongs_to :users
- has_ one : orders



## purchases テーブル

| Column        |  Type      |  Options                       |
|-------------- | ---------- | ------------------------------ |
| id            | integer    | null: false                    |
| product_id    | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_one: item



## Orders　テーブル

| Column        |  Type      |  Options                       |
|-------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| province      | integer    | null: false                    |
| region        | string     | null: false                    |
| address       | string     | null: false, foreign_key: true |
| building_name | string     |                                | 
| phone_number  | string     | null: false, foreign_key: true |
| id            | integer    | null: false                    |

### Association

- has_one :purchase
