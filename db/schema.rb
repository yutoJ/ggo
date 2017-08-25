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

ActiveRecord::Schema.define(version: 20170825163056) do

  create_table "gadgets", force: :cascade do |t|
    t.string   "gadget_type"
    t.text     "description"
    t.integer  "price"
    t.integer  "owner",                        null: false
    t.string   "city"
    t.boolean  "active",       default: false
    t.integer  "instant",      default: 0
    t.string   "listing_name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "price",                  null: false
    t.integer  "status",     default: 0, null: false
    t.datetime "start_date",             null: false
    t.datetime "end_date",               null: false
    t.integer  "user_id",                null: false
    t.integer  "gadget_id",              null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["gadget_id"], name: "index_reservations_on_gadget_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "star",       default: 1
    t.integer  "owner_id",               null: false
    t.integer  "gadget_id",              null: false
    t.integer  "guest_id",               null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["gadget_id"], name: "index_reviews_on_gadget_id"
    t.index ["guest_id"], name: "index_reviews_on_guest_id"
    t.index ["owner_id"], name: "index_reviews_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "phone_number"
    t.text     "description"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
