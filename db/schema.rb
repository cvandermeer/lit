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

ActiveRecord::Schema.define(version: 20150626063121) do

  create_table "answers", force: :cascade do |t|
    t.string  "title"
    t.integer "question_id"
    t.string  "image"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

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
    t.integer "points"
  end

  add_index "memberships", ["user_id", "team_id"], name: "index_memberships_on_user_id_and_team_id"

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

  add_index "questions", ["category_id", "language_id", "user_id"], name: "index_questions_on_category_id_and_language_id_and_user_id"

  create_table "teams", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.string  "picture"
    t.integer "user_id"
    t.integer "points"
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "user_results", force: :cascade do |t|
    t.integer "category_id"
    t.integer "language_id"
    t.boolean "correctly_answered"
    t.integer "user_id"
  end

  add_index "user_results", ["category_id", "language_id", "user_id"], name: "index_user_results_on_category_id_and_language_id_and_user_id"

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

  add_index "word_of_the_week_reactions", ["user_id"], name: "index_word_of_the_week_reactions_on_user_id"
  add_index "word_of_the_week_reactions", ["word_of_the_week_id"], name: "index_word_of_the_week_reactions_on_word_of_the_week_id"

  create_table "word_of_the_weeks", force: :cascade do |t|
    t.string "title"
    t.text   "description"
  end

end
