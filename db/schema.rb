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

ActiveRecord::Schema.define(version: 20150314185740) do

  create_table "activity_levels", force: :cascade do |t|
    t.string   "name"
    t.float    "correction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_types", force: :cascade do |t|
    t.string   "name"
    t.float    "correction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "coaches", force: :cascade do |t|
    t.string   "provider",                            null: false
    t.string   "uid",                    default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coaches", ["email"], name: "index_coaches_on_email"
  add_index "coaches", ["reset_password_token"], name: "index_coaches_on_reset_password_token", unique: true
  add_index "coaches", ["uid", "provider"], name: "index_coaches_on_uid_and_provider", unique: true

  create_table "companies", force: :cascade do |t|
    t.string   "provider",                            null: false
    t.string   "uid",                    default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["email"], name: "index_companies_on_email"
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  add_index "companies", ["uid", "provider"], name: "index_companies_on_uid_and_provider", unique: true

  create_table "devices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "device_type"
    t.string   "name"
    t.string   "device_string"
    t.string   "device_params"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "diets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "copyright"
    t.string   "image"
    t.integer  "rate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "families", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "show_all_data"
    t.boolean  "allow_comments"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.string   "name"
    t.float    "correction"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "programs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "comment"
    t.decimal  "init"
    t.decimal  "goal"
    t.datetime "init_date"
    t.datetime "goal_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scales", force: :cascade do |t|
    t.integer  "device_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_data", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "birthday"
    t.integer  "heigh"
    t.integer  "country"
    t.string   "sex"
    t.string   "body_frame"
    t.string   "weigh_unit"
    t.string   "heigh_unit"
    t.string   "energy_unit"
    t.string   "lifestyle"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",                            null: false
    t.string   "uid",                    default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

  create_table "weighings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.integer  "activity_id"
    t.float    "weigh"
    t.float    "body_fat"
    t.float    "body_water"
    t.float    "muscle_mass"
    t.float    "physique_rating"
    t.float    "basal_metabolic_rate"
    t.integer  "metabolic_age"
    t.float    "bone_mass"
    t.float    "viscerial_fat"
    t.text     "comment"
    t.string   "image"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
