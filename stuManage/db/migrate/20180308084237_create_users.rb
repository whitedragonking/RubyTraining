class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      # t.integer :id
      t.string :user_name
      t.string :password_hash
      t.string :full_name
      t.integer :type
      t.integer :class_id

      t.timestamps
    end
  end
end
