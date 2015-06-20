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

ActiveRecord::Schema.define(version: 20150330152939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "report_number"
    t.string   "event_type"
    t.string   "reporter_occupation"
    t.string   "manufacturer_state"
    t.date     "date_of_event"
    t.text     "mdr_text"
    t.string   "manufacturer_name"
    t.string   "report_source_code"
    t.integer  "number_devices_in_event"
    t.string   "device_operator"
    t.string   "brand_name"
    t.string   "generic_name"
    t.string   "catalog_number"
    t.string   "device_report_product_code"
    t.boolean  "baseline_510_k__exempt_flag"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
