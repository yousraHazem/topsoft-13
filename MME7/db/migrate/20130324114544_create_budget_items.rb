class CreateBudgetItems < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
    	t.references :task
    	t.references :budget
    	t.string "name"
    	t.integer "status"
    	t.boolean "operational"
      t.timestamps
    end
  end
end
