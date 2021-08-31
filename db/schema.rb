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

ActiveRecord::Schema.define(version: 2021_08_31_132813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lavelings", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "lavel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lavel_id"], name: "index_lavelings_on_lavel_id"
    t.index ["task_id"], name: "index_lavelings_on_task_id"
  end

  create_table "lavels", force: :cascade do |t|
    t.string "lavel_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_name", null: false
    t.string "to_do"
    t.date "deadline"
    t.integer "status"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["task_name"], name: "index_tasks_on_task_name"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lavelings", "lavels"
  add_foreign_key "lavelings", "tasks"
  add_foreign_key "tasks", "users"
end
