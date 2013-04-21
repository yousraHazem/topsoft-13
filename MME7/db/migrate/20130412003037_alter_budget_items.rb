class AlterBudgetItems < ActiveRecord::Migration
  def up
  	remove_column :budget_items , :status
  end

  def down
  end
end