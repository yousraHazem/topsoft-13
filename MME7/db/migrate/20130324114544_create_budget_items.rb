class CreateBudgetItems < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
    	t.string "name"
    	t.intger "status"
    	t.boolean "operational"
      t.timestamps
    end
  end
end
