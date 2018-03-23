class LikeStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :like_status do |n|
      n.string :user_id, limit: 255, null: false
      n.string :article_id, limit: 255, null: false
      n.integer :status, limit: 1, null: false, default: 1
      n.datetime :created, null: false
      n.datetime :modified, null: false
    end
  end
end
