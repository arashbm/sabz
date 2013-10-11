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

ActiveRecord::Schema.define(version: 20131011193009) do

  create_table "conversation_memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversation_memberships", ["conversation_id"], name: "index_conversation_memberships_on_conversation_id", using: :btree
  add_index "conversation_memberships", ["user_id"], name: "index_conversation_memberships_on_user_id", using: :btree

  create_table "conversations", force: true do |t|
    t.integer  "about_id"
    t.string   "about_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["about_id"], name: "index_conversations_on_about_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "sender_id"
    t.integer  "conversation_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

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
  end

  add_index "products", ["provider_id"], name: "index_products_on_provider_id", using: :btree

  create_table "requests", force: true do |t|
    t.string   "name"
    t.string   "sku"
    t.string   "manufacturer"
    t.string   "quantity"
    t.string   "discription"
    t.string   "url"
    t.integer  "requester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "last_state"
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
