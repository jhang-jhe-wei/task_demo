# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.7.2

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# schemad
## User
  Column  | Type
 :--------:|:--------:
  id    |   Integer
  name  |   String
  phone |   String
  email |   String
## Task
   Column  | Type
  :--------:|:--------:
   id   |   Integer
   title  |   String
   content |   String
   tag  |   String
   user_id  |  reference
   piority  |  integer
   state    |  integer
  
