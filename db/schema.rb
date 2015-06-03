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

ActiveRecord::Schema.define(version: 20150603102330) do

  create_table "answers", force: :cascade do |t|
    t.string  "title"
    t.integer "question_id"
    t.string  "image"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
  end

  create_table "languages", force: :cascade do |t|
    t.string "title"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.boolean "accepted"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.integer  "category_id"
    t.integer  "language_id"
    t.integer  "correct_answer_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "approved"
    t.string   "image"
  end

  create_table "teams", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.string  "picture"
    t.integer "user_id"
    t.integer "points"
  end

  create_table "user_results", force: :cascade do |t|
    t.integer "category_id"
    t.integer "language_id"
    t.boolean "correctly_answered"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.string   "name"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.integer  "points"
    t.string   "avatar"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_image_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "word_of_the_week_reactions", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "word_of_the_week_id"
    t.datetime "created_at"
  end

  create_table "word_of_the_weeks", force: :cascade do |t|
    t.string "title"
  end

end
