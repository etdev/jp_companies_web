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

ActiveRecord::Schema.define(version: 20170128145502) do

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",            default: "", null: false
    t.string   "name_jp",         default: "", null: false
    t.string   "name_kana",       default: "", null: false
    t.integer  "employees_count", default: 0,  null: false
    t.integer  "rating",          default: 0,  null: false
    t.string   "main_image_url"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["name"], name: "index_companies_on_name", using: :btree
    t.index ["name_kana"], name: "index_companies_on_name_kana", using: :btree
  end

  create_table "en_hyouban_entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "company_id"
    t.bigint   "en_hyouban_id",                   null: false
    t.string   "name",               default: "", null: false
    t.integer  "average_salary",     default: 0,  null: false
    t.string   "location",           default: "", null: false
    t.string   "url",                default: "", null: false
    t.integer  "rating",             default: 0,  null: false
    t.integer  "ratings_count",      default: 0,  null: false
    t.string   "daily_hours_worked", default: "", null: false
    t.string   "category",           default: "", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["company_id"], name: "index_en_hyouban_entries_on_company_id", using: :btree
    t.index ["en_hyouban_id"], name: "index_en_hyouban_entries_on_en_hyouban_id", unique: true, using: :btree
  end

  create_table "offices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "company_id"
    t.string   "country",    default: "", null: false
    t.string   "city",       default: "", null: false
    t.string   "detail"
    t.integer  "floor"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["company_id"], name: "index_offices_on_company_id", using: :btree
    t.index ["country", "city"], name: "index_offices_on_country_and_city", using: :btree
  end

  create_table "vorkers_entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "company_id"
    t.string   "vorkers_id",                                    default: "",    null: false
    t.string   "name",                                          default: "",    null: false
    t.string   "url",                                           default: "",    null: false
    t.decimal  "rating",                precision: 3, scale: 2, default: "0.0", null: false
    t.integer  "ratings_count",                                 default: 0,     null: false
    t.decimal  "monthly_overtime",      precision: 5, scale: 2, default: "0.0", null: false
    t.decimal  "percent_vacation_used", precision: 5, scale: 2, default: "0.0", null: false
    t.string   "category",                                      default: "",    null: false
    t.string   "thumbnail_url",                                 default: "",    null: false
    t.string   "stock_info",                                    default: "",    null: false
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.index ["company_id"], name: "index_vorkers_entries_on_company_id", using: :btree
    t.index ["vorkers_id"], name: "index_vorkers_entries_on_vorkers_id", unique: true, using: :btree
  end

end
