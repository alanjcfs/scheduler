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

ActiveRecord::Schema.define(version: 20140131205512) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_vendors", id: false, force: true do |t|
    t.integer "activity_id"
    t.integer "vendor_id"
  end

  add_index "activity_vendors", ["activity_id", "vendor_id"], name: "index_activity_vendors_on_activity_id_and_vendor_id"

  create_table "schedules", force: true do |t|
    t.date     "date"
    t.time     "time_start"
    t.time     "time_end"
    t.integer  "quantity"
    t.integer  "amount_sold"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
