
ActiveRecord::Schema.define(version: 20130918214516) do

  create_table "assets", force: true do |t|
    t.string   "asset"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_watchers", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "car_id"
  end

  create_table "cars", force: true do |t|
    t.string   "model"
    t.string   "brand"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
  end

  add_index "cars", ["state_id"], name: "index_cars_on_state_id", using: :btree

  create_table "cars_tags", id: false, force: true do |t|
    t.integer "tag_id"
    t.integer "car_id"
  end

  create_table "comments", force: true do |t|
    t.text    "text"
    t.integer "car_id"
    t.integer "user_id"
    t.integer "state_id"
    t.integer "previous_state_id"
  end

  create_table "states", force: true do |t|
    t.string "name"
    t.string "color"
    t.string "background"
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "tags_cars", id: false, force: true do |t|
    t.integer "tag_id"
    t.integer "car_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "username"
    t.string   "cars_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "authentication_token"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "twitter_id"
    t.string   "twitter_screen_name"
    t.string   "twitter_display_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
