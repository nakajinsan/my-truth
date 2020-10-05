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
このアプリは、自分の裏の顔を載せ、それをチームで共有できるようなアプリです。人に普段見せないような変顔や、嫌いな食べ物、嫌いな言葉、嫌いな人間など、あまり普段言わないようなことを載せ、それをチームで共有して楽しむことができます。


## 使い方
まず自身のアカウントを作成して、入りたいチームに参加します。そこで「投稿する」ボタンを押していただくと、自身のニックネームや画像、嫌いな食べ物などを入力するフォームが出てきますのでそれらを入力します。するとそのチームの一覧に自身のアップした画像が投稿されます。それらをクリックすると、その画像の詳細を見ることができるようになります。他の方の詳細ももちろん見ることができます。


## 目的
人間関係の距離をもっと縮めていきたいと思い、私はこのアプリを作成致しました。IT化が急速に発展する昨今、便利な世の中にはなってますが、逆に人間関係の希薄化さが問題になってきているように思われます。このように普段見せないような顔や苦手とするようなことを自己開示し、皆と共有することにより、人間関係の溝が少し狭まるのではないかと考えました。ですので、会社や家族、その他様々なグループで利用して頂けたらと思っております。


## 使用した技術
Ruby、Ruby On Rails、PostgreSQL、Heroku



## アプリのURL
https://quiet-anchorage-73700.herokuapp.com



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
|image|text|null: false|
|name|text|null: false|
|nated_food|text|null: false|
|dislike_word|text|null: false|
|hate_human|text|null: false|
|weaknes|text|null: false|
|remark|text|null: false|
|group|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belong_to :user
- belong_to :group