# テーブル設計


## users テーブル

| Column     | Type   | Options   |
| ---------- | ------ | --------- |
| email      | string | not null  |
| password   | string | not null  |
| name       | string | not null  |
| profile    | text   | not null  |
| occupation | text   | not null  |
| position   | text   | not null  |

### Association
- has_many :prototypes
- has_many :comments


### prototypes テーブル

| Column     | Type       | Options            |
| ---------- | ---------- | ------------------ |
| title      | string     | not null           |
| catch_copy | text       | not null           |
| concept    | text       | not null           |
| user       | references |  foreign_key: true |
| image      |            |                    |ActiveStorage  

### Association
- belongs_to :user
- has_many :comments

### comments テーブル
| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| text      | text       | not null          |
| user      | references | foreign_key: true |
| prototype | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :prototype