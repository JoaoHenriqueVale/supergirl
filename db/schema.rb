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

ActiveRecord::Schema.define(version: 20180403234026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "survey_id"
    t.bigint "girl_id"
    t.float "rating", default: 0.0
    t.bigint "question_id"
    t.index ["girl_id"], name: "index_results_on_girl_id"
    t.index ["question_id"], name: "index_results_on_question_id"
    t.index ["survey_id"], name: "index_results_on_survey_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "status", default: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "cpf"
    t.string "avatar", default: "girl.png"
    t.boolean "admin", default: false
  end

  add_foreign_key "results", "questions"
  add_foreign_key "results", "surveys"
  add_foreign_key "results", "users"
  add_foreign_key "results", "users", column: "girl_id"
end
