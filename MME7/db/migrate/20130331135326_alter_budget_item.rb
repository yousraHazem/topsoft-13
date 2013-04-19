class AlterBudgetItem < ActiveRecord::Migration
  def up
  	add_column :budget_items , :total, :integer
  end

  def down
  end
end
