# README

# Users
| Colum                 | Type   | Option     |
| --------------------- | ------ | ---------- |
| nickname              | string | null_false |
| family_name           | string | null_false |
| first_name            | string | null_false |
| family_name_kana      | string | null_false |
| first_name_kana       | string | null_false |
| email                 | string | null_false |  
| encrypted_password    | string | null_false |

# Products
| Colum         | Type    | Option     |
| ------------- | ------- | ---------- |
| products_name | string  | null_false |
| text          | text    | null_false |
| category      | integer | null_false |
| status        | integer | null_false |
| shipping      | integer | null_false |
| area          | integer | null_false |
| days          | integer | null_false |
| price         | integer | null_false |

# Addresses
| Colum          | Type    | Option     |
| -------------- | ------- | ---------- |
| postal_code    | string  | null_false |
| address_id     | integer | null_false |
| municipalities | string  | null_false |
| address_number | string  | null_false | 
| building       | string  |            |
| phone_number   | string  | null_false |

# Purchase_histories
| Colum      | Type    | Option     |
| ---------- | ------- | ---------- |
| User_id    | integer | null_false |
| Product_id | integer | null_false |