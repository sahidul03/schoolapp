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

ActiveRecord::Schema.define(version: 20150730192455) do

  create_table "committees", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "address",       limit: 255
    t.string   "email",         limit: 255
    t.string   "phone",         limit: 255
    t.string   "designation",   limit: 255
    t.string   "profile_photo", limit: 255
    t.string   "gender",        limit: 255
    t.string   "message",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "gender",              limit: 255
    t.string   "address",             limit: 255
    t.string   "father_name",         limit: 255
    t.string   "mother_name",         limit: 255
    t.string   "guardian_name",       limit: 255
    t.string   "guardian_contact_no", limit: 255
    t.string   "profile_photo",       limit: 255
    t.integer  "roll_no",             limit: 4
    t.integer  "level_id",            limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "students", ["level_id"], name: "index_students_on_level_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "address",       limit: 255
    t.string   "email",         limit: 255
    t.string   "phone",         limit: 255
    t.string   "qualification", limit: 255
    t.string   "designation",   limit: 255
    t.string   "profile_photo", limit: 255
    t.string   "gender",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
