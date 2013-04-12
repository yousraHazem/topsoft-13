class AlterBudgetSource < ActiveRecord::Migration
  def up
  	rename_column :budget_sources , :name , :budget_source_name
  end

  def down
  end
end
