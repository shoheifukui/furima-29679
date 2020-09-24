# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#テーブル設計

## users　テーブル

| Column                |  Type   |  Options    |
| --------------------- | ------- | ----------- |
| user_id               | integer | null: false |
| nickname              | string  | null: false |
| family_name           | string  | null: false |
| first_name            | string  | null: false |
| family_name_kana      | string  | null: false |
| first_name_kana       | string  | null: false |
| birth_year            | integer | null: false |
| birth_month           | integer | null: false |
| birth_day             | integer | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |

### Association

- has many : products
- has many : orders, thorough: purchases



## products　テーブル

| Column           |  Type   | Options     |
| ---------------- |-------- | ------------|
| product_id       | integer | null: false |
| product_image    | string  | null: false |
| product_name     | string  | null: false |
| product_detail   | text    | null: false |
| product_category | string  | null: false |
| product_status   | string  | null: false |
| product_price    | string  | null: false |

### Association

- belongs_to :users
- has_ one : orders, through: :purchases



## purchases テーブル

| Column      |  Type      |  Options                       |
|------------ | ---------- | ------------------------------ |
| id          | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| product_id  | references | null: false, foreign_key: true |

### Asociation

- belongs_to: users
- belongs_to: orders, through: : purchases



## Orders　テーブル

| Column        |  Type      |  Options                       |
|-------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| postal_code   | integer    | null: false                    |
| province      | string     | null: false                    |
| region        | string     | null: false                    |
| address       | string     | null: false                    |
| building name | string     | null: false                    |
| phone_number  | integer    | null: false                    |

### Association

- belongs_to :users
- 