# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_08_103549) do

  create_table "agreements", force: :cascade do |t|
    t.string "owner_type"
    t.integer "owner_id"
    t.integer "company_id"
    t.float "percentage"
    t.string "status"
    t.index ["company_id"], name: "index_agreements_on_company_id"
    t.index ["owner_type", "owner_id"], name: "index_agreements_on_owner_type_and_owner_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "platform_id"
    t.index ["platform_id"], name: "index_companies_on_platform_id"
  end

  create_table "company_sales_people", force: :cascade do |t|
    t.integer "company_id"
    t.integer "sales_person_id"
    t.index ["company_id"], name: "index_company_sales_people_on_company_id"
    t.index ["sales_person_id"], name: "index_company_sales_people_on_sales_person_id"
  end

  create_table "event_store_events", id: :string, limit: 36, force: :cascade do |t|
    t.string "event_type", null: false
    t.binary "metadata"
    t.binary "data", null: false
    t.datetime "created_at", null: false
    t.index ["created_at"], name: "index_event_store_events_on_created_at"
    t.index ["event_type"], name: "index_event_store_events_on_event_type"
  end

  create_table "event_store_events_in_streams", force: :cascade do |t|
    t.string "stream", null: false
    t.integer "position"
    t.string "event_id", limit: 36, null: false
    t.datetime "created_at", null: false
    t.index ["created_at"], name: "index_event_store_events_in_streams_on_created_at"
    t.index ["stream", "event_id"], name: "index_event_store_events_in_streams_on_stream_and_event_id", unique: true
    t.index ["stream", "position"], name: "index_event_store_events_in_streams_on_stream_and_position", unique: true
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.decimal "price"
    t.integer "company_id"
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "sales", force: :cascade do |t|
    t.string "status"
    t.decimal "total"
    t.integer "quantity"
    t.integer "product_id"
    t.integer "company_id"
    t.integer "sales_person_id"
    t.index ["company_id"], name: "index_sales_on_company_id"
    t.index ["product_id"], name: "index_sales_on_product_id"
    t.index ["sales_person_id"], name: "index_sales_on_sales_person_id"
  end

  create_table "sales_people", force: :cascade do |t|
    t.string "name"
  end

end
