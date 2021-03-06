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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130526231431) do

  create_table "bases", :force => true do |t|
    t.integer  "game_lat"
    t.integer  "game_lon"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "death_reasons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "deaths", :force => true do |t|
    t.integer "user_id"
    t.integer "base_id"
    t.integer "death_reason_id"
    t.integer "weapon_id"
    t.integer "death_game_lat"
    t.integer "death_game_lon"
    t.date    "death_day"
    t.time    "death_time"
  end

  add_index "deaths", ["base_id", "death_reason_id", "weapon_id"], :name => "index_deaths_on_base_id_and_death_reason_id_and_weapon_id"
  add_index "deaths", ["base_id", "death_reason_id"], :name => "index_deaths_on_base_id_and_death_reason_id"
  add_index "deaths", ["base_id", "weapon_id"], :name => "index_deaths_on_base_id_and_weapon_id"
  add_index "deaths", ["base_id"], :name => "index_deaths_on_base_id"
  add_index "deaths", ["death_day"], :name => "index_deaths_on_death_day"
  add_index "deaths", ["death_reason_id", "weapon_id"], :name => "index_deaths_on_death_reason_id_and_weapon_id"
  add_index "deaths", ["death_reason_id"], :name => "index_deaths_on_death_reason_id"
  add_index "deaths", ["death_time"], :name => "index_deaths_on_death_time"
  add_index "deaths", ["weapon_id"], :name => "index_deaths_on_weapon_id"

  create_table "weapons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
