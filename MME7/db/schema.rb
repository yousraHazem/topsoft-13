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

ActiveRecord::Schema.define(:version => 20130408104319) do

  create_table "budget_components", :force => true do |t|
    t.string   "name"
    t.integer  "total_quantity"
    t.integer  "unit_price"
    t.string   "status",             :default => "Pending"
    t.integer  "total"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "budget_item_id"
    t.integer  "spent"
    t.integer  "quantity_purchased", :default => 0
  end

  create_table "budget_items", :force => true do |t|
    t.integer  "task_id"
    t.integer  "budget_id"
    t.string   "name"
    t.integer  "status"
    t.boolean  "operational"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "spent"
    t.integer  "project_id"
    t.integer  "total"
  end

  create_table "budget_items_users", :id => false, :force => true do |t|
    t.integer "budget_item_id"
    t.integer "user_id"
  end

  create_table "budget_source_projects", :force => true do |t|
    t.integer  "budget_source_id"
    t.integer  "project_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "amount"
  end

  create_table "budget_sources", :force => true do |t|
    t.string   "name"
    t.integer  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "communities", :force => true do |t|
    t.string   "title"
    t.text     "social_profile_info"
    t.text     "contact_info"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "communities_projects", :id => false, :force => true do |t|
    t.integer "community_id"
    t.integer "project_id"
  end

  create_table "group_users", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.boolean  "isCreator"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "group_name",   :limit => 50
    t.text     "description"
    t.string   "levels"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "community_id"
  end

  create_table "posts", :force => true do |t|
    t.text     "content"
    t.integer  "group_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "project_users", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.boolean  "is_creator"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.boolean  "private_or_public"
    t.boolean  "admin_or_member"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "receipts", :force => true do |t|
    t.string   "name"
    t.integer  "budget_component_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "image"
  end

  create_table "task_users", :force => true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.boolean  "assigned"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "assigned"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_Nr"
    t.string   "address"
    t.string   "username"
    t.boolean  "isAdmin",         :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
