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

ActiveRecord::Schema.define(version: 2020_01_26_052908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role_type", null: false
    t.bigint "role_id", null: false
    t.index ["role_type", "role_id"], name: "index_accounts_on_role_type_and_role_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.bigint "doctor_id", null: false
    t.bigint "patient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id", "patient_id"], name: "index_appointments_on_doctor_id_and_patient_id", unique: true
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "doctor_likes", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "patient_id", null: false
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id", "patient_id"], name: "index_doctor_likes_on_doctor_id_and_patient_id", unique: true
    t.index ["doctor_id"], name: "index_doctor_likes_on_doctor_id"
    t.index ["patient_id"], name: "index_doctor_likes_on_patient_id"
  end

  create_table "doctor_reviews", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "doctor_id", null: false
    t.text "review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id", "patient_id"], name: "index_doctor_reviews_on_doctor_id_and_patient_id", unique: true
    t.index ["doctor_id"], name: "index_doctor_reviews_on_doctor_id"
    t.index ["patient_id"], name: "index_doctor_reviews_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "speciality_id", null: false
    t.index ["speciality_id"], name: "index_doctors_on_speciality_id"
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "specialities", force: :cascade do |t|
    t.string "speciality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "patients"
  add_foreign_key "doctor_likes", "doctors"
  add_foreign_key "doctor_likes", "patients"
  add_foreign_key "doctor_reviews", "doctors"
  add_foreign_key "doctor_reviews", "patients"
  add_foreign_key "doctors", "specialities"
end
