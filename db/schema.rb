# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_23_152015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contest_participations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "contest_id"
    t.datetime "entering_time"
  end

  create_table "contests", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.text "user_query"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "correct_sql"
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "contest_id"
  end

  create_table "user_query_infos", force: :cascade do |t|
    t.integer "task_id"
    t.integer "user_id"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.text "user_query"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
