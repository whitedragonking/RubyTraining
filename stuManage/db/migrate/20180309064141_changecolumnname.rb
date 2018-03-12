class Changecolumnname < ActiveRecord::Migration[5.1]
  def change
    rename_column :Users, :password_hash, :password_digest
  end
end
