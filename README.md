# README

* Ruby version: 2.7.4

* Database creation:
  ```
  create role skleh login createdb;
  grant all privileges on database skleh_production to skleh;
  ```

* Database initialization:
  ```
  rake db:create
  rails db:schema:load
  ```
