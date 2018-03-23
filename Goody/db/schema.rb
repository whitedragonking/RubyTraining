# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180321083903) do

  create_table "_articles_old_20180321", force: :cascade do |t|
    t.integer "numberic", limit: 11, null: false
    t.string "title", limit: 191, default: "", null: false
    t.string "art_img", limit: 255, null: false
    t.string "link_url"
    t.integer "attention", limit: 1, default: 0, null: false
    t.integer "browse_restriction", limit: 1
    t.string "description"
    t.string "category", limit: 191
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "public"
    t.datetime "created", null: false
    t.datetime "modified", null: false
    t.integer "del_flg", limit: 1, default: 0, null: false
    t.integer "display_flg", limit: 1, default: 1, null: false
  end

  create_table "_like_statuses_old_20180321", force: :cascade do |t|
    t.string "user_id", limit: 255, null: false
    t.string "article_id", limit: 255, null: false
    t.integer "status", default: 1, null: false
    t.datetime "created", null: false
    t.datetime "modified", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.integer "numberic", null: false
    t.string "title", limit: 191, default: "", null: false
    t.string "art_img", limit: 255, null: false
    t.string "link_url"
    t.integer "attention", default: 0, null: false
    t.integer "browse_restriction"
    t.string "description"
    t.integer "category"
    t.integer "status", default: 0, null: false
    t.datetime "public"
    t.datetime "created", null: false
    t.datetime "modified", null: false
    t.integer "del_flg", default: 0, null: false
    t.integer "display_flg", default: 1, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 191, default: "", null: false
    t.string "cat_img", limit: 255, null: false
    t.string "color", limit: 255, null: false
    t.integer "public", limit: 1, default: 1
    t.integer "status", limit: 1, default: 0, null: false
    t.string "description"
    t.datetime "created", null: false
    t.datetime "modified", null: false
    t.integer "del_flg", limit: 1, default: 0, null: false
  end

  create_table "like_statuses", force: :cascade do |t|
    t.string "user_id", limit: 255, null: false
    t.integer "article_id", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created", null: false
    t.datetime "modified", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
