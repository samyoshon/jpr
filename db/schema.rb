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

ActiveRecord::Schema.define(version: 20151217011717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.integer  "company_id"
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
  end

end
