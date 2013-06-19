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

ActiveRecord::Schema.define(version: 20130619091231) do

  create_table "hubs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topic_comments", force: true do |t|
    t.integer  "creator_id"
    t.integer  "topic_id"
    t.string   "state"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topic_comments", ["creator_id"], name: "index_topic_comments_on_creator_id"
  add_index "topic_comments", ["topic_id"], name: "index_topic_comments_on_topic_id"

  create_table "topics", force: true do |t|
    t.integer  "creator_id"
    t.string   "state"
    t.string   "published_at"
    t.string   "name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "password_digest"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
