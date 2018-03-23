class Category < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |n|
      n.string :name, limit: 191, null: false, default: ''
      n.string :cat_img, limit: 255, null: false
      n.string :color, limit: 255, null: false
      #COMMENT '0: non-public; 1: public',
      n.integer :public, limit: 1, default: 1
      #COMMENT '0: ON; 1: OFF',
      n.integer :status, limit: 1, null: false, default: 0
      n.string :description
      n.datetime :created, null: false, default: '0000-00-00 00:00:00'
      n.datetime :modified, null: false
      n.integer :del_flg, limit: 1, null: false, default: 0
    end
  end
end
