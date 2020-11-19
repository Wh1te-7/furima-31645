## usersテーブル

| Column             | Type   | Option   |
| ------------------ | ------ | -------- |
| last_name          | string | NOT NULL |
| first_name         | string | NOT NULL |
| last_name_kana     | string | NOT NULL |
| first_name_kana    | string | NOT NULL |
| email              | string | NOT NULL |
| encrypted_password | string | NOT NULL |
| nickname           | string | NOT NULL |
| birthday           | date   | NOT NULL |

### Association
 - has_many :products
 - has_one :customer

 ## productsテーブル

| Column      | Type       | Option            |
| ----------- | ---------- | ----------------- |
| title       | string     | NOT NULL          |
| concept     | text       | NOT NULL          |
| category_id | integer    | NOT NULL          |
| status_id   | integer    | NOT NULL          |
| user_id     | references |                   |
| delivery_id | integer    | NOT NULL          |
| area_id     | integer    | NOT NULL          |
| days_id     | integer    | NOT NULL          |
| price       | integer    | NOT NULL          |

### Association
 - belongs_to :user
 - has_one :customer
 - has_many :comments

## commentsテーブル
| Column  | Type       | Option   |
| ------- | ---------- | -------- |
| content | string     |          |

### Association
 - belongs_to :product
 belongs_to :customer

## customersテーブル

| Column        | Type       | Option   |
| ------------- | ---------- | -------- |
| user_id       | references |          |
| product_id    | references |          |

### Association
 - belongs_to :product
 - belongs_to :user
 - has_one :address
 - has_one :comment


### addressテーブル
| postal        | integer    | NOT NULL |
| prefecture_id | integer    | NOT NULL |
| home          | text       | NOT NULL |
| building      | text       |          |
| number        | integer    | NOT NULL |

### Association
 - belongs_to :customer