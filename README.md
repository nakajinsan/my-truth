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

# MY TRUTH
HEROKUでアプリをチェックできます。
![image](https://user-images.githubusercontent.com/65770515/95015841-45b9f380-068a-11eb-9547-0cf57d371f47.png)

## 概要説明
このアプリは、自分の裏の顔を載せていき、それをチームによって共有できるようなアプリとなっております。自分自身の普段見せないような変顔や、嫌いな食べ物、嫌いな言葉、嫌いな人間など、あまり普段言わないようなことを載せ、それをチームで共有して楽しむアプリとなっております。

## 使用した技術
Ruby、Ruby On Rails、PostgreSQL、Heroku

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :groups, through: :groups_users
- has_many :photos
- has_many :groups_users


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :users, through: :groups_users
- has_many :groups_users
- has_many :photos


## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belong_to :group
- belong_to :user


## phototsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|name|text||
|nated_food|text||
|dislike_word|text||
|hate_human|text||
|weaknes|text||
|remark|text||
|group|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belong_to :user
- belong_to :group