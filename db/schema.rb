# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_22_150829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "club_sports", force: :cascade do |t|
    t.bigint "club_id", null: false
    t.bigint "sport_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_club_sports_on_club_id"
    t.index ["sport_id"], name: "index_club_sports_on_sport_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "image_url"
    t.string "website"
    t.string "city"
    t.string "postal_code"
    t.bigint "user_id", null: false
    t.string "mail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "facebook_url"
    t.string "twitter_url"
    t.string "instagram_url"
    t.text "key_number"
    t.text "description"
    t.text "information"
    t.string "phone_number"
    t.string "siret"
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "event_sponsors", force: :cascade do |t|
    t.bigint "sponsor_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_sponsors_on_event_id"
    t.index ["sponsor_id"], name: "index_event_sponsors_on_sponsor_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "postal_code"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "name"
    t.string "image_url"
    t.text "description"
    t.integer "price"
    t.boolean "is_free"
    t.bigint "sport_id"
    t.bigint "club_id"
    t.bigint "user_id", null: false
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_events_on_club_id"
    t.index ["sport_id"], name: "index_events_on_sport_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "sponsor_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.boolean "is_admin", default: false
    t.boolean "is_club_admin", default: false
    t.boolean "is_event_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "club_sports", "clubs"
  add_foreign_key "club_sports", "sports"
  add_foreign_key "clubs", "users"
  add_foreign_key "event_sponsors", "events"
  add_foreign_key "event_sponsors", "sponsors"
  add_foreign_key "events", "clubs"
  add_foreign_key "events", "sports"
  add_foreign_key "events", "users"
end
