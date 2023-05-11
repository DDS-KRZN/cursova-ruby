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

ActiveRecord::Schema[7.0].define(version: 2023_05_11_225314) do
  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "company_id", null: false
    t.integer "director_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_departments_on_company_id"
    t.index ["director_id"], name: "index_departments_on_director_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people_in_teams", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "people_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["people_id"], name: "index_people_in_teams_on_people_id"
    t.index ["team_id"], name: "index_people_in_teams_on_team_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "descr"
    t.integer "leader_id", null: false
    t.date "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leader_id"], name: "index_projects_on_leader_id"
  end

  create_table "team_projects", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_team_projects_on_project_id"
    t.index ["team_id"], name: "index_team_projects_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "department_id", null: false
    t.integer "director_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_teams_on_department_id"
    t.index ["director_id"], name: "index_teams_on_director_id"
  end

  add_foreign_key "departments", "companies"
  add_foreign_key "departments", "directors"
  add_foreign_key "people_in_teams", "people", column: "people_id"
  add_foreign_key "people_in_teams", "teams"
  add_foreign_key "projects", "leaders"
  add_foreign_key "team_projects", "projects"
  add_foreign_key "team_projects", "teams"
  add_foreign_key "teams", "departments"
  add_foreign_key "teams", "directors"
end
