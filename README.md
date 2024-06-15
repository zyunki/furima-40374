# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| birthday           | date                | null: false               |

### Association

* has_many   :items
* has_many   :order


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| product_name                        | string     | null: false                    |
| product_condition                   | string     | null: false                    |
| category_id                         | integer    | null: false                    |
| price                               | integer    | null: false                    |
| product_description                 | text       | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to  :user
* has_one     :order

## orders table

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| user           | references | null: false, foreign_key: true |
| bought_product | references | null: false, foreign_key: true |

### Association

- belongs_to  :user
- belongs_to  :items
- belongs_to  :shipping_origin

## shipping_origin table

| Column           | Type       | Options       |
|------------------|------------|---------------|
| shipping_const   | integer    | null: false   |
| shipping_days    | integer    | null: false   |
| shipping_origin  | string     | null: false   |

### Association

- belongs_to :order
