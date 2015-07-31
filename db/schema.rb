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

ActiveRecord::Schema.define(version: 20150730175452) do

  create_table "breeds", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dogs", force: true do |t|
    t.string   "name"
    t.string   "age"
    t.text     "description"
    t.string   "particular_signals"
    t.string   "owner_name"
    t.string   "owner_email"
    t.string   "owner_phone"
    t.float    "lat"
    t.float    "lng"
    t.string   "password"
    t.integer  "breed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dogs", ["breed_id"], name: "index_dogs_on_breed_id"

  create_table "photos", force: true do |t|
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "dog_id"
  end

end
