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

ActiveRecord::Schema.define(version: 20130718010711) do

  create_table "readable_items", force: true do |t|
    t.integer "shared_item_id"
    t.text    "content"
    t.string  "domain"
    t.string  "title"
    t.string  "author"
  end

  create_table "shared_items", force: true do |t|
    t.integer  "user_id"
    t.string   "twitter_user_uid"
    t.string   "tweet_uid"
    t.string   "twitter_username"
    t.string   "url"
    t.string   "display_url"
    t.string   "tweet_body"
    t.datetime "shared_at"
    t.string   "sharer_avatar_url"
    t.string   "title"
    t.string   "read_state",        default: "unread"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "twitter_token"
    t.string   "twitter_secret"
  end

end
