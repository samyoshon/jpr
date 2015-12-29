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

ActiveRecord::Schema.define(version: 20151229012715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "city_id"
    t.string   "country_id"
    t.text     "qualifications"
    t.string   "salary_low"
    t.string   "salary_high"
    t.text     "benefits_description"
    t.boolean  "benefits_airfare"
    t.boolean  "benefits_housing"
    t.boolean  "benefits_pto"
    t.boolean  "benefits_sick"
    t.text     "additional_info"
    t.text     "how_to"
    t.integer  "adtype_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.boolean  "benefits_medical"
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
    t.string   "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "confirmed_at"
    t.string   "name"
    t.string   "facebook"
    t.string   "website"
    t.text     "description"
    t.text     "question_one"
    t.text     "question_two"
    t.text     "question_three"
    t.text     "question_four"
    t.text     "question_five"
    t.text     "answer_one"
    t.text     "answer_two"
    t.text     "answer_three"
    t.text     "answer_four"
    t.text     "answer_five"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "stripe_id"
    t.string   "card_last4"
    t.integer  "card_exp_month"
    t.integer  "card_exp_year"
    t.string   "card_brand"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
