# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120603171539) do

  create_table "admin_statuses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", :force => true do |t|
    t.string   "name"
    t.string   "user_name"
    t.string   "password"
    t.text     "description"
    t.integer  "residential_id"
    t.integer  "admin_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agents", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.text     "description"
    t.integer  "residential_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", :force => true do |t|
    t.datetime "entrance"
    t.datetime "exit"
    t.string   "plate_number"
    t.integer  "visitor_id"
    t.integer  "user_id"
    t.integer  "residential_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "residential_banned_lists", :force => true do |t|
    t.datetime "begin_time"
    t.datetime "end_time"
    t.text     "description"
    t.integer  "enabled"
    t.integer  "residential_id"
    t.integer  "visitor_id"
    t.integer  "residential_banned_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "residential_banned_statuses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "residential_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "residentials", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.integer  "enabled"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "residential_type_id"
  end

  create_table "user_banned_lists", :force => true do |t|
    t.datetime "begin_time"
    t.datetime "end_time"
    t.text     "description"
    t.integer  "enabled"
    t.integer  "visitor_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_statuses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "password"
    t.integer  "enabled"
    t.integer  "telephone"
    t.integer  "habitants_number"
    t.integer  "residential_id"
    t.integer  "user_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitor_statuses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitors", :force => true do |t|
    t.string   "name"
    t.string   "identification"
    t.string   "idpictureurl"
    t.integer  "visitor_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
