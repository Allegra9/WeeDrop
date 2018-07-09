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

ActiveRecord::Schema.define(version: 2018_07_09_154227) do

  create_table "buyers", force: :cascade do |t|
    t.string "name"
    t.string "delivery_address"
    t.string "delivery_postcode"
    t.string "billing_address"
    t.string "billing_postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prod_sales", force: :cascade do |t|
    t.integer "sale_id"
    t.integer "product_id"
    t.integer "quantity"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_prod_sales_on_product_id"
    t.index ["sale_id"], name: "index_prod_sales_on_sale_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "seller_id"
    t.string "name"
    t.float "price"
    t.string "description"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_products_on_seller_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "buyer_id"
    t.string "status"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_sales_on_buyer_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.boolean "is_seller"
    t.integer "class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
