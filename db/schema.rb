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

ActiveRecord::Schema.define(version: 20141104124716) do

  create_table "company_profiles", force: true do |t|
    t.string   "company_name"
    t.text     "description"
    t.string   "company_type"
    t.integer  "number_of_employees"
    t.string   "website"
    t.string   "location"
    t.string   "reg_code"
    t.boolean  "verified"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
  end

  create_table "job_applications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_profile_id"
  end

  create_table "job_postings", force: true do |t|
    t.string   "job_id"
    t.string   "position"
    t.text     "job_description"
    t.date     "job_start"
    t.date     "job_end"
    t.date     "posted_on"
    t.string   "position_time"
    t.string   "job_paid"
    t.text     "job_requirements"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.integer  "company_profile_id"
  end

  create_table "saved_job_postings", force: true do |t|
    t.string   "position_text"
    t.string   "description_text"
    t.string   "paid_text"
    t.string   "requirements_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_profile_id"
  end

  create_table "saved_student_profiles", force: true do |t|
    t.string   "school_text"
    t.string   "year_text"
    t.string   "skill_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_profile_id"
  end

  create_table "skills", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "student_profile_id"
  end

  create_table "stu_certifications", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "student_profile_id"
  end

  create_table "stu_interests", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "student_profile_id"
  end

  create_table "stu_references", force: true do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "relationship"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_profile_id"
  end

  create_table "stu_work_experiences", force: true do |t|
    t.string   "company"
    t.string   "position"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_profile_id"
  end

  create_table "student_profiles", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "school"
    t.string   "expected_graduation"
    t.string   "school_year"
    t.string   "last_completed_degree"
    t.string   "residential_address"
    t.string   "major"
    t.string   "brief_summary"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profileable_id"
    t.string   "profileable_type"
    t.string   "user_type"
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["profileable_id", "profileable_type"], name: "index_users_on_profileable_id_and_profileable_type"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
