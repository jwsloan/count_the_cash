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

ActiveRecord::Schema.define(version: 20140212215121) do

  create_table "denominations", force: true do |t|
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "envelope_id"
    t.integer  "count_in_envelope", default: 0
    t.string   "singular_name"
  end

  add_index "denominations", ["envelope_id"], name: "index_denominations_on_envelope_id"

  create_table "envelopes", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "current_amount",    default: 0
    t.integer  "additional_amount", default: 0
    t.integer  "new_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "envelopes", ["user_id"], name: "index_envelopes_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
