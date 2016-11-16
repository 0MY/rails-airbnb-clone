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

ActiveRecord::Schema.define(version: 20161116094602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "renter_id"
    t.integer  "woa_id"
    t.date     "book_start_at"
    t.date     "book_end_at"
    t.date     "validated_at"
    t.date     "paid_at"
    t.integer  "owner_rating"
    t.text     "owner_comment"
    t.integer  "renter_rating"
    t.text     "renter_comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["renter_id"], name: "index_bookings_on_renter_id", using: :btree
    t.index ["woa_id"], name: "index_bookings_on_woa_id", using: :btree
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "description"
    t.string   "avatar"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "woas", force: :cascade do |t|
    t.string   "title"
    t.string   "type"
    t.text     "description"
    t.integer  "price"
    t.integer  "deposit"
    t.text     "location"
    t.date     "rent_start_at"
    t.date     "rent_end_at"
    t.integer  "owner_id"
    t.string   "size"
    t.boolean  "hooked_on_wall"
    t.boolean  "needs_power"
    t.boolean  "needs_pedestal"
    t.boolean  "needs_wifi"
    t.boolean  "needs_hygrometry"
    t.boolean  "needs_temperature"
    t.boolean  "needs_glass"
    t.boolean  "needs_alarm"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.float    "lat"
    t.float    "lng"
    t.index ["owner_id"], name: "index_woas_on_owner_id", using: :btree
  end

  add_foreign_key "bookings", "users", column: "renter_id"
  add_foreign_key "bookings", "woas"
  add_foreign_key "woas", "users", column: "owner_id"
end
