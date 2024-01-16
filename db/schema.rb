# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_01_16_074732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string "billno"
    t.date "date"
    t.float "credit"
    t.float "debit"
    t.text "remark"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_bills_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "father"
    t.string "address"
    t.string "mobile"
    t.float "total"
    t.float "recieve"
    t.float "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "block"
  end

  create_table "dailyexps", force: :cascade do |t|
    t.string "name"
    t.text "remark"
    t.float "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "amount2"
  end

  create_table "dealerbills", force: :cascade do |t|
    t.string "billno"
    t.date "date"
    t.float "credit"
    t.float "debit"
    t.text "remark"
    t.bigint "dealer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_id"], name: "index_dealerbills_on_dealer_id"
  end

  create_table "dealeritems", force: :cascade do |t|
    t.string "itemname"
    t.float "quantity"
    t.float "rate"
    t.string "unit"
    t.float "amount"
    t.bigint "dealerbill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealerbill_id"], name: "index_dealeritems_on_dealerbill_id"
  end

  create_table "dealers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "mobile"
    t.float "total"
    t.float "recieve"
    t.float "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "block"
  end

  create_table "items", force: :cascade do |t|
    t.string "itemname"
    t.float "quantity"
    t.float "rate"
    t.string "unit"
    t.float "amount"
    t.bigint "bill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bill_id"], name: "index_items_on_bill_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "prodname"
    t.string "prodno"
    t.string "manufact"
    t.string "category"
    t.string "unit"
    t.float "quantity"
    t.float "price1"
    t.float "price2"
    t.float "price3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.string "name"
    t.string "HP"
    t.string "company"
    t.string "model"
    t.string "pitch1"
    t.float "turn1"
    t.float "gauge"
    t.float "weight"
    t.integer "slot"
    t.string "connection"
    t.string "coil"
    t.string "pitch2"
    t.float "turn2"
    t.float "stetarlen"
    t.float "length"
    t.text "remark"
    t.float "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "amount2"
    t.float "guage2"
    t.string "mobile"
    t.string "date"
  end

  add_foreign_key "bills", "customers"
  add_foreign_key "dealerbills", "dealers"
  add_foreign_key "dealeritems", "dealerbills"
  add_foreign_key "items", "bills"
end
