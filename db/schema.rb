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

ActiveRecord::Schema.define(version: 2018_11_27_035231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "complaints", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "comment"
    t.string "offence"
    t.string "number_plate"
    t.string "avatar"
    t.integer "user_id"
    t.string "address"
    t.string "postal_code"
    t.integer "offender_id"
    t.integer "status", default: 0
    t.integer "fine_amount"
    t.index ["number_plate"], name: "index_complaints_on_number_plate"
    t.index ["offender_id"], name: "index_complaints_on_offender_id"
  end

  create_table "fines", force: :cascade do |t|
    t.string "date", null: false
    t.string "time", null: false
    t.string "location", null: false
    t.string "offence", null: false
    t.integer "amount", null: false
    t.integer "status", default: 0
    t.bigint "user_id"
    t.bigint "officer_id"
    t.bigint "complaint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["complaint_id"], name: "index_fines_on_complaint_id"
    t.index ["officer_id"], name: "index_fines_on_officer_id"
    t.index ["user_id"], name: "index_fines_on_user_id"
  end

  create_table "officers", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "officer_locality", null: false
    t.string "government_id", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_officers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_officers_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", default: "", null: false
    t.string "ic_number", default: "", null: false
    t.string "driving_license", default: "", null: false
    t.string "number_plate", default: "", null: false
    t.string "gender", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "fines", "complaints"
  add_foreign_key "fines", "officers"
  add_foreign_key "fines", "users"
end
