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

ActiveRecord::Schema.define(version: 20171012204238) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "balance"
    t.string   "account_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "bitcoin_address"
    t.string   "slug"
    t.index ["slug"], name: "index_accounts_on_slug", unique: true
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "balances", force: :cascade do |t|
    t.string   "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "tradeId"
    t.string   "currency"
    t.string   "deposit"
    t.datetime "expiration"
    t.string   "status"
    t.string   "tradetype"
    t.string   "entry"
    t.string   "rate"
    t.string   "return"
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "body"
    t.integer  "managment_id"
    t.string   "slug"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "blogimg"
    t.index ["slug"], name: "index_blogs_on_slug"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "deposits", force: :cascade do |t|
    t.string   "amount"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "bitcoin_address"
    t.integer  "balance_id"
  end

  create_table "kbs", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.integer  "managment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "question"
    t.index ["slug"], name: "index_kbs_on_slug"
  end

  create_table "managments", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_managments_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managments_on_reset_password_token", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal  "amount"
    t.string   "transaction_type"
    t.integer  "account_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "transaction_number"
    t.string   "txhash"
    t.boolean  "completed_at"
    t.datetime "comfirmed_at"
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "lastname"
    t.string   "country"
    t.string   "phone"
    t.string   "address"
    t.string   "referralid"
    t.string   "referral_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "what_to_knows", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "managment_id"
    t.datetime "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
    t.index ["slug"], name: "index_what_to_knows_on_slug", unique: true
  end

end
