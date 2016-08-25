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

ActiveRecord::Schema.define(version: 20160825190912) do

  create_table "cards", force: :cascade do |t|
    t.string  "name"
    t.integer "value"
    t.string  "suit"
  end

  create_table "cards_decks", id: false, force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "deck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["card_id"], name: "index_cards_decks_on_card_id"
    t.index ["deck_id"], name: "index_cards_decks_on_deck_id"
  end

  create_table "cards_hands", id: false, force: :cascade do |t|
    t.integer "card_id"
    t.integer "hand_id"
    t.index ["card_id"], name: "index_cards_hands_on_card_id"
    t.index ["hand_id"], name: "index_cards_hands_on_hand_id"
  end

  create_table "decks", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_decks_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "stand"
  end

  create_table "hands", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type_name"
    t.index ["game_id"], name: "index_hands_on_game_id"
  end

end
