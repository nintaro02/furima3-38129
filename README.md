# README
#DB設計
## users table
|Column               | Type        | Options       |
|---------------------|-------------|---------------|
|nickname             |string       |null:false     |
|email                |string       |null:false,unique:true|
|encrypted_password   |string       |null:false     |
|first_name           |string       |null:false     |
|first_name_kana      |string       |null:false     |
|last_name            |string       |null:false     |
|last_name_kana       |string       |null:false     |
|birth_day            |date         |null:false     |

### Association
* has_many :orders
* has_many :items

## addresses table
|Column               |Type         |Options                    |
|---------------------|-------------|---------------------------|
|post_code            |string       |null:false                 |
|prefecture_id        |integer      |null:false                 |
|city                 |string       |null:false                 |
|address              |string       |null:false                 |
|building_name        |string       |                           |
|phone_number         |string       |null:false                 |
|order                |references   |null:false,foreign_key:true|
### Association
* belongs_to :order

## orders table

|Column               |Type         |Options                    |
|---------------------|-------------|---------------------------|
|user                 |references   |null:false,foreign_key:true|
|item                 |references   |null:false,foreign_key:true|

### Association
* belongs_to :user
* belongs_to :item
* has_one :address

## item table
|Column               |Type         |Options                    |
|---------------------|-------------|---------------------------|
|product             |string       |null:false                 | 
|price               |integer      |null:false                 |
|description         |text         |null:false                 |
|status_id           |integer      |null:false                 |
|postage_id          |integer      |null:false                 |
|shipping_day_id     |integer       |null:false                 |
|prefecture_id       |integer      |null:false                 |
|category_id         |integer      |null:false                 |
|user                 |references   |null:false,foreign_key:true|
### Association
* belongs_to :user
* has_one :order
