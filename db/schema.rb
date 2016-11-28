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

ActiveRecord::Schema.define(version: 20161128015742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "options", force: :cascade do |t|
    t.string   "option_text"
    t.boolean  "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "question_text"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "test_id"
  end

  add_index "questions", ["test_id"], name: "index_questions_on_test_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string   "title"
    t.integer  "time"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_submissions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "option_id"
  end

  add_index "user_submissions", ["option_id"], name: "index_user_submissions_on_option_id", using: :btree
  add_index "user_submissions", ["user_id"], name: "index_user_submissions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
    t.integer  "role_id"
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "options", "questions"
  add_foreign_key "questions", "tests"
  add_foreign_key "user_submissions", "options"
  add_foreign_key "user_submissions", "users"
  add_foreign_key "users", "roles"
end
