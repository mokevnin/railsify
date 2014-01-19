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

ActiveRecord::Schema.define(version: 20131111084133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: true do |t|
    t.integer  "region_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["region_id"], name: "index_cities_on_region_id", using: :btree

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "state"
    t.integer  "creator_id"
    t.string   "login"
    t.text     "description"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_group_link"
    t.string   "public_email"
    t.string   "phone"
  end

  create_table "company_domains", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_managers", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_managers", ["company_id"], name: "index_company_managers_on_company_id", using: :btree
  add_index "company_managers", ["user_id"], name: "index_company_managers_on_user_id", using: :btree

  create_table "company_news", force: true do |t|
    t.integer  "company_id"
    t.integer  "creator_id"
    t.string   "state"
    t.string   "slug"
    t.string   "name"
    t.text     "body"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
  end

  create_table "company_pages", force: true do |t|
    t.integer  "company_id"
    t.integer  "creator_id"
    t.string   "state"
    t.string   "slug"
    t.string   "name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  create_table "company_teachers", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "country_region_cities", force: true do |t|
    t.integer  "region_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "country_region_cities", ["region_id"], name: "index_country_region_cities_on_region_id", using: :btree

  create_table "country_regions", force: true do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "country_regions", ["country_id"], name: "index_country_regions_on_country_id", using: :btree

  create_table "course_lesson_attendants", force: true do |t|
    t.integer "user_id"
    t.integer "lesson_id"
    t.integer "member_id"
  end

  add_index "course_lesson_attendants", ["lesson_id"], name: "index_course_lesson_attendants_on_lesson_id", using: :btree
  add_index "course_lesson_attendants", ["user_id"], name: "index_course_lesson_attendants_on_user_id", using: :btree

  create_table "course_lessons", force: true do |t|
    t.integer  "course_id"
    t.integer  "creator_id"
    t.string   "state"
    t.datetime "start"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration"
    t.string   "presentation"
  end

  add_index "course_lessons", ["course_id"], name: "index_course_lessons_on_course_id", using: :btree
  add_index "course_lessons", ["creator_id"], name: "index_course_lessons_on_creator_id", using: :btree

  create_table "course_members", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "course_state"
  end

  create_table "course_reviews", force: true do |t|
    t.integer  "creator_id"
    t.integer  "course_id"
    t.string   "state"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_reviews", ["course_id"], name: "index_course_reviews_on_course_id", using: :btree
  add_index "course_reviews", ["creator_id"], name: "index_course_reviews_on_creator_id", using: :btree

  create_table "course_teachers", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_teacher_id"
  end

  add_index "course_teachers", ["course_id"], name: "index_course_teachers_on_course_id", using: :btree
  add_index "course_teachers", ["user_id"], name: "index_course_teachers_on_user_id", using: :btree

  create_table "courses", force: true do |t|
    t.integer  "company_id"
    t.integer  "creator_id"
    t.integer  "teacher_id"
    t.string   "type"
    t.string   "state"
    t.string   "subscription_state"
    t.string   "name"
    t.text     "description"
    t.integer  "country_region_city_id"
    t.string   "address_street"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.string   "address_description"
    t.string   "course_state"
    t.integer  "maximum_members_count"
    t.string   "image"
  end

  add_index "courses", ["city_id"], name: "index_courses_on_city_id", using: :btree

  create_table "mailing_list_users", force: true do |t|
    t.integer  "mailing_list_id"
    t.integer  "user_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mailing_list_users", ["mailing_list_id"], name: "index_mailing_list_users_on_mailing_list_id", using: :btree
  add_index "mailing_list_users", ["user_id"], name: "index_mailing_list_users_on_user_id", using: :btree

  create_table "mailing_lists", force: true do |t|
    t.string   "state"
    t.string   "processing_state"
    t.integer  "creator_id"
    t.integer  "course_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mailing_lists", ["course_id"], name: "index_mailing_lists_on_course_id", using: :btree
  add_index "mailing_lists", ["creator_id"], name: "index_mailing_lists_on_creator_id", using: :btree

  create_table "pages", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_authorizations", force: true do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_authorizations", ["user_id"], name: "index_user_authorizations_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "state"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.string   "reset_password_token"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "middle_name"
    t.date     "birthday"
  end

end
