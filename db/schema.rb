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

ActiveRecord::Schema.define(version: 20160713133808) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name",       limit: 255,                 null: false
    t.string   "money_type", limit: 255, default: "USD", null: false
    t.float    "balance",    limit: 24,  default: 0.0,   null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "user_id",    limit: 4,                   null: false
  end

  add_index "accounts", ["name", "user_id"], name: "index_accounts_on_name_and_user_id", unique: true, using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.string   "transaction_type",    limit: 255,   null: false
    t.string   "tag_type",            limit: 255
    t.float    "amount",              limit: 24,    null: false
    t.date     "date_of_transaction",               null: false
    t.text     "description",         limit: 65535
    t.integer  "from_account_id",     limit: 4,     null: false
    t.integer  "to_account_id",       limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id",             limit: 4,     null: false
  end

  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255, null: false
    t.string   "email",           limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "accounts", "users"
  add_foreign_key "transactions", "users"
end
