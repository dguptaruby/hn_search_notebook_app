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

ActiveRecord::Schema.define(version: 2019_12_24_081403) do

  create_table "hits_records", force: :cascade do |t|
    t.integer "search_query_id"
    t.integer "last_day"
    t.integer "last_week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["search_query_id"], name: "index_hits_records_on_search_query_id"
  end

  create_table "search_notebooks", force: :cascade do |t|
    t.string "title"
    t.string "creation_date"
    t.integer "search_result_id"
    t.integer "search_query_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["search_query_id"], name: "index_search_notebooks_on_search_query_id"
    t.index ["search_result_id"], name: "index_search_notebooks_on_search_result_id"
  end

  create_table "search_queries", force: :cascade do |t|
    t.string "query_string"
    t.string "creation_date"
    t.string "total_hits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_results", force: :cascade do |t|
    t.string "hn_author"
    t.integer "author_karma_points"
    t.string "url"
    t.string "creation_date"
    t.string "hn_tag"
    t.integer "search_notebook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "search_query_id"
    t.index ["search_notebook_id"], name: "index_search_results_on_search_notebook_id"
    t.index ["search_query_id"], name: "index_search_results_on_search_query_id"
  end

end
