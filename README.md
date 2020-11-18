## usersテーブル

| Column   | Type   | Option   |
| -------- | ------ | -------- |
| name     | string | NOT NULL |
| email    | string | NOT NULL |
| password | string | NOT NULL |
| nickname | string | NOT NULL |
| birthday | date   | NOT NULL |

### Association
 - has_many :products
 - has_one :customer

 ## productsテーブル

| Column   | Type       | Option            |
| -------- | ---------- | ----------------- |
| title    | string     | NOT NULL          |
| concept  | text       | NOT NULL          |
| category | string     | NOT NULL          |
| status   | string     | NOT NULL          |
| user     | references | foreign_key: true |
| delivery | string     | NOT NULL          |
| area     | string     | NOT NULL          |
| day      | date       | NOT NULL          |
| price    | integer    | NOT NULL          |

### Association
 - belongs_to :user
 - has_one :customer

## customersテーブル

| Column   | Type       | Option   |
| ------ --| ---------- | -------- |
| user     | references |          |
| product  | references |          |
| card     | integer    | NOT NULL |
| security | integer    | NOT NULL |
| content  | text       |          |
| postal   | integer    | NOT NULL |
| home     | text       | NOT NULL |
| building | text       |          |
| number   | integer    | NOT NULL |

### Association
 - belongs_to :product
 - belongs_to :user