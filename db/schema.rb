# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20190725154543) do

    create_table "categories", force: :cascade do |t|
      t.string   "name"
      t.integer  "priority"
      t.boolean  "is_published"
      t.integer  "user_id"
      t.datetime "created_at",   null: false
      t.datetime "updated_at",   null: false
    end
  
    add_index "categories", ["user_id"], name: "index_categories_on_user_id"
  
    create_table "microposts", force: :cascade do |t|
      t.text     "content"
      t.integer  "user_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
      t.string   "picture"
      t.string   "description"
      t.float    "price"
      t.string   "category"
      t.string   "side"
      t.integer  "category_id"
    end
  
    add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"
  
    create_table "relationships", force: :cascade do |t|
      t.integer  "follower_id"
      t.integer  "followed_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end
  
    add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
    add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"
  
    create_table "states", force: :cascade do |t|
      t.string "state_code"
      t.string "state_name"
    end
  
    add_index "states", ["state_code"], name: "index_states_on_state_code", unique: true
  
    create_table "users", force: :cascade do |t|
      t.string   "name"
      t.string   "email"
      t.datetime "created_at",                         null: false
      t.datetime "updated_at",                         null: false
      t.string   "password_digest"
      t.string   "remember_digest"
      t.boolean  "admin",              default: false
      t.string   "activation_digest"
      t.boolean  "activated",          default: false
      t.datetime "activated_at"
      t.string   "reset_digest"
      t.datetime "reset_sent_at"
      t.string   "alt_email_gravatar"
      t.string   "address_line2"
      t.string   "address_line1"
      t.string   "city"
      t.string   "region"
      t.string   "postal_code"
      t.string   "country"
      t.string   "phone"
      t.string   "ubereats_link"
      t.string   "doordash_link"
      t.string   "grubhub_link"
      t.string   "menu_categories"
      t.string   "facebook_link"
      t.string   "instagram_link"
      t.string   "picture"
    end
  
    add_index "users", ["email"], name: "index_users_on_email", unique: true
  
  end
  