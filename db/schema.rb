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

ActiveRecord::Schema.define(version: 20140208191024) do

  create_table "budgets", force: true do |t|
    t.date     "date"
    t.integer  "starting_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "denominations", force: true do |t|
    t.string   "singular_name"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "envelope_id"
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
    t.integer  "budget_id"
  end

  add_index "envelopes", ["budget_id"], name: "index_envelopes_on_budget_id"

end
