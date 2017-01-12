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

ActiveRecord::Schema.define(version: 20170112045330) do

  create_table "actors", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "race_id"
    t.integer  "might"
    t.integer  "will"
    t.integer  "cunning"
    t.integer  "subtlety"
    t.integer  "perception"
    t.integer  "sagacity"
    t.integer  "province_id"
    t.integer  "organization_id"
    t.integer  "scale"
    t.integer  "count"
    t.string   "personality"
    t.string   "mood"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "artifacts", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "owner_id"
    t.integer  "province_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "associations", force: :cascade do |t|
    t.integer  "domain_id"
    t.integer  "associable_id"
    t.string   "associable_type"
    t.integer  "strength"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "attitudes", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "target"
    t.integer  "desired_status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "borders", force: :cascade do |t|
    t.integer  "province_id"
    t.integer  "neighbor_id"
    t.integer  "defense"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "congregations", force: :cascade do |t|
    t.integer  "population_id"
    t.integer  "deity_id"
    t.integer  "clergy"
    t.integer  "laity"
    t.integer  "piety_multiplier"
    t.integer  "manpower_multiplier"
    t.integer  "loyalty"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "deities", force: :cascade do |t|
    t.string   "name"
    t.integer  "actor_id"
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "domains", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "content"
    t.integer  "reference_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "is_church"
    t.integer  "is_kingdom"
    t.integer  "leader_id"
    t.integer  "kingdom_id"
    t.string   "governance"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "populations", force: :cascade do |t|
    t.integer  "province_id"
    t.integer  "race_id"
    t.float    "piety"
    t.integer  "count"
    t.integer  "loyalty"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reference_id"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.integer  "base_dev"
    t.integer  "is_empyreal"
    t.integer  "kingdom_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "primary_terrain_id"
    t.integer  "secondary_terrain_id"
    t.integer  "region_id"
  end

  create_table "races", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "longevity"
    t.integer  "fecundity"
    t.integer  "might"
    t.integer  "will"
    t.integer  "cunning"
    t.integer  "sutlety"
    t.integer  "perception"
    t.integer  "sagacity"
    t.integer  "scale"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "recipients", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "organization_one_id"
    t.integer  "organization_two_id"
    t.integer  "current_relationship"
    t.integer  "expected_relationship"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "terrains", force: :cascade do |t|
    t.string   "name"
    t.float    "development_multiplier"
    t.integer  "difficulty"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "psswrd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
