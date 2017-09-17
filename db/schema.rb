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

ActiveRecord::Schema.define(version: 20170916182607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exchange_prices", force: :cascade do |t|
    t.float "spot"
    t.float "sell"
    t.float "buy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "exchange"
    t.string "coin"
    t.string "currency"
  end

  create_table "predicteds", force: :cascade do |t|
    t.bigint "user_id"
    t.string "coin"
    t.string "exchange"
    t.string "currency"
    t.string "prediction_type"
    t.float "change_in_price"
    t.float "value_at_expiration"
    t.float "value_at_time"
    t.datetime "expired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_predicteds_on_user_id"
  end

  create_table "predictions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "coin"
    t.string "exchange"
    t.string "currency"
    t.string "prediction_type"
    t.float "change_in_price"
    t.float "current_value"
    t.datetime "expiring_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_predictions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "predicteds", "users"
  add_foreign_key "predictions", "users"
end
