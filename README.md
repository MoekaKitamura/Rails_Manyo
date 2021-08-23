# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  $ ruby -v
  ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-darwin20]

  $ rails -v
  Rails 5.2.6

  $ psql --version
  psql (PostgreSQL) 13.3

* System dependencies

* Configuration

* Database creation
  User => user_name:string email:string password_digest:string admin:boolean
  Task => task_name:string to_do:string deadline:date status:string priority:string user:references
  Lavel => label_name:string
  Set_lavel => task:references lavel:references

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...