ActiveRecord::Schema.define(:version => 20130412003037) do

  create_table "budget_components", :force => true do |t|
    t.string   "name"
    t.integer  "total_quantity"
    t.string   "status",             :default => "Pending"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "budget_item_id"
    t.integer  "spent"
    t.integer  "quantity_purchased", :default => 0
    t.integer  "unit_price"
    t.integer  "total"
  end

  create_table "budget_items", :force => true do |t|
    t.integer  "task_id"
    t.string   "name"
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
    t.boolean  "is_dismissed"
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
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "assigned",    :default => false
    t.string   "title"
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