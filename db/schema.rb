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

ActiveRecord::Schema.define(version: 20170521145216) do

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "loans", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "amount_cents", default: 0, null: false
    t.integer "months", default: 1, null: false
    t.integer "period", default: 1, null: false
    # 1. почему decimal а не integer?
    # 2. `precision: 3, scale: 2` - а если понадобятся десятые процентов? Сотые? А если 2123%?
    t.decimal "rate", precision: 3, scale: 2, default: "0.3", null: false
    t.decimal "extra_rate", precision: 3, scale: 2, default: "0.5", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payments_count", default: 0
    t.index ["company_id"], name: "index_loans_on_company_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "loan_id", null: false
    t.integer "amount_cents", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "extra", default: false
    t.index ["loan_id"], name: "index_payments_on_loan_id"
  end

end
