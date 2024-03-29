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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140123101804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["from_id"], name: "index_messages_on_from_id", using: :btree
  add_index "messages", ["to_id"], name: "index_messages_on_to_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "sku"
    t.integer  "provider_id"
    t.string   "manufacturer"
    t.string   "quantity"
    t.text     "discription"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "last_state"
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["provider_id"], name: "index_products_on_provider_id", using: :btree

  create_table "requests", force: true do |t|
    t.string   "name"
    t.string   "sku"
    t.string   "manufacturer"
    t.string   "quantity"
    t.text     "discription"
    t.string   "url"
    t.integer  "requester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "last_state"
    t.integer  "category_id"
  end

  add_index "requests", ["category_id"], name: "index_requests_on_category_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "institute"
    t.string   "mobile"
    t.string   "phone"
    t.string   "fax"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
