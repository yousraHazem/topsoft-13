class CreateBudgetItemUsers < ActiveRecord::Migration
  def change
    create_table :budget_item_users do |t|
    	t.references :user
    	t.references :budget_item

      t.timestamps
    end
  end
end
