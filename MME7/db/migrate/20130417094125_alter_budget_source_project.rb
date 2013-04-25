class AlterBudgetSourceProject < ActiveRecord::Migration
  def up
  	change_column :budget_source_projects , :amount , :integer , :default => 0
  end

  def down
  end
end
