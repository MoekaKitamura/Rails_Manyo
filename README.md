# README

* Ruby version
  $ ruby -v
  ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-darwin20]

  $ rails -v
  Rails 5.2.6

  $ psql --version
  psql (PostgreSQL) 13.3


* Database
  User => user_name:string email:string password_digest:string admin:boolean
  Task => task_name:string to_do:string deadline:date status:string priority:string user:references
  Lavel => label_name:string
  Set_lavel => task:references lavel:references
  
    | User                   | 
    | ---------------------- | 
    | user_name:string       | 
    | email:string           | 
    | password_digest:string | 
    | admin:boolean          | 

    | Task                   | 
    | -----------------------| 
    | task_name:string       | 
    | to_do:string           | 
    | deadline:date          | 
    | status:string          | 
    | priority:string        | 
    | user_id(FK):references | 

    | Lavel             | 
    | ----------------- | 
    | label_name:string | 

    | Set_lavel                | 
    | ------------------------ | 
    | task_id(FK):references   | 
    | lavel_id(FK):references  | 

    * Deployment instructions
    Web URL:https://task-app-manyo0824.herokuapp.com/
      $ rails assets:precompile RAILS_ENV=production
      $ git add .
      $ git commit -m "  "
      $ git push origin step2(bruch name)
      (automatically deployed to haroku)
      or
      $ git push heroku step2:master