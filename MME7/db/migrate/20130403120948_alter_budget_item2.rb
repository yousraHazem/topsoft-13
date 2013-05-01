class AlterBudgetItem2 < ActiveRecord::Migration
  def up
  	add_column :budget_items , :spent, :integer
  	add_column :budget_items , :project_id , :integer
  	add_column :budget_items , :total , :integer
  	remove_column  :budget_items ,:budget_id
  end

  def down
  end
end
