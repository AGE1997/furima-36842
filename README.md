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

# テーブル設計

## users テーブル

| Colum                | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| last_name            | string | null: false               |
| first_name           | string | null: false               |
| pseudonym_last_name  | string | null: false               |
| pseudonym_first_name | string | null: false               |
| birthday             | date   | null: false               |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Colum               | Type       | Options                        |
| ------------------- | ------     |  ----------------------------- |
| name                | string     | null: false                    |
| explanation         | string     | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| days_id             | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| user  | references | null: false  foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Colum              | Type        | Options     |
| ------------------ | ----------- | ----------- |
| zip_code           | string      | null: false |
| prefecture_id      | integer     | null: false |
| municipal_district | string      | null: false |
| address            | string      | null: false |
| building_name      | string      |             |
| telephone_number   | string      | null: false |
| purchase           | references  | null: false |

### Association

- belongs_to :purchase