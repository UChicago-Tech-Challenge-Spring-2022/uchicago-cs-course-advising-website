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

ActiveRecord::Schema.define(version: 2022_05_23_233218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plans", force: :cascade do |t|
    t.string "class1a1", default: ""
    t.string "class1a2", default: ""
    t.string "class1a3", default: ""
    t.string "class1a4", default: ""
    t.string "class1a5", default: ""
    t.string "class1w1", default: ""
    t.string "class1w2", default: ""
    t.string "class1w3", default: ""
    t.string "class1w4", default: ""
    t.string "class1w5", default: ""
    t.string "class1s1", default: ""
    t.string "class1s2", default: ""
    t.string "class1s3", default: ""
    t.string "class1s4", default: ""
    t.string "class1s5", default: ""
    t.string "class1su1", default: ""
    t.string "class1su2", default: ""
    t.string "class1su3", default: ""
    t.string "class1su4", default: ""
    t.string "class1su5", default: ""
    t.string "class2a1", default: ""
    t.string "class2a2", default: ""
    t.string "class2a3", default: ""
    t.string "class2a4", default: ""
    t.string "class2a5", default: ""
    t.string "class2w1", default: ""
    t.string "class2w2", default: ""
    t.string "class2w3", default: ""
    t.string "class2w4", default: ""
    t.string "class2w5", default: ""
    t.string "class2s1", default: ""
    t.string "class2s2", default: ""
    t.string "class2s3", default: ""
    t.string "class2s4", default: ""
    t.string "class2s5", default: ""
    t.string "class2su1", default: ""
    t.string "class2su2", default: ""
    t.string "class2su3", default: ""
    t.string "class2su4", default: ""
    t.string "class2su5", default: ""
    t.string "class3a1", default: ""
    t.string "class3a2", default: ""
    t.string "class3a3", default: ""
    t.string "class3a4", default: ""
    t.string "class3a5", default: ""
    t.string "class3w1", default: ""
    t.string "class3w2", default: ""
    t.string "class3w3", default: ""
    t.string "class3w4", default: ""
    t.string "class3w5", default: ""
    t.string "class3s1", default: ""
    t.string "class3s2", default: ""
    t.string "class3s3", default: ""
    t.string "class3s4", default: ""
    t.string "class3s5", default: ""
    t.string "class3su1", default: ""
    t.string "class3su2", default: ""
    t.string "class3su3", default: ""
    t.string "class3su4", default: ""
    t.string "class3su5", default: ""
    t.string "class4a1", default: ""
    t.string "class4a2", default: ""
    t.string "class4a3", default: ""
    t.string "class4a4", default: ""
    t.string "class4a5", default: ""
    t.string "class4w1", default: ""
    t.string "class4w2", default: ""
    t.string "class4w3", default: ""
    t.string "class4w4", default: ""
    t.string "class4w5", default: ""
    t.string "class4s1", default: ""
    t.string "class4s2", default: ""
    t.string "class4s3", default: ""
    t.string "class4s4", default: ""
    t.string "class4s5", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
