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

ActiveRecord::Schema.define(version: 2020_10_28_121658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "text"
    t.bigint "question_id"
    t.boolean "is_right", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "attempts", force: :cascade do |t|
    t.integer "result", null: false
    t.string "status"
    t.bigint "member_test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_test_id"], name: "index_attempts_on_member_test_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "member_group_test_groups", force: :cascade do |t|
    t.bigint "member_group_id"
    t.bigint "test_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_group_id"], name: "index_member_group_test_groups_on_member_group_id"
    t.index ["test_group_id"], name: "index_member_group_test_groups_on_test_group_id"
  end

  create_table "member_groups", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_member_groups_on_company_id"
  end

  create_table "member_test_question_answers", force: :cascade do |t|
    t.bigint "member_test_question_id"
    t.bigint "answer_id"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_member_test_question_answers_on_answer_id"
    t.index ["member_test_question_id"], name: "index_member_test_question_answers_on_member_test_question_id"
  end

  create_table "member_test_questions", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "member_test_id"
    t.bigint "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_member_test_questions_on_answer_id"
    t.index ["member_test_id"], name: "index_member_test_questions_on_member_test_id"
    t.index ["question_id"], name: "index_member_test_questions_on_question_id"
  end

  create_table "member_tests", force: :cascade do |t|
    t.string "status", default: "draft", null: false
    t.bigint "member_id"
    t.bigint "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_member_tests_on_member_id"
    t.index ["test_id"], name: "index_member_tests_on_test_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_group_id"
    t.string "token"
    t.index ["company_id"], name: "index_members_on_company_id"
    t.index ["member_group_id"], name: "index_members_on_member_group_id"
    t.index ["token"], name: "index_members_on_token", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.text "text"
    t.bigint "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "test_groups", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", default: 0
    t.index ["company_id"], name: "index_test_groups_on_company_id"
    t.index ["name", "company_id"], name: "index_test_groups_on_name_and_company_id", unique: true
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.integer "questions_count"
    t.integer "pass_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "test_group_id", null: false
    t.integer "value", default: 0
    t.integer "module", default: 1
    t.text "description"
    t.index ["company_id"], name: "index_tests_on_company_id"
    t.index ["module", "test_group_id"], name: "index_tests_on_module_and_test_group_id", unique: true
    t.index ["test_group_id"], name: "index_tests_on_test_group_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "attempts", "member_tests"
  add_foreign_key "member_group_test_groups", "member_groups"
  add_foreign_key "member_group_test_groups", "test_groups"
  add_foreign_key "member_groups", "companies"
  add_foreign_key "member_test_question_answers", "answers"
  add_foreign_key "member_test_question_answers", "member_test_questions"
  add_foreign_key "member_test_questions", "answers"
  add_foreign_key "member_test_questions", "member_tests"
  add_foreign_key "member_test_questions", "questions"
  add_foreign_key "member_tests", "members"
  add_foreign_key "member_tests", "tests"
  add_foreign_key "members", "companies"
  add_foreign_key "members", "member_groups"
  add_foreign_key "questions", "tests"
  add_foreign_key "test_groups", "companies"
  add_foreign_key "tests", "companies"
  add_foreign_key "tests", "test_groups"
end
