# README
## Demo
* [Demo](https://wells-task-demo.herokuapp.com/)
* Login Information:
  * http basic auth ：
    * username：username
    * password：password
  * admin(login)：
    * email：admin@gmail.com
    * password：123456
  * user(login)：
    * email：user@gmail.com
    * password：123456
    
----------

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.7.2

* Rails version: 6.1.0

* System dependencies 

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
# Heroku
## Version
- heroku/7.47.6 darwin-x64 node-v12.16.2
## Deploy Command
```
heroku login -i
heroku create "wells-task-demo"
git init
git add .
git commit -m "message"
git push heroku master
heroku run rails db:migrate
```
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
  
