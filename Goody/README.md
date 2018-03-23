# Template Source (Like LIFULL's source code)
  [F] core     # = model
  
  [F] resource # = controller

## Set up:

  $ bundle install

## Add DB (use mysqlite3)
  Create a migration for creating a users table
  
    $ rake db:create_migration NAME=create_users_table
    
  Add code to the migration for creating columns
  
    class CreateUsersTable < ActiveRecord::Migration[5.0]
      def change
        create_table :users do |t|
          t.string :fname
          t.string :lname
          t.string :email
          t.datetime :created_at
          t.datetime :updated_at
        end
      end
    end
    
  Run the migration
  
    $ rake db:migrate
  Create a seeds file
  
    $ touch db/seeds.rb
    
  Write some seeds

    # db/seeds.rb
    require File.expand_path '../../core/user', __FILE__
    
    users = [
      {fname: 'Jon', lname: 'Doe', email: 'e@example.com'},
      {fname: 'Jane', lname: 'Doe', email: 'e@example.com'}
    ]

    users.each do |u|
      User.create(u)
    end
    
  Run the seeds
  
    $ rake db:seed

## Test:

    $ ruby app.rb
  
  -> Url: http://localhost:4567/user_data
  
  -> Result:
  
    [{"id":1,"fname":"Jon","lname":"Doe","email":"e@example.com","created_at":"2018-03-19T03:08:32.766Z","updated_at":"2018-03-19T03:08:32.766Z"},{"id":2,"fname":"Jane","lname":"Doe","email":"e@example.com","created_at":"2018-03-19T03:08:32.829Z","updated_at":"2018-03-19T03:08:32.829Z"}]
    
## Rubocop install:
    
    https://github.com/bbatsov/rubocop/blob/master/manual/installation.md