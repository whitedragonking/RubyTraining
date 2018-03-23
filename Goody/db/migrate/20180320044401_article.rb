class Article < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |n|
      n.integer :numberic, limit: 11, null: false
      n.string :title, limit: 191, null: false, default: ''
      n.string :art_img, limit: 255, null: false
      n.string :link_url
      n.integer :attention, limit: 1, null: false, default: 0
      n.integer :browse_restriction, limit: 1
      n.string :description
      n.string :category, limit: 191
      # status : 0- non-public; 1- public; 2- disabled
      n.integer :status, limit: 1, null: false, default: 0
      n.datetime :public
      n.datetime :created, null: false, default: '0000-00-00 00:00:00'
      n.datetime :modified, null: false
      n.integer :del_flg, limit: 1, null: false, default: 0
      n.integer :display_flg, limit: 1, null: false, default: 1
    end
  end
end
