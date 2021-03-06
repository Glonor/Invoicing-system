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

ActiveRecord::Schema.define(version: 20171204200352) do

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "tariff", precision: 20, scale: 4
    t.string "fiscal_code", limit: 16
    t.string "address"
    t.string "city"
    t.string "district"
    t.string "postal_code"
    t.string "phone"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "billed"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_events_on_client_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.datetime "issue_date"
    t.decimal "total_amount", precision: 20, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_invoices_on_client_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.integer "invoice_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal "amount", precision: 20, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["invoice_id"], name: "index_services_on_invoice_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "fiscal_code", limit: 16
    t.string "address"
    t.string "city"
    t.string "district"
    t.string "postal_code"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
