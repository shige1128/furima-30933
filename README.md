# README

# Users
| Colum                 | Type    | Option     |
| --------------------- | ------- | ---------- |
| nickname              | string  | null_false |
| family_name           | string  | null_false |
| first_name            | string  | null_false |
| family_name_kana      | string  | null_false |
| first_name_kana       | string  | null_false |
| email                 | string  | null_false |  
| encrypted_password    | string  | null_false |
| birth_year_id         | integer | null_false |
| birth_month_id        | integer | null_false |
| birth_day_id          | integer | null_false |

## Association
  has_many :products
  has_many :addresses
  has_many :purchase_histories

# Products
| Colum         | Type    | Option     |
| ------------- | ------- | ---------- |
| products_name | string  | null_false |
| text          | text    | null_false |
| category_id   | integer | null_false |
| status_id     | integer | null_false |
| shipping_id   | integer | null_false |
| area_id       | integer | null_false |
| days_id       | integer | null_false |
| price         | integer | null_false |
| user_id       | integer | null_false | 

## Association
  belongs_to :user
  has_many :purchase_histories

# Addresses
| Colum                 | Type    | Option     |
| --------------------- | ------- | ---------- |
| postal_code           | string  | null_false |
| address_id            | integer | null_false |
| municipalities        | string  | null_false |
| address_number        | string  | null_false | 
| building              | string  |            |
| phone_number          | string  | null_false |
| purchase_histories_id | integer | null_false |

## Association
  belongs_to :user
  belongs_to :product

# Purchase_histories
| Colum      | Type    | Option     |
| ---------- | ------- | ---------- |
| user_id    | integer | null_false |
| product_id | integer | null_false |

# Association
  belongs_to :user
  belongs_to :product
  belongs_to :address
