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

ActiveRecord::Schema.define(version: 20160514013138) do

  create_table "Actions", force: :cascade do |t|
    t.string  "type"
    t.string  "category"
    t.string  "request"
    t.integer "points"
  end

  create_table "Games", force: :cascade do |t|
    t.integer "rounds"
    t.boolean "started"
    t.boolean "addingplayers"
    t.string  "category"
    t.string  "lastplayer"
    t.integer "lastpoint"
  end

  create_table "Players", force: :cascade do |t|
    t.integer "game_id"
    t.string  "player_name"
    t.integer "points"
  end

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
