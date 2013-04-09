class AlterBudgetSourceProject < ActiveRecord::Migration
  def up
  	add_column :budget_source_projects , :amount , :integer
  	
  end

  def down
  end
end
