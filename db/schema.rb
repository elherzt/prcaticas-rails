
ActiveRecord::Schema.define(version: 20130913162544) do

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
    t.string   "mail"
    t.string   "authentication_token"
  end

end
