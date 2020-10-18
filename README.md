# README


#テーブル設計

## users テーブル

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

- has_many : items
- has_many : purchases




## items テーブル

| Column           |  Type      | Options                        |
| ---------------- |----------- | ------------------------------ |
| name             | string     | null: false                    |
| detail           | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| price            | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_days_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |          

### Association

- belongs_to :user
- has_one: purchase


## purchases テーブル

| Column        |  Type      |  Options                       |
|-------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true | 
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: item
- has_one :order



## Orders テーブル

| Column        |  Type      |  Options                       |
|-------------- | ---------- | ------------------------------ |
| purchase      | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| province_id   | integer    | null: false                    |
| region        | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                | 
| phone_number  | string     | null: false                    |

### Association

- belongs_to :purchase
