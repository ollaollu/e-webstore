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

ActiveRecord::Schema.define(version: 20150904221437) do

  create_table "order_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "amount"
    t.decimal  "price"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_products", ["product_id"], name: "index_order_products_on_product_id"
  add_index "order_products", ["user_id"], name: "index_order_products_on_user_id"

  create_table "orders", force: :cascade do |t|
    t.string   "shipping_address"
    t.integer  "telephone"
    t.string   "payment_gateway"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "payment_transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "amount"
    t.string   "status"
    t.string   "payment_gateway"
    t.string   "transaction_outcome"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "payment_transactions", ["user_id"], name: "index_payment_transactions_on_user_id"

  create_table "pictures", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.string   "address"
    t.string   "country"
    t.string   "city"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
