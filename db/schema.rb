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

ActiveRecord::Schema.define(:version => 20131021061408) do

  create_table "adverts", :force => true do |t|
    t.string   "title"
    t.boolean  "featured"
    t.boolean  "approved",                                           :default => false
    t.decimal  "price",               :precision => 10, :scale => 2
    t.text     "description"
    t.integer  "category_id"
    t.integer  "location_id"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "website"
    t.string   "pricing_strategy"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.integer  "user_id"
    t.string   "ad_type"
    t.string   "sale_by"
    t.string   "job_type"
    t.integer  "year"
    t.decimal  "kilometers"
    t.string   "trim"
    t.string   "body_type"
    t.string   "transmission"
    t.string   "color"
    t.string   "drivetrain"
    t.string   "make"
    t.string   "model"
    t.string   "vehicle_type"
    t.string   "fuel_type"
    t.integer  "engine_displacement"
    t.date     "event_date_from"
    t.date     "event_date_to"
    t.time     "event_time_from"
    t.time     "event_time_to"
    t.datetime "expire_date"
    t.boolean  "expire"
    t.boolean  "accept"
    t.integer  "visits",                                             :default => 0
    t.integer  "subcategory_id"
    t.string   "gender"
    t.string   "frame_size"
    t.string   "brand"
    t.string   "carrier"
    t.string   "stock"
    t.string   "vin"
    t.string   "report_url"
    t.string   "carproof"
    t.date     "dob"
    t.boolean  "urgent_ads",                                         :default => false
    t.boolean  "top_ad",                                             :default => false
    t.string   "bedrooms"
    t.string   "bathrooms"
    t.string   "furnished"
    t.string   "pet_friendly"
    t.string   "size"
    t.string   "sleeps"
    t.string   "vacation_type"
    t.boolean  "carproof_included",                                  :default => false
    t.boolean  "certified_pre_owned",                                :default => false
    t.boolean  "homepage_ads",                                       :default => false
    t.boolean  "bump_up_ads",                                        :default => false
    t.boolean  "urgent",                                             :default => false
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "section_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "slug"
    t.decimal  "gallery_amount"
    t.decimal  "top_ad3"
    t.decimal  "top_ad7"
    t.boolean  "rent",            :default => false
    t.decimal  "highlight_price"
    t.boolean  "ad_phone",        :default => false
    t.boolean  "pricing",         :default => false
    t.boolean  "website",         :default => false
    t.boolean  "advert_type",     :default => false
    t.boolean  "ad_sale_by",      :default => false
    t.boolean  "ad_job_type",     :default => false
    t.boolean  "ad_year",         :default => false
    t.boolean  "ad_kilometers",   :default => false
    t.boolean  "ad_trim",         :default => false
    t.boolean  "ad_body",         :default => false
    t.boolean  "fuel",            :default => false
    t.boolean  "ad_trans",        :default => false
    t.boolean  "ad_color",        :default => false
    t.boolean  "ad_drivetrain",   :default => false
    t.boolean  "ad_make",         :default => false
    t.boolean  "ad_model",        :default => false
    t.boolean  "ad_sale_type",    :default => false
    t.boolean  "engine",          :default => false
    t.boolean  "date_from",       :default => false
    t.boolean  "date_to",         :default => false
    t.boolean  "time_from",       :default => false
    t.boolean  "time_to",         :default => false
    t.boolean  "promote",         :default => false
    t.boolean  "sex",             :default => false
    t.boolean  "frame",           :default => false
    t.boolean  "ad_brand",        :default => false
    t.boolean  "ad_carrier",      :default => false
    t.boolean  "ad_diameter",     :default => false
    t.boolean  "ad_dob",          :default => false
    t.boolean  "carproof",        :default => false
    t.text     "header_message"
    t.boolean  "urgent",          :default => false
    t.boolean  "ad_address",      :default => false
    t.text     "footer_message"
    t.decimal  "urgent_amount"
    t.boolean  "ad_bedrooms",     :default => false
    t.boolean  "ad_bathrooms",    :default => false
    t.boolean  "ad_furnished",    :default => false
    t.boolean  "petfriendly",     :default => false
    t.boolean  "ad_size",         :default => false
    t.boolean  "ad_sleeps",       :default => false
    t.boolean  "ad_vacation",     :default => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "email"
    t.string   "subject"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "line_items", :force => true do |t|
    t.integer  "advert_id"
    t.decimal  "advert_bump_up",          :precision => 6, :scale => 2, :default => 0.0
    t.decimal  "advert_urgent_ad",        :precision => 6, :scale => 2, :default => 0.0
    t.decimal  "advert_homepage_gallery", :precision => 6, :scale => 2, :default => 0.0
    t.decimal  "advert_top_ad",           :precision => 6, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                             :null => false
    t.datetime "updated_at",                                                             :null => false
    t.integer  "cart_id"
    t.integer  "order_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "makes", :force => true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "models", :force => true do |t|
    t.integer  "make_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.integer  "advert_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "promotes", :force => true do |t|
    t.integer  "advert_id"
    t.boolean  "top_ad"
    t.integer  "top_ad_days"
    t.decimal  "top_ad_amount"
    t.boolean  "gallery"
    t.decimal  "gallery_amount"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "highlight_ad",     :default => false
    t.decimal  "highlight_amount"
    t.boolean  "urgent_ad",        :default => false
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "icon"
    t.integer  "col"
  end

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "ad_type",     :default => false
    t.boolean  "pricing",     :default => false
    t.boolean  "gender",      :default => false
    t.boolean  "diameter",    :default => false
    t.boolean  "sale_by",     :default => false
    t.boolean  "make",        :default => false
    t.boolean  "model",       :default => false
    t.boolean  "kilometers",  :default => false
    t.boolean  "color",       :default => false
    t.boolean  "engine",      :default => false
    t.boolean  "year",        :default => false
    t.boolean  "frame",       :default => false
    t.boolean  "brand",       :default => false
    t.boolean  "carrier",     :default => false
  end

  create_table "users", :force => true do |t|
    t.boolean  "admin"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "name"
    t.string   "phone"
    t.text     "address"
    t.string   "nickname"
    t.string   "contact_person"
    t.string   "skype_id"
    t.string   "token"
    t.boolean  "terms",           :default => false
    t.boolean  "information",     :default => false
  end

end
