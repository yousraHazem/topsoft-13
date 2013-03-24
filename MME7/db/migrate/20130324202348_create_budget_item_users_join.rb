class CreateBudgetItemUsersJoin < ActiveRecord::Migration
  def up
  	create_table :budget_items_users, :id => false do |t|
  		t.integer "budget_item_id"
  		t.integer "user_id"
  end

  def down
  end
end
