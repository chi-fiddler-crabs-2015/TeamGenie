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

ActiveRecord::Schema.define(version: 20150330235115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "team_id"
    t.datetime "game_time"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.text     "directions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "paid",        default: false
    t.float    "amount_owed", default: 0.0
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "membership_id"
    t.string   "attending",     default: "pending"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "activity"
    t.integer  "captain_id"
    t.integer  "home_location_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "team_logo_file_name"
    t.string   "team_logo_content_type"
    t.integer  "team_logo_file_size"
    t.datetime "team_logo_updated_at"
    t.float    "dues",                   default: 0.0
    t.float    "paid_dues",              default: 0.0
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.date     "birthday"
    t.string   "phone_number"
    t.string   "password_digest"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "publishable_key"
    t.string   "secret_key"
    t.string   "stripe_user_id"
    t.string   "currency"
    t.string   "stripe_account_type"
    t.text     "stripe_account_status", default: "{}"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
