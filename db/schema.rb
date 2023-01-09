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

ActiveRecord::Schema[7.0].define(version: 2023_01_09_122229) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alcools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cocktails", force: :cascade do |t|
    t.string "name"
    t.string "instruction"
    t.string "image"
    t.string "ingredient1"
    t.string "ingredient2"
    t.string "ingredient3"
    t.string "ingredient4"
    t.string "ingredient5"
    t.string "ingredient6"
    t.string "ingredient7"
    t.string "ingredient8"
    t.string "ingredient9"
    t.string "ingredient10"
    t.string "ingredient11"
    t.string "ingredient12"
    t.string "ingredient13"
    t.string "ingredient14"
    t.string "ingredient15"
    t.string "measure1"
    t.string "measure2"
    t.string "measure3"
    t.string "measure4"
    t.string "measure5"
    t.string "measure6"
    t.string "measure7"
    t.string "measure8"
    t.string "measure9"
    t.string "measure10"
    t.string "measure11"
    t.string "measure12"
    t.string "measure13"
    t.string "measure14"
    t.string "measure15"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
