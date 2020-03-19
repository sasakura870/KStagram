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
# KStagram DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :twees
- has_many :comments

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|text|text||
|image|String||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :tweet_genres
- has_many  :genres,  through:  :tweets_genres

## genresテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :tweets_genres
- has_many :tweets,  through:  :tweets_genres

## tweets_genresテーブル
|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|null: false, foreign_key: true|
|genre_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :genre

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|String||
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :user