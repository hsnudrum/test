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

ActiveRecord::Schema.define(:version => 20121030024406) do

  create_table "accounts", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
    t.string   "when_paid"
    t.integer  "amount_paid"
    t.string   "feewise_token"
    t.boolean  "ignore_partners"
  end

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "agents", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bulletins", :force => true do |t|
    t.string   "body"
    t.string   "kind"
    t.boolean  "hide"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cards", :force => true do |t|
    t.string   "day_phone"
    t.integer  "user_id"
    t.string   "stripe_card_token"
    t.boolean  "paid"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "cardholder_name"
    t.string   "billing_address"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "discount_code"
    t.string   "amount_paid"
  end

  add_index "cards", ["user_id"], :name => "index_cards_on_user_id"

  create_table "contact_feewises", :force => true do |t|
    t.string   "to"
    t.string   "cc"
    t.string   "subject"
    t.text     "body"
    t.string   "label"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
  end

  create_table "discount_codes", :force => true do |t|
    t.string   "code"
    t.decimal  "price"
    t.date     "expiration"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "filter_analytics", :force => true do |t|
    t.string   "password"
    t.string   "filter_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "partners", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "user_id"
    t.string   "list_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "purchase_preferences", :force => true do |t|
    t.string   "location"
    t.string   "min_price"
    t.string   "max_price"
    t.string   "time_frame"
    t.string   "daytime_phone"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "buying"
    t.string   "buy_where"
    t.string   "buy_when"
    t.boolean  "selling"
    t.string   "selling_where"
    t.string   "selling_when"
    t.string   "purchase_low"
    t.string   "purchase_high"
    t.string   "sell_low"
    t.string   "sell_high"
    t.text     "body"
  end

  add_index "purchase_preferences", ["user_id"], :name => "index_purchase_preferences_on_user_id"

  create_table "static_pages", :force => true do |t|
    t.boolean  "placeholder"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "subscriptions", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "teams", :force => true do |t|
    t.boolean  "broker_found"
    t.string   "broker_id_code"
    t.string   "broker_cell"
    t.boolean  "title_insurance_company_found"
    t.string   "title_insurance_company_id_code"
    t.string   "title_insurance_company_phone"
    t.boolean  "home_inspector_found"
    t.string   "home_inspector_id_code"
    t.string   "home_inspector_cell"
    t.boolean  "private_morgage_insurance_found"
    t.string   "private_morgage_insurance_id_code"
    t.string   "private_morgage_insurance_phone"
    t.boolean  "home_insurance_found"
    t.string   "home_insurance_id_code"
    t.string   "home_insurance_phone"
    t.boolean  "painter_found"
    t.string   "painter_id_code"
    t.string   "painter_cell"
    t.boolean  "sound_engineer_found"
    t.string   "sound_engineer_id_code"
    t.string   "sound_engineer_cell"
    t.boolean  "lighting_contractor_found"
    t.string   "lighting_contractor_id_code"
    t.string   "lighting_contractor_phone"
    t.boolean  "water_system_found"
    t.string   "water_system_id_code"
    t.string   "water_system_phone"
    t.boolean  "electrician_found"
    t.string   "electrician_id_code"
    t.string   "electrician_cell"
    t.boolean  "hvac_found"
    t.string   "hvac_id_code"
    t.string   "hvac_cell"
    t.boolean  "trim_found"
    t.string   "trim_id_code"
    t.string   "trim_cell"
    t.boolean  "kitchen_and_bath_found"
    t.string   "kitchen_and_bath_id_code"
    t.string   "kitchen_and_bath_cell"
    t.boolean  "flooring_found"
    t.string   "flooring_id_code"
    t.string   "flooring_phone"
    t.boolean  "water_proofing_found"
    t.string   "water_proofing_id_code"
    t.string   "water_proofing_phone"
    t.boolean  "landscaping_found"
    t.string   "landscaping_id_code"
    t.string   "landscaping_cell"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "user_id"
  end

  create_table "testscaffolds", :force => true do |t|
    t.string   "mystringxx"
    t.text     "mytextxx"
    t.integer  "myintegerxx"
    t.float    "myfloatxx"
    t.decimal  "mydecimalxx"
    t.datetime "mydatetimexx"
    t.datetime "mytimestampxx"
    t.time     "mytimexx"
    t.date     "mydatexx"
    t.binary   "mybinaryxx"
    t.boolean  "mybooleanxx"
    t.integer  "myreferencesxx_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "testscaffolds", ["myreferencesxx_id"], :name => "index_testscaffolds_on_myreferencesxx_id"

  create_table "us", :force => true do |t|
    t.string   "name"
    t.text     "note"
    t.string   "url"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "us", ["slug"], :name => "index_us_on_slug"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "full_name"
    t.boolean  "agree"
    t.boolean  "buying"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
