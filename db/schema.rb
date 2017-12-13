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

ActiveRecord::Schema.define(version: 20171011183230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.integer "key"
    t.string "category"
    t.decimal "price"
    t.string "name"
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean "featured"
    t.string "url"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer "key"
    t.date "start_date"
    t.date "end_date"
    t.string "first_name"
    t.string "last_name"
    t.integer "clothes_balance"
    t.integer "active"
    t.string "status"
    t.string "member_type"
    t.string "referred_by"
    t.decimal "boost_credit"
    t.boolean "birthday_boost"
    t.decimal "cost"
    t.string "email"
    t.string "add_on"
    t.boolean "flagged_member"
    t.string "first_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
