# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :patients


## patients テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| patient_name     | string     | null: false                    |

### Association

- belongs_to :user
- has_many :pains


## pains テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| patient          | references | null: false, foreign_key: true |
| time             | datetime   | null: false                    |
| pain_part        | string     | null: false                    |
| pain_scale_id    | integer    | null: false                    |
| treatment        | text       |                                |
| evaluation       | text       |                                |
| memo             | text       |                                |

### Association

- belongs_to :patient
